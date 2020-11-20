import 'package:flutter/material.dart';

class SimpleDialog extends StatelessWidget {
  const SimpleDialog({
    Key key,
    @required this.title,
    @required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Wrap(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25, left: 25, right: 25),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          child,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "ACEPTAR",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
