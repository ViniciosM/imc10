import 'package:hive/hive.dart';

part 'imc_hive_model.g.dart';

@HiveType(typeId: 1)
class ImcHiveModel extends HiveObject {
  @HiveField(0)
  double height = 0.0;

  @HiveField(1)
  double weight = 0.0;

  @HiveField(2)
  double imc = 0.0;

  ImcHiveModel();

  ImcHiveModel.create(
      {required this.height, required this.weight, required this.imc});
}
