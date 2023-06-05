import 'package:flutter/material.dart';
import 'package:imc10/controllers/home_controller.dart';
import 'package:imc10/controllers/home_hive_controller.dart';
import 'package:imc10/models/imc_hive_model.dart';
import 'package:imc10/pages/list_imc_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late HomeHiveController homeHiveController;
List<ImcHiveModel> listImc = [];
late TextEditingController _weightEC;
late TextEditingController _heightEC;
final _formKey = GlobalKey<FormState>();
final HomeController homeController = HomeController();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // homeController.addListener(() {
    //   setState(() {});
    // });
    homeHiveController = HomeHiveController();
    loadImcs();
    _weightEC = TextEditingController();
    _heightEC = TextEditingController();
    super.initState();
  }

  Future<void> loadImcs() async {
    listImc = await homeHiveController.getImcList();
  }

  @override
  void dispose() {
    _weightEC.dispose();
    _heightEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: const Text('IMC APP'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ListImcPage(imcList: listImc)));
              },
              icon: const Icon(
                Icons.history_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _weightEC,
                  decoration: const InputDecoration(
                    label: Text('Peso (Em quilogramas)'),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _heightEC,
                  decoration: const InputDecoration(
                    label: Text('Altura (Em metros)'),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool isValidForm =
                          _formKey.currentState?.validate() ?? false;

                      if (isValidForm) {
                        double weightDouble = double.parse(_weightEC.text);
                        double heightDouble = double.parse(_heightEC.text);
                        double result = await homeHiveController.calculateIMC(
                            weight: weightDouble, height: heightDouble);

                        await homeController.calculateIMC(
                            height: heightDouble, weight: weightDouble);

                        ImcHiveModel imcHiveModel = ImcHiveModel()
                          ..height = heightDouble
                          ..weight = weightDouble
                          ..imc = result;

                        await homeHiveController.saveImc(
                            imcHiveModel: imcHiveModel);

                        await loadImcs();

                        setState(() {});
                      }
                    },
                    child: const Text('Calcular'),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ValueListenableBuilder(
                  valueListenable: homeController.resultIMC,
                  builder: (context, object, _) {
                    return Visibility(
                        visible: homeController.resultIMC.value.isNotEmpty,
                        child: Text(homeController.resultIMC.value));
                  },
                ),
              ],
            )),
      ),
    );
  }
}
