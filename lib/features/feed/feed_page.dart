import 'package:flutter/material.dart';
import '../../shared/widgets/cards/post_card.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Feeds', 'Community', 'Explore'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TabBar(
          controller: _tabController,
          isScrollable: true,
          unselectedLabelColor: Theme.of(
            context,
          ).colorScheme.onSurface.withOpacity(0.5),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFeedContent(),
          _buildCommunityContent(),
          _buildExploreContent(),
        ],
      ),
    );
  }

  Widget _buildFeedContent() {
    return ListView(
      padding: const EdgeInsets.only(top: 8),
      children: [
        PostCard(
          username: 'John Doe',
          handle: '@johndoe',
          timestamp: '2h ago',
          content:
              'Just watched the new Lupin series on Netflix. Absolutely brilliant! 🎭',
          likeCount: 42,
          commentCount: 7,
          shareCount: 3,
          onLike: () {},
          onComment: () {},
          onShare: () {},
          onProfileTap: () {},
        ),
        PostCard(
          username: 'Jane Smith',
          handle: '@janesmith',
          timestamp: '4h ago',
          content:
              'Working on a new design project. Can\'t wait to share it with you all! #design #ux',
          likeCount: 28,
          commentCount: 5,
          shareCount: 1,
          onLike: () {},
          onComment: () {},
          onShare: () {},
          onProfileTap: () {},
        ),
        PostCard(
          username: 'Alex Johnson',
          handle: '@alexj',
          timestamp: '1d ago',
          content: 'Beautiful day for a hike! 🏔️ #nature #outdoors',
          type: PostType.image,
          imageUrl:
              'https://images.unsplash.com/photo-1551632811-561732d1e306?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
          likeCount: 156,
          commentCount: 23,
          shareCount: 12,
          onLike: () {},
          onComment: () {},
          onShare: () {},
          onProfileTap: () {},
        ),
      ],
    );
  }

  Widget _buildCommunityContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.people_outline, size: 64),
          const SizedBox(height: 16),
          Text('Community', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Connect with your community',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildExploreContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.explore_outlined, size: 64),
          const SizedBox(height: 16),
          Text('Explore', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Discover new content',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
