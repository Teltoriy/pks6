import 'package:flutter/material.dart';
import 'package:pks7/main.dart';
import 'package:pks7/components/cart_item.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});
  @override
  State<CartPage> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    globalStorage.cartState = this;
  }

  void forceUpdateState() {
    if (mounted) {
      setState(() {});
    }
  }
  int calcTotalAmount() {
    int sum = 0;
    for (final cartItem in globalStorage.cartItems) {
      sum += cartItem.patientCount * cartItem.item.price;
    }
    return sum;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 92, left: 27),
                  child: const Text(
                    "Корзина",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        height: 28 / 24,
                        letterSpacing: 0.33),
                  ),
                ),
                SizedBox(
                  height: 360,
                  child: ListView.builder(
                      itemCount: globalStorage.cartItems.length,
                      padding: const EdgeInsets.only(
                          top: 38, left: 27.5, right: 27.5),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return CartItem(
                          cartIndex: index,
                        );
                      }),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 29),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Сумма",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            letterSpacing: 0.38,
                            height: 28 / 20),
                      ),
                      Text(
                        "${calcTotalAmount()} ₽",
                        style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            letterSpacing: 0.38,
                            height: 28 / 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A6FEE),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.only(
                          top: 16, right: 26, bottom: 16, left: 27)),
                  child: const Text(
                    "Перейти к оформлению заказа",
                    style: TextStyle(
                        color: Color(0XFFFFFFFF),
                        fontFamily: "Montserrat",
                        fontSize: 17,
                        height: 24 / 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

