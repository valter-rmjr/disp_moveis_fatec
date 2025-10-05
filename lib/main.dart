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
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
    );
  }
}