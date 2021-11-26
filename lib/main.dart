import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/providers/authprovider.dart';
import 'package:onboarding/providers/dataprovider.dart';
import 'package:onboarding/router.dart';
import 'package:onboarding/screens/servicesceen.dart';
import 'package:onboarding/screens/signinscreen.dart';

import 'package:onboarding/themes/theme.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authprovider()),
        ChangeNotifierProxyProvider<Authprovider, DataProvider>(
            create: (_) => DataProvider(token: '', genratedToken: ''),
            update: (ctx, auth, prevdata) =>
                DataProvider(token: auth.token, genratedToken: auth.token))
      ],
      child: Consumer<Authprovider>(
        builder: (ctx, authdata, _) => MaterialApp(
          theme: AppTheme.lightTheme,
          home: authdata.isAuth
              ? const ServiceScreen()
              : FutureBuilder(
                  future: authdata.tryAutoLogin(),
                  builder: (ctx, authsnapshot) =>
                      authsnapshot.connectionState == ConnectionState.waiting
                          ? CircularProgressIndicator()
                          : const SigninScreen(),
                ),
          routes: routes,
        ),
      ),
    );
  }
}
