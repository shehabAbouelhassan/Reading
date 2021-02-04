import 'package:Reading_Corner/models/auth_model.dart';
import 'package:Reading_Corner/screens/root/root.dart';
import 'package:Reading_Corner/services/auth.dart';
import 'package:Reading_Corner/utils/OurTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // this widget is the root of your app
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthModel>.value(
      //bringing provider class,that makes the whole app have access to current user anytime!
      value: Auth().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: OurRoot(),
      ),
    );
  }
}
