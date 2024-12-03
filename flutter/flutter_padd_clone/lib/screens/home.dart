import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_padd_clone/models/theme_notifier.dart';
import 'package:flutter_padd_clone/widgets/app_drawer.dart';
import 'package:flutter_padd_clone/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Learn Flutter coding",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        backgroundColor: const Color.fromARGB(255, 8, 28, 58),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: ListView(
        children: [
          // Getting Started Section
          _buildSection(
            title: 'Getting Started',
            iconPath:
                'assets/images/flutter.svg', //Replace with your actual path
            items: [
              _buildItem('Introduction',
                  'assets/images/flutter-3.svg'), //Replace with your actual path
              _buildItem('Why Learn Flutter',
                  'assets/images/flutter-4.svg'), //Replace with your actual path
            ],
          ),
          // Dart Basics Section
          _buildSection(
            title: 'Dart Basics',
            iconPath:
                'assets/images/flutter-3.svg', //Replace with your actual path
            items: [
              _buildItem('Dart',
                  'assets/images/flutter.svg'), //Replace with your actual path
            ],
          ),
          // Flutter Widgets Section (Empty for this example)
          _buildSection(
            title: 'Flutter Widgets',
            iconPath:
                'assets/images/flutter.svg', //Replace with your actual path
            items: [],
          ),
          // Testing & Debugging Section
          _buildSection(
            title: 'Testing & Debugging',
            iconPath:
                'assets/images/flutter.svg', //Replace with your actual path
            items: [
              _buildItem('Unit Testing',
                  'assets/images/flutter-6.svg'), //Replace with your actual path
              _buildItem('Widget Testing',
                  'assets/images/flutter-5.svg'), //Replace with your actual path
            ],
          ),
        ],
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (current) => setState(() {
          _currentIndex = current;
        }),
      ),
    ));
  }

  Widget _buildSection({
    required String title,
    required String iconPath,
    required List<Widget> items,
  }) {
    return Container(
        color: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: 30,
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            if (items.isNotEmpty)
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                children: items,
              ),
            const SizedBox(height: 16),
          ],
        ));
  }

  Widget _buildItem(String title, String iconPath) {
    return InkWell(
      onTap: () {
        // Handle item tap
      },
      child: Card(
        elevation: 5,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 2,
                  child: Center(
                      child: SvgPicture.asset(
                    iconPath,
                    width: 50,
                    height: 50,
                  ))),
              const SizedBox(height: 8),
              Expanded(
                  child: Container(
                color: Colors.grey[200],
                alignment: Alignment.centerLeft,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
