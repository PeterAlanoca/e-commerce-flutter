import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/models/product.dart';
import 'package:e_commerce_flutter/screens/details/components/body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: BodyWidget(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/cart.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: defaultPadding / 2)
      ],
    );
  }
}
