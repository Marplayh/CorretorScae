import 'package:flutter/material.dart';
import '/screens/login_screen.dart';
import '/screens/home_screen.dart';
import '/screens/leads_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Corretor',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/login', // Tela inicial
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/leads' : (context) => LeadScreen(),
      },
    );
  }
}
