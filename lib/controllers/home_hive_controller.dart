import 'package:imc10/models/imc_hive_model.dart';
import 'package:imc10/repositories/imc_hive/imc_hive_repository.dart';
import 'package:imc10/repositories/imc_hive/imc_hive_repository_impl.dart';

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
}
