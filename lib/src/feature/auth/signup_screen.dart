import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pet_app/src/core/constants.dart';
import 'package:pet_app/resources/l10n/l10n.dart';
import 'package:pet_app/src/core/validators.dart';
import 'package:pet_app/src/core/widgets/pet_async_generic_button.dart';
import 'package:pet_app/src/feature/auth/controllers/auth_controller.dart';
import 'package:pet_app/src/routes/app_router.dart';
import 'package:pet_app/src/core/services/auth_service.dart';
import 'package:pet_app/src/core/widgets/generic_text_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  late final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    var autFormService = ref.watch(authFormServiceProvider);
    //*Navigate to Home Screen
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      if (autFormService.isSubmited &&
          autFormService.errorMessage == FormErrorMessage.none) {
        context.goNamed(AppRoute.home.name);
      }
    }));

    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.HOR_MARGIN),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.l10n.signupScreenTitle,
                      style: AppTextStyle().title),
                  const SizedBox.square(dimension: 50),
                  const SizedBox.square(dimension: 20),
                  GenericTextField(
                      labelText: 'Nombre',
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textEditingController: firstNameController,
                      validator: PetValidator(context).firstName()),
                  const SizedBox.square(dimension: 20),
                  GenericTextField(
                      labelText: 'Apellidos',
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textEditingController: lastNameController,
                      validator: PetValidator(context).lastName()),
                  const SizedBox.square(dimension: 20),
                  GenericTextField(
                      labelText: context.l10n.signupScreenEmail,
                      textInputType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      textEditingController: emailController,
                      validator: PetValidator(context).email()),
                  const SizedBox.square(dimension: 20),
                  GenericTextField(
                      labelText: context.l10n.signupScreenPassword,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      textEditingController: passwordController,
                      validator: PetValidator(context).password()),
                  const SizedBox.square(dimension: 20),
                  const SizedBox.square(dimension: 30),
                  SizedBox(
                    width: double.infinity,
                    child: AsyncGenericButton(
                        asyncValue: authState,
                        child:
                            Text(context.l10n.signupScreenCreateAccountButton),
                        onTap: () async {
                          if (formKey.currentState?.validate() ?? false) {
                            formKey.currentState?.save();
                            final success = await ref
                                .read(authControllerProvider.notifier)
                                .signup(
                                    email: emailController.text,
                                    password: passwordController.text);

                            if (context.mounted && success) {
                              context.goNamed(AppRoute.layout.name);
                            }
                          }
                        }),
                  ),
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
      ),
    );
  }
}
