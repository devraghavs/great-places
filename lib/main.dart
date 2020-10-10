import 'package:flutter/material.dart';
import 'package:nativeapp/providers/great_places.dart';
import 'package:nativeapp/screens/add_place.dart';
import 'package:nativeapp/screens/places_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesList(),
        routes: {
          AddPlace.routeName: (ctx) => AddPlace(),
        },
      ),
    );
  }
}
