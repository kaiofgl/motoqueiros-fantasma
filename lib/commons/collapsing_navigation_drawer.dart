import 'package:flutter/material.dart';
import 'package:motoqueirosfantasma/commons/collapsing_list_tile.dart';
import 'package:motoqueirosfantasma/model/navigation_model.dart';
import 'package:motoqueirosfantasma/model/theme.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => getWidget(context, widget));
  }

  Widget getWidget(context, widget) {
    return Container(
      width: widthAnimation.value,
      color: drawerBackgroundColor,
      child: Column(
        children: <Widget>[
          CollapsingListTile(
            title: 'Sarah',
            icon: Icons.person,
            animationController: _animationController,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, counter) {
                return CollapsingListTile(
                    animationController: _animationController,
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon);
              },
              itemCount: navigationItems.length,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
                isCollapsed
                    ? _animationController.forward()
                    : _animationController.reverse();
              });
            },
            child: Icon(Icons.chevron_left, color: Colors.white, size: 50.0),
          )
        ],
      ),
    );
  }
}
