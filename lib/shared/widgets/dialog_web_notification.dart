import 'package:flutter/material.dart';

class DialogWebNotification extends StatefulWidget {
  final title;
  final body;
  DialogWebNotification({this.title, this.body});
  @override
  DialogWebNotificationState createState() => DialogWebNotificationState();
}

class DialogWebNotificationState extends State<DialogWebNotification> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      actions: <Widget>[
        OutlinedButton.icon(
            label: Text('Close'),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close))
      ],
      content: Text(widget.body),
    );
  }
}
