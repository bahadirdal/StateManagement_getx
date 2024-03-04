import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/main_controller.dart';


class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});
  final _mainController = Get.find<MainController>(); // bu yapı ile second screen de ki fonksiyonumuzu kullanacağız.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("İkinci Ekran"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx( () => Text(
                  _mainController.counter.value.toString(), // gelen değeri stringe çevirip ekrana yazdırdık.
                style: TextStyle(fontSize: 25),
              ),
            ),
            ElevatedButton(onPressed: () => _mainController.incrementCounter(), child: Text("ARTTIR"))
          ],
        ),
      ),
    );
  }
}
