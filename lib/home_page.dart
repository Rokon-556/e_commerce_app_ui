import 'package:e_commerce_ui/widgets/header_section.dart';
import 'package:e_commerce_ui/widgets/product_list_section.dart';
import 'package:e_commerce_ui/widgets/story_view_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 65,),
            HeaderSection(),
            StoryViewSection(),
            SizedBox(height: 15,),
            ProductListSection(title: 'Categories')
          ],
        ),
      ),
    );
  }
}
