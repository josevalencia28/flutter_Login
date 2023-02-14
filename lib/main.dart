import 'package:flutter/material.dart';
//  import 'package: form_validation/form_screen.dart';
import 'package:flutter_application_1/form.screen.dart';

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormScreen(),
    );
  }
}
