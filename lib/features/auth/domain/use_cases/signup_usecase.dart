import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/ResponseModel.dart';
import '../../../../core/models/StateModel.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase extends StateNotifier<StateModel<User>> {
  final Ref ref;
  final AuthRepository _authRepository;

  SignupUseCase(this.ref, this._authRepository) : super(StateModel());

  void call({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? username,
  }) async {
    state = StateModel.loading();

    ResponseModel responseModel = await _authRepository.signUp(
      firstName: firstName,
      lastName: lastName,
      email: email,
      username: username,
      password: password,
    );

    if (responseModel.code == 201) {

      state = StateModel(
          state: DataState.SUCCESS,

          message: responseModel.message);
    } else {
      state = StateModel(
          state: DataState.ERROR,
          message: responseModel.message,
          errors: responseModel.errors);
    }
  }
}
