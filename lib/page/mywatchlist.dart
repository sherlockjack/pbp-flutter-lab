import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/mywatchlistid.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/modeldatawatch.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage(
      {super.key, required this.Blist, required this.tambahBudget});
  final List<BudgetData> Blist;
  final Function(BudgetData) tambahBudget;
  @override
  State<MyWatchListPage> createState() => _MyWatchListPage();
}

class _MyWatchListPage extends State<MyWatchListPage> {
  Future<List<ModelData>> fetchToDo() async {
    var url =
        Uri.parse('http://reioudjangopbp.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    List<ModelData> listToDo = [];
    for (var d in data) {
      if (d != null) {
        listToDo.add(ModelData.fromJson(d));
      }
    }

    return listToDo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyWatchList"),
      ),
      drawer:
          DrawerReiou(Blist: widget.Blist, tambahBudget: widget.tambahBudget),
      body: FutureBuilder(
        future: fetchToDo(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const <Widget>[
                  Text(
                    "Tidak ada to do list :(",
                    style: TextStyle(
                      color: Color(0xff59A5D8),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8)
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => watchId(
                          Blist: widget.Blist,
                          tambahBudget: widget.tambahBudget,
                          title: snapshot.data![index].fields.title,
                          date: snapshot.data![index].fields.releaseDate
                              .toString(),
                          rating:
                              snapshot.data![index].fields.rating.toString(),
                          status:
                              snapshot.data![index].fields.watched.toString(),
                          review: snapshot.data![index].fields.review,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          snapshot.data![index].fields.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.rating}/5")
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
