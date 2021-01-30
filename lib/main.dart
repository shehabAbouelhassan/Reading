import 'package:Reading_Corner/screens/root/root.dart';
import 'package:Reading_Corner/states/currentUser.dart';
import 'package:Reading_Corner/utilis/OurTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // this widget is the root of your app
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          CurrentUser(), //bringing provider class,that makes the whole app have access to current user anytime!
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: OurRoot(),
      ),
    );
  }
}
