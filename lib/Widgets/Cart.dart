import 'package:buddymart/Models/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/CartProvider.dart';
import '../Utils.dart';

class Carting extends StatefulWidget {
  const Carting({Key? key}) : super(key: key);

  @override
  State<Carting> createState() => _CartingState();
}

class _CartingState extends State<Carting> {
  String Sid = "";
  String quantity = "1";
  String total = "";
  String name = "";
  String imageUrl = "";
  String itemsNo = "";
  String discount = "";
  String mrp = "";
  String price = "";
  List<CartModel> cart = [
    CartModel(
        quantity: "1",
        sid: "1",
        total: "",
        name: "Yardlong bean ( പയർ )",
        imageUrl: "assets/pea.png",
        itemsNo: "500 g",
        discount: "",
        mrp: "45",
        price: "50"),
    CartModel(
        quantity: "1",
        sid: "2",
        total: "",
        name: "Beans ( ബീൻസ് )",
        imageUrl: "assets/beans.png",
        itemsNo: "500 g",
        discount: "20% Off",
        mrp: "40",
        price: "45"),
    CartModel(
        quantity: "1",
        sid: "3",
        total: "",
        name: "Cucumber ( വെള്ളരി )",
        imageUrl: "assets/pumpkin.png",
        itemsNo: "1 kg",
        discount: "",
        mrp: "30",
        price: "40"),
    CartModel(
        quantity: "1",
        sid: "4",
        total: "",
        name: "Tomato ( തക്കാളി )",
        imageUrl: "assets/tomato.png",
        itemsNo: "1 kg",
        discount: "20% Off",
        mrp: "40",
        price: "44"),
    CartModel(
        quantity: "1",
        sid: "5",
        total: "",
        name: "Onion ( സവാള )",
        imageUrl: "assets/onion.png",
        itemsNo: "1 kg",
        discount: "",
        mrp: "25",
        price: "28"),
    CartModel(
        quantity: "1",
        sid: "6",
        total: "",
        name: "Pumpkin ( മത്തങ്ങ )",
        imageUrl: "assets/cucumber.png",
        itemsNo: "1 kg",
        discount: "20% Off",
        mrp: "20",
        price: "24"),
    CartModel(
        quantity: "1",
        sid: "7",
        total: "",
        name: "Brinjal ( വഴുതിനങ്ങ )",
        imageUrl: "assets/Brinjal.png",
        itemsNo: "500 g",
        discount: "",
        mrp: "40",
        price: "46"),
  ];
  bool carted = false;
  @override
  void initState() {
    carted = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartProvider, child) {
      return cartProvider.cartCount > 0
          ? Container(
              color: Colors.white,
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartProvider.cartCount,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 70,
                            width: 70,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Image.asset(
                              cartProvider.items[index].imageUrl,
                              width: 48,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  cartProvider.items[index].name,
                                ),
                                Text(
                                  cartProvider.items[index].itemsNo,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  children: <Widget>[
                                    const Text(
                                      "Rs",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      cartProvider.items[index].price,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Rs " + cartProvider.items[index].mrp,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey[500]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .reduceQuantity(cartProvider
                                                      .items[index].sid);
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(
                                                                10)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "-",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          Text(
                                            cartProvider.items[index].quantity
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 7,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Provider.of<CartProvider>(context,
                                                      listen: false)
                                                  .addQuantity(cartProvider
                                                      .items[index].sid);
                                            },
                                            child: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(
                                                                10)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "+",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          : Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: cart.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Image.asset(
                                  cart[index].imageUrl,
                                  width: 48,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      cart[index].name,
                                    ),
                                    Text(
                                      cart[index].itemsNo,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "Rs " + cart[index].price,
                                          style: TextStyle(
                                              color: HexColor("F15A24"),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "Rs " + cart[index].mrp,
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey[500]),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                name = cart[index].name;
                                                Sid = cart[index].sid;
                                                mrp = cart[index].mrp;
                                                itemsNo = cart[index].itemsNo;
                                                imageUrl = cart[index].imageUrl;
                                                discount = cart[index].discount;
                                                price = cart[index].price;
                                                //total=cart[index].total;
                                                quantity = cart[index].quantity;
                                                addtoCart();
                                              });
                                            },
                                            child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: HexColor("F15A24"),
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(30)),
                                                ),
                                                child: const Center(
                                                    child: Text(
                                                  "Buy",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider()
                        ],
                      ),
                    );
                  }),
            );
    });
  }

  void addtoCart() {
    CartModel item = CartModel(
        quantity: quantity.toString(),
        price: price,
        total: (double.parse(price) * double.parse(quantity)).toString(),
        discount: discount,
        imageUrl: imageUrl,
        itemsNo: itemsNo,
        mrp: mrp,
        name: name,
        sid: Sid);
    Provider.of<CartProvider>(context, listen: false).addToCart(item);
  }
}
