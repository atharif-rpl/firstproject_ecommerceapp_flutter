import 'package:ecommerce_mobile/features/cart/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Membuat status bar menjadi terang agar kontras dengan background
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      backgroundColor: const Color(0xFF393939), // Mengubah background utama
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: _buildProductInfo(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      pinned: true,
      backgroundColor: Colors.orangeAccent, // Warna app bar yang lebih cerah
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0),
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.5),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.orangeAccent,
          child: Center(
            child: Hero(
              tag: 'product_image_tag',
              child: Image.asset(
                'assets/images/food.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: Container(
          height: 30,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF393939), // Warna disesuaikan dengan body
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      decoration: const BoxDecoration(
        color: Color(0xFF393939),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quinoa Fruit Salad',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: Colors.white, // Teks putih
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildQuantitySelector(),
              const Text(
                'Rp 20.000',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.orangeAccent, // Warna harga lebih menonjol
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          _buildSectionTitle('One Pack Contains'),
          const SizedBox(height: 16),
          Text(
            'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
            style: TextStyle(
              height: 1.6,
              fontSize: 16,
              color: Colors.grey[400], // Warna deskripsi lebih soft
            ),
          ),
          const SizedBox(height: 24),
          Divider(color: Colors.grey[700], thickness: 1),
          const SizedBox(height: 16),
          Text(
            'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
            style: TextStyle(
              height: 1.6,
              fontSize: 16,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        _buildQuantityButton(
          icon: Icons.remove,
          onPressed: _decrementQuantity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            quantity.toString(),
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        _buildQuantityButton(
          icon: Icons.add,
          onPressed: _incrementQuantity,
          backgroundColor: Colors.orangeAccent,
          iconColor: Colors.black,
        ),
      ],
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
    Color backgroundColor = const Color(0xFF4F4F4F), // Warna tombol lebih gelap
    Color iconColor = Colors.white,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: iconColor),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 3,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: _toggleFavorite,
            borderRadius: BorderRadius.circular(100),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[800],
                border: Border.all(color: Colors.orangeAccent.withOpacity(0.5)),
              ),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                color: Colors.orangeAccent,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                elevation: 5,
                shadowColor: Colors.orangeAccent.withOpacity(0.4),
              ),
              child: const Text(
                'Add to Basket',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
