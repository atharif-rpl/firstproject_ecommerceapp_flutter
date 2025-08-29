// Perintah ini memberitahu bahwa file ini adalah bagian dari file 'home_screen.dart'.
// Ini seperti satu bab cerita yang dipisah ke dalam beberapa lembar kertas agar lebih rapi.
part of '../home_screen.dart';

// Kita membuat sebuah "cetakan" tampilan baru bernama HeaderSection.
// Ini disebut StatelessWidget karena tampilannya akan tetap sama dan tidak berubah-ubah.
class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    // 'required' artinya, siapa pun yang memakai cetakan ini WAJIB memberikan data 'name'.
    required this.name, String? nama,
  });

  // Ini adalah tempat untuk menyimpan data nama yang dikirim dari halaman sebelumnya.
  // Tanda tanya (?) berarti datanya boleh kosong, untuk jaga-jaga.
  final String? name;

  @override
  // Bagian ini bertugas untuk "menggambar" semua yang akan tampil di layar.
  Widget build(BuildContext context) {
    // Semua isi dari header ini akan disusun dari atas ke bawah.
    return Column(
      // Membuat semua isinya rata kiri.
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Baris pertama, isinya akan disusun dari kiri ke kanan.
        SizedBox(height: 20,),
        Row(


          // Perintah ini membuat isi di dalamnya saling menjauh.
          // Satu ke pojok kiri, satu lagi ke pojok kanan.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Menampilkan ikon burger di sebelah kiri.
            CircleAvatar(
              radius: 20, // Atur ukuran lingkaran di sini
              backgroundImage: AssetImage('assets/images/profile.png'), // Path ke gambar Anda

            ),

            // Mengelompokkan ikon keranjang dan tulisannya agar tersusun atas-bawah.

          ],
        ),
        // Memberi jarak kosong yang cukup besar ke bawah.
        SizedBox(height: 20),
        // Menampilkan teks sapaan.
        // '$name' akan otomatis diganti dengan nama yang kita bawa dari halaman sebelumnya.
        // Jadi akan muncul "Hello Budi," atau "Hello Ani," tergantung input pengguna.
        RichText(
          text: TextSpan(
            // Style default untuk semua teks
            style: TextStyle(fontSize: 20, color: Colors.white, height: 1.3),
            children: <TextSpan>[
              TextSpan(text: 'Hello ',
                style: TextStyle(fontWeight: FontWeight.w900)
              ),
              // Bagian nama dibuat tebal
              TextSpan(
                text: '$name',
                style: TextStyle(fontWeight: FontWeight.w800,),
              ),
              TextSpan(text: '\nWhat fruit salad combo do you want today?'),
            ],
          ),
        )
      ],
    );
  }
}
