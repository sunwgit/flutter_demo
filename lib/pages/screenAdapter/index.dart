import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenDemo extends StatelessWidget {
  final String title;
  ScreenDemo({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.instance = ScreenUtil(width: 375, height: 750)..init(context);
    print('设备宽度:${ScreenUtil.screenWidth}'); //Device width
    print('设备高度:${ScreenUtil.screenHeight}'); //Device height
    print('设备的像素密度:${ScreenUtil.pixelRatio}'); //Device pixel density
    print(
        '底部安全区距离:${ScreenUtil.bottomBarHeight}'); //Bottom safe zone distance，suitable for buttons with full screen
    print(
        '状态栏高度:${ScreenUtil.statusBarHeight}px'); //Status bar height , Notch will be higher Unit px

    print('实际宽度的dp与设计稿px的比例:${ScreenUtil().scaleWidth}');
    print('实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}');

    print(
        '宽度和字体相对于设计稿放大的比例:${ScreenUtil().scaleWidth * ScreenUtil.pixelRatio}');
    print('高度相对于设计稿放大的比例:${ScreenUtil().scaleHeight * ScreenUtil.pixelRatio}');
    print('系统的字体缩放比例:${ScreenUtil.textScaleFactory}');

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: ScreenUtil().setWidth(187),
                    height: ScreenUtil().setHeight(200),
                    color: Colors.red,
                    // margin: const EdgeInsets.only(right: 1),
                    child: Text(
                      '我的宽度:${ScreenUtil().setWidth(375)}dp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(12),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: ScreenUtil().setWidth(187),
                    height: ScreenUtil().setHeight(200),
                    color: Colors.blue,
                    child: Text('我的宽度:${ScreenUtil().setWidth(375)}dp',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(12),
                        )),
                  ),
                )
              ],
            ),
            Text('设备宽度:${ScreenUtil.screenWidth}px'),
            Text('设备高度:${ScreenUtil.screenHeight}px'),
            Text('设备的像素密度:${ScreenUtil.pixelRatio}'),
            Text('底部安全区距离:${ScreenUtil.bottomBarHeight}px'),
            Text('状态栏高度:${ScreenUtil.statusBarHeight}px'),
            Text(
              '实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}',
              textAlign: TextAlign.center,
            ),
            Text(
              '实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}',
              textAlign: TextAlign.center,
            ),
            Text(
              '宽度和字体相对于设计稿放大的比例:${ScreenUtil().scaleWidth * ScreenUtil.pixelRatio}',
              textAlign: TextAlign.center,
            ),
            Text(
              '高度相对于设计稿放大的比例:${ScreenUtil().scaleHeight * ScreenUtil.pixelRatio}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(100),
            ),
            Text('系统的字体缩放比例:${ScreenUtil.textScaleFactory}'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('我的文字大小在设计稿上是25px，不会随着系统的文字缩放比例变化',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(24))),
                Text('我的文字大小在设计稿上是25px，会随着系统的文字缩放比例变化',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            ScreenUtil(allowFontScaling: true).setSp(24))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
