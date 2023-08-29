import 'package:e_commerce_ui/utils/app_colors.dart';
import 'package:e_commerce_ui/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/hamburger.png'),
          const SizedBox(
            width: 10,
          ),
          SearchBarWidget(
              hintText: 'Search here',
              leading: Image.asset(
                'assets/images/search.png',
              ),
              trailing: Image.asset(
                'assets/images/voice.png',
              )),
          const SizedBox(
            width: 10,
          ),
          Stack(
            children: [
              SizedBox(height:35,child: Image.asset('assets/images/vector.png')),
              Positioned(
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.mainColor,
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.all(2.0),
                      child: Text(
                        '1k',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
