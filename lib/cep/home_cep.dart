import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeCep extends StatefulWidget {
  const HomeCep({Key? key}) : super(key: key);
  @override 
  _HomeCepState createState() => _HomeCepState();
}

class _HomeCepState extends State<HomeCep> {

  TextEditingController txtcep = new TextEditingController();
  String resultado= '';

_consultaCep() async {
  String cep = txtcep.text;
  String url = "https://viacep.com.br/ws/${cep}/json/";

  try {
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    String cidade = retorno["localidade"];
    String bairro = retorno["bairro"];
    String ddd = retorno["ddd"];

    setState(() {
      resultado = "Lougradoro: ${logradouro} , Cidade: ${cidade} , Bairro : ${bairro} , DDD : ${ddd}";
    });
  } catch (e) {
    setState(() {
      resultado = "Erro ao consultar o CEP";
    });
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consultando um CEP"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o Cep ex: 77270000",
              ),
              style: TextStyle(fontSize: 15),
              controller: txtcep,
            ),

            Text("Resultado : ${resultado}", style: TextStyle(fontSize: 25),),


            ElevatedButton(
                child: Text("Consultar", style: TextStyle(fontSize: 20),),
            onPressed: _consultaCep,
            )

  


          ],
          ),
      ),
    );
  }
}