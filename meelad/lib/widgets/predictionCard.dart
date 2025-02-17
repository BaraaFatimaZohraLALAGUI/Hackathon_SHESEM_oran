import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CenteredCardWidget extends StatefulWidget {
  @override
  _CenteredCardWidgetState createState() => _CenteredCardWidgetState();
}

class _CenteredCardWidgetState extends State<CenteredCardWidget> {
  TextEditingController systolicBPController = TextEditingController();
  TextEditingController diastolicBPController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController bloodSugarController = TextEditingController();
  TextEditingController heartRateController = TextEditingController();

  Future<void> predict() async {
    var url = Uri.parse('http://127.0.0.1:5000/api');
    print("sending reques >>>>>>>>>>>>>>>>>>");
    var response = await http.get(Uri.parse(
        '$url?systolicbp=${systolicBPController.text}&diastolicbp=${diastolicBPController.text}&bodytemp=${temperatureController.text}&bs=${bloodSugarController.text}&heartrate=${heartRateController.text}'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // Handle the response data
      print(data);
    } else {
      print('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('SystolicBP'),
                      SizedBox(height: 4.0),
                      TextField(
                        controller: systolicBPController,
                        decoration: InputDecoration(
                          labelText: '130 mmhg',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DiastolicBP'),
                      SizedBox(height: 4.0),
                      TextField(
                        controller: diastolicBPController,
                        decoration: InputDecoration(
                          labelText: '80 mmhg',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Temperature'),
                      SizedBox(height: 4.0),
                      TextField(
                        controller: temperatureController,
                        decoration: InputDecoration(
                          labelText: '98 F',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Blood Sugar'),
                      SizedBox(height: 4.0),
                      TextField(
                        controller: bloodSugarController,
                        decoration: InputDecoration(
                          labelText: '15 mmol/l',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Heart Rate'),
                      SizedBox(height: 4.0),
                      TextField(
                        controller: heartRateController,
                        decoration: InputDecoration(
                          labelText: '98 bpm',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                predict();
              },
              child: Text('Predict'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Centered Card Widget'),
      ),
      body: CenteredCardWidget(),
    ),
  ));
}
