import 'dart:ui';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String image;
  final String maincategory;
  final String description;
  final int size;
  Color? dominantColor;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.size,
    required this.maincategory,
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
    ),
    ProductModel(
      id: 2,
      title: "Belt Bag",
      price: 300,
      size: 8,
      description: dummyText,
      image: "assets/images/bag2.jpg",
      maincategory: "Handbag",
    ),
    ProductModel(
      id: 3,
      title: "Hang Top",
      price: 350,
      size: 10,
      description: dummyText,
      image: "assets/images/bag3.jpg",
      maincategory: "Handbag",
    ),
    ProductModel(
      id: 4,
      title: "Old Fashion",
      price: 500,
      size: 11,
      description: dummyText,
      image: "assets/images/bag4.jpg",
      maincategory: "Handbag",
    ),
    ProductModel(
      id: 5,
      title: "Office Code",
      price: 235,
      size: 12,
      description: dummyText,
      image: "assets/images/bag5.jpg",
      maincategory: "Handbag",
    ),
    ProductModel(
      id: 6,
      title: "Office Code",
      price: 450,
      size: 12,
      description: dummyText,
      image: "assets/images/bag6.jpg",
      maincategory: "Handbag",
    ),
    // Jewellery
    ProductModel(
      id: 7,
      title: 'Gold Necklace',
      size: 21,
      description: dummyText,
      image: 'assets/images/j.set1.jpg',
      price: 130.99,
      maincategory: 'Jewellery',
    ),

    ProductModel(
      id: 8,
      title: 'Green Diamond set',
      size: 21,
      description: dummyText,
      image: 'assets/images/j.set2.jpg',
      price: 129.99,
      maincategory: 'Jewellery',
    ),

    ProductModel(
      id: 9,
      title: 'Premium Gold set',
      size: 21,
      description: dummyText,
      image: 'assets/images/j.set3.jpg',
      price: 129.99,
      maincategory: 'Jewellery',
    ),

    ProductModel(
      id: 10,
      title: 'Gold Necklace',
      size: 21,
      description: dummyText,
      image: 'assets/images/j.set4.jpg',
      price: 129.99,
      maincategory: 'Jewellery',
    ),

    ProductModel(
      id: 11,
      title: 'Gold Necklace',
      size: 21,
      description: dummyText,
      image: 'assets/images/j.set5.jpg',
      price: 129.99,
      maincategory: 'Jewellery',
    ),
    ProductModel(
      id: 12,
      title: 'Gold Necklace',
      size: 21,
      description: dummyText,
      image: 'assets/images/j.set6.jpg',
      price: 129.99,
      maincategory: 'Jewellery',
    ),
    //foot wear
    ProductModel(
      id: 13,
      title: 'foot wear',
      size: 21,
      description: dummyText,
      image: 'assets/images/s.set1.jpg',
      price: 129.99,
      maincategory: 'foot wear',
    ),
    ProductModel(
      id: 14,
      title: 'foot wear',
      size: 21,
      description: dummyText,
      image: 'assets/images/s.set2.jpg',
      price: 129.99,
      maincategory: 'foot wear',
    ),
    ProductModel(
      id: 15,
      title: 'foot wear',
      size: 21,
      description: dummyText,
      image: 'assets/images/s.set3.jpg',
      price: 129.99,
      maincategory: 'foot wear',
    ),
    ProductModel(
      id: 16,
      title: 'foot wear',
      size: 21,
      description: dummyText,
      image: 'assets/images/s.set4.jpg',
      price: 129.99,
      maincategory: 'foot wear',
    ),
    ProductModel(
      id: 17,
      title: 'foot wear',
      size: 21,
      description: dummyText,
      image: 'assets/images/s.set5.jpg',
      price: 129.99,
      maincategory: 'foot wear',
    ),
    ProductModel(
      id: 18,
      title: 'foot wear',
      size: 21,
      description: dummyText,
      image: 'assets/images/s.set6.jpg',
      price: 129.99,
      maincategory: 'foot wear',
    ),
    ProductModel(
      id: 19,
      title: 'foot wear',
      size: 21,
      description: dummyText,
      image: 'assets/images/a.1.jpg',
      price: 129.99,
      maincategory: 'Accessories',
    ),

    ProductModel(
      id: 20,
      title: 'Accessories',
      size: 21,
      description: dummyText,
      image: 'assets/images/a.2.jpg',
      price: 129.99,
      maincategory: 'Accessories',
    ),

    ProductModel(
      id: 21,
      title: 'Accessories',
      size: 21,
      description: dummyText,
      image: 'assets/images/a.3.jpg',
      price: 129.99,
      maincategory: 'Accessories',
    ),

    ProductModel(
      id: 22,
      title: 'Accessories',
      size: 21,
      description: dummyText,
      image: 'assets/images/a.4.jpg',
      price: 129.99,
      maincategory: 'Accessories',
    ),
    ProductModel(
      id: 23,
      title: 'Accessories',
      size: 21,
      description: dummyText,
      image: 'assets/images/a.5.jpg',
      price: 129.99,
      maincategory: 'Accessories',
    ),
    ProductModel(
      id: 24,
      title: 'Accessories',
      size: 21,
      description: dummyText,
      image: 'assets/images/a.6.jpg',
      price: 129.99,
      maincategory: 'Accessories',
    ),
  ];

  static const String dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
}
