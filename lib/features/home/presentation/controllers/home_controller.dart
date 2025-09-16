import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/route/app_paths.dart';
import '../../../../core/services/get_it.dart';

class HomeController extends StateNotifier<bool> {
  final Ref ref;

  HomeController(this.ref) : super(false);

  void logout(BuildContext context) {
    ServiceLocator.prefs.remove(UserKeys.userToken);
    context.go(loginScreenRoute);
  }
}
