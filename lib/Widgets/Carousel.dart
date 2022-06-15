import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliders extends StatelessWidget {
  const CarouselSliders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider(
          items: [
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://5.imimg.com/data5/VF/CT/MY-49857352/organic-vegetables-500x500.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: NetworkImage("https://previews.123rf.com/images/monticello/monticello1502/monticello150200118/36917614-basket-of-fresh-organic-fruits-in-the-garden.jpg"),
                    fit: BoxFit.cover,
                  ),
                )
            ),
            Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: NetworkImage("https://www.rikenvitamin.com/foodapplications/bakeryproducts/images/bread-main.jpg"),
                    fit: BoxFit.cover,
                  ),
                )
            ),
          ],
          options: CarouselOptions(
            height: 170,
            aspectRatio: 14 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
