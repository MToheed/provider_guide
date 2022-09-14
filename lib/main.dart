import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_guide/core/models/user.dart';
import 'package:provider_guide/locator.dart';
import 'package:provider_guide/ui/router.dart';

import 'core/services/auth_service.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (context) => locator<AuthService>().controller.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: MyRouter().generateRoute,
        initialRoute: "login",
      ),
    );
  }
}
