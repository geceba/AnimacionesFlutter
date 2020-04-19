import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool show;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;

  final List<PinterestButton> items ;

  PinterestMenu(
      {this.show = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey,
      @required this.items
      });

  /*final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.pie_chart,
        onPressed: () {
          print('Icon');
        }),
    PinterestButton(
        icon: Icons.search,
        onPressed: () {
          print('Icon 2');
        }),
    PinterestButton(
        icon: Icons.notifications,
        onPressed: () {
          print('Icon 3');
        }),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPressed: () {
          print('Icon 4');
        }),
  ];
 */
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (show) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
            return _PinterestMenuBackground(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          menuItems.length, (i) => _PinterestMenuButtom(i, menuItems[i])),
    );
  }
}

class _PinterestMenuButtom extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButtom(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSelected = Provider.of<_MenuModel>(context).itemSelected;
    final menuModel = Provider.of<_MenuModel>(context);

    double tam;
    Color color;

    if (itemSelected == index) {
      tam = 35;
      color = menuModel.activeColor;
    } else {
      tam = 25;
      color = menuModel.inactiveColor;
    }

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: tam,
          color: color,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSelected = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get itemSelected => this._itemSelected;

  set itemSelected(int index) {
    this._itemSelected = index;
    notifyListeners();
  }
}
