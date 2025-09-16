
import 'package:auth/features/home/domain/entities/home_user_entity.dart';
import 'package:auth/features/home/domain/providers/home_repository_provider.dart';

import '../../../../core/models/StateModel.dart';
import '../../domain/use_cases/get_user_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final homeStateNotifierProvider =
    StateNotifierProvider.autoDispose<GetUserUseCase, StateModel<HomeUser>>(
        (ref) => GetUserUseCase(ref, ref.read(homeRepoProvider)));



