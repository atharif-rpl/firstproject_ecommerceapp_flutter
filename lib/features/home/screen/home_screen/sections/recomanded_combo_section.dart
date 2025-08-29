
part of '../home_screen.dart';

class RecomandedComboSection extends StatelessWidget {
  const RecomandedComboSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Combo',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        SizedBox(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ItemTest(title: 'bakwan', price: '2.000', imagePath: 'assets/images/food.png',),
            // ItemTest(title: 'kaROKET', price: '3.000', imagePath: 'assets/images/splash.png',),
            // ItemTest(title: 'piapia', price: '1.000', imagePath: 'assets/images/food.png',),
            FoodItem(
              item: ItemFoodModel(
                imagePath: 'assets/images/food.png',
                name: 'Honey lime combo',
                price: '2,000',
              ),
            ),
            FoodItem(
              item: ItemFoodModel(
                imagePath: 'assets/images/food.png',
                name: 'Berry mango combo',
                price: '8,000',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

