import 'package:flutter/material.dart';
import 'package:my_shop/api/models/sale.dart';

class SaleHistoryTile extends StatelessWidget {
  final Sale sale;

  SaleHistoryTile({this.sale});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            title: Text(sale.id),
            trailing: IconButton(
                icon: Icon(Icons.arrow_forward_ios), onPressed: null),
          ),
        ),
      ),
    );
  }
}
