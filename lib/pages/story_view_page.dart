import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewPage extends StatefulWidget {
  final int index;
  final List<String> images;
  const StoryViewPage({super.key, required this.index, required this.images});

  @override
  State<StoryViewPage> createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage> {
  final storyController = StoryController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
      StoryView(
        storyItems: [
          for (int i = widget.index; i < widget.images.length; i++)
            StoryItem.inlineImage(
                url: widget.images[i],
                controller: storyController,
                imageFit: BoxFit.contain,
                caption: Text(
                  'Caption Here',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 17),
                ))
        ],
        controller: storyController,
        onStoryShow: (s){},
        onComplete: (){},
        progressPosition: ProgressPosition.top,
        repeat: false,
        inline: true,
      ),
      InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Align(
          alignment: Alignment.topRight,
          child: Icon(Icons.cancel,color: Colors.red,size: 40,),
        ),
      )
        ],
      ),
    );
  }
}
