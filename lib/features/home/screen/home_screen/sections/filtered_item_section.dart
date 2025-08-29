part of '../home_screen.dart';

class FilteredItemSection extends StatelessWidget {
  const FilteredItemSection({super.key, required this.category});

  final List<String> category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                category[index],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 26);
            },
            itemCount: category.length,
          ),
        ),
        SizedBox(height: 24),
        SizedBox(
          height: 200,
          child: ListView(
            clipBehavior: Clip.none,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              FoodItem(
                item: ItemFoodModel(
                  imagePath: 'assets/images/food.png',
                  name: 'Berry mango bbbbb',
                  price: '8,000',
                  bgColor: Color(0xffFFFAEB),
                ),
              ),
              SizedBox(width: 16),
              FoodItem(
                item: ItemFoodModel(
                  imagePath: 'assets/images/food.png',
                  name: 'Berry mango combo',
                  price: '8,000',
                  bgColor: Color(0xffFEF0F0),
                ),
              ),
              SizedBox(width: 16),
              FoodItem(
                item: ItemFoodModel(
                  imagePath: 'assets/images/food.png',
                  name: 'Berry mango combo',
                  price: '8,000',
                  bgColor: Color(0xffF1EFF6),
                ),
              ),
              SizedBox(width: 16),
              FoodItem(
                item: ItemFoodModel(
                  imagePath: 'assets/images/food.png',
                  name: 'Berry mango combo',
                  price: '8,000',
                  bgColor: Color(0xffF1EFF6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
