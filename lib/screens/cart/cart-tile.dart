import 'package:flutter/material.dart';
import 'package:my_shop/api/models/produclineitem.dart';
import 'package:my_shop/blocs/cart-bloc.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final ProductLineitem productLineitem;

  CartTile({this.productLineitem});

  @override
  Widget build(BuildContext context) {

    final _cartBloc = Provider.of<CartBloc>(context);

    return Container(
      //height: 100,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 17, 5, 0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: productLineitem.product.imageUrl == null
                    ? FlutterLogo()
                    : ClipRRect(borderRadius: BorderRadius.all(Radius.circular(8)), child: Image.network(productLineitem.product.imageUrl)),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(productLineitem.product.name),
                    Text('INR ${productLineitem.product.price}')
                  ],
                ),
              ),
            ),
            Flexible(
                flex: 2,
                child: IconButton(
                    icon: Icon(Icons.do_not_disturb_on), onPressed: () => _cartBloc.remove(productLineitem.product) )),
            Flexible(flex: 1, child: Text(productLineitem.count.toString())),
            Flexible(
              flex: 2,
              child: IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.green,
                  ),
                  onPressed: () => _cartBloc.add(productLineitem.product)),
            ),
            Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                      'INR ${(int.parse(productLineitem.product.price) * productLineitem.count).toString()}'),
                ))
          ],
        ),
      ),
    );
  }
}
