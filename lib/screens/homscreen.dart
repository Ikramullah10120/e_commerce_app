import 'package:e_commerce_app/models/handbagmodel.dart';
import 'package:e_commerce_app/screens/productdetailscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homscreen extends StatefulWidget {
  const Homscreen({super.key});

  @override
  State<Homscreen> createState() => _HomscreenState();
}

class _HomscreenState extends State<Homscreen> {
  String selected = ""; // to track selected category (optional)

  final List<String> categories = [
    "Handbag",
    "Jewellery",
    "foot wear",
    "Accessories",
  ];

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = ProductModel.products;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Women Heading
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              "Women",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // 5 Text buttons in a row with spacing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  categories.map((category) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = category;
                        });
                      },
                      child: Text(
                        category,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color:
                              selected == category ? Colors.black : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),

          // Optionally show which category is selected
          if (selected.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Selected: $selected",
                style: TextStyle(fontSize: 16),
              ),
            ),
          // products grid
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  final tag = 'product-${product.id}';
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        () =>
                            Productdetailscreen(product: product, heroTag: tag),
                      );
                    },

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 190,
                          decoration: BoxDecoration(
                            color: product.color,
                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: Center(
                            child: Hero(
                              tag: tag,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  product.image,
                                  height: 140,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),

                        //Title
                        Text(
                          product.title,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        //price
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
