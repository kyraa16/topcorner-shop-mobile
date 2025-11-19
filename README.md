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

<details>
<summary>Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter</summary>
 
### Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Model Dart diperlukan untuk memberikan struktur dan tipe data yang jelas saat bekerja dengan JSON. Tanpa model, kita hanya bekerja dengan Map<String, dynamic> yang tidak type-safe dan rawan error. Konsekuensi tanpa model:
- Validasi Tipe yang lemah. Tidak ada compile-time checking. Error baru muncul saat runtime ketika mengakses field dengan tipe yang salah (misalnya mengakses integer sebagai string).
Null-Safety lemah. Sulit mengelola nilai null. Dengan model, kita bisa eksplisit menandai field sebagai nullable (String?) atau required, sehingga compiler membantu mendeteksi potensi null pointer.
Maintainability yang buruk dan code menjadi sulit di-maintain. Setiap akses data harus manual type-casting seperti data['name'] as String. Dengan model, IDE dapat memberikan autocomplete dan refactoring otomatis.

### Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Package http berfungsi sebagai library standar Dart untuk HTTP requests (GET, POST, PUT, DELETE). Bersifat stateless, tidak menyimpan session/cookie antar request
Cocok untuk API yang tidak memerlukan autentikasi atau menggunakan token-based auth
Setiap request independen dan tidak "mengingat" request sebelumnya.

Sedangkan CookieRequest (dari pbp_django_auth) merupakan Custom wrapper yang menyimpan cookie session secara otomatis. Bersifat stateful dan memaintain session antar request, cocok untuk Django session-based authentication. package ini menangani CSRF token dan cookie secara otomatis sehingga memudahkan integrasi dengan Django authentication system. 

Perbedaan peran keduanya adalah http digunakan untuk request sederhana tanpa perlu session persistence. Sedangkan CookieRequest untuk aplikasi yang butuh maintain login state dan session dengan Django.

### Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Instance CookieRequest perlu dibagikan (shared) menggunakan Provider karena bersifat Single Source of Truth atau semua komponen menggunakan session yang sama. Ketika user login di satu halaman, semua halaman lain langsung tahu user sudah authenticated. Berguna unutk session sonsistency. Cookie dan session state harus konsisten di seluruh aplikasi. Jika setiap widget membuat instance sendiri, mereka akan punya session terpisah dan tidak sinkron. Meningkatkan efisiensi memory karena tidak perlu membuat multiple instance yang redundant. Satu instance cukup untuk handle semua HTTP request dalam aplikasi. Serta emudahkan management state login/logout. Ketika logout, cukup clear satu instance dan semua komponen otomatis terupdate.

### Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

`10.0.2.2` di ALLOWED_HOSTS dibutuhkan karnea Android emulator tidak bisa akses localhost host machine. `10.0.2.2` adalah special IP yang di-route ke localhost host. Dengan ini, request dari emulator dapat diterima Django tanpa error "Invalid HTTP_HOST"

CORS (Cross-Origin Resource Sharing) prlu diaktifkan karena Flutter web/mobile dianggap "different origin" dari Django backend. CORS middleware mengizinkan Flutter mengakses API Django dari domain/port berbeda. Tanpa CORS, browser/app akan block request dengan error CORS policy.

SameSite Cookie Setting diatur untuk mengizinkan cookie dikirim dari cross-origin requests. Dengan ini session cookie dapat disimpan di Flutter. Lalu, terakhir kita perlu menambahkan izin akses internet di Androind karena secara default Androic block interner access untuk security. Dengan permission ini, aplikasi dapat melakukan network request sehingga dapat terhubung dengan Django. 

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Berikut mekanisme alur pengiriman data mulai dari input hingga dapat ditampilkan di Flutter:
1. User input di form → validasi lokal (validator, required, format).
2. Buat model (instance Dart) dan serialisasi untuk menghasilkan JSON.
3. Kirim request HTTP (pakai CookieRequest/http) ke endpoint Django (POST/PUT). Sertakan header/CSRF bila perlu.
4. Django menerima request, lalu parsing JSON, validasi server-side (serializer/form), simpan ke DB.
5. Django mengembalikan response JSON (sukses atau error). Jika otentikasi session, response juga menyertakan Set-Cookie.
6. Flutter menerima response → parse JSON ke model (fromJson), periksa status.
7. Update state UI Provider dengan model baru.
8. UI merender data dari model — tampil di layar.

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

- Register :
  1. User mengisi username & passord di register page dan klik button register.
  2. Lakukan validasi
  3. Kirim POST ke endpoint `'http://localhost:8000/auth/register/'` dengan JSON
  4. Django melakukan validasi. Jika sukses, user baru akan berhasil dibuat
  5. Return respon sukses/error
    
- Login :
  1. User isi username & password di Login Page. Lalu klik button login.
  2. Kirim request POST ke django melalui ` 'http://localhost:8000/auth/login/'`
  3. Function view di Django akan menerima credentials dan melakukan authentikasi.
  4. Jika valid, maka akan create session dan set cookie last_login
  5. Return succes & user data atau error
  6. Pada Flutter, CookieRequest opomatis menyimpan session cookie.
  7. Parse response untuk ambil data user.
  8. Lalu navigasikan ke Home Page.
     
- Logout:
  1. Trigger di flutter saat user klit button logout di drawer
  2. request dikirim ke django. Lalu django memproses function pada view dengan request yang diterima.
  3. Destroy session di server, delete cookie last_login, lalu return seccess response jika berhasil.
  4. Pada Flutter, CookieRequest akan menghapus session cookie.
  5. Navigate ke login page

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Berikut tahapan yang saya lakukan untuk mengimplementasikan checklist:
1. Mengimplementasikan fitur register akun. Membuat register page dan menghubungkan dengan django project saya sebelumnya. Membuat dan mengimplementasikan endpoint untuk register.
2. Mengimplementasikan fitur login. Membuat page login. Implementasi menggunakan method request.login() dari package pbp_django_auth untuk mengirim credentials ke endpoint /auth/login Django.
3. Melakukan integrasi dengan Provider di main.dart untuk share instance CookieRequest ke seluruh aplikasi. Melakukan konfigurasi tambahan pada project Django lama saya. 
4. Membuat model ProductEntry yang sesuai dengan struktur JSON dari Django.
5. Membuat halaman daftar produk yang menampilkan semua produk dari endpoint /json dengan ListView.builder. Setiap produk ditampilkan dalam ProductEntryCard widget. 
6. Membuat halaman detail item yang menampilkan detail keseluruhan mengenai suatu produk. Saya membuat UI untuk halaman ini dan membuat tombol back juga untuk kembali ke Halaman List produk.
7. Membuat filter item dengan 2 kategori, yaitu All Products dan My Products. Menambahkan endpoint baru /json/my-product/ di Django yang melakukan query untuk mengambil object Product yang dibuat berasosiasi dengan seorang user.
8. Terakhir melakukan penyesuaian tampilan dan konsistensi warna. Serta melakuakn push ke github. 

</details>
