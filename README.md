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
        ).copyWith(secondary: Colors.cyanAccent[700]), 
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


<details>
<summary>Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements</summary>
 
###  Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()` pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
`Navigator.push()` digunakan untuk menambahkan halaman baru di atas halaman sekarang dengan halaman lama tetap ada di belakang. COntohnya pada program saya adalah pada:
`menu.dart` :
```
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const NewsFormPage(),
  ),
);
```
Ketika user klik tombol "Create Products", halaman form dibuka dan halaman home tetap ada di belakang. User bisa klik back untuk kembali ke home.

Sedangkan `Navigator.pushReplacement()` mengganti halaman sekarang dengan halaman baru. Halaman lama dihapus dari stack dan tidak ada tombol back ke halaman sebelumnya.
Contohnya pada :
`left_drawer.dart`:
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => MyHomePage()),
);
```
Ketika user klik "Home" di drawer, halaman sekarang diganti dengan home page. Ini mencegah user kembali ke halaman sebelumnya dengan tombol back.

`Navigator.push()` cocok digunakan saat user perlu kembali ke halaman sebelumnya atau user hanya ingin melakukan navigasi sementara (seperti lihat detail, isi form, dan lainnya).  Cocok digunakan untuk explorasi konten yang melakukan buka tutup halaman berkali kali.  Misalnya dalam aplikasi football shop ini, alur:
- Home ke -> Detail Produk
- Home ke -> Form Add Produk
- Detail produk -> Form Edit Produk
cocok menggunakan  Navigator.push()  

`Navigator.pushReplacement()` cocok digunakan saat user tidak perlu kembali ke halaman sebelumnya, mencegah duplikasi halaman, atau telah selesai melakukan suatu aksi (seperti save, detele, edit, logout, dll).  Misalnya dalam aplikasi football shop ini, alur :
- Login ke-> Home
- Form (setelah save) ke ->Home
cocok menggunakan  Navigator.pushReplacement()

### Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Saya memanfaatkan Scaffold, AppBar, dan Drawer untuk membuat struktur halaman yang konsisten. Scaffold digunakan sebagai kerangka dasar pada setiap halaman, dimana pada Scaffold digunakan Appbar dan Drawer. AppBar sebagai header di bagian atas halaman yang selalu muncul di setiap halaman. Appbar akan memunculkan hamburger jika ada drawer dan memunculkan tombol back jika dari push(). Lalu untuk drawer merupakan side bar yang bisa diakses dimana saya dari seluruh halaman aplikasi. Cukup buat sekali pada `left_drawer.dart` sehingga tampilan drawer konsisten untuk seluruh halaman. Dengan hierarki widget ini menjadikan tampilan konsisten di setiap halaman dan memudahkan navigasi user. 

### Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
`Padding` memberi jarak sehingga kegunaannya pada form adalah membuat form tidak menempel di tepi layar ataupun dengan elemen lain, sehingga user dapat lebih nyaman membaca dan berinteraksi dengan halaman. Penerapan Padding pada aplikasi saya :
```
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(...),
),
```
field pada form dibungkus dengan padding sebesar 8.0 sehingga terdapat jarak antar field.

`SingleChildScrollView` akan memuat semua tanpa overflow, hal ini akan terlihat jelas jika formnya panjang. Lalu, jika keyboard muncul saat mengetik untuk pengisian formnya, user dapat scroll untuk melihat field yang lainnya. Serta responsif di semua ukuran handphone. Tanpa menggunakan SingleChildScrollView, form yang terlalu panjang akan overflow dan field bawah tidak bisa diakses. Berikut contoh penggunaan saya :
```
body: Form(
  key: _formKey,
  child: SingleChildScrollView(  //ini
    child: Column(...),
  ),
),
```
Digunakan pada from create new product. 


`ListView` membantu untuk membuat list yang bisa discroll jika item banyak. ListView juga memiliki build-in features yang siap digunakan (seperti separators, lazy loading, dll). Contoh penggunaan ListView pada aplikasi saya :
```
// Pada left_drawer.dart
return Drawer(
  child: ListView(
    children: [
      DrawerHeader(...),
      ListTile(...),  // Home
      ListTile(...),  // Add News
    ],
  ),
);
```
Pada kode ini, Drawer menggunakan ListView supaya kalau menu bertambah, drawer akan bisa discroll. 


### Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Cara menyesuaikan tema aplikasi dengan identitas visual yang konsisten dengan brand toko adalah dengan memanfaatkan set theme secara global. Pada main.dart, saya menggunakan warna cyan sebagai primary color aplikasi saya. 
```
theme: ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.cyan,  // Warna utama: Cyan (biru kehijauan)
  ).copyWith(secondary: Colors.cyanAccent[900]),
),
```
warna ini akan menjadi warna dominan aplikasi yang dapat dipakai di berbagai halaman dalam aplikasi.

Konsistensi juga akan terjaga karena warna yang sama dapat diakses secara langsung tanpa memilih warna secara manual (yang bisa mengakibatkan ketidakkonsistenan warna), yaitu cotohnya dengan :
`backgroundColor: Theme.of(context).colorScheme.primary,`. Tidak dihard code warnanya dan memudahkan penggantian tema jika dibutuhkan sehingga cukup menggandi di main.dart nya saja. 
</details>
