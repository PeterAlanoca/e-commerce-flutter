import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/models/product.dart';
import 'package:e_commerce_flutter/screens/details/details_screen.dart';
import 'package:e_commerce_flutter/screens/home/components/categories_widget.dart';
import 'package:e_commerce_flutter/screens/home/components/item_card_widget.dart';
import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            'Women',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const CategoriesWidget(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: defaultPadding,
                mainAxisSpacing: defaultPadding,
              ),
              itemBuilder: (context, index) => ItemCardWidget(
                product: products[index],
                pressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: products[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
