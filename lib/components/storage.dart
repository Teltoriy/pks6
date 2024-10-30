import "package:pks7/components/product.dart";
import "package:pks7/components/product_list.dart";
import "../pages/cart.dart";
class GlobalComponent {
  List<ProductList> services = [
    ProductList(
        "ПЦР-тест на определение РНК коронавируса стандартный", 1800, "2 дня"),
    ProductList("Клинический анализ крови с лейкоцитарной формулировкой", 690,
        "1 день"),
    ProductList("Биохимический анализ крови, базовый", 2440, "1 день"),
  ];
  CartPageState? cartState;
  List<Product> cartItems = [];
  GlobalComponent() {
    cartItems.addAll([Product(services[1], 1), Product(services[0], 1)]);
  }
}