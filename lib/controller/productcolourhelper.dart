import 'package:e_commerce_app/models/handbagmodel.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorGenerator {
  static Future<Color> getDominantColor(String imagePath) async {
    final imageProvider = AssetImage(imagePath);
    final palette = await PaletteGenerator.fromImageProvider(imageProvider);
    return palette.dominantColor?.color ?? Colors.grey.shade200;
  }

  /// Call this once during app start (e.g. in initState)
  static Future<void> productDominantColors() async {
    for (var product in ProductModel.products) {
      product.dominantColor ??= await getDominantColor(product.image);
    }
  }
}
