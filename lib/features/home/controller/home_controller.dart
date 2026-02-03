import 'package:assignment/data/datasource/remote/dio/dio_client.dart';
import 'package:assignment/data/model/base_model/api_response.dart';
import 'package:assignment/data/repositories/local/sharepreferences_class.dart';
import 'package:assignment/features/home/data/model/post_model.dart';
import 'package:assignment/features/home/data/model/user_model.dart';
import 'package:assignment/features/home/data/repo/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final DioClient dioClient;
  final HomeRepo homeRepo;
  final SharedPreferencesClass sharedPreferencesClass;

  HomeController({
    required this.dioClient,
    required this.homeRepo,
    required this.sharedPreferencesClass,
  });

  var isSupportPostLoading = false.obs;
  var isSupportUserLoading = false.obs;
  var homePostDataList = <PostDataModel>[].obs;
  var bookmarkedPosts = <int>{}.obs;

  // Search related variables
  var searchQuery = ''.obs;
  var isSearching = false.obs;
  final RxList<dynamic> usersList = <dynamic>[].obs;

  @override
  void onInit() {
    getHomePostInfo();
    super.onInit();
  }



  List<PostDataModel> searchPosts(String query) {
    if (query.isEmpty) {
      return homePostDataList;
    }

    final lowercaseQuery = query.toLowerCase();
    return homePostDataList.where((post) {
      final title = post.title?.toLowerCase() ?? '';
      final body = post.body?.toLowerCase() ?? '';
      final userName = post.userName?.toLowerCase() ?? '';

      return title.contains(lowercaseQuery) ||
          body.contains(lowercaseQuery) ||
          userName.contains(lowercaseQuery);
    }).toList();
  }

// Method to search bookmarked posts
  List<PostDataModel> searchBookmarkedPosts(String query) {
    final bookmarkedPosts = homePostDataList
        .where((post) => post.isBookmarked == true)
        .toList();

    if (query.isEmpty) {
      return bookmarkedPosts;
    }

    final lowercaseQuery = query.toLowerCase();
    return bookmarkedPosts.where((post) {
      final title = post.title?.toLowerCase() ?? '';
      final body = post.body?.toLowerCase() ?? '';
      final userName = post.userName?.toLowerCase() ?? '';

      return title.contains(lowercaseQuery) ||
          body.contains(lowercaseQuery) ||
          userName.contains(lowercaseQuery);
    }).toList();
  }

// User খুঁজে পাওয়ার মেথড
  User getUserById(int userId) {
    try {
      return usersList.firstWhere((user) => user.id == userId);
    } catch (e) {
      // যদি user না পাওয়া যায়, তাহলে একটা default user return করুন
      return User(
        id: userId,
        name: 'User $userId',
        username: 'user$userId',
        email: 'user$userId@example.com',
        address: Address(
          street: 'Unknown Street',
          suite: 'Unknown Suite',
          city: 'Unknown City',
          zipcode: '00000',
          geo: Geo(lat: '0', lng: '0'),
        ),
        phone: '000-000-0000',
        website: 'example.com',
        company: Company(
          name: 'Unknown Company',
          catchPhrase: 'Unknown Catch Phrase',
          bs: 'Unknown BS',
        ),
      );
    }
  }

// User এর posts পাওয়ার মেথড
  List<PostDataModel> getPostsByUserId(int userId) {
    return homePostDataList.where((post) => post.userId == userId).toList();
  }

  Future<void> getHomePostInfo() async {
    isSupportPostLoading.value = true;
    try {
      ApiResponse apiResponse = await homeRepo.allPostData();
      debugPrint("===================== Get home post Data Response: ${apiResponse.response?.data}");

      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        List<dynamic> data = apiResponse.response!.data;
        homePostDataList.value = data.map((item) => PostDataModel.fromJson(item)).toList();
        for (var post in homePostDataList) {
          post.isBookmarked = false;
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load home post data',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      debugPrint("❌ Error: $e");
    } finally {
      isSupportPostLoading.value = false;
    }
  }

  // Toggle bookmark for a post
  void toggleBookmark(int postId) {
    final index = homePostDataList.indexWhere((post) => post.id == postId);
    if (index != -1) {
      homePostDataList[index].isBookmarked = !(homePostDataList[index].isBookmarked ?? false);
      homePostDataList.refresh();

      if (homePostDataList[index].isBookmarked == true) {
        bookmarkedPosts.add(postId);
      } else {
        bookmarkedPosts.remove(postId);
      }
    }
  }

  void likePost(int postId) {
    debugPrint('Liked post $postId');
  }

  // Search methods
  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  void clearSearch() {
    searchQuery.value = '';
    isSearching.value = false;
  }

  void toggleSearch() {
    isSearching.value = !isSearching.value;
    if (!isSearching.value) {
      searchQuery.value = '';
    }
  }

  // Filter posts based on search query
  List<PostDataModel> get filteredPosts {
    if (searchQuery.isEmpty) {
      return homePostDataList;
    }

    return homePostDataList.where((post) {
      final title = post.title?.toLowerCase() ?? '';
      final body = post.body?.toLowerCase() ?? '';
      final userName = post.userName?.toLowerCase() ?? '';
      final query = searchQuery.value.toLowerCase();

      return title.contains(query) ||
          body.contains(query) ||
          userName.contains(query);
    }).toList();
  }

  // Filter bookmarked posts based on search query
  List<PostDataModel> get filteredBookmarkedPosts {
    final bookmarked = homePostDataList
        .where((post) => post.isBookmarked == true)
        .toList();

    if (searchQuery.isEmpty) {
      return bookmarked;
    }

    return bookmarked.where((post) {
      final title = post.title?.toLowerCase() ?? '';
      final body = post.body?.toLowerCase() ?? '';
      final userName = post.userName?.toLowerCase() ?? '';
      final query = searchQuery.value.toLowerCase();

      return title.contains(query) ||
          body.contains(query) ||
          userName.contains(query);
    }).toList();
  }
}