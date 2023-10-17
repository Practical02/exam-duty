import 'package:exam_duty_app/auth.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/admin_dashboard.dart';
import 'screens/user_dashboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    _logging();
  }

  void _logging() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loggedIn = prefs.getBool('loginStat') ?? false;
    });
  }

  void _loggingIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loggedIn = true;
      prefs.setBool('loginStat', loggedIn);
    });
  }

  void loggingOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loggedIn = false;
      prefs.setBool('loginStat', loggedIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: loggedIn ? '/user' : '/',
      routes: {
        '/': (context) => LoginPage(),
        '/user': (context) => UserDashboard(),
        '/admin': (context) => AdminDashboard(),
      },
    );
  }
}
