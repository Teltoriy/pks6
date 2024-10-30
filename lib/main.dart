import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pks7/components/storage.dart';
import 'package:pks7/pages/cart.dart';
import 'package:pks7/pages/products.dart';
import 'package:pks7/pages/profile.dart';
void main() {
  runApp(MyApp());
}
GlobalComponent globalStorage = GlobalComponent();
class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MainAppState();
}

class _MainAppState extends State<MyApp> {
  int selectedIndex = 0;
  List<Widget> pages = [CatalogPage(),CartPage(),ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF1A6FEE),
            brightness: Brightness.light),
        canvasColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: pages[selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(border: Border(top: BorderSide(color: Color.fromARGB((0.3 * 255).round(), 160, 160, 160), width: 0.5))),
          child: Container(
            margin: EdgeInsets.only(left: 7, right: 8, top: 8, bottom: 16),

            child: Theme(
              data: (
                  Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent
                  )
              ),
              child: BottomNavigationBar(
                selectedLabelStyle: const TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w300
                ),
                unselectedLabelStyle: const TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF898A8D)
                ),
                elevation: 0.0,
                backgroundColor: Colors.white,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        selectedIndex == 0 ?
                        'assets/icons/home_selected.svg' : 'assets/icons/home.svg',
                        width: 23.61,
                        height: 28,
                      ),
                      label: "Главная"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        selectedIndex == 1 ?
                        'assets/icons/cart_selected.svg' : 'assets/icons/cart.svg',
                        width: 22.92,
                        height: 22.25,
                      ), label: "Корзина"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        selectedIndex == 2 ?
                        'assets/icons/user_selected.svg' : 'assets/icons/user.svg',
                        width: 24,
                        height: 24,
                      ), label: "Профиль")
                ],
                selectedItemColor: Color(0xFF1A6FEE),
                unselectedItemColor: Color(0xFF898A8D),
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 12.0,
                unselectedFontSize: 12.0,
                currentIndex: selectedIndex,
                useLegacyColorScheme: true,

                onTap: (int barItemIndex) => {
                  setState(() {
                    selectedIndex = barItemIndex;
                  }),
                },
              ),
            ),
          ),
        ),

      ),
    );
  }
}
