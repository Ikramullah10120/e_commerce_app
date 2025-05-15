import 'package:e_commerce_app/controller/productcolourhelper.dart';
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
  String selected = "Handbag";
  bool _loadingColors = true;

  final List<String> categories = [
    "Handbag",
    "Jewellery",
    "foot wear",
    "Accessories",
  ];

  @override
  void initState() {
    super.initState();
    _loadColors();
    // _generateDominantColors();
  }

  Future<void> _loadColors() async {
    await ColorGenerator.productDominantColors();
    setState(() {
      _loadingColors = false;
    });
  }

  // Future<void> _generateDominantColors() async {
  //   for (var product in ProductModel.products) {
  //     final color = await ColorGenerator.getDominantColor(product.image);
  //     product.dominantColor = color;
  //   }

  //   setState(() {
  //     _loadingColors = false;
  //   });
  // }

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
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_sharp),
        //   onPressed: () =>
        //   Navigator.pop(context),
        // ),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 16),
        ],
      ),
      body:
          _loadingColors
              ? const Center(child: CircularProgressIndicator())
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      "Women",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
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
                                      selected == category
                                          ? Colors.black
                                          : Colors.grey,
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                () => Productdetailscreen(
                                  product: product,
                                  heroTag: tag,
                                  bgColor:
                                      product.dominantColor ??
                                      Colors.grey.shade200,
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 190,
                                  decoration: BoxDecoration(
                                    color:
                                        product.dominantColor ??
                                        Colors.grey.shade200,
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
                                const SizedBox(height: 8),
                                Text(
                                  product.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "\$${product.price}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
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
