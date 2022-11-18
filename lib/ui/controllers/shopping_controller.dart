import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  var entries = <Product>[].obs;

  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();

    entries.add(Product(0, "Toy car", 10));
    entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;

    for (int i = 0; i < entries.length; i++) {
      newTotal += entries[i].quantity * entries[i].price;
    }

    total.value = newTotal;
  }

  agregarProducto(id) {
    logInfo('agregarProducto $id');

    var eFound = entries.firstWhere((element) =>
        element.id ==
        id); // contiene el elemento del id ingresado por parámetro

    int idx = entries.indexOf(eFound); // contiene el índice del elemento

    entries[idx].quantity += 1;

    entries.refresh();
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');

    var eFound = entries.firstWhere((element) =>
        element.id ==
        id); // contiene el elemento del id ingresado por parámetro

    int idx = entries.indexOf(eFound); // contiene el índice del elemento

    if (entries[idx].quantity > 0) {
      entries[idx].quantity -= 1;

      entries.refresh();
    }

    calcularTotal();
  }
}
