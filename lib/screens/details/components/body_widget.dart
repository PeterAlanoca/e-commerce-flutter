import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/models/product.dart';
import 'package:e_commerce_flutter/screens/details/components/add_to_cart_widget.dart';
import 'package:e_commerce_flutter/screens/details/components/color_and_size_widget.dart';
import 'package:e_commerce_flutter/screens/details/components/counter_with_favorite_button.dart';
import 'package:e_commerce_flutter/screens/details/components/description_widget.dart';
import 'package:e_commerce_flutter/screens/details/components/product_title_with_image_widget.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {

  final Product product;

  const BodyWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: defaultPadding,
                    right: defaultPadding,
                  ),
                  //height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorAndSizeWidget(product: product),
                      const SizedBox(height: defaultPadding / 2),
                      DescriptionWidget(product: product),
                      const SizedBox(height: defaultPadding / 2),
                      const CounterWithFavoriteButton(),
                      const SizedBox(height: defaultPadding / 2),
                      AddToCartWidget(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImageWidget(product: product)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
