import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartWidget extends StatelessWidget {
  
  const AddToCartWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 50,
            margin: const EdgeInsets.only(right: defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/add_to_cart.svg',
                colorFilter: ColorFilter.mode(
                  product.color,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {},
            ),
          ),
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
                onPressed: () {},
                child: Text(
                  'Buy Now'.toUpperCase(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
