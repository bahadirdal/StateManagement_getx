import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/main_controller.dart';
import 'package:getx_example/screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ekranda yenileme yapmıyor.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ekranda yenileme yapar
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _mainController = Get.put(MainController()); // get.put ile maincontroller() fonksiyonumuzu değişkenimize atadık
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() =>  Text(
                _mainController.counter.value.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(SecondScreen(), transition: Transition.leftToRight); // getx özelliği ile diğer ekrana geçişi sadece bu kod yapısı ile yapabiliyoruz.
                  Get.snackbar("Başarılı", "İkinci ekrana gidildi.", snackPosition: SnackPosition.BOTTOM); // Getx ile diğer sayfaya geçişte ekrana popup gibi bir notfication çıkartıyoruz ekrana.
                }, child: const Text("İkinci Ekrana Git")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mainController.incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
