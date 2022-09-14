import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculadora IMC",
    theme: ThemeData(primarySwatch: Colors.green,
    ),
    home: const Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _resultText = "";

  void _resetFields(){
    _formKey.currentState?.reset();
    _alturaController.clear();
    _pesoController.clear();

    setState(() {
      _resultText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: _resetFields , icon: Icon(Icons.refresh))
        ]
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 120, color: Colors.green),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Peso(Kg)",
                    labelStyle: TextStyle(color: Colors.green),
                    ),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                  controller: _pesoController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "insira seu peso";
                    } else{
                      return null;
                    }
                  },
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Altura",
                    labelStyle: TextStyle(color: Colors.green),
                    ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.green, fontSize: 25.0),
                  controller: _alturaController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "insira sua altura";
                    } else{
                      return null;
                    }
                  },
                )
              ],
            ),
            ) 
          ),
    );
  }
}