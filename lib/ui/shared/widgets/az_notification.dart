import 'package:flutter/material.dart';
import 'package:sprung/next.dart';

enum NotificationStatus { success, warning, error }

// ignore: must_be_immutable
class AZNotification extends StatefulWidget {
  bool isActive;
  @required
  Widget child;
  NotificationStatus status;
  Function completion;
  double maxHeight;
  double borderRadius;

  AZNotification(
      {this.child,
      this.isActive,
      this.status = NotificationStatus.success,
      this.completion,
      this.maxHeight = 100,
      this.borderRadius = 0.0});

  @override
  _AZNotificationState createState() => _AZNotificationState();
}

class _AZNotificationState extends State<AZNotification> {
  Color _getNotificationStatusColor(NotificationStatus status) {
    Color color;

    switch (status) {
      case NotificationStatus.success:
        color = Colors.green;
        break;
      case NotificationStatus.warning:
        color = Colors.orange;
        break;
      case NotificationStatus.error:
        color = Colors.red;
        break;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
        bottom: 0,
        child: AnimatedContainer(
            duration: Duration(seconds: 2),
            curve: widget.isActive ? Sprung.underDamped() : Curves.easeOutSine,
            width: MediaQuery.of(context).size.width,
            height: widget.isActive ? widget.maxHeight : 0,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  color: _getNotificationStatusColor(widget.status),
                ),
                alignment: Alignment.center,
                child: widget.child,
                height: 100)),
      )
    ]);
  }
}
