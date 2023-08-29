import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_ui/app_constants/images.dart';
import 'package:e_commerce_ui/pages/story_view_page.dart';
import 'package:flutter/material.dart';

class StoryViewSection extends StatelessWidget {
  const StoryViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: Images.stories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_){
                    return StoryViewPage(index: index, images: Images.stories);
                  }));
                },

                child: Container(
                  margin: const EdgeInsets.only(right: 5, top: 10),
                  child: CachedNetworkImage(
                    width: 100,
                    fit: BoxFit.fill,
                    imageUrl: Images.stories[index],
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
