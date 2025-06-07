import 'package:e_commerce_flutter/base/constants.dart';
import 'package:flutter/material.dart';

class CartCounterWidget extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int>? onChanged;

  const CartCounterWidget({
    super.key,
    this.initialValue = 1,
    this.onChanged,
  });

  @override
  State<CartCounterWidget> createState() => _CartCounterWidgetState();
}

class _CartCounterWidgetState extends State<CartCounterWidget> {
  late int numOfItems;

  @override
  void initState() {
    super.initState();
    numOfItems = widget.initialValue;
  }

  void _updateItems(int value) {
    setState(() {
      numOfItems = value;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(numOfItems);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove,
          pressed: () {
            if (numOfItems > 1) {
              _updateItems(numOfItems - 1);
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Text(
            numOfItems.toString().padLeft(2, '0'),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        buildOutlineButton(
          icon: Icons.add,
          pressed: () {
            _updateItems(numOfItems + 1);
          },
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({required IconData icon, Function? pressed}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        onPressed: () => pressed?.call(),
        child: Icon(icon),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }
}