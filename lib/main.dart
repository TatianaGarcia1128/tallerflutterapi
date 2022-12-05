import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller/pages/pages.dart';
import 'package:taller/provider/photos_provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => PhotosProvider(), lazy: false)
    ],
    child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'home',
      routes:{
        'home': (context) => HomePage(),
        'detail': (context) => DetailPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
