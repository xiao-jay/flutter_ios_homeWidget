import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_widgetkit/flutter_widgetkit.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  final myController = TextEditingController();
  // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Enter a text',
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: TextField(
                        controller: myController
                    )),
                ElevatedButton(onPressed: () {
                  print(FlutterWidgetData(myController.text));
                  WidgetKit.setItem('widgetData', json.encode(FlutterWidgetData(myController.text).toJson()), 'group.flutter.home_widget');
                  WidgetKit.reloadAllTimelines();
                }, child: Text("Send to Widget"))
              ],
            ),
          ),
        ),
      );
    }
  }


class FlutterWidgetData {
  final String text;

  FlutterWidgetData(this.text);

  FlutterWidgetData.fromJson(Map<String, dynamic> json)
      : text = json['text'];

  Map<String, dynamic> toJson() =>
      {
        'text': text,
      };
}

