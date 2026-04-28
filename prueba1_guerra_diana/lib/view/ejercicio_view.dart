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
        decoration: InputDecoration(
          labelText: 'Número natural',
          hintText: hint,
          border: const OutlineInputBorder(),
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

// Molécula
class NumeroInput extends StatelessWidget {
  final TextEditingController numeroC;
  final VoidCallback onAgregar;

  const NumeroInput({
    super.key,
    required this.numeroC,
    required this.onAgregar,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Label('Número natural'),
          const SizedBox(height: 8),
          NumberField(
            controller: numeroC,
            hint: 'Ingrese un número natural',
          ),
          const SizedBox(height: 15),
          PrimaryButton(
            text: 'Agregar número',
            onPressed: onAgregar,
          ),
        ],
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

            NumeroInput(
              numeroC: numeroC,
              onAgregar: agregarNumero,
            ),

            const SizedBox(height: 10),

            PrimaryButton(
              text: 'Limpiar',
              onPressed: limpiarDatos,
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