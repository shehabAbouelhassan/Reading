import 'package:Reading_Corner/models/auth_model.dart';
import 'package:Reading_Corner/models/userModel.dart';
import 'package:Reading_Corner/screens/inGroup/inGroup.dart';
import 'package:Reading_Corner/screens/login/login.dart';
import 'package:Reading_Corner/screens/noGroup/noGroup.dart';
import 'package:Reading_Corner/screens/splashScreen/splashScreen.dart';
import 'package:Reading_Corner/services/dbStream.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  unknown,
  notLoggedIn,
  loggedIn,
}

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;
  String currentUid;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    //get the state , check current user, set AuthStatus based on whatever/state
    AuthModel _authStream = Provider.of<AuthModel>(context);

    if (_authStream != null) {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
        currentUid = _authStream.uid;
      });
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;
    switch (_authStatus) {
      case AuthStatus.unknown:
        retVal = SplashScreen();
        break;
      case AuthStatus.notLoggedIn:
        retVal = Login();
        break;
      case AuthStatus.loggedIn:
        retVal = StreamProvider<UserModel>.value(
          value: DBStream().getCurrentUser(currentUid),
          child: LoggedIn(),
        );
        break;
      default:
    }

    return retVal;
  }
}

class LoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel _userStream = Provider.of<UserModel>(context);
    Widget retVal;
    if (_userStream != null) {
      if (_userStream.groupId != null) {
        retVal = InGroup();
      } else {
        retVal = NoGroup();
      }
    } else {
      retVal = SplashScreen();
    }

    return retVal;
  }
}
