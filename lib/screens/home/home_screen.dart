import 'package:e_commerce_flutter/base/constants.dart';
import 'package:e_commerce_flutter/screens/home/components/body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const BodyWidget(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/back.svg'),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
          ),
          color: textColor,
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/cart.svg',
            colorFilter: const ColorFilter.mode(textColor, BlendMode.srcIn),
          ),
          color: textColor,
          onPressed: () {},
        ),
        const SizedBox(width: defaultPadding / 2)
      ],
    );
  }
}
