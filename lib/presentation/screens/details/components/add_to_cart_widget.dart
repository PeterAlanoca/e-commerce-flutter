import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:flutter/material.dart';

class AddToCartWidget extends StatelessWidget {
  final Product product;
  final VoidCallback? onDelete;

  const AddToCartWidget({
    super.key,
    required this.product,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: product.color,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: onDelete,
                child: Text(
                  'Eliminar'.toUpperCase(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}