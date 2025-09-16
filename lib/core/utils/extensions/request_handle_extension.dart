import 'dart:convert';

import 'package:auth/core/utils/extintions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/dialogs/loading_dialog.dart';
import '../../models/StateModel.dart';
import '../../network/api_excepion.dart';
import '../../widgets/simple_alert.dart';
import '../snaks.dart';

extension GenericRequest<T> on StateNotifier<StateModel<T>> {
  Future<void> request(Future<dynamic> Function() asyncFunc,
      {Function(T)? onComplete, Function(ApiException)? onFailure}) async {
    var response;
    try {
      response = await asyncFunc();
      print(" Response $response");
      //state = StateModel(state: DataState.SUCCESS, data: response is T ? response : null ,message: response?.message );
      onComplete?.call(response);
    } on ApiException catch (e) {
      print("Error Response $response $e");
      onFailure?.call(e);
        Map? error = json.tryDecode(e.message ?? "");
      var message = error?.containsKey("errors") == true
          ? (error!["errors"] as List).first
          : "Something wrong happen please try again later";
      if (e.code == 401 || e.code == 403) {
        print("Not Authed Here");
        Future.delayed(const Duration(milliseconds: 20), () {
          print("Will Retry");
          request(asyncFunc);
        });
      } else {
        state = StateModel(
            state: DataState.ERROR, data: response?.data, message: message);
      }
    } on Exception catch (e) {
      print("Some Err Here");
      onFailure?.call(ApiException(500, e.toString()));
      state = StateModel(
          state: DataState.ERROR,
          data: response?.data,
          message: (e).toString());
    }
  }

  Future<void> uploadRequest(Future<dynamic> Function() asyncFunc,
      {Function(T)? onComplete}) async {
    try {
      var response = await asyncFunc();
      if (response.data != null) {
        onComplete?.call(response);
        state = StateModel(
            state: DataState.SUCCESS,
            data: response,
            message: "Uploaded Successfully");
      } else {
        state =
            StateModel(state: DataState.ERROR, message: "Something went wrong");
      }
    } on ApiException catch (e) {
      print("Response Err ${e.message}");
      if (e.code == 401) {
        print("Not Authed Here");
        Future.delayed(const Duration(milliseconds: 20), () {
          print("Will Retry");
          request(asyncFunc);
        });
      } else {
        state =
            StateModel(state: DataState.ERROR, message: (e.message).toString());
      }
    } on Exception catch (e) {
      print("Response Err 2$e");
      state = StateModel(state: DataState.ERROR, message: (e).toString());
    }
  }

  Future<void> handleTokenRefreshRequest(Future<dynamic> Function() asyncFunc,
      {Function(ApiException)? onFailure}) async {
    var response;
    try {
      response = await asyncFunc();
    } on ApiException catch (e) {
      print("Error Response $e");
      onFailure?.call(e);
      Map? error = json.tryDecode(e.message ?? "");
      var message = error?.containsKey("message") == true
          ? error!["message"]
          : "Something wrong happen please try again later";
      if (e.code == 401 || e.code == 403) {
        print("Not Authed Here");
        Future.delayed(const Duration(milliseconds: 20), () {
          print("Will Retry");
          request(asyncFunc);
        });
      } else {
        state = StateModel(
            state: DataState.ERROR, data: response?.data, message: message);
      }
    } on Exception catch (e) {
      print("Some Err Here");
      onFailure?.call(ApiException(500, e.toString()));
      state = StateModel(
          state: DataState.ERROR,
          data: response?.data,
          message: (e).toString());
    }
  }
}

extension RequestHandle<T> on ConsumerState {
  void handleState<T>(
      AutoDisposeStateNotifierProvider<dynamic, StateModel<T>> provider,
      {bool? showLoading,
      bool? showToast,
      GlobalKey<SimpleAlertState>? alertKey,
      Function(StateModel<T>)? onSuccess,
      Function(StateModel<T>)? onLoading,
      Function(StateModel<T>)? onFail}) {
    ref.listen(provider, (previous, next) {
      print("User Request Here $next");
      next.handelStateWithoutWidget(onSuccess: (state) {
        if (showLoading == true && context.isThereCurrentDialogShowing()) {
          try {
            context.pop();
          } catch (e) {
            print("NAV cannont pop");
          }
        }
        if (showToast == true) {
          AppSnackBar.showSnackBar(context,
              isSuccess: true, message: state.message ?? "Success !");
        }

        if (alertKey != null) {
          alertKey.currentState?.showAlert(
              alertType: SimpleAlertType.success,
              message: state.message ?? "Success !");
        }

        onSuccess?.call(state as StateModel<T>);
      }, onFailure: (state) {
        if (context.isThereCurrentDialogShowing()) {
          context.pop();
        }
        if (showToast == true) {
          AppSnackBar.showSnackBar(context,
              isSuccess: false,
              message:
                  state.errors?.first ?? state.message ?? "somethingWrong");
        }

        if (alertKey != null) {
          var isAlert = state.message?.startsWith("Alert:") == true;

          alertKey.currentState?.showAlert(
              message: state.errors?.first ??
                  state.message?.replaceAll("Alert:", "") ??
                  "somethingWrong",
              alertType:
                  isAlert ? SimpleAlertType.alert : SimpleAlertType.danger);
        }

        onFail?.call(state as StateModel<T>);
      }, onLoading: (state) {
        onLoading?.call(state as StateModel<T>);
        showLoading == true ? context.showLoadingDialog() : print("loading");
      });
    });
  }
}

