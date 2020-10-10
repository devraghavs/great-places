import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nativeapp/providers/great_places.dart';
import 'package:nativeapp/widgets/image_input.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();
  File _pickedImage;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context,listen: false)
        .addPlace(_titleController.text, _pickedImage);
      Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: _titleController,
                ),
                SizedBox(height: 10),
                ImageInput(_selectImage),
              ]),
            ),
          )),
          RaisedButton.icon(
            elevation: 0,
            label: Text('Add Place'),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            icon: Icon(Icons.add),
            color: Theme.of(context).accentColor,
            onPressed: _savePlace,
          )
        ],
      ),
    );
  }
}
