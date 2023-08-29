import 'package:e_commerce_ui/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/hamburger.png'),
          const SizedBox(
            width: 10,
          ),
          SearchBarWidget(
              hintText: 'Search here',
              leading: Image.asset('assets/images/search.png',),
              trailing: Image.asset('assets/images/voice.png',)),
          const SizedBox(
            width: 10,
          ),
          Image.asset('assets/images/vector.png'),
        ],
      ),
    );
  }
}
