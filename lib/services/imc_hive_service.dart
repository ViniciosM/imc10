import 'package:hive/hive.dart';
import 'package:imc10/models/imc_hive_model.dart';

class ImcHiveService {
  static late Box _box;

  ImcHiveService._create();

  static Future<ImcHiveService> load() async {
    if (Hive.isBoxOpen('imcBox')) {
      _box = Hive.box('imcBox');
    } else {
      _box = await Hive.openBox('ImcBox');
    }

    return ImcHiveService._create();
  }

  save(ImcHiveModel imcHiveModel) {
    _box.add(imcHiveModel);
  }

  update(ImcHiveModel imcHiveModel) {
    imcHiveModel.save();
  }

  delete(ImcHiveModel imcHiveModel) {
    _box.delete(imcHiveModel);
  }

  List<ImcHiveModel> getImcList() {
    return _box.values.cast<ImcHiveModel>().toList();
  }
}
