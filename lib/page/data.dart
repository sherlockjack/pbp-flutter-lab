import 'package:flutter/material.dart';
import 'drawer.dart';
import '../main.dart';

class dataPage extends StatelessWidget {
  const dataPage({
    super.key,
    required this.Blist,
    required this.tambahBudget,
  });

  final String title = 'Data Budget';
  final List<BudgetData> Blist;
  final Function(BudgetData) tambahBudget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: DrawerReiou(
        Blist: Blist,
        tambahBudget: tambahBudget,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: Blist.length,
          itemBuilder: ((context, index) {
            return Card(
                child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    Blist[index].title,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                ListTile(
                  leading: Text(Blist[index].nominal.toString()),
                  trailing: Text(Blist[index].jenis),
                ),
              ],
            ));
          }),
        ),
      ),
    );
  }
}
