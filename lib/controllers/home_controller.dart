import 'package:flutter/material.dart';
import 'package:imc10/repositories/imc_repository.dart';

class HomeController extends ChangeNotifier {
  ValueNotifier<String> resultIMC = ValueNotifier<String>('');
  Future<void> calculateIMC(
      {required double height, required double weight}) async {
    ImcRepository imcRepository = ImcRepository();
    double imc =
        await imcRepository.calculateIMC(weight: weight, height: height);

    if (imc < 16) {
      resultIMC.value = 'IMC: ${imc.toStringAsFixed(2)} - MAGREZA LEVE';
      notifyListeners();
    } else if (imc > 16 && imc < 17) {
      resultIMC.value = 'IMC: ${imc.toStringAsFixed(2)} - MAGREZA MODERADA';
      notifyListeners();
    } else if (imc > 17 && imc < 18.5) {
      resultIMC.value = 'IMC: ${imc.toStringAsFixed(2)} - MAGREZA LEVE';
      notifyListeners();
    } else if (imc > 18.5 && imc < 25) {
      resultIMC.value = 'IMC: ${imc.toStringAsFixed(2)} - SAUDÁVEL';
      notifyListeners();
    } else if (imc > 25 && imc < 30) {
      resultIMC.value = 'IMC: ${imc.toStringAsFixed(2)} - SOBREPESO';
      notifyListeners();
    } else if (imc > 30 && imc < 35) {
      resultIMC.value = 'IMC: ${imc.toStringAsFixed(2)} - OBESIDADE GRAU I';
      notifyListeners();
    } else if (imc > 35 && imc < 40) {
      resultIMC.value =
          'IMC: ${imc.toStringAsFixed(2)} - OBESIDADE GRAU II (Severa)';
      notifyListeners();
    } else if (imc <= 40) {
      resultIMC.value =
          'IMC: ${imc.toStringAsFixed(2)} - OBESIDADE GRAU III (Mórbida)';
      notifyListeners();
    } else {
      resultIMC.value = 'Não foi possível calcular o IMC';
      notifyListeners();
    }
  }
}
