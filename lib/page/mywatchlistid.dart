import 'package:counter_7/main.dart';
import 'package:counter_7/page/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'drawer.dart';

class watchId extends StatelessWidget {
  const watchId(
      {super.key,
      required this.title,
      required this.date,
      required this.rating,
      required this.status,
      required this.review,
      required this.Blist,
      required this.tambahBudget});
  final String title;
  final String date;
  final String rating;
  final String status;
  final String review;
  final List<BudgetData> Blist;
  final Function(BudgetData) tambahBudget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('watchlistby req'),
        ),
        drawer: DrawerReiou(Blist: Blist, tambahBudget: tambahBudget),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.5),
                child: RichText(
                    text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Release Date: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: date),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(2.5),
                child: RichText(
                    text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Rating: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: rating),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(2.5),
                child: RichText(
                    text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Sudah Nonton: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: status),
                  ],
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(2.5),
                child: RichText(
                    text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Review: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: review),
                  ],
                )),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyWatchListPage(
                    Blist: Blist,
                    tambahBudget: tambahBudget,
                  ),
                ),
              );
            },
            child: const Text('Back'),
          ),
        ));
  }
}
