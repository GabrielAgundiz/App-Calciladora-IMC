import 'package:flutter/material.dart';
import 'package:practica_3_2109526/ui/calculator/widgets/widgets_calculator.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  TextEditingController _pesoController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  String respuesta = "RESPUESTA";
  double imc = 0.0;
  List<String> historial = [];

  void _calcular() {
    setState(() {
      double peso = (double.tryParse(_pesoController.text) ?? 0.0);
      double altura = (double.tryParse(_alturaController.text) ?? 0.0) / 100;

      if (peso > 0 && altura > 0) {
        imc = peso / (altura * altura);
        respuesta = imc.toStringAsFixed(1);

        if (imc < 18.5) {
          respuesta += " - PESO BAJO";
        } else if (imc < 25) {
          respuesta += " - PESO NORMAL";
        } else if (imc < 30) {
          respuesta += " - SOBREPESO";
        } else if (imc < 35) {
          respuesta += " - OBESIDAD LEVE";
        } else if (imc < 40) {
          respuesta += " - OBESIDAD MEDIA";
        } else {
          respuesta += " - OBESIDAD MORBIDA";
        }

        historial.insert(0, "IMC: $respuesta, Peso: $peso kg, Altura: ${altura * 100} cm");
      } else {
        respuesta = "Entradas inválidas";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _sizeEspacio(),
              MyTextInput(inputController: _pesoController, label: 'Peso (Kg)'),
              _sizeEspacio(),
              MyTextInput(inputController: _alturaController, label: 'Altura (cm)'),
              _sizeEspacio(),
              MyButton(
                lblText: Text("Calcular"),
                press: (() => _calcular()),
              ),
              _sizeEspacio(),
              Text(
                respuesta,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              _sizeEspacio(),
              Text('Historial de cálculos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              _sizeEspacio(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: historial.map((calculation) => Text(calculation)).toList(),
              ),
              _sizeEspacio(),
              MyTable(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _sizeEspacio() {
  return SizedBox(
    height: 20,
  );
}