import 'package:ecommerce_mobile/features/home/model/item_model.dart';
import 'package:ecommerce_mobile/features/home/screen/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodItem extends StatefulWidget {
  const FoodItem({
    super.key,
    required this.item,
  });

  final ItemFoodModel item;

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // Menggunakan InkWell untuk efek ripple saat ditekan dan navigasi
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen()),
        );
      },
      borderRadius: BorderRadius.circular(16), // Menyesuaikan efek ripple dengan bentuk container
      child: Container(
        width: 180,
        height: 236,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: widget.item.bgColor ?? const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff202020).withOpacity(0.05),
                spreadRadius: 0,
                blurRadius: 6,
                offset: const Offset(0, 3),
              )
            ]),
        child: Stack(
          children: [
            Column(
              children: [
                // Gambar produk
                Image.asset(
                  widget.item.imagePath,
                  width: 90,
                  height: 90,
                ),
                const SizedBox(height: 16),
                // Nama produk
                Text(
                  widget.item.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 14),
                // Baris harga dan tombol tambah
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.item.price,
                      style: const TextStyle(color: Color(0xffFFA451)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xffFFF2E7)),
                      child: const Icon(
                        Icons.add,
                        color: Color(0xffFFA451),
                        size: 12,
                      ),
                    )
                  ],
                )
              ],
            ),
            // Tombol favorit
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                child: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border_rounded,
                  size: 16,
                  color: const Color(0xffFFA451),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
