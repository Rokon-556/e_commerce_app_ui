import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_ui/utils/dimension.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/images.dart';

class ProductListSection extends StatelessWidget {
  final String title;
  final bool isOff;
  final Widget? categoryWidget;
  const ProductListSection(
      {super.key,
      required this.title,
      required this.isOff,
      this.categoryWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimension.width20),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Dimension.font15),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    'See all',
                    style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: Dimension.font14),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: Dimension.icon10,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: Dimension.height10,
        ),
        categoryWidget ?? Container(),
        SizedBox(
          height: Dimension.height10,
        ),
        Padding(
          padding: EdgeInsets.only(left: Dimension.width20),
          child: SizedBox(
            height: Dimension.height30 * 6,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Images.stories.length,
                itemBuilder: (context, index) {
                  return singleProduct(Images.stories[index]);
                }),
          ),
        ),
      ],
    );
  }

  Widget singleProduct(String imgUrl) {
    return Container(
      width: Dimension.width30 * 4,
      margin: EdgeInsets.only(right: Dimension.width10 - 2),
      decoration: BoxDecoration(
          color: const Color.fromARGB(207, 225, 223, 223),
          borderRadius: BorderRadius.circular(Dimension.radius12 / 2.4)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                CachedNetworkImage(
                  height: Dimension.height30 * 3.1,
                  width: Dimension.width30 * 4 - 10,
                  fit: BoxFit.cover,
                  imageUrl: imgUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Positioned(
                  left: 3,
                  top: 3,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.percentContainerColor,
                        borderRadius:
                            BorderRadius.circular(Dimension.radius12 / 2.4)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: isOff
                          ? Text(
                              '11%',
                              style: TextStyle(
                                  fontSize: Dimension.font14 - 2,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.mainColor),
                            )
                          : Container(),
                    ),
                  ),
                ),
                Positioned(
                  right: 3,
                  top: 3,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                    size: Dimension.icon20,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Dimension.width5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Chinese Boil',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      color: const Color(0xff181725),
                      letterSpacing: 1.2,
                      fontSize: Dimension.font14 - 1,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(height: Dimension.height5 - 1),
                Text(
                  '200gm',
                  style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: Dimension.font14 - 2),
                ),
                SizedBox(height: Dimension.height5 + 1),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '¥250',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: Dimension.font14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: Dimension.width5,
                        ),
                        isOff
                            ? Text(
                                '¥280',
                                style: TextStyle(
                                    color: AppColors.smallTextColor,
                                    fontSize: Dimension.font14 - 2,
                                    decoration: TextDecoration.lineThrough),
                              )
                            : Container()
                      ],
                    ),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.mainColor,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: Dimension.height20 + 5,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
