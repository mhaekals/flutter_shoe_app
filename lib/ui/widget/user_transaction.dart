import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class UserTransaction extends StatefulWidget {
  final Function _selectHandler;

  UserTransaction(
    this._selectHandler,
  );

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final inputShoesController = TextEditingController();

  final inputPriceController = TextEditingController();

  DateTime? _selectDate;

  void _onSubmitted() {
    if (inputShoesController.text.isEmpty ||
        inputPriceController.text.isEmpty ||
        _selectDate == null) return;

    widget._selectHandler(inputShoesController.text,
        double.parse(inputPriceController.text), _selectDate);

    inputShoesController.clear();
    inputPriceController.clear();
    _selectDate = null;
  }

  void _addDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2016),
            lastDate: DateTime.now())
        .then((pickDate) {
      _selectDate = pickDate;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  (_selectDate == null)
                      ? 'Choose book date!'
                      : DateFormat.yMd().format(_selectDate!),
                  style: Theme.of(context)
                      .primaryTextTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              IconButton(onPressed: _addDate, icon: Icon(Icons.date_range)),
            ],
          ),
          TextField(
            decoration:
                InputDecoration(border: InputBorder.none, labelText: 'Brand'),
            controller: inputShoesController,
            //  onSubmitted: inputShoesController.text.isEmpty
            // ? null
            //    : widget._selectHandler(),
          ),
          TextField(
            controller: inputPriceController,
            decoration:
                InputDecoration(border: InputBorder.none, labelText: 'Price'),
            keyboardType: TextInputType.number,
            maxLength: 5,
            // onSubmitted: inputPriceController.text.isEmpty
            //     ? null
            //     : widget._selectHandler(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: _onSubmitted, icon: Icon(IconlyBold.bag)),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
