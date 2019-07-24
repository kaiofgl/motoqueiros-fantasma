import 'package:flutter/material.dart';
import 'package:motoqueirosfantasma/model/theme.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;

  CollapsingListTile(
      {@required this.title,
      @required this.icon,
      @required this.animationController});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 250, end: 70).animate(widget.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAnimation.value,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            color: Colors.white30,
            size: 38.0,
          ),
          SizedBox(
            width: 10.0,
          ),

          (widthAnimation.value >= 220)
              ? Text(widget.title, style: TextStyle(color: Colors.white70, fontSize: 20.0, ))
              : Container()
        ],
      ),
    );
  }
}
