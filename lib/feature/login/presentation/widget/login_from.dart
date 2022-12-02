import 'package:city_weather/generated/l10n.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final Key formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;
  final String buttonLabel;
  final String formLabe;
  const LoginForm(
      {Key? key,
      required this.formKey,
      required this.emailController,
      required this.passwordController,
      required this.onPressed,
      required this.buttonLabel,
      required this.formLabe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          formLabe,
          style: const TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: S.current.email,
                    border: const OutlineInputBorder(),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return value != null && !EmailValidator.validate(value)
                        ? S.current.valid_email
                        : null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: S.current.password,
                    border: const OutlineInputBorder(),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    return value != null && value.length < 6
                        ? S.current.min_requirements
                        : null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                    onPressed: onPressed, child: const Text(' Login '))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
