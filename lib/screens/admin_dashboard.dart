import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(AdminDashboard());

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UploadFileScreen(),
    );
  }
}

class UploadFileScreen extends StatefulWidget {
  @override
  _UploadFileScreenState createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  String? filePath;

  void _openFileExplorer() async {
      if (Theme.of(context).platform == TargetPlatform.android) {
    // Check if permission is granted, and request it if not
    var status = await Permission.storage.status;
    if (status.isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom, // You can specify the types of files to allow here.
      );
      if (result != null) {
        setState(() {
          filePath = result.files.single.path;
        });
      }
    } else {
      // Request permission
      await Permission.storage.request();
    }
  }else {
    // On other platforms (including desktop), you can handle file picking differently.
    // You may want to display a message or implement an alternative solution.
    print("File picking not supported on this platform.");
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.black),
              ),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _openFileExplorer,
                    child: Text('Choose File'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Selected File: ${filePath ?? "No file selected"}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
