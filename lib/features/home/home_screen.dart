import 'package:flutter/material.dart';
import '../../core/utils/constants.dart';
import '../../features/activity/activity_page.dart';
import '../../features/explore/explore_page.dart';
import '../../features/feed/feed_page.dart';
import '../../features/profile/profile_page.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const HomeScreen({super.key, required this.toggleTheme});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Each page will have its own app bar, so we don't set it here
      body: Center(child: _buildPage(_selectedIndex)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
        shape: const CircleBorder(),
        elevation: 8,
        child: const Icon(Icons.add, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.surface,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                0,
                _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
                'Home',
              ),
              _buildNavItem(
                1,
                _selectedIndex == 1 ? Icons.search_outlined : Icons.search,
                'Explore',
              ),
              _buildNavItem(
                2,
                _selectedIndex == 2
                    ? Icons.notifications
                    : Icons.notifications_outlined,
                'Activity',
              ),
              _buildNavItem(
                3,
                _selectedIndex == 3 ? Icons.person : Icons.person_outline,
                'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const FeedPage();
      case 1:
        return const ExplorePage();
      case 2:
        return const ActivityPage();
      case 3:
        return const ProfilePage();
      default:
        return const FeedPage();
    }
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child:
            label == 'Profile'
                ? const CircleAvatar(
                  radius: 12,
                  backgroundImage: NetworkImage('https://picsum.photos/200'),
                )
                : Icon(
                  icon,
                  color:
                      isSelected
                          ? ThemeData.light().colorScheme.secondary
                          : ThemeData.light().colorScheme.onSurface.withAlpha(
                            50,
                          ),
                  size: 24,
                ),
      ),
    );
  }
}
