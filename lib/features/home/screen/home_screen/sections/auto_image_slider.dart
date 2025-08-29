// Mendeklarasikan bahwa file ini adalah bagian dari home_screen.dart
part of '../home_screen.dart';

// Membuat StatefulWidget karena state (indeks halaman saat ini) akan berubah.
class AutoImageSlider extends StatefulWidget {
  const AutoImageSlider({super.key});

  @override
  State<AutoImageSlider> createState() => _AutoImageSliderState();
}

class _AutoImageSliderState extends State<AutoImageSlider> {
  // Daftar widget gambar yang akan ditampilkan di slider.
  // Pastikan path gambar ini sesuai dengan yang ada di folder assets Anda.
  final myitems = [
    // Menambahkan properti 'fit' untuk memastikan gambar mengisi ruang dengan benar.
    Image.asset('assets/images/bannerfood1.png', fit: BoxFit.cover),
    Image.asset('assets/images/bannerfood2.png', fit: BoxFit.cover),
    Image.asset('assets/images/bannerfood1.png', fit: BoxFit.cover),
    Image.asset('assets/images/bannerfood2.png', fit: BoxFit.cover),
  ];

  // Variabel untuk menyimpan indeks halaman (slide) yang sedang aktif.
  int myCurrentIndex = 0;

  get px => null;

  @override
  Widget build(BuildContext context) {
    // Menggunakan Column untuk menumpuk slider dan indikatornya.
    return Column(
      children: [
        // Widget CarouselSlider untuk membuat slider gambar.
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true, // Membuat slider berjalan otomatis.
            height: 180, // Tinggi slider akan menentukan tinggi gambar.
            autoPlayCurve: Curves.fastOutSlowIn, // Jenis animasi transisi.
            autoPlayAnimationDuration: const Duration(milliseconds: 800), // Durasi animasi.
            autoPlayInterval: const Duration(seconds: 2), // Jeda waktu antar slide.


            viewportFraction: 1.0, // Membuat setiap item mengisi lebar layar.
            enlargeCenterPage: false, // Tidak perlu diperbesar jika sudah full-width.

            // Fungsi yang akan dipanggil setiap kali halaman slider berubah.
            onPageChanged: (index, reason) {
              setState(() {
                // Memperbarui state indeks saat ini.
                myCurrentIndex = index;
              });
            },
          ),
          // Mengambil item (gambar) dari daftar yang sudah dibuat.
          items: myitems,
        ),
        SizedBox(height: 20,),
        // Widget untuk menampilkan indikator titik-titik di bawah slider.
        AnimatedSmoothIndicator(
          activeIndex: myCurrentIndex, // Menghubungkan ke indeks yang aktif.
          count: myitems.length, // Jumlah total titik sesuai jumlah gambar.
          effect: WormEffect( // Jenis efek animasi untuk indikator.
            dotHeight: 8,
            dotWidth: 8,
            spacing: 3,
            dotColor: Colors.grey.shade200,
            activeDotColor: Colors.orange.shade400,
            paintStyle: PaintingStyle.fill,
          ),
        )
      ],
    );
  }
}
