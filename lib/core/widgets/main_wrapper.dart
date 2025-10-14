import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/pages/bookmark_page.dart';
import 'package:weather_app/features/weather/presentation/pages/weather_page.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Weather App')),
        body: SafeArea(
          child: Center(
            child: IndexedStack(
              index: selectedPage,
              children: [WeatherPage(), BookmarkPage()],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.cloud), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: ''),
          ],
        ),
      ),
    );
  }
}
