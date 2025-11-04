## TOP CORNER SHOP

Kadek Chandra Rasmi | 2406426473 | PBP E

<details>
<summary>Tugas 7 : Elemen Dasar Flutter</summary>
 
### Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget Tree adalah struktur hierarki berbentuk pohon/tree yang menggambarkan bagaimana widget disusun dalam aplikasi Flutter. Setiap tampilan di Flutter (seperti teks, tombol, layout, gambar, dll) semuanya adalah widget, dan widget saling bersarang membentuk pohon (tree).

Widget parent/induk adalah widget yang membungkus widget lain. Sedangkan, widget child/anak adalah widget yang berada di dalam widget lain. Data dan properti diturunkan dari parent ke child melalui constructor. Parent menentukan bagaimana child ditampilkan (misalnya posisi, ukuran, padding, alignment, dll).

### Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
- MaterialApp : Menjadi root dari aplikasi dan menyediakan konfigurasi utama seperti tema, judul, serta navigasi antar halaman.
- Scaffold : Menyediakan struktur dasar suatu page (seperti app bar, body, dll) agar tampilan mengikuti gaya Material Design.
- AppBar : Menampilkan bagian atas aplikasi dengan judul Top Corner Shop.
- Padding :  Memberi jarak di sekeliling konten body agar tidak menempel pada tepi layar atau elemen lainnya.
- Column : Menyusun widget secara vertikal, misalnya InfoCard, teks sambutan, dan GridView.
- Row : Menyusun tiga InfoCard secara horizontal di satu baris.
- InfoCard : Widget kustom yang menampilkan informasi NPM, Nama, dan Kelas di dalam bentuk kartu.
- Card : Memberikan tampilan seperti kartu dengan bayangan dan sudut halus.
- Container : Digunakan untuk mengatur ukuran, padding, dan dekorasi dalam InfoCard dan ItemCard.
- Text : Menampilkan teks seperti judul, serta text pada button.
- SizedBox : Memberi jarak vertikal antar elemen.
- Center : Menempatkan widget di tengah area yang tersedia.
- Material : Menyediakan efek ink ripple dan warna latar belakang untuk ItemCard.
- InkWell : Handle action ketika kartu ditekan dan menampilkan SnackBar.
- Icon : Menampilkan icon pada card menu.
- SnackBar : Memberi umpan balik berupa pesan kecil di bagian bawah layar ketika pengguna menekan suatu item.
- ScaffoldMessenger : Menampilkan atau menghapus SnackBar di layar.

### Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Widget MaterialApp berfungsi untuk menyediakan kofigurasi global seperti judul aplikasi, theme, dan halaman utama. 
```
return MaterialApp( 
      title: 'Flutter Demo', 
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSwatch( 
          primarySwatch: Colors.cyan, 
        ).copyWith(secondary: Colors.cyanAccent[900]), 
      ), 
      home: MyHomePage(), 
    );
```

MaterialApp digunakan sebagai root widget karena MaterialApp menyediakan context yang dibutuhkan semua widget Material di bawahnya. Widget seperti Scaffold, AppBar, SnackBar, dan FloatingActionButton membutuhkan MaterialApp di atasnya agar dapat ditampilkan dengan style yang benar. Ia juga menyediakan navigator, tema, dan localization untuk seluruh aplikasi. Selain itu, MaterialApp juga dijadikan root karena standar convention flutter sehingga kode kita mudah dipahami developer lain. 

### Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?
`StatelessWidget` adalah widget yang tidak berubah. Cocok dipakai jika tidak ada kondisi perubahan setelah widget dibuat. Contohnya pada `MyApp`, `MyHomePage`, `InfoCard`, dan `ItemCard` yang semuanya menggunakan StatelessWidget karnea tidak memerlukan perubahan tampilan yang dinamis. Widget ini hanya rebuild ketika parent-nya rebuild. Keuntungannya adalah lebih ringan. 

Sedangkan `StatefulWidget` adalah widget yang bisa berubah. Memiliki object state yang menyimpan data yang bisa berubah-ubah. Widget ini dapat melakukan rebuild sendiri dengan `setState()`. Digunakan saat tampilan perlu berubah karena interaksi pengguna atau perubahan data (misalnya input, animasi, counter, form).

### Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode `build`?
BuildContext adalah objek yang menyediakan informasi tentang posisi widget dalam pohon widget (widget tree) dan hubungannya dengan widget lain. `BuildContext` penting di flutter karena membantu widget memahami lokasinya dalam hierarki, mengakses data tema, media query, dan layanan lain yang disediakan oleh parent widget, serta memungkinkan navigasi dan menampilkan dialog/SnackBar. 

Contohnya pada penggunaannya di method `build` :
```
@override
Widget build(BuildContext context) {
  // Context digunakan untuk mengakses berbagai properti
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
    body: Container(
      width: MediaQuery.of(context).size.width,
    ),
  );
}
```
`BuildContext` digunakan untuk mengakses tema aplikasi (pada Theme.of(context)), mengakses informasi tentang device (MediaQuery.of(context)), serta menampilkan SnackBar (ScaffoldMessenger.of(context)).


### Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart"
`Hot Reload` digunakan untuk memperbarui kode UI tanpa kehilangan state aplikasi. Dapat dilakukan dengan cepat (hanya rebuild bagian UI yang berubah) dan cocok digunakan untuk perubahan tampilan yang kecil seperti warna, teks, atau layout. 

Sedangkan `Hot Restart` menjalankan ulang seluruh aplikasi dari awal. Kecepatannya lebih lambat karena seluruh state direset dan tidak mempertahankan state. Hot Restart cocok digunakan saat mengubah logika program, variable global, atau struktur main() method. 

</details>
