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
             Colors.blueAccent,
             Color.fromARGB(255, 166, 8, 198),
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
            padding: const EdgeInsets.only(left:20.0,top:220.0,right: 20.0),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color:Color.fromARGB(87, 255, 255, 255),
              ),
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
                  Padding(  
                  padding: const EdgeInsets.fromLTRB(150,20,150,20),  
                  child: TextField(  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(155, 233, 227, 227)),
                        borderRadius: BorderRadius.circular(10.0)
                      ),  
                      labelText: 'Email Address',  
                      hintText: 'Enter your email',  
                    ),  
                  ),  
                ),  
                 Padding(  
                  padding: EdgeInsets.fromLTRB(150,20,150,20),  
                  child: TextField( 
                    obscureText: true,  
                    decoration: InputDecoration(  
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(155, 233, 227, 227)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),  
                      labelText: 'Password',  
                      hintText: 'Enter your password',  
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
                )
                ]),
               ),
               ),
        ],
      )
    );
  }
}