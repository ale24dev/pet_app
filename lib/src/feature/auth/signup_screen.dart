import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_theme/app_theme.dart';

import 'package:pet_app/src/core/constants.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/routes/app_router.dart';
import 'package:pet_app/src/widgets/generic_button.dart';
import 'package:pet_app/src/core/widgets/generic_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.HOR_MARGIN),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(context.l10n.signupScreenTitle, style: AppTextStyle().title),
              const SizedBox.square(dimension: 50),
              GenericTextField(
                  labelText: context.l10n.signupScreenEmail,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next),
              const SizedBox.square(dimension: 20),
              GenericTextField(
                  labelText: context.l10n.signupScreenPassword,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  obscureText: true),
              const SizedBox.square(dimension: 20),
              GenericTextField(
                  labelText: context.l10n.signupScreenConfirmPassword,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  obscureText: true),
              const SizedBox.square(dimension: 30),
              GenericButton(
                  widget: Text(context.l10n.signupScreenCreateAccountButton),
                  function: () {
                    context.goNamed(AppRoute.home.name);
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
                      context.goNamed(AppRoute.signUp.name);
                    },
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
