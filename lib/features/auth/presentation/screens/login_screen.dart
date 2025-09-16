import 'package:auth/core/Theme/Local_colors.dart';
import 'package:auth/core/utils/extensions/request_handle_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/Theme/text_styles.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../providers/controllers_providers.dart';
import '../providers/usecase_provider.dart';
import '../widgets/auth_header_widget.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/signup_suggestion.dart';

class LoginScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.read(loginControllerProvider);
    final state = ref.watch(loginControllerProvider);
    // Handle login success/failure
    handleState(
      loginStateNotifierProvider,
      showLoading: true,
      onSuccess: (res) => controller.handleLoginSuccess(context),
      onFail: (res) => controller.handleLoginError(context),

    );

    return PopScope(
      child: Scaffold(
        appBar: CustomAppBar(
          navigated: context.canPop(),
          appContext: context,
          title: 'Login screen',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const AuthHeaderWidget(marginTop: 44, marginBottom: 64),
                  LabeledTextField(
                    controller: controller.nameController,
                    hint: 'ahmed',
                    textInputType: TextInputType.name,
                    validator: (value) => controller.validateName(value),
                    label: Text(
                      'user name',
                      style: TextThemes.subtitleNeutralSimiBold,
                    ),
                  ),SizedBox(height: 16.px,),
                  LabeledTextField(
                    mode: AutovalidateMode.onUserInteraction,
                    isvisible: controller.isPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: LocalColors.neutral2,
                      ),
                      onPressed: () {
                        controller.togglePasswordVisibility();
                        // Trigger rebuild
                      },
                    ),
                    controller: controller.passwordController,
                    hint: "**********",
                    label: Text(
                      'password',
                      style: TextThemes.subtitleNeutralSimiBold,
                    ),
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'required*';
                      }
                      return null;
                    },
                    onChanged: (v) {},
                  ),SizedBox(height: 16.px,),
                  AppButton(width: double.infinity,
                    enabled: true,
                    height: 5.h,
                    text: 'login',
                    onPress: controller.login,
                  ),SizedBox(height: 16.px,),
                  SignUpSuggestion(
                    onTap: () => controller.signUp(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
