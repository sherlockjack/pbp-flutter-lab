Nama: Reiou Nagata
NPM: 2106636943

---
## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang immutable.
Penampilan dan propertinya tidak berubah selama widgetnya masih ada.
Widget tidak bergantung pada perubahan data atau bisa dibilang statis.

Stateful Widget adalah widget yang berubah saat runtime atau mutable.
Widget ini bisa dirender berulang kali dan penampilannya berubah sesuai event yang ada yang berarti dia Dinamis.

---
## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya
Text: Menampilkan Text
AppBar: Menampung Informasi terhadap bar
FloatingButton: Fungsinya sama kayak button akan tetapi berbeda sifat ketika dipencet.
MaterialApp: Widget yang merangkup widget   
Scaffold: Layout structure Design Visual
Center: Memusatkan dirinya sendiri
Collumn: Layoutchild dalam bentuk list secara vertikal
Container: Untuk menampung properti dari widget

---
## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut
Berguna untuk merebuild statefulwidget dan childnya. 
Variabel yang terdampak oleh `setState()` bakal bakal bergantung.

## Jelaskan perbedaan antara const dengan final
const adalah sesuatu yang mirip final namun konstant di compile-time saja.
Sedangkan final adalah yang tidak akan dirubah/terubah oleh apapun (udah final).

---
## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas
Membuat flutter create counter_7 <br>
Membuat fungsi decrement untuk mendecrementkan angka.<br>
Lalu saya membuat row dan contingen untuk ngebuat plus minesnya.<br>
Akan tetapi saya ngebuat if else, supaya kalau angkanya genap maka textnya jadi biru dan jika ganjil maka merah
Dan if else demi + - nya jika dia 0 maka -nya hilang.
```
floatingActionButton: Container(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (_counter != 0) ...[
              FloatingActionButton(
                onPressed: _decrement,
                tooltip: 'decrement',
                child: const Icon(Icons.remove),
              ),
            ],
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'increment',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
```