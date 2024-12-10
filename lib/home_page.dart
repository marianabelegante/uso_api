import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  String resposta = '';

  final dio = Dio();

  Map<String, dynamic>? endereco;

  Future<Map<String, dynamic>> getHttp() async {
    final response = await dio.get('https://viacep.com.br/ws/76873490/json/');
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina incial'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Text(
                'Consumo de API',
              ),
              SizedBox(height: 32,),
              ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic>? end = await getHttp();
                    setState(()  {
                     endereco = end;
                    });
                  },
                  child: Text('Clique aqui')),
              SizedBox(height: 32,),
              Text('${endereco?['cep'] ?? ''}'),
              Text('${endereco?['logradouro'] ?? ''}'),
              Text('${endereco?['bairro'] ?? ''}'),
              Text('${endereco?['estado'] ?? ''}'),
            ],
          ),

        ),
      ),
    );
  }
}



