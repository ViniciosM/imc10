import 'dart:math' as math;

class ImcRepository {
  Future<double> calculateIMC(
      {required double weight, required double height}) async {
    try {
      double imc = 0;
      if (height != 0 && height <= 2.20) {
        imc = weight / math.pow(height, 2);
      }

      return imc;
    } catch (e) {
      throw e.toString();
    }
  }
}
