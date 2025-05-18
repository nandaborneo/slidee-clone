import 'package:flutter/material.dart';
import '../../shared/widgets/inputs/app_text_field.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SEARCH'),

        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppTextField(
              controller: _searchController,
              hint: 'Search users, posts, or hashtags',
              prefixIcon: Icons.search,
              onChanged: (value) {
                // Handle search
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Suggested Users',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildUserListItem(
                  name: 'User ${index + 1}',
                  username: '@user${index + 1}',
                  imageUrl: 'https://picsum.photos/200?random=$index',
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserListItem({
    required String name,
    required String username,
    required String imageUrl,
  }) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      title: Text(name),
      subtitle: Text(username),
      trailing: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        child: const Text('Follow'),
      ),
    );
  }
}
