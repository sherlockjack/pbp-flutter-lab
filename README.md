## Pengambilan Data JSON tanpa Membuat Model

Function `jsonDecode` dipanggil untuk mengembalikan object `Map<String,dynamic>`, kemudian  diakses seperti map.
Pengambilan cara ini tidak terlalu disarankan, tipe datanya tidak diketahui jadi rentan kenak runtime.

## Widget Baru yang Digunakan
1.FutureBuilder: build widget dengan dapat data asynchronous function
2.CircularProgressIndicator:  icon loading selama aplikasi mengambil data
3.RichText: Pawang TextSpan
4.InkWell: layout yang memiliki touch response
5.TextSpan: menampung text dengan style berbeda
6.ElevatedButton: tombol yang muncul ketika ditekan

## Mekanisme Pengambilan Data JSON
Widget `futurebuilder` manggil function `fetchToDo` yang sudah dibuat.<br />
Function bakal mengambil data dari endpoint Tugas3, lalu membuat instance model ke data dan memasukkan kedalam list <br />
Kalau data belum didapatkan `CircularProgressIndicator` akan menampilkan icon loading.<br />
Kalau sudah data akan menampilkan sesuai yang kita inginkan


## Implementasi

> Ngebuat `mywatchlist.dart` <br />
> Ngebuat `/model/modeldatawatch.dart`<br />
> Menjalankan `flutter pub add http`<br />
> di File `android/app/src/main/AndroidManifest.xml` menjalankan <br />
```
...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
...
```
> Menyalin data dari endpoint tugas3 ke situs QuickType <br>
> menempel ke modeldatawatchlist.dart dan melakukan beberapa perubahan<br>
> Menjalankan code flutter pub add http<br>
> menambahkan import, dan membuat state yang berisi function yang mengambil data Json di MyWatchListPage <br>
> Menambahkan stateless yang menerima detail film  di watchId <br>
> Membuat tampilan untuk bisa melihat list judul film yang dipetakan
> Membuat tampilan untuk bisa mendaftarkan film
> Membuat onpress biar bisa dinavigasi ke mywatchlistid.dart ketika ditekan
> Di drawer ga lupa untuk membuat ListTile biar bisa ternavigasi ke MyWatchListPage
> Menangis
