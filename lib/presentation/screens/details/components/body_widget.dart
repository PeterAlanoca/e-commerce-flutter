import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/domain/models/product.dart';
import 'package:e_commerce_flutter/presentation/screens/details/components/add_to_cart_widget.dart';
import 'package:e_commerce_flutter/presentation/screens/details/components/cart_counter_widget.dart';
import 'package:e_commerce_flutter/presentation/screens/details/components/color_and_size_widget.dart';
import 'package:e_commerce_flutter/presentation/screens/details/components/description_widget.dart';
import 'package:e_commerce_flutter/presentation/screens/details/components/product_title_with_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:e_commerce_flutter/application/product/product_state.dart';

class BodyWidget extends ConsumerWidget {
  final Product product;

  const BodyWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      const CartCounterWidget(),
                      const SizedBox(height: defaultPadding / 2),
                      AddToCartWidget(
                        product: product,
                        onDelete: () async {
                          await ref.read(productProvider.notifier).deleteProduct(product.id);
                          Navigator.of(context).pop();
                        },
                      ),
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