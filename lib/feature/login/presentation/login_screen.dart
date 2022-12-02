import 'package:city_weather/feature/login/presentation/widget/label_text.dart';
import 'package:city_weather/feature/login/presentation/widget/login_from.dart';
import 'package:city_weather/feature/search/presentation/search_screen.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginForm(
                    formLabe: S.current.sign_in,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    formKey: _formKey,
                    buttonLabel: S.current.sign_in,
                    onPressed: () {}),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(),
                const SizedBox(
                  height: 48,
                ),
                LabelText(
                  S.current.no_account,
                  color: Colors.black,
                  bold: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  child: LabelText(
                    S.current.sign_up,
                    color: Colors.blue,
                    bold: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
