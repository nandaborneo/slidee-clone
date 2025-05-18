import 'dart:math';

import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/constants.dart';

enum PostType { textOnly, image, link }

/// Post card widget for displaying posts in the feed
class PostCard extends StatelessWidget {
  final String username;
  final String handle;
  final String timestamp;
  final String content;
  final String? imageUrl;
  final String? linkUrl;
  final PostType type;
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;
  final VoidCallback? onProfileTap;

  const PostCard({
    Key? key,
    required this.username,
    required this.handle,
    required this.timestamp,
    required this.content,
    this.imageUrl,
    this.linkUrl,
    this.likeCount = 0,
    this.commentCount = 0,
    this.shareCount = 0,
    this.onLike,
    this.onComment,
    this.onShare,
    this.onProfileTap,
    this.type = PostType.textOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onProfileTap,
            child: CircleAvatar(
              radius: AppConstants.defaultAvatarSize / 2,
              backgroundColor: Theme.of(
                context,
              ).colorScheme.primary.withOpacity(0.2),
              child: CircleAvatar(
                radius: AppConstants.defaultAvatarSize / 2,
                backgroundImage: NetworkImage(
                  'https://picsum.photos/${Random().nextInt(400)}',
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(username, style: AppTextStyles.username(context)),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(handle, style: AppTextStyles.handle(context)),
                    ),
                    Text(timestamp, style: AppTextStyles.timestamp(context)),
                  ],
                ),
                const SizedBox(height: 12),

                // Post content
                Text(content, style: AppTextStyles.bodyMedium(context)),

                // Additional content based on post type
                if (type == PostType.image && imageUrl != null) ...[
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          width: double.infinity,
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.1),
                          child: const Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                  ),
                ] else if (type == PostType.link && linkUrl != null) ...[
                  const SizedBox(height: 12),
                  // Placeholder for link preview widget
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Link Preview for: $linkUrl',
                    ), // Replace with actual link preview widget
                  ),
                ],

                const SizedBox(height: 16),

                // Interaction buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInteractionButton(
                      context: context,
                      icon: Icons.favorite_border,
                      count: likeCount,
                      onTap: onLike,
                    ),
                    _buildInteractionButton(
                      context: context,
                      icon: Icons.chat_bubble_outline,
                      count: commentCount,
                      onTap: onComment,
                    ),
                    _buildInteractionButton(
                      context: context,
                      icon: Icons.repeat,
                      count: shareCount,
                      onTap: onShare,
                    ),
                    IconButton(
                      icon: const Icon(Icons.send_outlined),
                      onPressed: () {},
                      iconSize: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInteractionButton({
    required BuildContext context,
    required IconData icon,
    required int count,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 4),
            Text(count.toString(), style: AppTextStyles.caption(context)),
          ],
        ),
      ),
    );
  }
}
