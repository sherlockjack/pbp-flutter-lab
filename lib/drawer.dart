import 'package:flutter/material.dart';
import 'main.dart';
import 'form.dart';
import 'data.dart';

class DrawerReiou extends StatelessWidget {
  const DrawerReiou(
      {super.key, required this.Blist, required this.tambahBudget});
  final List<BudgetData> Blist;
  final Function(BudgetData) tambahBudget;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(
                    Blist: Blist,
                    tambahBudget: tambahBudget,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => formPage(
                    Blist: Blist,
                    tambahBudget: tambahBudget,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => dataPage(
                    Blist: Blist,
                    tambahBudget: tambahBudget,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
