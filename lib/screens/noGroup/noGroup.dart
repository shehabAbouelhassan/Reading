import 'package:flutter/material.dart';

class NoGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _goToJoin(BuildContext context) {
      /* Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OurJoinGroup(),
        ),
      );
      */
    }

    void _goToCreate(BuildContext context) {
      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OurCreateGroup(),
        ),
      );
      */
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(
            flex: 1, //ratio 1 To:  5 Top Bottom
          ),
          Padding(
            padding: EdgeInsets.all(80.0),
            child: Image.asset("assets/logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "Welcome to Reading Corner",
              textAlign: TextAlign.center,
              style: (TextStyle(fontSize: 40.0, color: Colors.blueGrey)),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Simply create a Corner for you , or join one of ours.",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 20.0, color: Colors.blueGrey)),
              )),
          Spacer(
            flex: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _goToCreate(context),
                  child: Text(
                    "Create",
                  ),
                  color: Theme.of(context).canvasColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                        color: Theme.of(context).secondaryHeaderColor,
                        width: 2),
                  ),
                ),
                RaisedButton(
                  onPressed: () => _goToJoin(context),
                  child: Text(
                    "Join",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
