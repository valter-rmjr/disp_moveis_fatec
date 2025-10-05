import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:app_corrida/controller/corrida.controller.dart';
import 'package:app_corrida/model/corrida.model.dart';

class CorridaListView extends StatefulWidget {
  const CorridaListView({super.key});

  @override
  State<CorridaListView> createState() => _CorridaListViewState();
}

class _CorridaListViewState extends State<CorridaListView> {
  final ctrl = GetIt.I.get<CorridaController>();

  @override
  void initState() {
    super.initState();
    ctrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    ctrl.removeListener(() => setState(() {}));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Corridas Realizadas',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: const Color(0xFF89AFFF),
        actions: [
          // Botão para visualização em ListView
          IconButton(
            onPressed: () {
              ctrl.alterarVisualizacao(true);
            },
            icon: const Icon(
              Icons.view_list_outlined,
              color: Color(0xFfffffff),
            ),
          ),
          // Botão para visualização em GridView
          IconButton(
            onPressed: () {
              ctrl.alterarVisualizacao(false);
            },
            icon: const Icon(
              Icons.grid_view_outlined,
              color: Color(0xFfffffff),
            ),
          ),
          // Botão de Logout
          IconButton(
            onPressed: () => _mostrarDialogoLogout(),
            icon: const Icon(
              Icons.logout,
              color: Color(0xFfffffff),
            ),
            tooltip: 'Sair',
          ),
        ],
      ),
      // Body
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ctrl.visualizarLista ? _visualizarLista() : _visualizarGrid(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _caixaDialogo(-1);
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  // Diálogo de confirmação de logout
  void _mostrarDialogoLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Confirmar Saída',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: const Text(
            'Tem certeza que deseja sair do aplicativo?',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
                _realizarLogout();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Sair',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      },
    );
  }

  // Função para realizar o logout
  void _realizarLogout() {
    Navigator.pushReplacementNamed(context, '/login');
    
    // Mostrar mensagem de confirmação
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Logout realizado com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Caixa de Diálogo
  _caixaDialogo(int index) {
    if (index >= 0) {
      ctrl.txtTempo.text = ctrl.corridas[index].tempo;
      ctrl.txtDistancia.text = ctrl.corridas[index].distancia;
      ctrl.txtData.text = ctrl.corridas[index].data;
    } else {
      ctrl.limparCampos();
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      index >= 0 ? 'Alterar Corrida' : 'Adicionar Corrida',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campo Tempo
                    TextField(
                      controller: ctrl.txtTempo,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Tempo (min)',
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Campo Distância
                    TextField(
                      controller: ctrl.txtDistancia,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Distância (km)',
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Campo Data
                    TextField(
                      controller: ctrl.txtData,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: 'Data (dd/mm/aaaa)',
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Botões
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: const Text('Cancelar'),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            if (ctrl.txtTempo.text.isEmpty ||
                                ctrl.txtDistancia.text.isEmpty ||
                                ctrl.txtData.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Por favor, preencha todos os campos.'),
                                ),
                              );
                            } else {
                              if (index >= 0) {
                                ctrl.alterarCorrida(index);
                              } else {
                                ctrl.adicionarCorrida(
                                  Corrida(
                                    tempo: ctrl.txtTempo.text,
                                    distancia: ctrl.txtDistancia.text,
                                    data: ctrl.txtData.text,
                                  ),
                                );
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    index >= 0
                                        ? 'Corrida alterada com sucesso!'
                                        : 'Corrida adicionada com sucesso!',
                                  ),
                                ),
                              );
                              Navigator.of(context).pop();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Salvar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Visualização com ListView
  Widget _visualizarLista() {
    return ListView.builder(
      itemCount: ctrl.corridas.length,
      itemBuilder: (context, index) {
        final item = ctrl.corridas[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          child: ListTile(
            title: Text(
              'Distância: ${item.distancia} km',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Tempo: ${item.tempo} min | Data: ${item.data}',
            ),
            trailing: SizedBox(
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _caixaDialogo(index);
                    },
                    icon: const Icon(Icons.edit),
                    color: Colors.blue,
                  ),
                  IconButton(
                    onPressed: () {
                      ctrl.removerCorrida(ctrl.corridas[index]);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item removido com sucesso!'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete_outline),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Visualização com GridView
  Widget _visualizarGrid() {
    return GridView.builder(
      itemCount: ctrl.corridas.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        final item = ctrl.corridas[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tempo: ${item.tempo} min',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Distância: ${item.distancia} km',
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Data: ${item.data}',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}