import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre a Equipe'),
        backgroundColor: const Color(0xFF89AFFF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF89AFFF),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0x6D1900FF),
                    child: Icon(
                      Icons.people,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nosso Projeto',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF070042),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'O RunTracker é um projeto acadêmico desenvolvido para a disciplina de Dispositivos Móveis.\n Nosso objetivo é criar uma experiência fácil para ajudar os usuários a monitorar suas corridas e melhorar seu desempenho físico.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF070042),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Equipe de Desenvolvimento',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF070042),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '- Valter Ruiz\n',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF070042),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
