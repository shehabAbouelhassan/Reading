import 'package:Reading_Corner/screens/root/root.dart';
import 'package:Reading_Corner/services/auth.dart';
import 'package:flutter/material.dart';

class InGroup extends StatefulWidget {
  @override
  _InGroupState createState() => _InGroupState();
}

class _InGroupState extends State<InGroup> {
  //
  // List<String> _timeUntil = List(2); //[0] Timeuntill book is due
  // //[0] Timeuntill next book
  // Timer _timer;
  // void _startTimer(CurrentGroup currentGroup) {
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       _timeUntil = OurTimeLeft().timeLeft(currentGroup
  //           .getCurrentGroup.currentBookDue
  //           .toDate()); //function that we're calling here
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();

    // CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
//
    //  CurrentGroup _currentGroup =
    //    Provider.of<CurrentGroup>(context, listen: false);
    //currentGroup.updateStateFromDatabase(
    //_currentUser.getCurrentUser.groupId, _currentUser.getCurrentUser.uid);
    //_startTimer(_currentGroup);
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }

  /* void _goToAddBook(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OurAddBook(
                onGroupCreation: false,
              )),
    );
  }*/

  /*void _goToReview() {
    CurrentGroup _currentGroup =
        Provider.of<CurrentGroup>(context, listen: false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OurReview(
          currentGroup: _currentGroup,
        ),
      ),
    );
  }
*/

  void _signOut(BuildContext context) async {
    String _returnString = await Auth().signOut();
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => OurRoot(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: RaisedButton(
        child: Text("signOut"),
        onPressed: () => _signOut(context),
      )),
      body: Center(
        child: Text("sign out "),
      ),
      /*ListView(
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
                                _timeUntil[0] ?? "loading..",
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
                        onPressed:
                            value.getDoneWithCurrentBook ? null : _goToReview,
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Next Book \nqueued In:",
                      style: TextStyle(fontSize: 30, color: Colors.grey[600]),
                    ),
                    Text(
                      _timeUntil[1] ?? "loading",
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
              onPressed: () => _goToAddBook(context),
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
      */
    );
  }
}