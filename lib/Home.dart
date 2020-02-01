import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _real = "Real";
  String _dolar = "Dolar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _real,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _dolar,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: RaisedButton(
                  child: Text("Ver o Preço"),
                  onPressed: () async {
                    String url = "https://blockchain.info/ticker";
                    http.Response response;
                    response = await http.get(url);
                    Map<String, dynamic> retorno = json.decode(response.body);
                    setState(() {
                      _real =
                          "Compra: ${retorno["BRL"]["symbol"]} ${retorno["BRL"]["buy"]}.\nVENDA: ${retorno["BRL"]["symbol"]} ${retorno["BRL"]["sell"]}";
                      _dolar =
                          "Compra: ${retorno["USD"]["symbol"]} ${retorno["USD"]["buy"]}.\nVENDA: ${retorno["USD"]["symbol"]} ${retorno["USD"]["sell"]}";
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
