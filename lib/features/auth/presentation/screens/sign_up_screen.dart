import 'package:auth/core/utils/extensions/request_handle_extension.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/Theme/Local_colors.dart';
import '../../../../core/Theme/text_styles.dart';
import '../../../../core/utils/snaks.dart';
import '../../../../core/utils/validationUtils.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../providers/auth_validation_provider.dart';
import '../providers/controllers_providers.dart';
import '../providers/usecase_provider.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/labeled_text_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key, this.invitedId});

  final String? invitedId;

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // Get controller instance
    final controller = ref.watch(signUpControllerProvider);
    final validState = ref.watch(validationSignUpProvider);

    handleState(
      signUpStateNotifierProvider,
      showLoading: true,
      onSuccess: (res) {

        controller.handleSignUpSuccess(context);
      },
      onFail: (res) {
        controller.handleSignUpError(res.errors);
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        navigated: true,
        appContext: context,
        title: 'Registration screen',

      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AuthHeaderWidget(
                marginTop: 0.0,
                marginBottom: 48,
              ),
              LabeledTextField(
                controller: controller.firstNameController,
                focusNode: controller.focusNode,
                hint:'ahmed',
                textInputType: TextInputType.name,
                validator: (value) =>
                    controller.validateFirstName(value, context),
                label: Text(
                'first name',
                  style: TextThemes.subtitleNeutralSimiBold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              LabeledTextField(
                controller: controller.lastNameController,
                hint: 'ali',
                textInputType: TextInputType.name,
                validator: (value) =>
                    controller.validateLastName(value, context),
                label: Text(
                 'last name',
                  style: TextThemes.subtitleNeutralSimiBold,
                ),
              ),

              const SizedBox(height: 16),
              LabeledTextField(
                mode: AutovalidateMode.onUserInteraction,
                controller: controller.emailController,
                hint: "example@gmail.com",
                textInputType: TextInputType.emailAddress,
                validator: (email) => ValidationUtils.validateEmailInput(
                  context: context,
                  email: email,
                  validState: validState,
                ),
                label: Text(
                  'email',
                  style: TextThemes.subtitleNeutralSimiBold,
                ),
                onChanged: controller.onEmailChanged,
              ),  const SizedBox(height: 16),
              LabeledTextField(
                controller: controller.usernameController,
                hint: 'ahmed Ali',
                textInputType: TextInputType.name,
                validator: (value) =>
                    controller.validateLastName(value, context),
                label: Text(
                  'User name',
                  style: TextThemes.subtitleNeutralSimiBold,
                ),
              ),
              const SizedBox(height: 16),
              LabeledTextField(
                isvisible: controller.isPasswordVisible,
                textInputType: TextInputType.visiblePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: LocalColors.primary40,
                  ),
                  onPressed: () {
                    controller.togglePasswordVisibility();
                  },
                ),
                controller: controller.passwordController,
                hint: "*****************************",
                errorMaxLine: 3,
                validator: (value) =>
                    controller.validatePassword(value, context),
                label: Text(
                  'password',
                  style: TextThemes.subtitleNeutralSimiBold,
                ),
              ),
              const SizedBox(height: 24),
              AppButton(
                width: double.infinity,
                height: 5.h,
                backColor: LocalColors.primary40,
                text: 'continue',
                onPress: () => controller.signUp(context),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have an account? '),
                  GestureDetector(
                    onTap: () => controller.navigateToLogin(context),
                    child: Text(
                      'login',
                      style: TextThemes.midTitleBlackRegular.copyWith(
                        color: LocalColors.primary40,
                      ),
                    ),
                  ),
                ],
              ),SizedBox(height: 16.px,),
            ],
          ),
        ),
      ),
    );
  }
}
