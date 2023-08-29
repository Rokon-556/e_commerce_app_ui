import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_ui/app_constants/images.dart';
import 'package:flutter/material.dart';

class ProductListSection extends StatelessWidget {
  final String title;
  final bool? isOff;
  final Widget? categoryWidget;
  const ProductListSection({super.key, required this.title, this.isOff,this.categoryWidget});

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
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Row(
                children: [
                  Text(
                    'See all',
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
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
                  height: 100,
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
                        color: const Color.fromARGB(207, 225, 223, 223),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        '11%',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff37AD57)),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 3,
                  top: 3,
                  child: Icon(Icons.favorite_border,color: Colors.grey,),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Current Chinese Boil'),
                const SizedBox(
                  height: 2
                ),
                const Text('200gm'),
                const SizedBox(
                  height: 5
                ),
                Row(
                  children: [
                    const Text('¥250'),
                    const Spacer(),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xff37AD57),
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
