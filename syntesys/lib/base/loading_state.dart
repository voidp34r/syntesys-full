import 'package:flutter/material.dart';
import '../services/authentication.dart';
import '../base/dialog_shower.dart' as DialogShower;

abstract class LoadingBaseState<T extends StatefulWidget> extends State<T> {

  bool _isLoading = false;
  bool _hasUser = false;
  String _title = "";

  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
        title: new Text(_title),
        actions: <Widget>[
          _hasUser?new FlatButton(
              onPressed: _logOut, child: new Text(
                "Log out",
                style: new TextStyle(
                  color: Colors.white
                ),
          )):new Container(),
          
        ],
    ),
    body: _isLoading?new Center(
      child: new Scaffold(
        body: new Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ):content(),
  );

  Widget content();

  set isLoading(bool value) {
    _isLoading = value;
  }

  set title(String value) {
    _title = value;
  }

  set hasUser(bool value) {
    _hasUser = value;
  }



  void _logOut() {
    var dialog = DialogShower.buildDialog(
        title: "Está de saída?",
        message: "Você tem certeza que quer sair?",
        confirm: "Sim",
        confirmFn: (){
          setState(()=>_isLoading = true);
          Navigator.pop(context);
          UserAuth.logout().then((n){
            setState(()=>_hasUser = false);
            setState(()=>_isLoading = false);
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/signin", (Route<dynamic> route) => false);
          });
        },
        cancel: "Não",
        cancelFn: ()=> Navigator.pop(context)
    );
    showDialog(context: context, child: dialog);
  }
}