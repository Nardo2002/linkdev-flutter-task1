import 'package:flutter/material.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.username,
    required this.size,
  });
  final String username;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.png'),
                  radius: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome',
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                        Text(
                          username,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ]),
                ),
                const ImageIcon(
                  AssetImage('assets/images/arrow.png'),
                )
              ],
            ),
          ),
          DrawerTile(
            title: 'Explore',
            icon: const ImageIcon(AssetImage('assets/images/explore.png')),
            size: size,
          ),
          DrawerTile(
            title: 'Live Chat',
            icon: const ImageIcon(AssetImage('assets/images/live.png')),
            size: size,
          ),
          DrawerTile(
            title: 'Gallery',
            icon: const ImageIcon(AssetImage('assets/images/gallery.png')),
            size: size,
          ),
          DrawerTile(
            title: 'Whish List',
            icon: const ImageIcon(AssetImage('assets/images/wishlist.png')),
            size: size,
          ),
          DrawerTile(
            title: 'E-Magazine',
            icon: const ImageIcon(AssetImage('assets/images/e-magazine.png')),
            size: size,
          ),
        ],
      ),
    );
  }
}
