import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:practiceapi/carted.dart';

import 'products_data/product.dart';
import 'products_data/products_data.dart';

class DetailScreen extends StatefulWidget {
  Product? pDatas;
  DetailScreen({
    this.pDatas,
    super.key,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ProductsData? productsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
          backgroundColor: Colors.amber[50],
          title: Center(
            child: Text(
              "MOBILE DETAILS",
              style: TextStyle(
                  color: Colors.pink[300],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      image: DecorationImage(
                        image: NetworkImage(widget.pDatas!.thumbnail!),
                        fit: BoxFit.fill,
                      )),
                ),
                SizedBox(
                  height: 150,
                  child: SingleChildScrollView(
                    child: Container(
                      width: 250,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black, width: 1),
                              top: BorderSide(color: Colors.black, width: 1),
                              left: BorderSide(color: Colors.black, width: 1),
                              right:
                                  BorderSide(color: Colors.black, width: 1))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Title : ${widget.pDatas!.title!}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.lightBlue),
                            ),
                            Text(
                              "Description : ${widget.pDatas!.description!}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.lightBlue),
                            ),
                            Text(
                              "Price : ${widget.pDatas!.price!.toString()}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.lightBlue),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              width: 400,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1),
                      top: BorderSide(color: Colors.black, width: 1),
                      left: BorderSide(color: Colors.black, width: 1),
                      right: BorderSide(color: Colors.black, width: 1))),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discount : ${widget.pDatas!.discountPercentage!.toString()}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.purpleAccent),
                    ),
                    Text(
                      "Rating : ${widget.pDatas!.rating!.toString()}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.purpleAccent),
                    ),
                    Text(
                      "Stock : ${widget.pDatas!.stock!.toString()}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.purpleAccent),
                    ),
                    Text(
                      "Category : ${widget.pDatas!.category!}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.purpleAccent),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 300,
                width: 400,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1),
                        top: BorderSide(color: Colors.black, width: 1),
                        left: BorderSide(color: Colors.black, width: 1),
                        right: BorderSide(color: Colors.black, width: 1))),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CarouselSlider(
                        options: CarouselOptions(height: 300.0),
                        items: widget.pDatas!.images!.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  // decoration:
                                  //     const BoxDecoration(color: Colors.amber),
                                  child: Image.network(
                                    i,
                                    fit: BoxFit.fill,
                                  ));
                            },
                          );
                        }).toList(),
                      )),
                    ],
                  ),
                )),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 10, backgroundColor: Colors.amber[200]),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ));
                },
                child: const Text(
                  "Add Cart",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.green),
                ))
          ],
        ),
      ),
    );
  }
}
