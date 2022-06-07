import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import '../../model/shoes.dart';

class Chart extends StatelessWidget {
  List<Shoes> _shoesList;
  final Function _delete;
  Chart(this._shoesList, this._delete);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        elevation: 10,
        child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: _shoesList.isEmpty
                ? Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset(
                        'asset/noTx.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _shoesList.length,
                    itemBuilder: (context, index) => Card(
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 2,
                                    )),
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "\$${_shoesList[index].price.toStringAsFixed(2)}",
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(fontSize: 12),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _shoesList[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Text(
                                      DateFormat.d()
                                          .add_jm()
                                          .format(_shoesList[index].date),
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: IconButton(
                                    onPressed: () =>
                                        _delete(_shoesList[index].id),
                                    icon: Icon(IconlyBold.delete)),
                              ),
                            ],
                          ),
                        ))),
      ),
    );
  }
}
