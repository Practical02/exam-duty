import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:exam_duty_app/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'login_page.dart';
import '../widgets/my_card.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  late Map<String, dynamic> _duties = {};

  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    _logging();
    _fetchDuties();
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

  Future<void> _fetchDuties() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    String? jwt = authProvider.jwt;
    print(jwt);
    String? email = await storage.read(key: 'email');
    try {
      final response = await http.post(
        Uri.parse('http://172.17.104.35:5000/duty/duties'),
        headers: {
          'Authorization': 'Bearer $jwt',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON response and update the duties list
        setState(() {
          _duties = json.decode(response.body);
        });
        print(_duties);
      } else {
        // If the request is not successful, handle the error
        print('Failed to load duties. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions, such as network errors
      print('Error: $e');
    }
  }

  List<String> convertDateList(List<String> dateList) {
    List<String> formattedDateList = [];

    for (String dateString in dateList) {
      try {
        // Parse the date string into a DateTime object.
        final originalDate = DateTime.parse(dateString);

        // Format the DateTime to your desired format "dd-MM-yyyy".
        final formattedDate = DateFormat('dd-MM-yyyy').format(originalDate);

        formattedDateList.add(formattedDate);
      } catch (e) {
        // Handle any parsing errors, e.g., invalid date string format.
        formattedDateList.add('Invalid Date');
      }
    }

    return formattedDateList;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    String formattedDate = '';
    if (_duties['data'] != null && _duties['data'].isNotEmpty) {
      final date =
          _duties['data'][0]['date']; // Assuming you want the first date
      final originalDate = DateTime.parse(date);
      formattedDate = DateFormat('dd-MM-yyyy').format(originalDate);
    } else {
      formattedDate =
          'No Date Available'; // Handle the case where no date is available
    }
    String? jwt = authProvider.jwt;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Dashboard'),
          backgroundColor: const Color.fromARGB(255, 11, 130, 185),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
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
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text(' Dashboard '),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const UserDashboard(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  _loggingIn();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: MyCard(
          dutyDate: formattedDate,
        ),
      ),
    );
  }
}
