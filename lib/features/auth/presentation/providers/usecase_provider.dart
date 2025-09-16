
import '../../../../core/models/StateModel.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/providers/auth_repository_provider.dart';
import '../../domain/use_cases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_cases/signup_usecase.dart';


final loginStateNotifierProvider =
    StateNotifierProvider.autoDispose<LoginUseCase, StateModel<User>>(
        (ref) => LoginUseCase(ref, ref.read(authRepoProvider)));



final signUpStateNotifierProvider =
    StateNotifierProvider.autoDispose<SignupUseCase, StateModel<User>>(
        (ref) => SignupUseCase(ref, ref.read(authRepoProvider)));


