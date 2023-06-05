import 'package:flutter/material.dart';
import 'package:imc10/controllers/home_controller.dart';
import 'package:imc10/controllers/home_hive_controller.dart';
import 'package:imc10/models/imc_hive_model.dart';
import 'package:imc10/repositories/imc_hive/imc_hive_repository_impl.dart';

class ListImcPage extends StatefulWidget {
  const ListImcPage({required this.imcList, super.key});

  final List<ImcHiveModel> imcList;

  @override
  State<ListImcPage> createState() => _ListImcPageState();
}

class _ListImcPageState extends State<ListImcPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de IMCs'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.separated(
          itemCount: widget.imcList.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.only(top: 10),
              leading: const Icon(Icons.calculate_outlined),
              title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Altura: ${widget.imcList[index].height} m | Peso: ${widget.imcList[index].weight} kg'),
                    Text('Resultado: ${widget.imcList[index].imc}')
                  ]),
              trailing: IconButton(
                  onPressed: () async {
                    HomeHiveController homeHiveController =
                        HomeHiveController();

                    await homeHiveController.deleteImc(
                        imcHiveModel: widget.imcList[index]);

                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  )),
            );
          },
          separatorBuilder: (context, _) => const Divider(),
        ),
      ),
    );
  }
}
