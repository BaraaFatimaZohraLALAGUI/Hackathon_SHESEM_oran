import 'package:flutter/material.dart';
import 'package:meelad/widgets/textfield.dart';
import 'package:meelad/widgets/uploadfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meelad',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meelad'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Use buildTextField function from textfield.dart
            buildTextField(controller, 'رقم الهاتف', '+21300000000', 'assets/icons/phone.png'),
            SizedBox(height: 20),
            Text('Other widgets go here'),
            // Use buildUploadDocument function from uploadfile.dart
            buildUploadDocument('hint', 'label', 'docs/files', (bool success) {
              if (success) {
                print('File Uploaded successfully');
              } else {
                print('failed to upload file');
              }
            }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
