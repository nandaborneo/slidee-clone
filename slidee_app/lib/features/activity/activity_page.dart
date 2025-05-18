import 'package:flutter/material.dart';
import 'package:slidee_app/core/theme/app_colors.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final List<String> _filterOptions = ['all', 'follow', 'replied'];
  String _selectedFilter = 'all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACTIVITY'),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children:
                    _filterOptions.map((filter) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(filter),
                          selected: _selectedFilter == filter,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() {
                                _selectedFilter = filter;
                              });
                            }
                          },
                          selectedColor: Theme.of(
                            context,
                          ).colorScheme.primary.withAlpha(0),
                          labelStyle: TextStyle(
                            color:
                                _selectedFilter == filter
                                    ? Colors.white
                                    : AppColors.textPrimaryLight,
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ),
          Expanded(child: _buildActivityList()),
        ],
      ),
    );
  }

  Widget _buildActivityList() {
    // Placeholder activity items
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildActivityItem(
          username: 'User ${index + 1}',
          action:
              index % 3 == 0
                  ? 'liked your post'
                  : index % 3 == 1
                  ? 'started following you'
                  : 'replied to your post',
          timeAgo: '${index + 1}h ago',
          imageUrl: 'https://picsum.photos/200?random=$index',
        );
      },
    );
  }

  Widget _buildActivityItem({
    required String username,
    required String action,
    required String timeAgo,
    required String imageUrl,
  }) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
      title: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
              text: username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' $action'),
          ],
        ),
      ),
      subtitle: Text(timeAgo),
      trailing:
          action.contains('follow')
              ? OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: const Text('Follow'),
              )
              : null,
    );
  }
}
