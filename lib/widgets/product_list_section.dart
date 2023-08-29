import 'package:cached_network_image/cached_network_image.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const Spacer(),
              const Row(
                children: [
                  Text(
                    'See all',
                    style: TextStyle(color: AppColors.smallTextColor, fontSize: 14),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10,
                    color: Colors.grey,
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        categoryWidget ?? Container(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            height: 180,
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
      width: 120,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color: const Color.fromARGB(207, 225, 223, 223),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                CachedNetworkImage(
                  height: 95,
                  width: 110,
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
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: isOff
                          ? const Text(
                              '11%',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.mainColor),
                            )
                          : Container(),
                    ),
                  ),
                ),
                const Positioned(
                  right: 3,
                  top: 3,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current Chinese Boil',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      color: Color(0xff181725),
                      letterSpacing: 1.2,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                const Text(
                  '200gm',
                  style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          '¥250',
                          style: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        isOff
                            ? const Text(
                                '¥280',
                                style: TextStyle(
                                    color: AppColors.smallTextColor,
                                    fontSize: 12,
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
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
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
