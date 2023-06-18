import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pet_app/src/core/utils.dart';

part 'auth_service.g.dart';

enum FormErrorMessage { none, email, password, confirmPassword }

class AuthForm {
  final String email;
  final String password;
  final String confirmPassword;
  final FormErrorMessage? errorMessage;

  ///Check if form has submited
  final bool isSubmited;

  AuthForm(
      {this.email = '',
      this.isSubmited = false,
      this.password = '',
      this.confirmPassword = '',
      this.errorMessage});

  AuthForm copyWith(
          {String? email,
          String? password,
          String? confirmPassword,
          FormErrorMessage? errorMessage,
          bool? isSubmited}) =>
      AuthForm(
        email: email ?? this.email,
        errorMessage: errorMessage ?? this.errorMessage,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        isSubmited: isSubmited ?? this.isSubmited,
      );

  @override
  String toString() {
    return 'AuthForm { email: $email, password: $password, confirmPassword: $confirmPassword, errorMessage: $errorMessage, isSubmitted: $isSubmited }';
  }
}

@riverpod
class AuthFormService extends _$AuthFormService {
  @override
  AuthForm build() {
    return AuthForm();
  }

  // resetState() {
  //   state = state.copyWith(
  //       email: '',
  //       password: '',
  //       confirmPassword: '',
  //       errorMessage: FormErrorMessage.none,
  //       isSubmited: null);
  // }

  onSubmitRegisterButton(
      {required String email,
      required String password,
      required String confirmPassword}) {
    var emailValid = Utils.validateEmail(email);
    var passwordValid = Utils.validatePassword(password);
    var passwordAreEquals =
        Utils.checkIfPasswordsAreEquals(password, confirmPassword);
    state = state.copyWith(
        isSubmited: true,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        errorMessage: !emailValid
            ? FormErrorMessage.email
            : !passwordValid
                ? FormErrorMessage.password
                : !passwordAreEquals
                    ? FormErrorMessage.confirmPassword
                    : FormErrorMessage.none);
  }

  onSubmitLoginButton({
    required String email,
    required String password,
  }) {
    var emailValid = Utils.validateEmail(email);
    var passwordValid = Utils.validatePassword(password);

    state = state.copyWith(
        isSubmited: true,
        email: email,
        errorMessage: !emailValid
            ? FormErrorMessage.email
            : !passwordValid
                ? FormErrorMessage.password
                : FormErrorMessage.none);
  }
}
