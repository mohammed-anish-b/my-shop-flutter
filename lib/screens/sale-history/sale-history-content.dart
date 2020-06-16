import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_shop/api/models/sale.dart';
import 'package:my_shop/api/services/sale-history-service.dart';
import 'package:my_shop/blocs/sale-history-bloc.dart';
import 'package:my_shop/screens/sale-history/sale-history-tile.dart';
import 'package:provider/provider.dart';

class SaleHistoryContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Sale> sales = Provider.of<List<Sale>>(context);
    log(Provider.of<List<Sale>>(context).toString());
    final _saleHistoryBloc = Provider.of<SaleHistoryBloc>(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: Text(
            'Sale History',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(70))),
          backgroundColor: Colors.blueGrey,
          expandedHeight: 150.0,
          flexibleSpace: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Row(
              children: <Widget>[
                SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    new DateFormat.yMd().format(_saleHistoryBloc.date),
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.calendar_today, color: Colors.white),
                    onPressed: () {
                      showMyDatePicker(context, _saleHistoryBloc);
                    }),
              ],
            ),
          ),
          floating: true,
          actions: <Widget>[],
        ),
        sales == null
            ? SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {}),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => SaleHistoryTile(sales[index]),
                    childCount: sales.length))
      ],
    );
  }

  showMyDatePicker(context, _saleHistoryBloc) {
    showDatePicker(
            context: context,
            firstDate: DateTime(2019),
            lastDate: DateTime.now(),
            initialDate: _saleHistoryBloc.date)
        .then((value) async {
      if (value != null) {
        _saleHistoryBloc.changeDate(value);
      }
    });
  }
}
