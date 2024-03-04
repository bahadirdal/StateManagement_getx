import 'package:get/get.dart';

class MainController extends GetxController {

  var counter = 0.obs; //obs yapısı bunu int'dan RxInt'a çeviriyor getx de kullanıyoruz.
  void incrementCounter() => counter.value++; // .value diyerek Rx tipindeki yukarıdaki verimize değere ulaşıyoruz.
}