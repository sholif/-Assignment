import 'package:assignment/features/home/controller/home_controller.dart';
import 'package:assignment/features/home/data/model/post_model.dart';
import 'package:assignment/features/home/data/model/user_model.dart';
import 'package:assignment/features/home/view/screen/profile_details_screen.dart';
import 'package:assignment/features/home/view/widget/post_card.dart';
import 'package:assignment/features/home/view/widget/post_card_sketon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeController controller = Get.find<HomeController>();
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchController.addListener(() {
      controller.setSearchQuery(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        title: Column(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Assignment',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: [
                            Color(0xFF833AB4),
                            Color(0xFFFD1D1D),
                            Color(0xFFFCAF45),
                          ],
                        ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            controller.setSearchQuery(value);
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            suffixIcon: controller.searchQuery.isNotEmpty
                                ? IconButton(
                                    icon: Icon(Icons.clear, color: Colors.grey),
                                    onPressed: () {
                                      controller.clearSearch();
                                    },
                                  )
                                : null,
                            hintText: 'Search posts...',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          cursorColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'ALL POSTS'),
            Tab(text: 'BOOKMARKS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAllPostsTab(),

          _buildBookmarksTab(),
        ],
      ),
    );
  }

  Widget _buildAllPostsTab() {
    return Obx(() {
      if (controller.isSupportPostLoading.value) {
        return _buildShimmerList();
      }

      final posts = controller.searchQuery.isNotEmpty
          ? controller.searchPosts(controller.searchQuery.value)
          : controller.homePostDataList;

      if (posts.isEmpty && controller.searchQuery.isNotEmpty) {
        return _buildEmptySearchState();
      }

      return RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.black,
        onRefresh: () async {
          await controller.getHomePostInfo();
        },
        child: _buildPostsList(posts),
      );
    });
  }

  Widget _buildBookmarksTab() {
    return Obx(() {
      if (controller.isSupportPostLoading.value) {
        return _buildShimmerList();
      }

      final posts = controller.searchQuery.isNotEmpty
          ? controller.searchBookmarkedPosts(controller.searchQuery.value)
          : controller.homePostDataList
              .where((post) => post.isBookmarked == true)
              .toList();

      if (posts.isEmpty) {
        if (controller.searchQuery.isNotEmpty) {
          return _buildEmptySearchState();
        }
        return _buildNoBookmarksState();
      }

      return RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.black,
        onRefresh: () async {
          await controller.getHomePostInfo();
        },
        child: _buildPostsList(posts),
      );
    });
  }

  Widget _buildEmptySearchState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            color: Colors.grey,
            size: 64,
          ),
          SizedBox(height: 16),
          Text(
            'No posts found',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoBookmarksState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_border,
            color: Colors.grey,
            size: 64,
          ),
          SizedBox(height: 16),
          Text(
            'No bookmarked posts',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Tap the bookmark icon to save posts',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 5,
      itemBuilder: (context, index) {
        return PostCardSkeleton();
      },
    );
  }

  Widget _buildPostsList(List<PostDataModel> posts) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return PostCard(
          post: post,
          controller: controller,
          callback: () {
            User user = controller.getUserById(post.userId!);
            List<PostDataModel> userPosts = controller.homePostDataList
                .where((post) => post.userId == post.userId)
                .toList();

            Get.to(
              () => ProfileDetailsScreen(
                user: user,
                userPosts: userPosts,
              ),
            );
          },
        );
      },
    );
  }
}
