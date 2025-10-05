<<<<<<< HEAD
import 'package:app_corrida/controller/corrida.controller.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get_it/get_it.dart';

import 'view/login_view.dart';
import 'view/cadastro_view.dart';
import 'view/recupera_view.dart';
import 'view/sobre_view.dart';
import 'view/corrida_view.dart';

final g = GetIt.instance;

void main() {
  g.registerSingleton<CorridaController>(CorridaController());
  
  runApp(DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
);
=======
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(

    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp()
    ),
  );
>>>>>>> 54ee9696c6c4b0b149e186b172ed1e6f6cbe7083
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

<<<<<<< HEAD
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RunTracker',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginView(),
      routes: {
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/recuperar': (context) => const RecoverView(),
        '/sobre': (context) => const AboutView(),
        '/lista': (context) => const CorridaListView(),
      },
=======
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
>>>>>>> 54ee9696c6c4b0b149e186b172ed1e6f6cbe7083
    );
  }
}