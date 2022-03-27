import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  bool fav = false;
  bool fav1 = false;
  bool fav2 = false;
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: ListView(
          children: <Widget>[
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: GFSegmentTabs(
                tabController: tabController,
                width: 290,
                length: 3,
                tabs: const <Widget>[
                  Text('Tab 1'),
                  Tab(
                    child: Text('Tab 2'),
                  ),
                  Tab(
                    child: Text('Tab 3'),
                  ),
                ],
                tabBarColor: GFColors.LIGHT,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: GFColors.WHITE,
                unselectedLabelColor: GFColors.DARK,
                indicator: const BoxDecoration(
                  color: GFColors.DARK,
                  border: Border(
                    bottom: BorderSide(
                      color: GFColors.INFO,
                      width: 3,
                    ),
                  ),
                ),
                //indicatorPadding: const EdgeInsets.all(8),
                // indicatorWeight: 2,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 140,
              child: GFTabBarView(
                controller: tabController,
                height: 400,
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      GFCard(
                        boxFit: BoxFit.cover,
                        titlePosition: GFPosition.end,
                        title: GFListTile(
                          titleText: 'Card Title 1',
                          icon: GFIconButton(
                            onPressed: null,
                            icon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  fav = !fav;
                                });
                                },
                              child: fav
                                  ? const Icon(
                                Icons.favorite,
                                color: GFColors.DANGER,
                              )
                                  : const Icon(Icons.favorite_border),
                            ),
                            type: GFButtonType.transparent,
                          ),
                        ),
                        content: const Text(
                          'Some quick example text to build on the card',
                          style: TextStyle(color: Colors.grey),
                        ),
                        buttonBar: GFButtonBar(
                          padding: const EdgeInsets.only(bottom: 10),
                          children: <Widget>[
                            GFButton(
                              onPressed: () {},
                              text: 'Read More',
                            ),
                            GFButton(
                              onPressed: () {},
                              text: 'Send',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      GFCard(
                        boxFit: BoxFit.cover,
                        titlePosition: GFPosition.end,
                        title: const GFListTile(
                          avatar: GFAvatar(
                            backgroundImage:
                            AssetImage('assets/images/avatar9.png'),
                          ),
                          titleText: 'Avatar Card Title 2',
                          subTitleText: 'Sub Title',
                        ),
                        content: const Text(
                          'Some quick example text to build on the card',
                          style: TextStyle(color: Colors.grey),
                        ),
                        buttonBar: GFButtonBar(
                          padding: const EdgeInsets.only(bottom: 20, top: 10),
                          children: <Widget>[
                            GFIconButton(
                                color: const Color(0xFF3B5998),
                                shape: GFIconButtonShape.circle,
                                icon: const Icon(
                                  IconData(0xe908,
                                      fontFamily: 'MaterialIcons'),
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {}),
                            GFIconButton(
                                color: const Color(0xFF00ACEE),
                                shape: GFIconButtonShape.circle,
                                icon: const Icon(
                                  IconData(0xe907,
                                      fontFamily: 'MaterialIcons'),
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {}),
                            GFIconButton(
                                color: const Color(0xFF25D366),
                                shape: GFIconButtonShape.circle,
                                icon: const Icon(
                                  IconData(0xe906,
                                      fontFamily: 'MaterialIcons'),
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    children: <Widget>[
                      GFCard(
                        boxFit: BoxFit.cover,
                        title: const GFListTile(
                          avatar: GFAvatar(
                            backgroundImage:
                            AssetImage('assets/images/avatar10.png'),
                          ),
                          title: Text(
                            'Another Card Title 1',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          subTitle: Text(
                            'subtitle',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        content: const Text(
                          'GetWidget is an open source library that comes with pre-build 1000+ UI components',
                          style: TextStyle(color: Colors.grey),
                        ),
                        buttonBar: GFButtonBar(
                          padding: const EdgeInsets.only(bottom: 10),
                          children: <Widget>[
                            GFButton(
                              onPressed: () {},
                              text: 'Send',
                            ),
                            GFButton(
                              onPressed: () {},
                              text: 'View',
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
}