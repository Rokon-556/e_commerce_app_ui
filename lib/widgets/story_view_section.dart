import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_ui/pages/story_view_page.dart';
import 'package:e_commerce_ui/utils/dimension.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

import '../utils/images.dart';

class StoryViewSection extends StatelessWidget {
  const StoryViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimension.height30 * 5,
      child: Padding(
        padding:  EdgeInsets.only(left: Dimension.width20),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: Images.stories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  showStory(context, index, Images.stories);
                  // Navigator.of(context).push(MaterialPageRoute(builder: (_){
                  //   return StoryViewPage(index: index, images: Images.stories);
                  // }));
                },
                child: Container(
                  margin: EdgeInsets.only(right: Dimension.width5, top: Dimension.height10),
                  child: CachedNetworkImage(
                    width: Dimension.width30 * 3.2,
                    fit: BoxFit.fill,
                    imageUrl: Images.stories[index],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              );
            }),
      ),
    );
  }

  void showStory(BuildContext context, int index, List<String> images) {
    final storyController = StoryController();
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: StoryView(
                storyItems: [
                  for (int i = index; i < images.length; i++)
                    StoryItem.inlineImage(
                      url: images[i],
                      controller: storyController,
                      imageFit: BoxFit.contain,
                      // caption:  Text(
                      //   'Caption Here',
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       backgroundColor: Colors.black,
                      //       fontSize: Dimension.font15),
                      // ),
                    ),
                ],
                controller: storyController,
                onStoryShow: (s) {},
                onComplete: () {
                  Navigator.pop(context);
                },
                progressPosition: ProgressPosition.top,
                repeat: false,
                inline: true,
              ),
            ),
          );
        });
  }
}
