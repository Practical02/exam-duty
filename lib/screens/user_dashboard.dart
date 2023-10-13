import 'package:flutter/material.dart';
import 'login_page.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('User Dashboard'),
            backgroundColor: Color.fromARGB(255, 11, 130, 185),
          ),
          drawer: Drawer(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ), //BoxDecoration
                  child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    accountName: Text(
                      "Abhishek Mishra",
                      style: TextStyle(fontSize: 18),
                    ),
                    accountEmail: Text("abhishekm977@gmail.com"),
                    currentAccountPictureSize: Size.square(50),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 108, 217, 166),
                      child: Text(
                        "A",
                        style: TextStyle(fontSize: 30.0, color: Colors.blue),
                      ), //Text
                    ), //circleAvatar
                  ), //UserAccountDrawerHeader
                ), //DrawerHeader
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text(' Dashboard '),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => UserDashboard(),
                    ));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('LogOut'),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
                  },
                ),
              ],
            ),
          ), //Drawer
          body: Align(
            alignment: Alignment.topLeft,
            child: Mycard(),
          )),
    );
  }
}

class Mycard extends StatelessWidget {
  const Mycard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 240,
        padding: new EdgeInsets.all(10.0),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Color.fromARGB(255, 143, 40, 129),
                )),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                title: Row(
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'DUTY ON : ',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(fontSize: .0),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'DUTY AT : ',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(fontSize: .0),
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              )
            ])));
  }
}
