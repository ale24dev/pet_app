import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_app/src/core/async_value.dart';

import 'package:pet_app/src/core/utils.dart';
import 'package:pet_app/src/core/constants.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/core/widgets/pet_async_generic_button.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:pet_app/src/routes/app_router.dart';
import 'package:pet_app/src/core/services/auth_service.dart';
import 'package:pet_app/src/core/widgets/generic_text_field.dart';
import 'package:pet_app/src/feature/auth/constants/aut_form_type.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
     ref.listen(authControllerProvider,
        (_, state) => state.showAlertDialogOnError(context),);
    var autFormService = ref.watch(authFormServiceProvider);
    //*Navigate to Home Screen
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      if (autFormService.isSubmited &&
          autFormService.errorMessage == FormErrorMessage.none) {
        context.goNamed(AppRoute.home.name);
      }
    }));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.HOR_MARGIN),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.l10n.loginScreenTitle, style: AppTextStyle().title),
            const SizedBox.square(dimension: 50),
            GenericTextField(
              labelText: context.l10n.loginScreenEmail,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              textEditingController: emailController,
              errorText: Utils.getAuthFormTextByEnum(
                  context: context,
                  formErrorMessage: autFormService.errorMessage,
                  authFormType: AuthFormType.email),
            ),
            const SizedBox.square(dimension: 20),
            GenericTextField(
                labelText: context.l10n.loginScreenPassword,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: true,
                textEditingController: passwordController,
                errorText: Utils.getAuthFormTextByEnum(
                    context: context,
                    formErrorMessage: autFormService.errorMessage,
                    authFormType: AuthFormType.password)),
            const SizedBox.square(dimension: 30),
            Center(
              child: AsyncGenericButton(
                  asyncValue: authState,
                  child: Text(context.l10n.loginScreenLoginButton),
                  onTap: () async {
                    final success = await ref
                        .read(authControllerProvider.notifier)
                        .login(
                            email: emailController.text,
                            password: passwordController.text);

                    if (context.mounted && success) {
                      print(success);
                    }else{
                      print(authState.error);
                    }
                  }),
            ),
            const SizedBox.square(dimension: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.l10n.loginScreenHaveAccount),
                const SizedBox.square(dimension: 5),
                TextButton(
                  child: Text(context.l10n.loginScreenRegisterButton,
                      style: AppTextStyle()
                          .body
                          .copyWith(color: AppColor.primary)),
                  onPressed: () {
                    context.goNamed(AppRoute.signUp.name);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
