## Navigator.push dan Navigator.pushReplacement
Navigator.push melakukan navigasi ke suatu halaman memakai push
Navigator.pushReplacement sama tapi sebelum push harus pop terlebih dahulu

---

## Widget yang Digunakan
formPage: Widget kostum halaman form
form: Widget untuk membuat form
DropdownButtonFormField: Isian form yang menerima 1 pilihan DropdownMenuItem
TextFormField: Untuk menerima input karakter
TextButton: Tombol Text
ListView: Looping object untuk dipetakan kedalam list
dataPage: stateless yang menampilkan halaman penyajian data
Card: Layout kartu
DrawerReiou: kostum untuk membuat drawer
Drawer: Membuat tombol hamburger

---

## Event Flutter
onTap: menekan widget baru aktif (Selain tombol)
onPressed : sama kayak onTap tapi biasanya tombol
onSaved : untuk mengumpulkan form
onChanged: User mengganti nilai form

---
## Cara Kerja Navigator
Menyimpan stack yang berisi object Route, nanti akan diarahkan ke path masing masing halaman.
Operasinya ada  .push , .pop, .pushReplacament yang menjadi mixed dari push dan pop.

---
## Implementasi Tugas 8

>Memperbaiki kode yang dari minggu lalu
>Membuat class BudgetData
>Membuat List kosong Blist
>Membuat fungsi tambahBudget, yang menambahkan object BudgetData ke Blist
>membuat file data.dart,drawer.dart,form.dart
>Membuat statefulWidget formPage yang menerima Blist dan tambahBudget
>Mengisi state statenya 
>Membangun tampilan FormPage
>sama seperti formPage cuma kali ini dataPage
>Membangun tampilan dataPage
>Membuat Drawer yang menerima Blist dan tambahBudget di inisasi
>Membangun tampilan Drawer
>Memanggil Drawer di file lainnya
>Menangis karena bikinnya sambil sakit :')
