import 'package:imc10/models/imc_hive_model.dart';

abstract class ImcHiveRepository {
  Future<void> save({required ImcHiveModel imcHiveModel});
  Future<void> delete({required ImcHiveModel imcHiveModel});
  Future<void> update({required ImcHiveModel imcHiveModel});
  Future<List<ImcHiveModel>> getListImc();
}
