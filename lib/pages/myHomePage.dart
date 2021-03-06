import 'package:flutter/material.dart';
import '../model/base.dart';
import '../pages/counter.dart';
import '../pages/animation/animate.dart';
import '../pages/design/drawerDemo.dart';
import '../pages/design/snackbarDemo.dart';
import '../pages/design/orientationList.dart';
import '../pages/design/tabDemo.dart';
import '../pages/design/wrapDemo.dart';
import '../pages/forms/formDemo.dart';
import '../pages/forms/focusNodeDemo.dart';
import '../pages/forms/textFieldChange.dart';
import '../pages/forms/retrieveTextFieldValue.dart';
import '../pages/gestures/inkWellDemo.dart';
import '../pages/gestures/dismissDemo.dart';
import '../pages/lists/basicList.dart';
import '../pages/lists/horizontalList.dart';
import '../pages/lists/mixedList.dart';
import '../model/listItem.dart';
import '../pages/navigation/heroDemo.dart';
import '../pages/navigation/returnData.dart';
import '../pages/navigation/passData.dart';
import '../pages/network/fetchData.dart';
import '../pages/network/fetchData2.dart';
import '../pages/screenAdapter/index.dart';
import '../pages/_eventBus/eventBusDemo.dart';
import '../pages/swiper/swiperDemo.dart';
import '../pages/bottomNavBar/bottomNavBar.dart';
import '../pages/sliver/gird_list_demo.dart';
import '../pages/sliver/collapseing_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          _buildListView(CollapsingList(), 'CollapsingList'),
          _buildListView(GridListDemo(), 'GridListDemo'),
          _buildListView(Counter(title: 'Counter'), 'Counter'),
          _buildListView(AnimatedBox(title: 'AnimatedBox'), 'AnimatedBox'),
          _buildListView(SnackBarDemo(title: 'SnackBar'), 'SnackBar'),
          _buildListView(
              OrientationList(title: 'OrientationList'), 'OrientationList'),
          _buildListView(TabDemo(title: 'TabDemo'), 'TabDemo'),
          _buildListView(FormDemo(title: 'FormDemo'), 'FormDemo'),
          _buildListView(
              MyCustomForm(title: 'TextField Focus'), 'TextField Focus'),
          _buildListView(
              TextFieldChange(title: 'TextFieldChange'), 'TextFieldChange'),
          _buildListView(RetrieveTextFieldValue(title: 'RetrieveInputValue'),
              'RetrieveInputValue'),
          _buildListView(InkWellDemo(title: 'InkWellDemo'), 'InkWellDemo'),
          _buildListView(DismissDemo(title: 'DismissDemo'), 'DismissDemo'),
          _buildListView(BasicList(title: 'BasicList'), 'BasicList'),
          _buildListView(
              HorizontalList(title: 'HorizontalList'), 'HorizontalList'),
          _buildListView(
              MixedList(
                title: 'MixedList',
                items: List<ListItem>.generate(
                  20000,
                  (i) => i % 6 == 0
                      ? HeadingItem('Heading $i')
                      : MessageItem('Sender $i', 'Msg:Hello World! $i'),
                ),
              ),
              'MixedList'),
          _buildListView(HeroDemo('HeroDemo'), 'HeroDemo'),
          _buildListView(ReturnDataDemo('ReturnDataDemo'), 'ReturnDataDemo'),
          _buildListView(PassDataDemo('PassDataDemo'), 'PassDataDemo'),
          _buildListView(FetchData('FetchData'), 'FetchData'),
          _buildListView(FetchData2('FetchData2'), 'FetchData2'),
          _buildListView(
              ScreenDemo(
                title: 'ScreenDemo',
              ),
              'ScreenDemo'),
          _buildListView(
              EventBusDemo(
                'EventBusDemo',
              ),
              'EventBusDemo'),
          _buildListView(
              SwiperDemo(
                'SwiperDemo',
              ),
              'SwiperDemo'),
          _buildListView(
              BottomNavBar(
                'bottom navgation bar',
              ),
              'bottom navgation bar'),
          _buildListView(WrapDemo(), 'WrapDemo'),
        ],
      ),
      drawer: DrawerDemo(),
    );
  }

  Widget _buildListView(Widget widget, String routeName) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
        },
        child: Text(
          routeName,
          style: TextStyle(fontSize: 16),
        ),
        color: THEME_COLOR,
        textColor: Colors.white70,
      ),
    );
  }
}
