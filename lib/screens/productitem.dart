// import 'package:e_commerce_app/controller/productcolourhelper.dart';
// import 'package:e_commerce_app/models/handbagmodel.dart';
// import 'package:e_commerce_app/screens/productdetailscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class Productitem extends StatefulWidget {
//   final ProductModel product;
//   final String tag;
//   const Productitem({super.key, required this.product, required this.tag});

//   @override
//   State<Productitem> createState() => _ProductitemState();
// }

// class _ProductitemState extends State<Productitem> {
//   Color? bgColor;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
// setState(() {

// });  }

//   color:widget.product.domi

//   @override
//   Widget build(BuildContext context) {
//     final product = widget.product;
//     return GestureDetector(
//       onTap: () {
//         Get.to(
//           () => Productdetailscreen(
//             product: product,
//             heroTag: widget.tag,
//             bgColor: bgColor ?? Colors.grey.shade200,
//           ),
//         );
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 190,
//             decoration: BoxDecoration(
//               color: bgColor ?? Colors.grey.shade200,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Center(
//               child: Hero(
//                 tag: widget.tag,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(
//                     product.image,
//                     height: 140,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 8),
//           Text(
//             product.title,
//             style: TextStyle(fontSize: 16, color: Colors.grey),
//           ),
//           Text(
//             "\$${product.price}",
//             style: TextStyle(
//               fontSize: 14,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:e_commerce_app/models/handbagmodel.dart';
import 'package:e_commerce_app/screens/productdetailscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Productitem extends StatelessWidget {
  final ProductModel product;
  final String tag;

  const Productitem({super.key, required this.product, required this.tag});

  @override
  Widget build(BuildContext context) {
    final bgColor = product.dominantColor ?? Colors.grey.shade200;

    return GestureDetector(
      onTap: () {
        Get.to(
          () => Productdetailscreen(
            product: product,
            heroTag: tag,
            bgColor: bgColor,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 190,
            decoration: BoxDecoration(
              color: bgColor,
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
          Text(
            product.title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
