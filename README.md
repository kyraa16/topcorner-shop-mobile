## TOP CORNER SHOP

Kadek Chandra Rasmi | 2406426473 | PBP E

<details>
<summary>Tugas 7 : Elemen Dasar Flutter</summary>
 
### Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget Tree adalah struktur hierarki berbentuk pohon/tree yang menggambarkan bagaimana widget disusun dalam aplikasi Flutter. Setiap tampilan di Flutter (seperti teks, tombol, layout, gambar, dll) semuanya adalah widget, dan widget saling bersarang membentuk pohon (tree).

contoh:
'''
MaterialApp
 └── Scaffold
      ├── AppBar
      │    └── Text
      └── Center
           └── Text
'''

Widget parent/induk adalah widget yang membungkus widget lain. Sedangkan, widget child/anak adalah widget yang berada di dalam widget lain. Data dan properti diturunkan dari parent ke child melalui constructor. Parent menentukan bagaimana child ditampilkan (misalnya posisi, ukuran, padding, alignment, dll).

### Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
ans

### Apa fungsi dari widget `MaterialApp`? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Widget MaterialApp berfungsi untuk menyediakan kofigurasi global seperti judul aplikasi, theme, dan halaman utama. 
'''
return MaterialApp( 
      title: 'Flutter Demo', 
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSwatch( 
          primarySwatch: Colors.cyan, 
        ).copyWith(secondary: Colors.cyanAccent[900]), 
      ), 
      home: MyHomePage(), 
    );
'''

MaterialApp digunakan sebagai root widget karena MaterialApp menyediakan context yang dibutuhkan semua widget Material di bawahnya. Widget seperti Scaffold, AppBar, SnackBar, dan FloatingActionButton membutuhkan MaterialApp di atasnya agar dapat ditampilkan dengan gaya yang benar. Ia juga menyediakan navigator, tema, dan localization untuk seluruh aplikasi. Selain itu, MaterialApp juga dijadikan root karena standar convention flutter sehingga kode kita mudah dipahami developer lain. 

### Jelaskan perbedaan antara `StatelessWidget` dan `StatefulWidget`. Kapan kamu memilih salah satunya?
`StatelessWidget` adalah widget yang tidak berubah. Cocok dipakai jika tidak ada kondisi perubahan setelah widget dibuat. Contohnya pada `MyApp`, `MyHomePage`, `InfoCard`, dan `ItemCard` yang semuanya menggunakan StatelessWidget karnea tidak memerlukan perubahan tampilan yang dinamis. Widget ini hanya rebuild ketika parent-nya rebuild. Keuntungannya adalah lebih ringan. 

Sedangkan `StatefulWidget` adalah widget yang bisa berubah. Memiliki object state yang menyimpan data yang bisa berubah-ubah. Widget ini dapat melakukan rebuild sendiri dengan `setState()`. Digunakan saat tampilan perlu berubah karena interaksi pengguna atau perubahan data (misalnya input, animasi, counter, form).

### Apa itu `BuildContext` dan mengapa penting di Flutter? Bagaimana penggunaannya di metode `build`?
BuildContext adalah referensi ke lokasi widget di dalam widget tree. Setiap widget memiliki BuildContext sendiri.  BuildContext sangat penting karena memungkinkan widget untuk:
- Mengakses tema (Theme.of(context)),
- Mengambil navigasi (Navigator.of(context)),
- Menampilkan SnackBar (ScaffoldMessenger.of(context)),
- Dan berinteraksi dengan parent widget-nya.
- 
Contohnya pada penggunaannya di method `build` :

...



### Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart"
ans

</details>
