import 'package:e_commerce_ui/utils/dimension.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final Widget leading;
  final Widget trailing;
  const SearchBarWidget(
      {super.key,
      required this.hintText,
      required this.leading,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimension.searchBoxWidth,
      height: Dimension.height30 + 10,
      decoration: BoxDecoration(
        color: const Color.fromARGB(207, 225, 223, 223),
        borderRadius: BorderRadius.circular(Dimension.radius12)
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: leading,
            suffixIcon: trailing,
            border: InputBorder.none,
          ),
      ),
    );
  }
}
