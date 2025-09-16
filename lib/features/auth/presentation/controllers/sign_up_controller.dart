import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_paths.dart';
import '../../../../core/utils/snaks.dart';
import '../providers/auth_validation_provider.dart';
import '../providers/usecase_provider.dart';

class SignUpController extends StateNotifier<bool> {
  final Ref ref;


  // Text Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  // Form and Focus
  final formKey = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();

  // Phone Number

  // Password Visibility - using regular bool with notifyListeners
  bool isPasswordVisible = true;

  // Terms Agreement

  // Validation States

  SignUpController(this.ref, ) : super(false) {
    _setupListeners();
  }

  void _setupListeners() {
    emailController.addListener(() {
      ref.read(validationSignUpProvider.notifier).updateStatue({});
    });
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    // Trigger UI rebuild by changing state
    state = !state;
  }

  void onEmailChanged(String value) {
    emailController.text = value;
    ref.read(validationSignUpProvider.notifier).updateStatue({});
  }

  void navigateToLogin(BuildContext context) {
    context.go(loginScreenRoute);
  }

  void navigateToTerms() {
    // Navigate to Terms screen
    // Implementation depends on your routing setup
  }

  void signUp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      registerNewUser();
    }
  }

  void registerNewUser() {
    ref.read(signUpStateNotifierProvider.notifier).call(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          username: usernameController.text,
          password: passwordController.text,
        );
  }

  void handleSignUpSuccess(BuildContext context) {
    AppSnackBar.showSnackBar(context,
        isSuccess: true, message: "account registered successfully !");
    context.go(loginScreenRoute);
  }

  void handleSignUpError(List<String>? errors) {
    Map<String, String> errorMap = {};

    for (String error in (errors ?? [])) {
      if (error.contains("email")) {
        errorMap["email"] = error;
      }
      if (error.contains("phone")) {
        errorMap["phone"] = error;
      }
      if (error.contains("name")) {
        errorMap["name"] = error;
      }
    }
    ref.read(validationSignUpProvider.notifier).updateStatue(errorMap);
  }

  // Validation Methods
  String? validateFirstName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'First name is required*';
    } else if (value.length < 2) {
      return 'min 2 chars';
    }
    return null;
  }

  String? validateLastName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'Last name is required*';
    } else if (value.length < 2) {
      return 'min 2 chars';
    }
    return null;
  }

  String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'required*';
    } else if (value.length < 6) {
      return 'min 6 chars';
    }
    return null;
  }

  String? validateUsername(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'required*';
    } else if (value.length < 2) {
      return 'min 2 chars';
    }
    return null;
  }

  void disposeControllers() {
    // Remove listeners
    emailController.removeListener(() {});

    // Dispose Controllers
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();

    // Dispose FocusNode
    focusNode.dispose();
  }
}

