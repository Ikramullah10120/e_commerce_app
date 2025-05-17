import 'package:e_commerce_app/controller/productcolourhelper.dart';
import 'package:e_commerce_app/models/handbagmodel.dart';
import 'package:e_commerce_app/screens/productitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homscreen extends StatefulWidget {
  const Homscreen({super.key});

  @override
  State<Homscreen> createState() => _HomscreenState();
}

class _HomscreenState extends State<Homscreen> {
  String selected = "Handbag";
  final List<String> categories = [
    "Handbag",
    "Jewellery",
    "foot wear",
    "Accessories",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _generateDominantColorsInBackground(); // ✅ Background me color generation
  }

  void _generateDominantColorsInBackground() async {
    for (var product in ProductModel.products) {
      if (product.dominantColor == null) {
        final color = await ColorGenerator.getDominantColor(product.image);
        product.dominantColor = color;
        if (mounted) {
          setState(() {}); // ✅ Update only this item
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products =
        selected.isEmpty
            ? ProductModel.products
            : ProductModel.products
                .where(
                  (product) =>
                      product.maincategory.toLowerCase() ==
                      selected.toLowerCase(),
                )
                .toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed:
              () => Get.snackbar('Working', "Screen is not available on back"),
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              "Women",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // Category Row
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

          if (selected.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Selected: $selected",
                style: TextStyle(fontSize: 16),
              ),
            ),

          // Product Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  final tag = 'product-${product.id}';
                  return RepaintBoundary(
                    child: Productitem(product: product, tag: tag),
                  );
                  // return Productitem(product: product, tag: tag);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
