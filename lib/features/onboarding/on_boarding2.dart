// Memanggil "peralatan" yang kita butuhkan untuk membuat halaman ini.
// Ini adalah alamat halaman selanjutnya yang akan kita tuju.
import 'package:ecommerce_mobile/features/home/screen/home_screen/home_screen.dart';
import 'package:ecommerce_mobile/features/home/screen/main_screen/main_screen.dart';
// Ini adalah "kotak alat" utama dari Flutter untuk membuat tampilan.
import 'package:flutter/material.dart';
// Kita membuat sebuah halaman bernama SecOnBoarding.
// Halaman ini "pintar" karena bisa mengingat apa yang pengguna ketik.
class SecOnBoarding extends StatefulWidget {
  const SecOnBoarding({super.key});

  @override
  // Membuat "otak" untuk halaman pintar ini.
  State<SecOnBoarding> createState() => _SecOnBoardingState();
}

// Ini adalah "otak" dari halaman SecOnBoarding.
// Semua logika dan tampilan yang bisa berubah ada di sini.
class _SecOnBoardingState extends State<SecOnBoarding> {

  // Membuat sebuah "wadah" untuk menampung tulisan dari pengguna.
  // Nanti, apa pun yang diketik di kolom nama akan disimpan di sini.
  final _nameController = TextEditingController();

  @override
  // Bagian ini bertugas untuk "menggambar" semua yang akan tampil di layar.
  Widget build(BuildContext context) {
    // Scaffold adalah seperti kanvas atau kerangka dasar dari halaman kita.
    return Scaffold(
      // Isi dari halaman kita disusun dari atas ke bawah (menggunakan Column).
      body: Column(
        children: [
          // Kita bagi layar menjadi dua bagian. Bagian atas ini lebih besar (65%).
          Flexible(
            flex: 65,
            child: Container(
              // Menghias kotak bagian atas ini.
              decoration: BoxDecoration(
                // Memberi warna oranye.
                color: Color(0xffFFA451),
                // Memberi gambar sebagai latar belakang.
                image: DecorationImage(
                  // Mengambil gambar dari folder 'assets'.
                    image: AssetImage('assets/images/kakioren.png',),
                    // Mengatur posisi gambar sedikit ke bawah.
                    alignment: Alignment(0, 0.6),
                    // Mengatur ukuran gambar.
                    scale: 1
                ),
              ),
            ),
          ),
          // Ini adalah bagian bawah layar, ukurannya lebih kecil (35%).
          Flexible(
            flex: 35,
            child: Container(
              // Memberi sedikit ruang kosong di pinggir kiri, kanan, atas, dan bawah.
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
              decoration: BoxDecoration(
                // Memberi warna putih.
                color: Color(0xff393939),
              ),
              // Di dalam kotak putih ini, kita susun lagi isinya dari atas ke bawah.
              child: Column(
                // Membuat semua isinya melebar memenuhi kotak.
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Mengelompokkan tulisan pertanyaan dan kolom input.
                  Column(
                    // Membuat isinya rata kiri.
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Menampilkan tulisan pertanyaan.
                      Text('What is your firstname?', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),),
                      // Memberi jarak ke bawah sebesar 16.
                      SizedBox(height: 16,),
                      // Membuat kolom untuk mengetik teks.
                      TextFormField(
                        // Menghubungkan kolom ini dengan "wadah" yang kita buat tadi.
                        controller: _nameController,
                        // Menghias kolom input.
                        decoration: InputDecoration(
                          // Menampilkan tulisan petunjuk di dalam kolom.
                          hintText: 'Enter your first name',
                        ),
                      )
                    ],
                  ),
                  // Memberi jarak ke bawah sebesar 34.
                  SizedBox(height: 34,),
                  // Membuat sebuah tombol.
                  ElevatedButton(
                    // Perintah yang dijalankan saat tombol ini ditekan.
                    onPressed: (){
                      // Mengambil tulisan yang ada di dalam "wadah".
                      String nameController = _nameController.text;
                      // Pindah ke halaman berikutnya (HomeScreen).
                      // Halaman yang ini akan ditutup dan tidak bisa kembali lagi.
                      Navigator.pushAndRemoveUntil(
                        context,
                        // Menentukan tujuan pindahnya ke HomeScreen.
                        MaterialPageRoute(builder: (context) => MainScreen(name: nameController,)), // Sambil pindah, kita "membawa" nama yang sudah diketik.
                        // Perintah untuk menutup semua halaman sebelumnya.
                            (route) => false,
                      );
                    },
                    // Tulisan yang muncul di tombol.
                    child: Text('Let’s Continue',),
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
