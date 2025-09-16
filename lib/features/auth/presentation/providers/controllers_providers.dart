import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/login_controller.dart';
import '../controllers/sign_up_controller.dart';

final loginControllerProvider = Provider.autoDispose<LoginController>((ref) {
  final controller = LoginController(ref);

  // This will be called when the provider is disposed
  ref.onDispose(() {
    controller.disposeControllers();
  });

  return controller;
});

final signUpControllerProvider =
Provider.autoDispose<SignUpController>((ref, ) {
  final controller = SignUpController(ref, );

  ref.onDispose(() {
    controller.disposeControllers();
  });

  return controller;
});
