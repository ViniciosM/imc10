import 'package:flutter/material.dart';
import 'package:imc10/models/imc_hive_model.dart';

class ListImcPage extends StatelessWidget {
  const ListImcPage({required this.imcList, super.key});

  final List<ImcHiveModel> imcList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de IMCs'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: imcList.length,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: const Icon(Icons.calculate_outlined),
            title: Text('${imcList[index].height} ${imcList[index].weight}'),
          );
        },
        separatorBuilder: (context, _) => const Divider(),
      ),
    );
  }
}
