import 'package:flutter/material.dart';
import 'package:my_shop/api/models/sale.dart';
import 'package:my_shop/api/services/sale-history-service.dart';
import 'package:my_shop/blocs/sale-history-bloc.dart';
import 'package:my_shop/screens/sale-history/sale-history-content.dart';
import 'package:my_shop/shared/sidemenu.dart';
import 'package:provider/provider.dart';

class SaleHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _saleHistoryService = Provider.of<SaleHistoryService>(context);
    final _saleHistoryBloc = Provider.of<SaleHistoryBloc>(context);
    return StreamProvider<List<Sale>>.value(
        value: _saleHistoryService.getSaleHistory(_saleHistoryBloc.date),
        child: Scaffold(drawer: SideMenu(), body: SaleHistoryContent()));
  }
}
