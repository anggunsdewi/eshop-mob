**Nama   : Anggun Sasmitha Dewi**

**NPM    : 2306165673**

**Kelas  : PBP A**

# 🔗[Link to Fresh and Bloom!🌿](http://anggun-sasmitha-eshoppbp.pbp.cs.ui.ac.id/)


<details>
    <summary><strong>📘Tugas 7 PBP</strong></summary>

### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
1. Stateless Widget
   _Widget_ yang bersifat statis, tidak memiliki keadaan (_state_) yang bisa berubah setelah _widget_ dibuat. Biasanya digunakan untuk elemen UI yang tidak memerlukan pembaruan data atau perubahan saat aplikasi berjalan.
2. Stateful Widget
   _Widget_ yang memiliki keadaan (_state_) yang bisa berubah selama masa hidup _widget_ tersebut. _Stateful widget_ digunakan ketika UI perlu diperbarui atau diubah seiring berjalannya waktu, misalnya pada saat berinteraksi dengan pengguna atau ketika data berubah.

Perbedaan utama:
- Stateless Widget: Tidak memiliki state yang bisa diubah setelah dibuat. Contoh: Text, Icon.
- Stateful Widget: Memiliki state yang bisa diubah dan memicu pembaruan UI. Contoh: Checkbox, TextField.

### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- Scaffold: Menyediakan struktur dasar untuk halaman, termasuk AppBar dan body.
- AppBar: Menampilkan bilah aplikasi di bagian atas layar dengan judul dan elemen opsional lainnya.
- Padding: Memberikan jarak di sekeliling widget lain.
- Column: Menyusun widget secara vertikal.
- Row: Menyusun widget secara horizontal.
- Card: Menampilkan kotak dengan bayangan untuk menonjolkan konten.
- Text: Menampilkan teks di layar.
- Icon: Menampilkan ikon.
- GridView: Menampilkan widget dalam bentuk grid.
- Material: Memberikan efek material pada widget seperti bayangan dan respons interaksi.
- InkWell: Menambahkan efek sentuhan pada widget ketika ditekan.
- SnackBar: Menampilkan pesan singkat di bagian bawah layar untuk memberi tahu pengguna tentang tindakan yang dilakukan.

### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
`setState()` digunakan dalam StatefulWidget untuk memberi tahu framework bahwa state objek telah diubah dan perlu dilakukan rebuild UI. Fungsi ini memicu `build()` dipanggil ulang agar perubahan state dapat tercermin pada layar.
Contoh variabel yang terdampak: Variabel-variabel dalam kelas State yang digunakan untuk menyimpan data yang berubah, seperti counter, status login, atau daftar item. Hanya variabel yang berada dalam state (dalam kelas State) yang terpengaruh oleh `setState()`.

### Jelaskan perbedaan antara const dengan final.
1. `const`: Digunakan untuk mendeklarasikan nilai yang konstan dan tetap selama compile-time. Nilai ini sudah diketahui dan ditentukan pada saat kompilasi.
2. `final`: Digunakan untuk mendeklarasikan variabel yang nilainya tetap setelah diinisialisasi, tetapi bisa diatur saat run-time. Nilai final bisa diatur satu kali saja, tetapi tidak harus ditentukan saat kompilasi.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
#### A. Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
- Inisiasi dengan perintah `flutter create freshnbloom` pada terminal
- Masuk ke dalam direktori menggunakan perintah `cd freshnbloom`
#### B.  Membuat tiga tombol sederhana dengan ikon dan teks untuk: 
a. Melihat daftar produk (Lihat Daftar Produk)
b. Menambah produk (Tambah Produk)
c. Logout (Logout)

- Menambah perintah berikut pada `menu.dart`:
    ```
      class MyHomePage extends StatelessWidget {  
      ...
      final List<ItemHomepage> items = [
      ItemHomepage("Lihat Mood", Icons.mood),
      ItemHomepage("Tambah Mood", Icons.add),
      ItemHomepage("Logout", Icons.logout),
      ];
      ...
      }
    ```
- Menampilkan item card dalam bentuk grid 3 kolom dengan perintah berikut:
    ```
    GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        // Agar grid menyesuaikan tinggi kontennya.
        shrinkWrap: true,

        // Menampilkan ItemCard untuk setiap item dalam list items.
        children: items.map((ItemHomepage item) {
          return ItemCard(item);
        }).toList(),
    ),
    ```
- Menambah kelas `ItemCard` dengan perintha sebagai berikut:
    ```
      class ItemCard extends StatelessWidget {
          // Menampilkan kartu dengan ikon dan nama.
        
          final ItemHomepage item;
        
          const ItemCard(this.item, {super.key});
        
          @override
          Widget build(BuildContext context) {
          return Material(
          // Menentukan warna latar belakang dari tema aplikasi.
          color: item.color,
          // Membuat sudut kartu melengkung.
          borderRadius: BorderRadius.circular(12),
        
              child: InkWell(
                // Aksi ketika kartu ditekan.
                onTap: () {
                  // Menampilkan pesan SnackBar saat kartu ditekan.
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                    );
                },
                // Container untuk menyimpan Icon dan Text
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Column(
                      // Menyusun ikon dan teks di tengah kartu.
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.icon,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                          item.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          );
          }
        
        }
    ```
#### C. Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Daftar Produk, Tambah Produk, dan Logout).
- Menambahkan properti color pada class ItemHomepage:
    ```
        class ItemHomepage {
          final String name;
          final IconData icon;
          final Color color; // Tambahkan properti warna.
        
          ItemHomepage(this.name, this.icon, this.color);
        }
    ```
- Memperbarui List<ItemHomepage>:
  ```
      final List<ItemHomepage> items = [
          ItemHomepage("Lihat Daftar Produk", Icons.mood, Colors.blue),
          ItemHomepage("Tambah Produk", Icons.add, Colors.purple),
          ItemHomepage("Logout", Icons.logout, Colors.red),
        ];
  ```
- Memodifikasi `ItemCard`:
  ```
      Widget build(BuildContext context) {
          return Material(
            color: item.color, // Menggunakan warna dari item.
            ....
  ```
#### D. Memunculkan Snackbar dengan tulisan:
a. "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol Lihat Daftar Produk ditekan.
b. "Kamu telah menekan tombol Tambah Produk" ketika tombol Tambah Produk ditekan.
c. "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

- Menggunakan perintah:
    ```
        child: InkWell(
            // Aksi ketika kartu ditekan.
            onTap: () {
              // Menampilkan pesan SnackBar saat kartu ditekan.
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                    SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
                );
            },
            // Container untuk menyimpan Icon dan Text
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  // Menyusun ikon dan teks di tengah kartu.
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
    ```
</details>

<details>
    <summary><strong>📘Tugas 8 PBP</strong></summary>

### Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
`const` di Flutter digunakan untuk mendeklarasikan objek yang bersifat konstan. Ketika sebuah widget atau objek diberi label `const`, Flutter akan memastikan bahwa objek tersebut hanya diciptakan sekali selama aplikasi berjalan. Dengan menggunakan `const`, dapat meningkatkan performa karena mengurangi *overhead* pembuatan objek yang tidak perlu.


Keuntungan menggunakan `const`:
1. Dengan menggunakan `const`, suatu objek tidak perlu dibuat ulang setiap kali widget di-*render*, yang berarti lebih sedikit operasi yang dilakukan, sehingga dapat meningkatkan performa
2. Objek `const` disimpan di memori dan digunakan ulang tanpa perlu dialokasikan ulang, sehingga dapat mengurangi penggunaan memori


Kapan menggunakan const:
1. Ketika widget tidak memiliki state yang berubah, seperti Text, Icon, atau Padding yang memiliki nilai tetap sepanjang aplikasi
2. Konstruktor widget yang tidak memiliki perubahan di setiap *build* (misalnya pada widget yang digunakan berulang kali dan tidak berubah)


Kapan tidak menggunakan const:
1. Widget memiliki properti yang nilainya berubah secara dinamis, seperti dalam kasus input dari pengguna atau perubahan berdasarkan state (misalnya, widget yang berada dalam StatefulWidget)

### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
- Column, digunakan untuk menata elemen secara vertikal (ke bawah). Setiap elemen anaknya akan ditampilkan dalam urutan vertikal, satu per satu dari atas ke bawah


  Contoh pada berkas `productentry_form.dart` untuk menampilkan popup produk, jumlah, dan deskripsi
    ```
    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product: $_name'),
            Text('Jumlah: $_amount'),
            Text('Description: $_description'),
          ],
        ),
    ```
- Row, digunakan untuk menata elemen secara horizontal (ke samping). Setiap elemen anaknya akan ditampilkan secara berurutan di sepanjang sumbu horizontal


  Contoh pada berkas `menu.dart` untuk menampilkan informasi npm, nama, dan kelas:
    ```
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InfoCard(title: 'NPM', content: npm),
          InfoCard(title: 'Name', content: name),
          InfoCard(title: 'Class', content: className),
        ],
      ),
    ```
### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada halaman form saya pada tugas kali ini, elemen input yang digunakan adalah `TextFormField`, yang digunakan untuk input data dari pengguna. Terdapat tiga buah `TextFormField` untuk input:
  - Nama Produk
  - Jumlah Produk
  - Deskripsi Produk


Elemen input Flutter lain yang tidak digunakan:
- `Checkbox`, untuk memilih opsi dengan cara mencentang.
- `Radio`, untuk memilih salah satu dari beberapa opsi yang tersedia.
- `Switch`, untuk memilih antara dua opsi (on/off).
- `TextField`, mirip dengan `TextFormField` tetapi tanpa validasi langsung.

### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk mengatur tema dalam aplikasi Flutter, kita dapat menggunakan ThemeData yang diterapkan pada MaterialApp. Tema ini memungkinkan kita untuk mendefinisikan berbagai gaya seperti warna, font, dan elemen UI lainnya yang konsisten di seluruh aplikasi. Pada kode saya, tema sudah diterapkan dengan menggunakan `Theme.of(context).colorScheme.primary` untuk menentukan warna pada elemen seperti `AppBar` dan tombol `ElevatedButton` pada berkas `productentry_form.dart`

### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Di Flutter, navigasi antar halaman bisa dilakukan menggunakan Navigator. Hal ini memungkinkan kita untuk mem-*push* dan *pop* halaman baru pada stack navigasi.


Contoh navigasi: Untuk menavigasi antar halaman, kita menggunakan `Navigator.push()`:
  ```
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewPage()),
  );
  ```
</details>

<details>
    <summary><strong>📘Tugas 9 PBP</strong></summary>

### 1. **Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?**
Membuat model untuk pengambilan atau pengiriman data JSON sangatlah penting. Model ini memberikan struktur data yang konsisten dan terdefinisi dengan baik, yang memastikan bahwa data yang diterima atau dikirim selalu sesuai dengan format yang diharapkan. Dengan adanya model, saya dapat dengan mudah memvalidasi data secara otomatis, sehingga mengurangi kemungkinan adanya data yang tidak valid atau rusak yang dapat menyebabkan masalah dalam aplikasi.

Selain itu, penggunaan model mempermudah proses pengembangan dan pemeliharaan kode. Saya dapat dengan jelas melihat representasi data yang saya tangani, yang membuat penambahan fitur baru atau debugging menjadi lebih efisien. Banyak library seperti json_serializable di Flutter memungkinkan saya untuk melakukan konversi otomatis antara JSON dan objek Dart, yang mengurangi beban kerja manual dan meminimalisir kesalahan penulisan kode.

Jika saya tidak membuat model terlebih dahulu, saya harus mengakses data JSON secara manual menggunakan kunci string. Hal ini berisiko menyebabkan error runtime jika terjadi kesalahan penulisan kunci atau jika struktur JSON berubah dari sisi server. Selain itu, tanpa model yang terdefinisi dengan baik, validasi data menjadi lebih sulit dilakukan, yang bisa mengakibatkan bug dan masalah keamanan dalam aplikasi. Pemeliharaan kode juga menjadi lebih menantang karena tidak adanya representasi data yang terstruktur dengan jelas.

### 2. **Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini**
Dalam tugas ini, saya menggunakan library HTTP seperti http untuk menjembatani komunikasi antara aplikasi Flutter dan server backend Django. Library ini memungkinkan saya untuk mengirim berbagai jenis permintaan HTTP seperti GET, POST, PUT, dan DELETE ke server, serta menerima respons dari server tersebut. Dengan menggunakan library HTTP, saya dapat mengelola data JSON yang diterima dari server dengan lebih mudah, mengubahnya menjadi objek yang dapat digunakan dalam aplikasi Flutter.

Selain itu, library HTTP ini juga membantu saya dalam menangani berbagai jenis error yang mungkin terjadi selama proses komunikasi, seperti timeout, kegagalan koneksi, atau respons error dari server. Saya juga dapat menambahkan header khusus, seperti token autentikasi atau cookie, yang diperlukan untuk mengakses endpoint tertentu di server. Beberapa fitur tambahan seperti interceptor, retry logic, dan manajemen sesi yang ditawarkan oleh library HTTP meningkatkan efisiensi dan keamanan komunikasi jaringan antara aplikasi dan server.

### 3. **Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter**
Saya menggunakan CookieRequest untuk mengelola cookie yang disimpan selama sesi pengguna. Cookie ini sangat berguna untuk mempertahankan sesi autentikasi atau menyimpan preferensi pengguna, sehingga pengguna tidak perlu login kembali setiap kali membuka aplikasi karena sesi autentikasi tetap terjaga. Selain itu, CookieRequest secara otomatis mengirimkan cookie dengan setiap permintaan HTTP, memastikan bahwa setiap permintaan yang memerlukan autentikasi memiliki informasi yang diperlukan.

Penting bagi saya untuk membagikan instance CookieRequest ke semua komponen di aplikasi Flutter agar konsistensi sesi pengguna dapat terjaga di seluruh aplikasi. Dengan menggunakan satu instance yang sama, semua komponen dapat mengakses dan menggunakan cookie yang sama, yang menghindari duplikasi data dan mengurangi overhead dalam pengelolaan multiple instances. Selain itu, jika terjadi perubahan pada cookie, seperti saat pengguna melakukan logout, perubahan tersebut langsung tercermin di semua komponen yang menggunakan instance yang sama. Hal ini memastikan bahwa semua bagian aplikasi berada dalam keadaan yang sinkron dan konsisten.

### 4. **Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter**
Proses pengiriman data dalam aplikasi Flutter dimulai ketika saya memasukkan data melalui antarmuka pengguna, seperti mengisi formulir atau memasukkan informasi tertentu. Setelah data diinput, aplikasi Flutter melakukan validasi awal untuk memastikan bahwa data tersebut memenuhi kriteria yang diperlukan, seperti format email yang benar atau kekuatan kata sandi yang cukup.

Setelah data divalidasi, saya mengubahnya menjadi objek model Dart yang sesuai. Objek model ini kemudian dikonversi menjadi format JSON jika diperlukan, dan dikirim ke server backend melalui permintaan HTTP menggunakan library HTTP yang telah diimplementasikan. Di sisi server, data yang diterima diproses sesuai kebutuhan, misalnya disimpan ke dalam database atau digunakan untuk autentikasi. Setelah proses di server selesai, server mengirimkan respons kembali ke aplikasi Flutter, seringkali dalam format JSON yang berisi hasil proses atau data yang diminta.

Aplikasi Flutter kemudian menerima respons tersebut dan mengubahnya kembali menjadi objek model Dart. Jika ada data yang perlu ditampilkan, aplikasi akan memperbarui state dan antarmuka pengguna untuk menampilkan data tersebut kepada pengguna. Dengan demikian, data yang saya input akhirnya ditampilkan di antarmuka aplikasi setelah melalui proses validasi, pengiriman, dan pengolahan di server.

### 5. ** Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter**
Proses autentikasi dalam aplikasi dimulai dari tahap registrasi, di mana saya mengisi formulir dengan data seperti nama, email, dan kata sandi di aplikasi Flutter. Data ini kemudian dikirim ke server Django melalui permintaan HTTP POST ke endpoint registrasi. Di sisi Django, data yang diterima divalidasi untuk memastikan bahwa email unik dan kata sandi memenuhi kriteria yang ditetapkan. Jika validasi berhasil, Django membuat entitas pengguna baru di database dan mungkin mengirimkan email verifikasi jika diperlukan. Setelah proses ini selesai, Django mengirimkan respons sukses atau error kembali ke aplikasi Flutter, yang kemudian menampilkan pesan yang sesuai kepada pengguna.

Selanjutnya, saat saya melakukan login, saya memasukkan email dan kata sandi di aplikasi Flutter. Data ini dikirim ke server Django melalui permintaan HTTP POST ke endpoint login. Django memverifikasi kredensial saya dan jika valid, membuat sesi autentikasi serta menghasilkan token atau cookie yang diperlukan untuk sesi tersebut. Aplikasi Flutter menerima token atau cookie ini dan menyimpannya menggunakan CookieRequest atau metode penyimpanan yang aman lainnya. Dengan token atau cookie yang disimpan, aplikasi Flutter dapat menjaga sesi autentikasi tetap aktif tanpa perlu login ulang setiap kali membuka aplikasi.

Saat saya memilih untuk logout, aplikasi Flutter mengirimkan permintaan HTTP POST ke endpoint logout di server Django. Django kemudian menghapus sesi autentikasi atau menginvalidasi token/cookie yang digunakan. Aplikasi Flutter juga menghapus token atau cookie yang disimpan dan memperbarui state untuk menandakan bahwa saya telah logout, biasanya dengan mengarahkan saya kembali ke halaman login atau halaman awal aplikasi.

Seluruh proses autentikasi ini diatur melalui manajemen state di aplikasi Flutter, menggunakan metode seperti Provider atau Bloc untuk mengelola status autentikasi pengguna. Berdasarkan status autentikasi ini, antarmuka pengguna aplikasi menampilkan menu atau halaman yang sesuai, seperti halaman utama untuk pengguna yang telah login atau halaman login/register untuk pengguna yang belum login. Dengan demikian, mekanisme autentikasi yang terintegrasi antara Flutter dan Django memastikan alur data dan keamanan sesi pengguna berjalan dengan lancar dan aman

</details>