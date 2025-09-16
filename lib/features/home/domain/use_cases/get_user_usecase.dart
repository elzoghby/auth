import 'package:auth/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/ResponseModel.dart';
import '../../../../core/models/StateModel.dart';
import '../../../../core/models/user_model.dart';
import '../entities/home_user_entity.dart';

class GetUserUseCase extends StateNotifier<StateModel<HomeUser>> {
  final Ref ref;
  final HomeRepository _homeRepository;

  GetUserUseCase(this.ref, this._homeRepository) : super(StateModel());

  void call() async {
    state = StateModel(state: DataState.LOADING);

    ResponseModel responseModel = await _homeRepository.getUser();

    if (responseModel.code == 200) {
      var user = UserModel.fromJson(responseModel.data);

      state = StateModel(
          state: DataState.SUCCESS,
          data: toHomeUserEntity(user),
          message: responseModel.message);
    } else {
      state = StateModel(
          state: DataState.ERROR,
          message: responseModel.message,
          errors: responseModel.errors);
    }
  }
}
