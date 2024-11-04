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