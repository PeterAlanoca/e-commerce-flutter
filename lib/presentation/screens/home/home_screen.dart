import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/presentation/screens/home/add_product_screen.dart';
import 'package:e_commerce_flutter/presentation/screens/home/components/body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const BodyWidget(),
    );
  }

  AppBar buildAppBar(BuildContext context) { // <-- recíbelo aquí
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/back.svg'),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          color: textColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddProductScreen()),
            );
          },
        ),
        const SizedBox(width: defaultPadding / 2)
      ],
    );
  }
}
