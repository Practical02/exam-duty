import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/admin_dashboard.dart';
import 'screens/user_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/user': (context) => const UserDashboard(),
        '/admin': (context) => const AdminDashboard(),
      },
    );
  }
}
