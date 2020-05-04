import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/blocs/loading-bloc.dart';
import 'package:my_shop/blocs/login-signup-bloc.dart';
import 'package:my_shop/blocs/login-signup-toggle-bloc.dart';
import 'package:my_shop/screens/product/create-product.dart';
import 'package:my_shop/services/auth-service.dart';
import 'package:my_shop/services/auth-wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(
          value: AuthService().user,
        ),
        ChangeNotifierProvider.value(value: LoginSignupToggleBloc()),
        ChangeNotifierProvider.value(value: LoginSignupBloc()),
        Provider.value(value: AuthService()),
        ChangeNotifierProvider.value(value: LoadingBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes: {'create-product': (context) => CreateProduct()},
      ),
    );
  }
}
