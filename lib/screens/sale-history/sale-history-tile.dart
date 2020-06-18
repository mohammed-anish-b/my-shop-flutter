import 'package:flutter/material.dart';
import 'package:my_shop/api/models/sale.dart';
import 'package:my_shop/api/services/product-service.dart';
import 'package:my_shop/api/services/sale-history-service.dart';
import 'package:provider/provider.dart';

class SaleHistoryTile extends StatefulWidget {
  final Sale sale;

  SaleHistoryTile({this.sale});

  @override
  _SaleHistoryTileState createState() => _SaleHistoryTileState();
}

class _SaleHistoryTileState extends State<SaleHistoryTile> {
  bool isDetailedView = false;

  @override
  Widget build(BuildContext context) {
    final _saleHistoryService = Provider.of<SaleHistoryService>(context);
    final _productService = Provider.of<ProductService>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                title: Text(widget.sale.id),
                trailing: IconButton(
                    icon: isDetailedView
                        ? Icon(Icons.keyboard_arrow_up)
                        : Icon(Icons.keyboard_arrow_down),
                    onPressed: () {
                      getProductLineItems(
                          _saleHistoryService, _productService, widget.sale.id);
                      toggleDetailedView();
                    }),
              ),
              isDetailedView
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Image.network(
                                            widget.sale.productLineitems[index]
                                                .product.imageUrl,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(widget
                                              .sale
                                              .productLineitems[index]
                                              .product
                                              .name),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text('X'),
                                          )),
                                      Expanded(flex: 2, child: Text(widget.sale
                                                .productLineitems[index].count
                                                .toString())),
                                      Expanded(
                                          flex: 2,
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                  'INR ${widget.sale.productLineitems[index].product.price}'))),
                                    ],
                                  ),
                                );
                              },
                              itemCount: widget.sale.productLineitems.length),
                        ),
                        Divider(color: Colors.black),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Total'))),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text('INR ${widget.sale.total}')))
                            ],
                          ),
                        )
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  toggleDetailedView() {
    setState(() {
      this.isDetailedView = !this.isDetailedView;
    });
  }

  getProductLineItems(SaleHistoryService _saleHistoryService,
      ProductService _productService, String id) {
    if (widget.sale.productLineitems.length == 0) {
      _saleHistoryService.getProductLineItemFromSaleId(id).then((value) {
        value.forEach((element) {
          _productService.getProductFromProductId(element.productId).then((p) {
            element.product = p;
            setState(() {
              widget.sale.productLineitems.add(element);
            });
          });
        });
      });
    }
  }
}
