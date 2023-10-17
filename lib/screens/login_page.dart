import 'dart:convert';

import 'package:exam_duty_app/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final storage = FlutterSecureStorage();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

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

  Future attemptLogIn(
    String email,
  ) async {
    var res = await http.post(Uri.parse('http://172.17.104.35:5000/auth/login'),
        body: {"email": email});
    if (res.statusCode == 200) {
      final Map<String, dynamic> _body = json.decode(res.body);

      final Map<String, dynamic> _data = _body['data'];

      return _data['accessToken'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Color.fromARGB(255, 166, 8, 198),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(100.0),
              child: Text(
                'Name',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, top: 230.0, right: 5.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
                color: Color.fromARGB(87, 255, 255, 255),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(155, 233, 227, 227)),
                            borderRadius: BorderRadius.circular(10.0)),
                        labelText: 'Email Address',
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(50, 20, 50, 50),
                  //   child: TextField(
                  //     obscureText: true,
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderSide: const BorderSide(
                  //           color: Color.fromARGB(155, 233, 227, 227),
                  //         ),
                  //         borderRadius: BorderRadius.circular(10.0),
                  //       ),
                  //       labelText: 'Password',
                  //     ),
                  //   ),
                  // ),
                  ElevatedButton(
                    onPressed: () async {
                      var email = _emailController.text;

                      var jwt = await attemptLogIn(email);
                      if (jwt != null) {
                        authProvider.setJwt(jwt);
                        storage.write(key: "jwt", value: jwt);
                        storage.write(key: "email", value: email);
                        Navigator.pushReplacementNamed(context, '/user');
                        _loggingIn();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
