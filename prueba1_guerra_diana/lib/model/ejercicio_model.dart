class EjercicioModel {
  final List<int> numeros = [];

  final List<int> menores15 = [];
  final List<int> mayores50 = [];
  final List<int> entre25y45Lista = [];

  double promedio = 0.0;

  void agregarNumero(int numero) {
    numeros.add(numero);

    if (numero < 15) {
      menores15.add(numero);
    }

    if (numero > 50) {
      mayores50.add(numero);
    }

    if (numero >= 25 && numero <= 45) {
      entre25y45Lista.add(numero);
    }
  }

  void limpiar() {
    numeros.clear();
    menores15.clear();
    mayores50.clear();
    entre25y45Lista.clear();
  }

  int cantidadIngresada() {
    return numeros.length;
  }

  bool estaCompleto() {
    return numeros.length == 100;
  }

  int menoresQue15() {
    return menores15.length;
  }

  int mayoresQue50() {
    return mayores50.length;
  }

  int entre25y45() {
    return entre25y45Lista.length;
  }

  double calcularPromedio() {
    if (numeros.isEmpty) {
      return 0;
    }

    int suma = 0;

    for (int numero in numeros) {
      suma += numero;
    }
    promedio = suma / numeros.length;
    return promedio;
  }

  String mostrarMenores15() {
    return menores15.isEmpty ? 'Ninguno' : menores15.join(', ');
  }

  String mostrarMayores50() {
    return mayores50.isEmpty ? 'Ninguno' : mayores50.join(', ');
  }

  String mostrarEntre25y45() {
    return entre25y45Lista.isEmpty ? 'Ninguno' : entre25y45Lista.join(', ');
  }
}