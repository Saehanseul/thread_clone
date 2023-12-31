import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thread_clone/features/login/screens/signup_screen.dart';
import 'package:thread_clone/features/login/view_models/signup_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeURL = "/login";
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widgetbuild(BuildContext context) {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: "Email",
            ),
            onChanged: (value) {
              final state = ref.read(signUpForm.notifier).state;
              ref.read(signInForm.notifier).state = {...state, "email": value};
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: "Password",
            ),
            onChanged: (value) {
              final state = ref.read(signInForm.notifier).state;
              ref.read(signInForm.notifier).state = {
                ...state,
                "password": value,
              };
            },
          ),
          ElevatedButton(
            onPressed: () {
              print('onPressed');
              ref.read(signUpProvider.notifier).signIn(context);
            },
            child: const Text("Login"),
          ),
          GestureDetector(
            onTap: () {
              context.go(SignUpScreen.routeURL);
            },
            child: const Text("Sign up"),
          )
        ],
      ),
    );
  }
}
