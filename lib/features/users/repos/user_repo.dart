import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

//create profile
  Future<void> createProfile(UserProfileModel profile) async {
    
  }
//get profile

//update profile - avatar
//update profile - bio
//update profile - link
}

final userRepo = Provider((ref) => UserRepository());
