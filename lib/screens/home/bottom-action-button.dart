import 'package:flutter/material.dart';
import 'package:my_shop/blocs/tab-switch-bloc.dart';
import 'package:provider/provider.dart';

class BottomActionButon extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final _tabSwitchBloc = Provider.of<TabSwitchBloc>(context);
    
    return _tabSwitchBloc.index == 0 ? FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "create-product");
            },
            color: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            icon: Icon(Icons.add,color: Colors.white),
            label: Text("Add product",style: TextStyle(
              color: Colors.white
            ))
          ) : FlatButton.icon(
            color: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            icon: Icon(Icons.shopping_basket,color: Colors.white,),
            label: Text("Checkout",style: TextStyle(
              color: Colors.white
            )),
            onPressed: () {}
          );
  }
}