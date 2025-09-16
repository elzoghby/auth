import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_paths.dart';
import '../../../../core/utils/snaks.dart';
import '../providers/auth_validation_provider.dart';
import '../providers/usecase_provider.dart';

class LoginController extends StateNotifier<bool> {
  final Ref ref;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> enableLogin = ValueNotifier(false);

  bool isPasswordVisible = true;

  LoginController(this.ref) : super(false) {
    nameController.addListener(_updateLoginState);
    passwordController.addListener(_updateLoginState);
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  void _updateLoginState() {
    bool allValid =
        nameController.text.length > 1 && passwordController.text.length > 1;
    enableLogin.value = allValid;
  }

  void signUp(BuildContext context) {
    context.push(signUpScreenRoute);
  }

  void login() {
    ref.read(validationLoginProvider.notifier).updateStatue({});

    ref.read(loginStateNotifierProvider.notifier).call(
          username: nameController.text,
          password: passwordController.text,
        );
  }

  void signInWithApple() {
    // Apple login implementation
  }

  void handleLoginSuccess(BuildContext context) {
    AppSnackBar.showSnackBar(context,
        isSuccess: true, message: "login succeeded !");

    navigateToMainScreen(context);
  }

  void handleLoginError(BuildContext context) {
    AppSnackBar.showSnackBar(context,
        isSuccess: false, message: "invalid credentials");
  }

  void navigateToMainScreen(BuildContext context) {
    context.go(mainScreenRoute);
  }

  String? validateName(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'required';
    }
    return null;
  }

  disposeControllers() {
    print('disposeControllers');

    nameController.removeListener(_updateLoginState);
    passwordController.removeListener(_updateLoginState);

    // Dispose resources
    nameController.dispose();
    enableLogin.dispose();
    passwordController.dispose();
  }
}
