import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_padd_clone/models/font_size_notifier.dart';
import 'package:flutter_padd_clone/models/theme_notifier.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final fontSizeNotifier = Provider.of<FontSizeNotifier>(context);

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              margin: EdgeInsets.zero,
              child: Center(
                child: Image.asset(
                  "assets/images/image.png",
                  width: 105,
                ),
              )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Bookmarks'),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock_open_outlined),
            title: const Text('Get Pro- Unlock Everthings'),
            onTap: () {
              // Handle item tap
            },
          ),
          const Divider(color: Colors.grey),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Rate App'),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('More Apps'),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy Policy'),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: const Text('Send Feedback'),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.thumb_up),
            title: const Text('Like Us (Get Latest Updates)'),
            onTap: () {
              // Handle item tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share App'),
            onTap: () {
              // Handle item tap
            },
          ),
          const Divider(color: Colors.grey),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Handle item tap
            },
          ),
          const Divider(
            color: Colors.grey,
            endIndent: 0,
          ),
          ExpansionTile(
            title: Text(
              'change font',
              style: TextStyle(fontSize: fontSizeNotifier.fontSize),
            ),
            children: <Widget>[
              Slider(
                divisions: 6,
                min: 16,
                max: 26,
                label: fontSizeNotifier.fontSize.round().toString(),
                value: fontSizeNotifier.fontSize,
                onChanged: (value) => {fontSizeNotifier.changeFontSize(value)},
              )
            ],
          ),
          ListTile(
            title: const Text('Change theme'),
            trailing: CupertinoSwitch(
                value: themeNotifier.isDarkMode,
                onChanged: (value) => themeNotifier.toggleTheme()),
            onTap: () {
              // Handle item tap
            },
          ),
        ],
      ),
    );
  }
}
