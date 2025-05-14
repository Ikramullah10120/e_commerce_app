import 'dart:ui';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String image;
  final String maincategory; // 👈 this MUST be here
  final String description;
  Color? dominantColor;
  final int size;
  // final Color color;
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    // required this.color,
    required this.size,
    required this.maincategory,
    this.dominantColor,
  });

  static List<ProductModel> products = [
    ProductModel(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag1.jpg",
      maincategory: "Handbag",
      dominantColor: products[0].dominantColor,
      // color: const Color.fromARGB(255, 33, 81, 116),
    ),
    ProductModel(
      id: 2,
      title: "Belt Bag",
      price: 300,
      size: 8,
      description: dummyText,
      image: "assets/images/bag2.jpg",
      maincategory: "Handbag",
      dominantColor: products[0].dominantColor,

      // color: const Color(0xFFD3A984),
    ),
    ProductModel(
      id: 3,
      title: "Hang Top",
      price: 350,
      size: 10,
      description: dummyText,
      image: "assets/images/bag3.jpg",
      dominantColor: products[0].dominantColor,

      maincategory: "Handbag",
      // color: const Color(0xFF989493),
    ),
    ProductModel(
      id: 4,
      title: "Old Fashion",
      price: 500,
      size: 11,
      description: dummyText,
      dominantColor: products[0].dominantColor,

      image: "assets/images/bag4.jpg",
      maincategory: "Handbag",
      // color: const Color(0xFFE6B398),
    ),
    ProductModel(
      id: 5,
      title: "Office Code",
      price: 235,

      dominantColor: products[0].dominantColor,
      size: 12,
      description: dummyText,
      image: "assets/images/bag5.jpg",
      maincategory: "Handbag",
      // color: const Color(0xFFFB7883),
    ),
    ProductModel(
      id: 6,
      title: "Office Code",
      price: 450,
      size: 12,

      dominantColor: products[0].dominantColor,
      description: dummyText,
      image: "assets/images/bag6.jpg",
      maincategory: "Handbag",
      // color: const Color(0xFFAEAEAE),
    ),
    //Jewerllery
    ProductModel(
      id: 7,
      title: 'Gold Necklace',
      size: 21,

      dominantColor: products[0].dominantColor,
      description: dummyText,
      image: 'assets/images/j.set1.jpg',
      price: 129.99,
      maincategory: 'Jewellery',
    ),
    ProductModel(
      id: 8,
      title: 'Gold Necklace',
      image: 'assets/images/j.set2.jpg',
      description: dummyText,
      size: 21,
      dominantColor: products[0].dominantColor,

      price: 129.99,
      maincategory: 'Jewellery',
    ),
  ];

  static const String dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
}
