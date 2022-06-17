import 'package:buddymart/Screens/HomePage.dart';
import 'package:buddymart/Widgets/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';

class FreshVegetables extends StatefulWidget {
  const FreshVegetables({Key? key}) : super(key: key);

  @override
  State<FreshVegetables> createState() => _FreshVegetablesState();
}

class _FreshVegetablesState extends State<FreshVegetables> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: 1020,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 15),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              "assets/Icons/arrow.svg",
                              height: 12,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: SizedBox(
                            width: 250,
                            child: Text(
                              "Fresh Vegetables",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          flex: 3,
                        ),
                        SvgPicture.asset("assets/Icons/Vector.svg"),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: SvgPicture.asset("assets/Icons/noti.svg"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const TextField(
                        // autofocus: true,
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                      child: SizedBox(height: 200, child: Carting())),
                  cartProvider.cartCount > 0
                      ? Container(
                          width: 260,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    cartProvider.cartCount.toString() +
                                        " items" +
                                        " _ " +
                                        "Rs " +
                                        cartProvider.total.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40))),
                                  child: const Center(
                                      child: Text(
                                    "Checkout",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              )
                            ],
                          ),
                        )
                      : Container(
                          width: 260,
                          height: 60,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    "0 items ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                flex: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40))),
                                  child: const Center(
                                      child: Text(
                                    "Checkout",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
