import '../model/ejercicio_model.dart';

class EjercicioController {
  final EjercicioModel modelo = EjercicioModel();

  String agregarNumero(String texto) {
    if (texto.isEmpty) {
      return 'Por favor, ingrese un número';
    }

    int? numero = int.tryParse(texto);

    if (numero == null) {
      return 'Por favor, ingrese un número válido';
    }

    if (numero < 0) {
      return 'Por favor, ingrese un número natural';
    }

    if (modelo.estaCompleto()) {
      return 'Ya se ingresaron los 100 números';
    }

    modelo.agregarNumero(numero);

    if (modelo.estaCompleto()) {
      return 'Número agregado correctamente. Ya ingresó los 100 números.';
    }

    return 'Número agregado correctamente';
  }

  String obtenerResultados() {
    return '''
    Números ingresados: ${modelo.cantidadIngresada()}/100

    Menores que 15: ${modelo.menoresQue15()}
    Lista: ${modelo.mostrarMenores15()}

    Mayores que 50: ${modelo.mayoresQue50()}
    Lista: ${modelo.mostrarMayores50()}

    Entre 25 y 45: ${modelo.entre25y45()}
    Lista: ${modelo.mostrarEntre25y45()}

    Promedio: ${modelo.calcularPromedio().toStringAsFixed(2)}
    ''';
  }

  void limpiar() {
    modelo.limpiar();
  }
}

