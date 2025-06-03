import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/models/product.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  
  const DescriptionWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding,
      ),
      child: Text(
        product.description,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
