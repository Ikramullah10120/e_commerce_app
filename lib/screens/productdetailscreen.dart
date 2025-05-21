import 'package:e_commerce_app/models/handbagmodel.dart';
import 'package:e_commerce_app/widgets/prductactionselection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productdetailscreen extends StatelessWidget {
  final ProductModel product;
  final String heroTag;
  final Color bgColor;
  Productdetailscreen({
    Key? key,
    required this.product,
    required this.heroTag,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        actions: [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.shopping_cart_outlined, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Title and Price
                Positioned(
                  top: kToolbarHeight - 40,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Aristocratic Hand Bag",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 70),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 4),
                          Text(
                            "\$${product.price}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // White container
                Positioned(
                  top: 250,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 80),
                        Text("Color: ", style: TextStyle(fontSize: 16)),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                _buildColorDot(Colors.cyan),
                                _buildColorDot(Colors.green),
                                _buildColorDot(
                                  const Color.fromARGB(255, 247, 108, 66),
                                ),
                              ],
                            ),
                            Transform.translate(
                              offset: Offset(0, -30),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 130),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Size: ",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "12 cm",
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 20),
                        Productactionsection(color: bgColor),
                      ],
                    ),
                  ),
                ),

                // Product image
                Positioned(
                  top: 110,
                  right: 30,
                  //hero wrapping here image
                  child: Hero(
                    tag: heroTag,
                    child: Image.asset(
                      product.image,
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildColorDot(Color color) {
  return Container(
    margin: EdgeInsets.only(right: 8),
    height: 24,
    width: 24,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey.shade300),
    ),
  );
}
