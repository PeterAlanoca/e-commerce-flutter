import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final Product product;
  final Function pressed;

  const ItemCardWidget({
    super.key,
    required this.product,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    try {
      if (product.image.isNotEmpty) {
        imageWidget = Image.memory(
          product.imageBytes,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Icon(Icons.broken_image, size: 60, color: Colors.white));
          },
        );
      } else {
        imageWidget = const Center(child: Icon(Icons.image, size: 60, color: Colors.white));
      }
    } catch (e) {
      imageWidget = const Center(child: Icon(Icons.broken_image, size: 60, color: Colors.white));
    }

    return GestureDetector(
      onTap: () => pressed.call(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: '${product.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: imageWidget,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 4),
            child: Text(
              product.title,
              style: const TextStyle(color: textLightColor),
            ),
          ),
          Text(
            '\$${product.price}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}