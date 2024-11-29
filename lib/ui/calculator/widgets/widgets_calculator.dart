import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  const MyTextInput({Key? key, required this.inputController, required this.label}) : super(key: key);
  
  final TextEditingController inputController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.lblText, required this.press}) : super(key: key);

  final Widget lblText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: lblText,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Aumentando el padding horizontal
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18, // Reduciendo el tamaño de la fuente
        color: Colors.blue,
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), // Reduciendo el padding
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

class MyAppContainer extends StatelessWidget {
  const MyAppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Reduciendo la altura del contenedor
      margin: EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)), // Reduciendo el radio del borde
      ),
    );
  }
}

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), // Reduciendo el padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Table(
        border: TableBorder.all(),
        children: const [
          TableRow(children: [
            MyText(text: 'Menor a 18.5'), // Usando el widget MyText en lugar de Text
            MyText(text: 'PESO BAJO'), // Usando el widget MyText en lugar de Text
          ]),
          TableRow(children: [
            MyText(text: '18.6 a 24.9'), // Usando el widget MyText en lugar de Text
            MyText(text: 'PESO NORMAL'), // Usando el widget MyText en lugar de Text
          ]),
          TableRow(children: [
            MyText(text: '25 a 29.9'), // Usando el widget MyText en lugar de Text
            MyText(text: 'SOBREPESO'), // Usando el widget MyText en lugar de Text
          ]),
          TableRow(children: [
            MyText(text: '30 a 34.9'), // Usando el widget MyText en lugar de Text
            MyText(text: 'OBESIDAD LEVE'), // Usando el widget MyText en lugar de Text
          ]),
          TableRow(children: [
            MyText(text: '35 a 39.9'), // Usando el widget MyText en lugar de Text
            MyText(text: 'OBESIDAD MEDIA'), // Usando el widget MyText en lugar de Text
          ]),
          TableRow(children: [
            MyText(text: 'Mayor a 40'), // Usando el widget MyText en lugar de Text
            MyText(text: 'OBESIDAD MORBIDA'), // Usando el widget MyText en lugar de Text
          ]),
        ],
      ),
    );
  }
}

