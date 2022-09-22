import 'package:flutter/material.dart';
import 'result.dart';

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

  void _resetFields() {
    _alturaController = TextEditingController();
    _pesoController = TextEditingController();
    _formKey.currentState?.reset();

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
            IconButton(onPressed: _resetFields, icon: Icon(Icons.refresh))
          ]),
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "insira seu peso";
                } else {
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "insira sua altura";
                } else {
                  return null;
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: ButtonTheme(
                  height: 50.0,
                  highlightColor: Colors.amber,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        calcula_imc();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  )),
            ),
            Text(
              _resultText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
            )
          ],
        ),
      )),
    );
  }

  void calcula_imc() {
    String _texto = "";
    String _imagem = "";

    double altura = double.parse(_alturaController.text);
    double peso = double.parse(_pesoController.text);

    double imc = peso / (altura * altura);

    if (imc < 18.6) {
      _texto = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      _imagem = "images/thin.png";
    } else if (imc >= 18.6 && imc < 24.9) {
      _texto = "Peso ideal (${imc.toStringAsPrecision(4)})";
      _imagem = "images/shape.png";
    } else if (imc >= 24.9 && imc < 29.9) {
      _texto = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
      _imagem = "images/fat.png";
    } else if (imc >= 29.9 && imc < 34.9) {
      _texto = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      _imagem = "images/fat.png";
    } else if (imc >= 34.9 && imc < 39.9) {
      _texto = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      _imagem = "images/fat.png";
    } else if (imc >= 40) {
      _texto = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      _imagem = "imagens/fat.png";
    }

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Result(_imagem, _texto)));
  }
}
