import 'package:flutter/material.dart';

class Homscreen extends StatefulWidget {
  const Homscreen({super.key});

  @override
  State<Homscreen> createState() => _HomscreenState();
}

class _HomscreenState extends State<Homscreen> {
  String selected = '';
  final List<String> category = [
    "Hand bag",
    "Jewellery",
    "Footwear",
    "Dresses",
  ];
  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              "Women",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  category.map((category) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = category;
                        });
                        print("Tapped:$category");
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
              padding: EdgeInsets.all(16),
              child: Text("Selected:$selected", style: TextStyle(fontSize: 16)),
            ),
        ],
      ),
    );
  }
}
