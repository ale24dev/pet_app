import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_theme/app_theme.dart';

import 'package:pet_app/src/core/constants.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/routes/app_router.dart';
import 'package:pet_app/src/widgets/generic_button.dart';
import 'package:pet_app/src/core/widgets/generic_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                textInputAction: TextInputAction.next),
            const SizedBox.square(dimension: 20),
            GenericTextField(
                labelText: context.l10n.loginScreenPassword,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                obscureText: true),
            const SizedBox.square(dimension: 40),
            GenericButton(
                widget: Text(context.l10n.loginScreenLoginButton),
                function: () {
                  context.goNamed(AppRoute.home.name);
                }),
            const SizedBox.square(dimension: 20),
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
