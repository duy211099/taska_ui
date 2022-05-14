import 'package:flutter/material.dart';
import 'package:taska_ui/taska_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            child: Column(
              children: [
                TaskaInputField(
                  hintText: 'Placeholder',
                  autofocus: true,
                  onChanged: ((value) => print(value)),
                  icon: TaskaIcons.user,
                ),
                SizedBox(height: 10),
                TaskaInputField(
                  hintText: 'Placeholder',
                  icon: TaskaIcons.profile,
                ),
              ],
            ),
          ),
        ));
  }
}
