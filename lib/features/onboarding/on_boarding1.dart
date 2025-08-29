import 'package:ecommerce_mobile/features/onboarding/on_boarding2.dart';
import 'package:ecommerce_mobile/preferences/assets.dart';
import 'package:ecommerce_mobile/preferences/color.dart';
import 'package:flutter/material.dart';

class FirstOnBoarding extends StatelessWidget {
  const FirstOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 65,
            child: Container(
              decoration: BoxDecoration(
                color: MainColors.primaryColor,
                image: DecorationImage(
                    image: AssetImage('assets/images/orangungu.png',),
                    alignment: Alignment(0, 0.6),
                    scale: 1
                ),
              ),
            ),
          ),
          Flexible(
            flex: 35,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
              decoration: BoxDecoration(
                color: Color(0xff393939),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Get The Freshest Fruit Salad Combo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text('We deliver the best and freshest fruit\n salad in town. Order for a combo\n today!!!',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                  SizedBox(height: 34,),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SecOnBoarding()));
                      },
                      child: Text('Lets Continue')
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
