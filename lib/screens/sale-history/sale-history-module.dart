import 'package:flutter/cupertino.dart';
import 'package:my_shop/api/services/product-service.dart';
import 'package:my_shop/api/services/sale-history-service.dart';
import 'package:my_shop/blocs/sale-history-bloc.dart';
import 'package:my_shop/screens/sale-history/sale-history.dart';
import 'package:provider/provider.dart';

class SaleHistoryModule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         Provider(create: (context) => SaleHistoryService()),
         ChangeNotifierProvider(create: (context) => SaleHistoryBloc()),
         Provider(create: (context) => ProductService()),
      ],
      child: SaleHistory(),
    );
  }
}