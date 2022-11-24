import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import 'drawer.dart';

class formPage extends StatefulWidget {
  const formPage(
      {super.key, required this.Blist, required this.tambahBudget});
  final String title = '';
  final List<BudgetData> Blist;
  final Function(BudgetData) tambahBudget;

  @override
  State<formPage> createState() => _formPageState();
}

class _formPageState extends State<formPage> {
  final _formKey = GlobalKey<FormState>();
  String judul = '';
  int nominal = 0;
  String? jenis;
  final List<String> list = ['Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerReiou(
        Blist: widget.Blist,
        tambahBudget: widget.tambahBudget,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Judul',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        judul = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      labelText: 'Nominal',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        nominal = (value == null || value.isEmpty)
                            ? 0
                            : int.parse(value);
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        nominal = (value == null || value.isEmpty)
                            ? 0
                            : int.parse(value);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField(
                    value: jenis,
                    hint: const Text('Pilih Jenis'),
                    items: list.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        jenis = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Jenis tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.tambahBudget(BudgetData(judul, nominal, jenis!));
                      }
                      ;
                    },
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
