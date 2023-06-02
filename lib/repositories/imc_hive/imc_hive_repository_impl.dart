import 'package:hive/hive.dart';
import 'package:imc10/models/imc_hive_model.dart';
import 'package:imc10/repositories/imc_hive/imc_hive_repository.dart';

class ImcHiveRepositoryImpl implements ImcHiveRepository {
  static late Box _box;

  ImcHiveRepositoryImpl._create();

  static Future<ImcHiveRepository> load() async {
    if (Hive.isBoxOpen('imcBox')) {
      _box = Hive.box('imcBox');
    } else {
      _box = await Hive.openBox('ImcBox');
    }

    return ImcHiveRepositoryImpl._create();
  }

  @override
  Future<List<ImcHiveModel>> getListImc() async {
    return _box.values.cast<ImcHiveModel>().toList();
  }

  @override
  Future<void> delete({required ImcHiveModel imcHiveModel}) async {
    await _box.delete(imcHiveModel);
  }

  @override
  Future<void> save({required ImcHiveModel imcHiveModel}) async {
    await _box.add(imcHiveModel);
  }

  @override
  Future<void> update({required ImcHiveModel imcHiveModel}) async {
    await imcHiveModel.save();
  }
}
