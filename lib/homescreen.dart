import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:practiceapi/api_connection.dart';
import 'package:practiceapi/detailscreen.dart';
import 'package:practiceapi/products_data/product.dart';

import 'products_data/products_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductsData? productsData;
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    productsData = (await ApiConnection().apiCall());
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: loading
          ? const Center(
              child: SizedBox(
                  height: 50, width: 30, child: CircularProgressIndicator()),
            )
          : SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: productsData!.products!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                pDatas: productsData!.products![index],
                              ),
                            ));
                          },
                          leading: Image.network(
                            "${productsData!.products![index].thumbnail}",
                            fit: BoxFit.fill,
                            height: 50,
                            width: 70,
                          ),
                          title: Text(
                            "${productsData!.products![index].title}",
                            style: const TextStyle(
                                color: Colors.indigo, fontSize: 15),
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${productsData!.products![index].price}",
                                style: const TextStyle(
                                    color: Colors.purpleAccent, fontSize: 15),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${productsData!.products![index].discountPercentage}",
                                style: const TextStyle(
                                    color: Colors.greenAccent, fontSize: 15),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "${productsData!.products![index].brand}",
                            style: const TextStyle(
                                color: Colors.deepOrange, fontSize: 15),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
