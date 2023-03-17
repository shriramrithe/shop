import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/ui/home_screen/home_provider.dart';
import 'package:shop/ui/home_screen/home_screen.dart';
import 'package:shop/ui/second_screen/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
