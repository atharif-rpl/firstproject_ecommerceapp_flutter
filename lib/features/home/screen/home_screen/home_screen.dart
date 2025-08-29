import 'package:ecommerce_mobile/features/home/widgets/food_banner.dart';
import 'package:ecommerce_mobile/features/home/widgets/item_test.dart';
import 'package:ecommerce_mobile/preferences/icon.dart';
import 'package:ecommerce_mobile/features/features.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part 'sections/header_section.dart';
part 'sections/recomanded_combo_section.dart';
part 'sections/filtered_item_section.dart';
part 'sections/auto_image_slider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.name});

  final String? name;

  final List<String> category = [
    'Hottest',
    'Popular',
    'Top',
    'Most Liked',
    'Recently Added',
    'Newest',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF393939),
      // --- PERUBAHAN UTAMA DI SINI ---
      body: Stack(
        children: [
          Positioned(
            top: -150,
            right: 90,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                color: Color(0xFFFFAC4B),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 26.0, horizontal: 24),
            child: ListView(
              children: [
                HeaderSection(name: name),
                SizedBox(height: 35),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Dishes, restaurants or cuisines',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFFFFFFFF),
                    ),
                    filled: true,
                    fillColor: Color(0xFF656F77),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
                SizedBox(height: 35),
                AutoImageSlider(),
                SizedBox(height: 35),
                RecomandedComboSection(),
                SizedBox(height: 60),
                FilteredItemSection(category: category),
                SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
