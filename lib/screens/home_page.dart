import 'package:demo_app/screens/page_one.dart';
import 'package:demo_app/screens/page_two.dart';
import 'package:demo_app/screens/page_three.dart';
import 'package:demo_app/screens/page_four.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/themes/custom_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.initialPage, this.page});
  final String? initialPage;
  final Widget? page;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentPageName = 'pageOne';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'pageOne': const PageOne(),
      'pageTwo': const PageTwo(),
      'pageThree': const PageThree(),
      'pageFour': const PageFour(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPageName),
      ),
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: CustomTheme.of(context).secondaryBackground,
        selectedItemColor: CustomTheme.of(context).primary,
        unselectedItemColor: CustomTheme.of(context).grayLight,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.home_rounded,
              size: 24.0,
            ),
            label: 'Page One',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.date_range_outlined,
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.date_range_rounded,
              size: 24.0,
            ),
            label: 'Page Two',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_rounded,
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.favorite_rounded,
              size: 24.0,
            ),
            label: 'Page Three',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 24.0,
            ),
            activeIcon: Icon(
              Icons.account_circle_rounded,
              size: 24.0,
            ),
            label: 'Page Four',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
