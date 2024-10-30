import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../main.dart';

class CartItem extends StatefulWidget {
  CartItem({super.key, required this.cartIndex});
  int cartIndex;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xFFE0E0E0),
                  width: 1.0,
                  strokeAlign: BorderSide.strokeAlignInside),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  globalStorage.cartItems[widget.cartIndex].item.name,
                  style: const TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: -0.32,
                      height: 20 / 16),
                ),
              ),
              Container(
                margin:
                const EdgeInsets.only(left: 13, top: 34, right: 6, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          "${globalStorage.cartItems[widget.cartIndex].item.price.toString()} ₽",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 17,
                            height: 24 / 17,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "${globalStorage.cartItems[widget.cartIndex].patientCount.toString()} пациент",
                          style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            height: 20 / 15,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          padding: EdgeInsets.zero,
                          decoration: const BoxDecoration(
                              color: Color(0xFFF5F5F9),
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 32,
                                height: 32,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    if (globalStorage.cartItems[widget.cartIndex]
                                        .patientCount >
                                        1) {
                                      setState(() {
                                        globalStorage.cartItems[widget.cartIndex]
                                            .patientCount -= 1;
                                      });
                                      globalStorage.cartState!.forceUpdateState();
                                    }
                                  },
                                  icon: SvgPicture.asset(
                                    globalStorage.cartItems[widget.cartIndex]
                                        .patientCount >
                                        1
                                        ? "assets/icons/remove_enabled.svg"
                                        : "assets/icons/remove_disabled.svg",
                                  ),
                                ),
                              ),
                              Container(
                                color: Color(0xFFEBEBEB),
                                width: 1,
                                height: 16,
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    setState(() {
                                      globalStorage.cartItems[widget.cartIndex]
                                          .patientCount += 1;
                                    });
                                    globalStorage.cartState!.forceUpdateState();
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/icons/add_enabled.svg",
                                  ),
                                  style: IconButton.styleFrom(
                                      padding: EdgeInsets.zero),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
              margin: EdgeInsets.all(16),
              width: 20,
              height: 20,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    globalStorage.cartItems.removeAt(widget.cartIndex);
                    if (globalStorage.cartState != null) {
                      globalStorage.cartState!.forceUpdateState();
                    }
                  },
                  icon: SvgPicture.asset("assets/icons/delete.svg"))),
        )
      ],
    );
  }
}
