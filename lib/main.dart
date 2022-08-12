import 'package:triqui/pages/triqui_page.dart';
import 'package:triqui/provider/animation.dart';
import 'package:triqui/provider/count.dart';
import 'package:triqui/provider/provider.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:flutter/services.dart';
import 'package:triqui/provider/validator.dart';


void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TriquiProvider>(
            create: (context) => TriquiProvider(),
          ),
          ChangeNotifierProvider<CountProvider>(
            create: (context) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ValidatorProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AnimationProvider(),
          ),
        ],
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'TRIQUI',
            theme: ThemeData.light(),
            home: const TriquiPage(),
          );
        });
  }
}