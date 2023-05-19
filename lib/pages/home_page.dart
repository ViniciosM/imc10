import 'package:flutter/material.dart';
import 'package:imc10/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

late TextEditingController _weightEC;
late TextEditingController _heightEC;
final _formKey = GlobalKey<FormState>();
final HomeController homeController = HomeController();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeController.addListener(() {
      setState(() {});
    });
    _weightEC = TextEditingController();
    _heightEC = TextEditingController();
    super.initState();
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
                    label: Text('Peso'),
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
                    label: Text('Altura'),
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

                      if (true) {
                        double weightDouble = double.parse(_weightEC.text);
                        double heightDouble = double.parse(_heightEC.text);
                        await homeController.calculateIMC(
                            height: heightDouble, weight: weightDouble);
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
