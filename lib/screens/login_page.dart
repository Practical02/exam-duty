import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
         gradient: LinearGradient(
          colors:[
            Color.fromARGB(255, 53, 37, 228),
            Colors.pink,
            ]),
        ),
      child: const Padding(
          padding: EdgeInsets.all(100.0),
          child: Text('Name',style:TextStyle(
            fontSize:40,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
      ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:250.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                ),
                color:Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center ,
                children:[
                  const Padding(  
                  padding: EdgeInsets.all(15),  
                  child: TextField(  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'User Name',  
                      hintText: 'Enter Your Name',  
                    ),  
                  ),  
                ),  
                const Padding(  
                  padding: EdgeInsets.all(15),  
                  child: TextField(  
                    obscureText: true,  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(),  
                      labelText: 'Password',  
                      hintText: 'Enter Password',  
                    ),  
                  ),  
                ),  
ElevatedButton(
                onPressed: () {
                  // Add your login logic here
                  // Typically, you'd validate the credentials and navigate to the next screen on success.
                  // For this example, we'll just navigate to the user dashboard.
                  Navigator.pushReplacementNamed(context, '/user');
                },
                child: const Text('Login'),
              ),

                ]),
               ),
               ),
        ],
      )
    );
  }
}