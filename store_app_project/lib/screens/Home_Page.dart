import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  List<Product> filterProducts = [];

  bool isLoading = false;
  @override
  void initState() {

   //get product here
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Column(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.9),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(),
                              Text(
                                "Gen Shop",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Stack(alignment: Alignment(4, -4), children: [
                                Icon(
                                  Icons.shopping_basket,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                CircleAvatar(
                                  radius: 11,
                                  backgroundColor: Colors.red,
                                  child: Text(
                                    "0",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ])
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                "Find Your",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                              Text(
                                "ISPIRATION",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ],
                            textBaseline: TextBaseline.alphabetic,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Search with name or price",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                )),
                          )
                        ],
                      ),
                    ),
                  )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Categories",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  InkWell(
                                    child: const Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Electronics",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        filterProducts = products
                                            .where((element) =>
                                                element.category ==
                                                "electronics")
                                            .toList();
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child: const Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Jewelery",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        filterProducts = products
                                            .where((element) =>
                                                element.category == "jewelery")
                                            .toList();
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child: const Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Men's clothing",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        filterProducts = products
                                            .where((element) =>
                                                element.category ==
                                                "men's clothing")
                                            .toList();
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child: const Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Women's clothing",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        filterProducts = products
                                            .where((element) =>
                                                element.category ==
                                                "women's clothing")
                                            .toList();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 1.5 / 2),
                                itemCount: filterProducts.length,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) => Card(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.favorite_border,
                                              color: Colors.red,
                                              size: 30,
                                            ),
                                            Icon(
                                              Icons.add_shopping_cart_outlined,
                                              color: Colors.red,
                                              size: 30,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 100,
                                          child: Image(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                filterProducts[index].image),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${filterProducts[index].price} \$",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Container(
                                              width: 50,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "3.9",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 16,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
