import 'package:assignment/features/home/controller/home_controller.dart';
import 'package:assignment/features/home/data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCard extends StatefulWidget {
  final PostDataModel post;
  final HomeController controller;
  final VoidCallback callback;

  const PostCard({
    super.key,
    required this.post,
    required this.controller,
    required this.callback,

  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {

    final isBookmarked = widget.post.isBookmarked ?? false;

    return Card(
      color: Colors.grey[900],
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: widget.callback,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      widget.post.userImage ?? 'https://i.pravatar.cc/150?img=1',
                    ),
                    radius: 20,
                  ),
                ),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: widget.callback,
                  child: Text(
                    widget.post.userName ?? 'Unknown User',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    _showMoreOptions(context);
                  },
                  icon: Icon(Icons.more_vert, color: Colors.white, size: 20),
                ),
              ],
            ),
            SizedBox(height: 12),

            Text(
              widget.post.title?.toUpperCase() ?? 'No Title',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.post.body ?? 'No Content',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            SizedBox(height: 12),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    widget.controller.likePost(widget.post.id ?? 0);
                  },
                  icon: Icon(Icons.favorite_border, color: Colors.white, size: 24),
                ),
                SizedBox(width: 4),
                Text(
                  'Like',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    Get.snackbar(
                      'Comment',
                      'Comment feature coming soon!',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  icon: Icon(Icons.comment_outlined, color: Colors.white, size: 24),
                ),
                SizedBox(width: 4),
                Text(
                  'Comment',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    // Share functionality
                    Get.snackbar(
                      'Share',
                      'Share feature coming soon!',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  icon: Icon(Icons.send_outlined, color: Colors.white, size: 24),
                ),
                SizedBox(width: 4),
                Text(
                  'Share',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() { });
                    widget.controller.toggleBookmark(widget.post.id ?? 0);
                  },
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                    color: isBookmarked ? Colors.amber : Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Posted by User ${widget.post.userId}',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.report, color: Colors.white),
              title: Text(
                'Report',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.snackbar(
                  'Report',
                  'Post reported successfully!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.copy, color: Colors.white),
              title: Text(
                'Copy Link',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.snackbar(
                  'Copied',
                  'Link copied to clipboard!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share, color: Colors.white),
              title: Text(
                'Share to...',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.snackbar(
                  'Share',
                  'Share feature coming soon!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            ),
            Divider(color: Colors.grey[700]),
            ListTile(
              leading: Icon(Icons.cancel, color: Colors.white),
              title: Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}


