import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practiceapi/api_connection.dart';
import 'package:practiceapi/cards/cards.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cards? cardsData;
  bool loading = true;
  @override
  void initState() {
    // TODO: implement initState
    getCarts();
    super.initState();
  }

  void getCarts() async {
    cardsData = await ApiConnection().cartsCall();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(
              child: SizedBox(
                  width: 120, height: 120, child: CircularProgressIndicator()),
            )
          : SafeArea(
              child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    //shrinkWrap: true,
                    itemCount: cardsData!.carts!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          "USER ID:${cardsData!.carts![index].userId}",
                          style: const TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        title: Text(
                          "TOTAL QTY:${cardsData!.carts![index].totalQuantity}",
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "DISCOUNTED TOTAL:${cardsData!.carts![index].discountedTotal}",
                          style: const TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Text(
                          "TOTAL:${cardsData!.carts![index].total}",
                          style: const TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
    );
  }
}
