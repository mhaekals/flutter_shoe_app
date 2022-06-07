import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:shoes_app/model/shoes.dart';

import '../widget/user_transaction.dart';

import '../widget/chart.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Shoes> shoesList = [];
  void _addShoes(String name, double price, DateTime choosen) {
    final txShoes = Shoes(
        id: DateTime.now().toString(),
        name: name,
        price: double.parse(price.toString()),
        date: choosen);

    setState(() {
      shoesList.add(txShoes);
    });
  }

  void _delete(String id) {
    if (shoesList.length == 0) return;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        elevation: 10,
        title: Icon(IconlyBold.delete),
        content: Text('Are u sure?'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.cancel),
          ),
          IconButton(
            onPressed: () {
              shoesList.removeWhere((e) => e.id == id);
              setState(() {});
              Navigator.pop(context);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [Chart(shoesList, _delete), UserTransaction(_addShoes)],
        ),
      ),
    );
  }
}
