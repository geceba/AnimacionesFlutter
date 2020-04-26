import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animation/src/widgets/pinterest_menu.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
        //body: PinterestMenu(),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;

    return Positioned(
        bottom: 30,
        child: Container(
          width: width,
          child: Align(
            child: PinterestMenu(
              show: show,
              items: [
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
              ],
              //backgroundColor: Colors.red,
            ),
          ),
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double lastScroll = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.offset > lastScroll && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      lastScroll = controller.offset;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show(bool show) {
    this._show = show;
    notifyListeners();
  }
}
