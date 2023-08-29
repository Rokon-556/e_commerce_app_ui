import 'package:e_commerce_ui/utils/app_colors.dart';
import 'package:e_commerce_ui/utils/dimension.dart';
import 'package:e_commerce_ui/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Dimension.width20, vertical: Dimension.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/hamburger.png',height: Dimension.height20 * 1.8,),
          SizedBox(
            width: Dimension.width10,
          ),
          SearchBarWidget(
              hintText: 'Search here',
              leading: Image.asset(
                'assets/images/search.png',
                height: Dimension.icon20,
              ),
              trailing: Image.asset(
                'assets/images/voice.png',
                height: Dimension.icon20,

              )),
          SizedBox(
            width: Dimension.width10,
          ),
          Stack(
            children: [
              SizedBox(
                  height: Dimension.height20 * 1.8, child: Image.asset('assets/images/vector.png')),
              Positioned(
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius12),
                      color: AppColors.mainColor,
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        '1k',
                        style: TextStyle(color: Colors.white, fontSize: Dimension.font14 - 4),
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
