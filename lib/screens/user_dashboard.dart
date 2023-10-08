import 'package:flutter/material.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('User Dashboard'),
          ),
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
        height: 150,
        padding: new EdgeInsets.all(10.0),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Color.fromARGB(255, 143, 40, 129),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  title: Text(
                    'DUTY ON : ',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  subtitle:
                      Text(
                        '12-04-2023', style: TextStyle(fontSize: 18.0)
                        ),
                )
              ],
            )));
  }
}
