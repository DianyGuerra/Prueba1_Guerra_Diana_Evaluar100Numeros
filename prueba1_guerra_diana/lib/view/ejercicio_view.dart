import 'package:flutter/material.dart';
import '../controller/ejercicio_controller.dart';

// Átomo
class Label extends StatelessWidget {
  final String text;

  const Label(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
}

// Átomo
class NumberField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const NumberField({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Número natural',
          border: OutlineInputBorder(),
        ),
      );
}

// Átomo
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// Átomo
class ResultText extends StatelessWidget {
  final String text;

  const ResultText(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
}

// Atomo
class NumeroInput extends StatelessWidget {
  final TextEditingController numeroC;

  const NumeroInput({
    super.key,
    required this.numeroC,
  });

  @override
  Widget build(BuildContext context) => NumberField(
        controller: numeroC,
        hint: 'Número natural',
      );
}

// Organismo
class EjercicioCard extends StatefulWidget {
  const EjercicioCard({super.key});

  @override
  State<EjercicioCard> createState() => _EjercicioCardState();
}

class _EjercicioCardState extends State<EjercicioCard> {
  final numeroC = TextEditingController();

  String mensaje = '';
  String resultado = '';

  final controller = EjercicioController();

  void agregarNumero() {
    setState(() {
      mensaje = controller.agregarNumero(numeroC.text);
      resultado = controller.obtenerResultados();
      numeroC.clear();
    });
  }

  void limpiarDatos() {
    setState(() {
      controller.limpiar();
      numeroC.clear();
      mensaje = 'Datos limpiados correctamente';
      resultado = controller.obtenerResultados();
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Label('Ingrese 100 números naturales'),
            const SizedBox(height: 20),

            NumeroInput(numeroC: numeroC),

            const SizedBox(height: 20),

            PrimaryButton(
              text: 'Agregar número',
              onPressed: () {
                agregarNumero();
              },
            ),

            const SizedBox(height: 10),

            PrimaryButton(
              text: 'Limpiar',
              onPressed: () {
                limpiarDatos();
              },
            ),

            const SizedBox(height: 20),

            Text(
              mensaje,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            ResultText(resultado),
          ],
        ),
      );

  @override
  void dispose() {
    numeroC.dispose();
    super.dispose();
  }
}

// Página
class EjercicioPage extends StatelessWidget {
  const EjercicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 17'),
      ),
      body: const SingleChildScrollView(
        child: EjercicioCard(),
      ),
    );
  }
}