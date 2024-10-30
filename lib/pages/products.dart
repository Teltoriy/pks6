import 'package:flutter/material.dart';
import 'package:pks7/components/product_item.dart';
import 'package:pks7/main.dart';

class CatalogPage extends StatefulWidget {
  CatalogPage({super.key});
  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 92, right: 188, bottom: 0, left: 27),
            child: const Text(
              "Каталог услуг",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  height: 28 / 24,
                  letterSpacing: 0.33),
            ),
          ),
          ListView.builder(
              itemCount: globalStorage.services.length,
              padding: const EdgeInsets.only(top: 38),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ProductItem(index: index,);
              })
        ],
      ),
    );
  }
}
