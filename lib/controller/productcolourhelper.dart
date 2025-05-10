import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorGenerator {
  static Future<Color> getDominantColor(String imagePath) async {
    final imageProvider = AssetImage(imagePath);
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      imageProvider,
    );
    print('Dominant Color: ${paletteGenerator.dominantColor?.color}');

    return paletteGenerator.dominantColor?.color ?? Colors.grey.shade200;
  }
}
