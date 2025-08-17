import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(

    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp()
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 390, 
                  height: 80,
                  color: Colors.green,
                  child: Center(
                    child: Text('Texto', 
                    style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ]
            ),
            Row(
              children: [
                Container(
                  width: 195,
                  height: 80,
                  color: Colors.red,
                  child: Center(
                  child: Text('A',
                    style: TextStyle(color: Colors.white)
                    ,)
                  ),
                ),
                Container(
                  width: 195,
                  height: 80,
                  color: Colors.red,
                  child: Center(
                  child: Text('B',
                    style: TextStyle(color: Colors.white)
                    ,)
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 390,
                  height: 604,
                  color: Colors.yellow,
                  child: Center(
                  child: Text('C',
                    style: TextStyle(color: Colors.black)
                           ,)
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 195,
                  height: 80,
                  color: Colors.blue,
                  child: Center(
                  child: Text('D',
                    style: TextStyle(color: Colors.white)
                           ,)
                ),
                ),
                Container(
                  width: 195,
                  height: 80,
                  color: Colors.blue,
                  child: Center(
                  child: Text('E',
                    style: TextStyle(color: Colors.white)
                           ,)
                ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}