
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 16.0),
              const TextField(
                obscureText: true, // Use this for password input
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  // Add your login logic here
                  // Typically, you'd validate the credentials and navigate to the next screen on success.
                  // For this example, we'll just navigate to the user dashboard.
                  Navigator.pushReplacementNamed(context, '/user');
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
  
      ) 
    );
  }
}



   

