import 'package:Reading_Corner/models/book.dart';
import 'package:Reading_Corner/screens/root/root.dart';
import 'package:Reading_Corner/services/database.dart';
import 'package:Reading_Corner/states/currentUser.dart';
import 'package:Reading_Corner/widgets/OurContainer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

class OurAddBook extends StatefulWidget {
  final bool onGroupCreation;
  final String groupName;

  OurAddBook({
    this.onGroupCreation,
    this.groupName,
  });

  @override
  _OurAddBookState createState() => _OurAddBookState();
}

class _OurAddBookState extends State<OurAddBook> {
  TextEditingController _bookNameController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _lengthController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked =
        await DatePicker.showDateTimePicker(context, showTitleActions: true);
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addBook(BuildContext context, String groupName, OurBook book) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString;

    if (widget.onGroupCreation) {
      _returnString = await OurDatabase()
          .createGroup(groupName, _currentUser.getCurrentUser.uid, book);
    } else {
      _returnString = await OurDatabase()
          .addBook(_currentUser.getCurrentUser.groupId, book);
    }

    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => OurRoot(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _bookNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.book),
                      hintText: "Book Name",
                    ),
                  ),
                  TextFormField(
                    controller: _authorController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "Author",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _lengthController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.label),
                      hintText: "Length",
                    ),
                  ),
                  Text(_selectedDate.toString()),
                  FlatButton(
                    child: Text("change Date"),
                    onPressed: () => _selectDate(context),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  //datepicker
                  RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: (Text(
                        "Add Book",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      )),
                    ),
                    onPressed: () {
                      OurBook book = OurBook();
                      book.name = _bookNameController.text;
                      book.author = _authorController.text;
                      book.length = int.parse(_bookNameController.text);
                      book.dateCompleted = Timestamp.fromDate(_selectedDate);

                      _addBook(context, widget.groupName, book);
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
