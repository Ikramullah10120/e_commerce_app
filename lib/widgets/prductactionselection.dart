import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Productactionsection extends StatefulWidget {
  final Color color;
  const Productactionsection({super.key, required this.color});

  @override
  State<Productactionsection> createState() => _ProductactionsectionState();
}

class _ProductactionsectionState extends State<Productactionsection> {
  int quantity = 1;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Quatity button
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      border: Border.all(color: Colors.grey, width: 1.5),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      '$quantity',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      border: Border.all(color: Colors.grey, width: 1.5),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ),
                ],
              ),
              //Heart icon
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.shopping_cart_checkout_rounded, size: 45),
              SizedBox(width: 40),
              ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "Your order has been placed",
                    " Thank you for shopping with us",
                    colorText: Colors.white,

                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: widget.color,
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.color,
                  minimumSize: Size(250, 60),

                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'BUY NOW',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
