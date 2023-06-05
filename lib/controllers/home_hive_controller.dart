import 'package:imc10/models/imc_hive_model.dart';
import 'package:imc10/repositories/imc_hive/imc_hive_repository.dart';
import 'package:imc10/repositories/imc_hive/imc_hive_repository_impl.dart';
import 'dart:math' as math;

class HomeHiveController {
  Future<List<ImcHiveModel>> getImcList() async {
    ImcHiveRepository imcHiveRepository = await ImcHiveRepositoryImpl.load();
    var listImc = imcHiveRepository.getListImc();
    return listImc;
  }

  Future<void> saveImc({required ImcHiveModel imcHiveModel}) async {
    ImcHiveRepository imcHiveRepository = await ImcHiveRepositoryImpl.load();
    await imcHiveRepository.save(imcHiveModel: imcHiveModel);
  }

  Future<void> deleteImc({required ImcHiveModel imcHiveModel}) async {
    ImcHiveRepository imcHiveRepository = await ImcHiveRepositoryImpl.load();
    await imcHiveRepository.delete(imcHiveModel: imcHiveModel);
  }

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
