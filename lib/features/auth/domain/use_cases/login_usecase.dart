import 'package:auth/core/constants/constants.dart';
import 'package:auth/core/services/get_it.dart';
import 'package:auth/features/auth/domain/providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/ResponseModel.dart';
import '../../../../core/models/StateModel.dart';
import '../../../../core/models/user_model.dart';
import '../../domain/entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends StateNotifier<StateModel<User>> {
  final Ref ref;
  final AuthRepository _authRepository;

  LoginUseCase(this.ref, this._authRepository) : super(StateModel());

  void call({String? username, String? password}) async {
    state = StateModel(state: DataState.LOADING);

    ResponseModel responseModel =
        await _authRepository.login(username: username, password: password);

    if (responseModel.code == 200) {
      var user = UserModel.fromJson(responseModel.data);

      // save user data
      ServiceLocator.prefs
          .setString(UserKeys.userToken, user.accessToken ?? '');
      ref.read(userProvider.notifier).setUser();
      state = StateModel(
          state: DataState.SUCCESS,
          data: toUserEntity(user),
          message: responseModel.message);
    } else {
      state = StateModel(
          state: DataState.ERROR,
          message: responseModel.message,
          errors: responseModel.errors);
    }
  }
}
