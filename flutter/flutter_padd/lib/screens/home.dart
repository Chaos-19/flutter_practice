import 'package:flutter/material.dart';
import 'package:flutter_padd/screens/detail.dart';

class HomeScreen extends StatefulWidget {
  final bool isDarkMode; // Current theme mode (true for dark)
  final Function(bool) onThemeToggle; // Callback to toggle theme

  const HomeScreen({
    Key? key,
    required this.isDarkMode,
    required this.onThemeToggle,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;

  late bool _isDarkMode;

  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode; // Initialize with the current theme mode
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Drawer Example',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode; // Update local state
              });
              widget.onThemeToggle(!_isDarkMode);
            },
          ),
        ],
        elevation: 7,
        shadowColor: Colors.lightBlue,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: [
        Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SecondPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0); // Start from the right
                    const end = Offset.zero; // Move to original position
                    const curve = Curves.ease;

                    final tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    final offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
                // MaterialPageRoute(builder: (context) => SecondPage())
              );
            },
            child: Text('Hello from Home'),
          ),
        ),
        const Center(
          child: Text('Hello From Favorite'),
        ),
        const Center(
          child: Text('Hello From Settings'),
        ),
      ][_tabIndex],
      drawer: Drawer(
        clipBehavior: Clip.none,
        child: ListView(
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.zero,
                  border: Border.all(
                    //color: Colors.yellow,
                    width: 2,
                  )),
              child: Container(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                    border: Border.all(
                  // color: Colors.red,
                  width: 2,
                )),
                child: Image.asset(
                  'assets/IMG_2740.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          setState(() {
            _tabIndex = value;
          })
        },
        //selectedItemColor: Colors.green,
        currentIndex: _tabIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
