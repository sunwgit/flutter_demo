import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperDemo extends StatelessWidget {
  final String title;
  SwiperDemo(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
          // width: MediaQuery.of(context).size.width,
          height: 200,
          child: Swiper(
            itemBuilder: (context, i) => Image.network(
                  'http://www.pptbz.com/pptpic/UploadFiles_6909/201211/2012111719294197.jpg',
                  fit: BoxFit.fill,
                ),
            itemCount: 4,
            // itemHeight: 200,
            // itemWidth: MediaQuery.of(context).size.width,
            autoplay: true,
            duration: 1000,
            pagination: SwiperCustomPagination(
              builder: (BuildContext context,SwiperPluginConfig config){
                return ConstrainedBox(
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            new Expanded(
                              child: new Align(
                                alignment: Alignment.bottomCenter,
                                // child: new DotSwiperPaginationBuilder(
                                //         color: Colors.greenAccent,
                                //         activeColor: Colors.red,
                                //         size: 10.0,
                                //         activeSize: 20.0)
                                //     .build(context, config),
                                child: RectSwiperPaginationBuilder(
                                  activeColor: Colors.greenAccent,
                                  color: Colors.lightBlue,
                                  size: Size(30, 10),
                                  activeSize: Size(45, 15)
                                ).build(context, config),
                              ),
                            )
                          ],
                        ),
                        constraints: new BoxConstraints.expand(height: 200.0),
                      );
              }
            ),
          )),
    );
  }
}
