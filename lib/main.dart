import 'package:ghekko_demo_3_flutter_app/src/theming/theme_manager.dart';
import 'package:ghekko_demo_3_flutter_app/pages/1home.dart';
import 'package:ghekko_demo_3_flutter_app/pages/2page.dart';
import 'package:ghekko_demo_3_flutter_app/pages/3page.dart';
import 'package:ghekko_demo_3_flutter_app/pages/4page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme.getTheme(),
            home: const HomePage()
        )
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => Scaffold(
        appBar: GFAppBar(
            title: const Text('Ghekko Demo 3'),
            actions: <Widget>[
              GFIconButton(
                icon: const Icon(
                  Icons.light_mode,
                  color: GFColors.LIGHT,
                ),
                onPressed: () => {
                  theme.setLightMode(),
                },
                type: GFButtonType.transparent,
              ),
              GFIconButton(
                icon: const Icon(
                  Icons.dark_mode,
                  color: GFColors.DARK,
                ),
                onPressed: () => {
                  theme.setDarkMode(),
                },
                type: GFButtonType.transparent,
              ),
            ]
        ),
        body: IndexedStack(
          index: selectedTab,
          children: const <Widget>[
            Home(),
            Page2(),
            Page3(),
            Page4(),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedTab,
          onDestinationSelected: (int index) {
            setState(() {
              selectedTab = index;
            });
            },
          //animationDuration: const Duration(seconds: 3),
          // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              selectedIcon: Icon(Icons.home),
            ),
              NavigationDestination(
                icon: Icon(Icons.note_outlined),
                label: 'Page 2',
                selectedIcon: Icon(Icons.note),
              ),
              NavigationDestination(
                icon: Icon(Icons.pages_outlined),
                label: 'Page 3',
                selectedIcon: Icon(Icons.pages),
              ),
              NavigationDestination(
                icon: Icon(Icons.perm_device_information_outlined),
                label: 'Page 4',
                selectedIcon: Icon(Icons.perm_device_information),
              ),
            ],
        ),
      ),
    );
  }
}
