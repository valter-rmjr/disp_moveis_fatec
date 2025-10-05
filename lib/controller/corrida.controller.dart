import 'package:flutter/material.dart';

import '../model/corrida.model.dart';

class CorridaController extends ChangeNotifier {
  final List<Corrida> _corridas = [
    Corrida(tempo: '25', distancia: '5', data: '09/08/2025'),
    Corrida(tempo: '70', distancia: '15', data: '09/09/2025'),
    Corrida(tempo: '30', distancia: '5.5', data: '10/08/2025'),
    Corrida(tempo: '45', distancia: '7', data: '20/09/2025'),
  ];

  List<Corrida> get corridas => _corridas;

  bool _visualizarLista = true;
  bool get visualizarLista => _visualizarLista;

  final txtTempo = TextEditingController();
  final txtDistancia = TextEditingController();
  final txtData = TextEditingController();

  void alterarVisualizacao(valor) {
    _visualizarLista = valor;
    notifyListeners();
  }

  void adicionarCorrida(Corrida corrida) {
    String tempo = txtTempo.text;
    String distancia = txtDistancia.text;
    String data = txtData.text;

    _corridas.add(Corrida(tempo: tempo, distancia: distancia, data: data));

    txtTempo.clear();
    txtDistancia.clear();
    txtData.clear();

    notifyListeners();
  }

  void removerCorrida(Corrida corrida) {
    _corridas.remove(corrida);
    notifyListeners();
  }

  void alterarCorrida(index){
    String tempo = txtTempo.text;
    String distancia = txtDistancia.text;
    String data = txtData.text;

    _corridas[index] = Corrida(tempo: tempo, distancia: distancia, data: data);

    txtTempo.clear();
    txtDistancia.clear();
    txtData.clear();

    notifyListeners();
  }

  void limparCampos() {
    txtTempo.clear();
    txtDistancia.clear();
    txtData.clear();
  }
}