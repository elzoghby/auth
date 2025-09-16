import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/providers/http_provider.dart';
import '../../../../core/services/get_it.dart';
import '../../domain/entities/user_entity.dart';

class UserProvider extends StateNotifier<User?> {
  final Ref ref;

  UserProvider(this.ref) : super(null);

  setUser() {
    String? token = ServiceLocator.prefs.getString(UserKeys.userToken);
    ref.read(httpOperationsProvider).userToken = token;

  }

}

final userProvider = StateNotifierProvider<UserProvider, User?>((ref) {
  return UserProvider(ref);
});
