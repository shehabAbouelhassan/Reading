import 'package:Reading_Corner/main.dart';
import 'package:Reading_Corner/screens/login/localwidgets/loginForm.dart';
import 'package:Reading_Corner/screens/login/login.dart';
import 'package:Reading_Corner/screens/noGroup/noGroup.dart';
import 'package:Reading_Corner/states/currentGroup.dart';
import 'package:Reading_Corner/states/currentUser.dart';
import 'package:Reading_Corner/widgets/OurContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    CurrentGroup _currentGroup =
        Provider.of<CurrentGroup>(context, listen: false);
    _currentGroup.updateStateFromDatabase(_currentUser.getCurrentUser.groupId);
  }

  void _goToNoGroup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OurNoGroup()),
    );
  }

  void _signOut(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.signOut();
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => OurLogin(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
              child: Consumer<CurrentGroup>(
                builder: (BuildContext context, value, Widget child) {
                  return Column(
                    children: <Widget>[
                      Text(
                        value.getCurrentBook.name ?? "loading..",
                        style: TextStyle(fontSize: 30, color: Colors.grey[600]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Due In:",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.grey[600]),
                            ),
                            Expanded(
                              child: Text(
                                (value.getCurrentGroup.currentBookDue != null)
                                    ? value.getCurrentGroup.currentBookDue
                                        .toDate()
                                        .toString()
                                    : "Loading..",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RaisedButton(
                        child: Text(
                          "Finished Book",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Next Book queued In:",
                      style: TextStyle(fontSize: 30, color: Colors.grey[600]),
                    ),
                    Text(
                      "14 Days",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: RaisedButton(
              child: Text(
                "Book Corner History",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => _goToNoGroup(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: RaisedButton(
              onPressed: () => _signOut(context),
              child: Text("Sgin Out"),
              color: Theme.of(context).canvasColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                    color: Theme.of(context).secondaryHeaderColor, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
