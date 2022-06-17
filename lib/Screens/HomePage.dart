import 'package:buddymart/Models/Category.dart';
import 'package:buddymart/Screens/FrshVegitables.dart';
import 'package:buddymart/Widgets/Carousel.dart';
import 'package:flutter/material.dart';

import '../Models/TodaysDeal.dart';
import '../Utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categoryList = [
    Category(
        name: 'Fruits',
        imageUrl: 'assets/orange.png',
        comingSoon: "",
        bgColor: HexColor("F4E2B0")),
    Category(
        name: 'Vegetables',
        imageUrl: 'assets/veg.png',
        comingSoon: "",
        bgColor: HexColor("D3F1B6")),
    Category(
        name: 'Food Grains',
        imageUrl: 'assets/grains.png',
        comingSoon: "",
        bgColor: HexColor("#ECE9D3")),
    Category(
        name: 'Bakery',
        comingSoon: "",
        imageUrl: 'assets/bread.png',
        bgColor: HexColor("FDE2B5"))
  ];
  List<Category> categoryLists = [
    Category(
        name: 'Beverages',
        imageUrl: 'assets/bev.png',
        comingSoon: "Coming Soon",
        bgColor: HexColor("D7EAFC")),
    Category(
        name: 'Meat&Fish',
        imageUrl: 'assets/meat.png',
        comingSoon: "",
        bgColor: HexColor("FCDED9")),
    Category(
        name: 'Healthcare',
        imageUrl: 'assets/life.png',
        comingSoon: "Coming Soon",
        bgColor: HexColor("E5EAF2")),
    Category(
        name: 'Baby Care',
        imageUrl: 'assets/baby.png',
        comingSoon: "Coming Soon",
        bgColor: HexColor("EFE9DB"))
  ];

  List<Todaysdeal> todaysdeallist = [
    Todaysdeal(
        name: "Onam Kit",
        imageUrl:
            "https://www.india.com/wp-content/uploads/2017/09/Onasadya.jpg",
        itemsNo: "20 Items",
        discount: "15% Off - Use code ONAM15",
        mrp: "Rs 400",
        price: "Rs 250"),
    Todaysdeal(
        name: "Fruit Bowl (6 varieties of organic fruits)",
        imageUrl:
            "https://www.thedailymeal.com/sites/default/files/story/2018/iStock-636877252.jpg",
        itemsNo: "6 Assorted Items",
        discount: "15% Off - Use code ONAM15",
        mrp: "Rs 400",
        price: "Rs 200"),
    Todaysdeal(
        name: "Tomatoes - Hybrid and organically grown(Grade One)",
        imageUrl:
            "https://images-prod.healthline.com/hlcmsresource/images/AN_images/tomatoes-1296x728-feature.jpg",
        itemsNo: "20 Items",
        discount: "10% Off - Use code HYBRIDSALE",
        mrp: "Rs 65",
        price: "Rs 50")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                      height: 40,
                      width: 50,
                      child: Image.asset("assets/buddylogo.png")),
                ),
                const SizedBox(
                  width: 250,
                  child: Text(
                    "Buddy's Mart",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 29,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 200,
              width: double.infinity,
              child: CarouselSliders(),
            ),
            SizedBox(
              child: Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Categories",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    flex: 2,
                  ),
                  FlatButton(
                    onPressed: () {},
                    child:
                        const Text('All', style: TextStyle(color: Colors.red)),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  for (Category category in categoryList)
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const FreshVegetables()));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: category.bgColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  AssetImage(category.imageUrl))),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                category.name,
                                textScaleFactor: 1.0,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                      ),
                      flex: 4,
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  for (Category category in categoryLists)
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const FreshVegetables()));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  InkWell(
                                    onTap: () {

                                    },
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: category.bgColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 7,
                                    left: 2,
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  AssetImage(category.imageUrl))),
                                    ),
                                  ),
                                  category.comingSoon != ""
                                      ? Positioned(
                                          top: 45,
                                          right: 4,
                                          child: Container(
                                            height: 15,
                                            width: 55,
                                            decoration: const BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: SizedBox(
                                              width: 120,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Text(
                                                  category.comingSoon,
                                                  style: const TextStyle(
                                                    fontSize: 8,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                category.name,
                                textScaleFactor: 1.0,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ),
                      ),
                      flex: 4,
                    )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220,
              width: 340,
              child: Stack(
                children: [
                  Container(
                    height: 170,
                    width: 340,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              "assets/banner.jpg",
                            ))),
                  ),
                  Positioned(
                    top: 110,
                    left: 250,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.orange,
                            Colors.red,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: const Icon(Icons.mic_none,
                          color: Colors.white, size: 30),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("Todays Deal",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 350,
              child: todaysdeallist.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: todaysdeallist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 120,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 200,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            todaysdeallist[index].imageUrl)),
                                  ),
                                ),
                                title: SizedBox(
                                  width: 400,
                                  child: Text(
                                    todaysdeallist[index].name,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                subtitle: Column(
                                  children: [
                                    SizedBox(
                                      width: 300,
                                      child: Text(
                                        todaysdeallist[index].itemsNo,
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                        width: 300,
                                        child: Text(
                                          todaysdeallist[index].discount,
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        )),
                                  ],
                                ),
                                trailing: Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                        child: Text(
                                      todaysdeallist[index].mrp,
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey[500],
                                        fontSize: 13,
                                      ),
                                    )),
                                    SizedBox(
                                        child: Text(
                                      todaysdeallist[index].price,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ],
                                ),
                              ),
                              const Divider(
                                height: 10,
                              )
                            ],
                          ),
                        );
                      },
                    )
                  : const Center(child: Text('No Items')),
            )
          ],
        ),
      ),
    ));
  }
}
