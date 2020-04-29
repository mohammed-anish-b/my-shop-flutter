import 'package:flutter/material.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:my_shop/api/services/product-service.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final ProductService _productService = ProductService.getInstance;

  ProductTile({this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        color: Colors.white70,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: Dismissible(
          confirmDismiss: (DismissDirection direction) async {
            return await showDailog(context);
          },
          direction: DismissDirection.endToStart,
          background: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                  )),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0), color: Colors.red),
          ),
          key: ValueKey(product.uid),
          child: ListTile(
            leading: product.imageUrl == null ? CircleAvatar(child: FlutterLogo()) : CircleAvatar(
              backgroundImage: NetworkImage(product.imageUrl),
            ),
            title: Text(product.name),
            subtitle: Text('INR ${product.price}'),
            trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart), onPressed: null),
          ),
        ),
      ),
    );
  }

  Future<bool> showDailog(context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text("Are you sure ?")),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  _productService.deleteProduct(product.uid);
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  "DELETE",
                  style: TextStyle(color: Colors.red),
                )),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("CANCEL"),
            ),
          ],
        );
      },
    );
  }
}
