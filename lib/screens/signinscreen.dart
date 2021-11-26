import 'package:flutter/material.dart';
import 'package:onboarding/widgets/signinform.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SigninForm(),)) ;
  }
}
