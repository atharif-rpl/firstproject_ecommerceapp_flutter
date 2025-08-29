import 'package:ecommerce_mobile/preferences/color.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key, required Color color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MainColors.whiteColor,
        ),
        child: InkWell(
          onTap: () {
            // Perintah untuk kembali ke halaman sebelumnya.
            Navigator.pop(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min, // Membuat Row sekecil mungkin.
            children: [
              Icon(Icons.arrow_back_ios, size: 20),
              Text('Go back'),
            ],
          ),
        ),
      ),
    );
  }
}
