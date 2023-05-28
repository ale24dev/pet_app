import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pet_app/src/core/utils.dart';
import 'package:pet_app/src/core/constants.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/core/widgets/phone_text_field.dart';
import 'package:pet_app/src/routes/app_router.dart';
import 'package:pet_app/src/widgets/generic_button.dart';
import 'package:pet_app/src/core/services/auth_service.dart';
import 'package:pet_app/src/core/widgets/generic_text_field.dart';
import 'package:pet_app/src/feature/auth/constants/aut_form_type.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    for (final controller in [
      emailController,
      passwordController,
      confirmPasswordController,
      phoneController
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var autFormService = ref.watch(authFormServiceProvider);
    //*Navigate to Home Screen
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      if (autFormService.isSubmited &&
          autFormService.errorMessage == FormErrorMessage.none) {
        context.goNamed(AppRoute.layout.name);
      }
    }));

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.HOR_MARGIN),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.l10n.signupScreenTitle,
                    style: AppTextStyle().title),
                const SizedBox.square(dimension: 50),
                GenericTextField(
                  labelText: context.l10n.signupScreenEmail,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  textEditingController: emailController,
                  errorText: Utils.getAuthFormTextByEnum(
                      context: context,
                      formErrorMessage: autFormService.errorMessage,
                      authFormType: AuthFormType.email),
                ),
                const SizedBox.square(dimension: 20),
                PhoneTextField(controller: phoneController),
                GenericTextField(
                    labelText: context.l10n.signupScreenPassword,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    textEditingController: passwordController,
                    errorText: Utils.getAuthFormTextByEnum(
                        context: context,
                        formErrorMessage: autFormService.errorMessage,
                        authFormType: AuthFormType.password)),
                const SizedBox.square(dimension: 20),
                GenericTextField(
                    labelText: context.l10n.signupScreenConfirmPassword,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    textEditingController: confirmPasswordController,
                    errorText: Utils.getAuthFormTextByEnum(
                        context: context,
                        formErrorMessage: autFormService.errorMessage,
                        authFormType: AuthFormType.confirmPassword)),
                const SizedBox.square(dimension: 30),
                GenericButton(
                    widget: Text(context.l10n.signupScreenCreateAccountButton),
                    function: () {
                      ref
                          .read(authFormServiceProvider.notifier)
                          .onSubmitRegisterButton(
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text);
                    }),
                const SizedBox.square(dimension: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(context.l10n.signupScreenHaveAccount),
                    const SizedBox.square(dimension: 5),
                    TextButton(
                      child: Text(context.l10n.signupScreenLogin,
                          style: AppTextStyle()
                              .body
                              .copyWith(color: AppColor.primary)),
                      onPressed: () {
                        context.goNamed(AppRoute.login.name);
                      },
                    ),
                  ],
                )
              ])),
    );
  }
}
