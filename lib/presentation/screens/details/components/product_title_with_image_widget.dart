import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:flutter/material.dart';

class ProductTitleWithImageWidget extends StatelessWidget {
  const ProductTitleWithImageWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Poleras',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: 'Precio\n'),
                    TextSpan(
                      text: '\$${product.price}',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                child: Hero(
                  tag: '${product.id}',
                  child: Image.memory(
                    product.imageBytes,
                    fit: BoxFit.contain,
                    width: size.width * 0.75,
                    height: size.width * 0.75,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
