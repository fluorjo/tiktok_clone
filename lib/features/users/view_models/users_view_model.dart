import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';
import 'package:tiktok_clone/features/users/repos/user_repo.dart';
import 'package:tiktok_clone/features/authentication/view_models/signup_view_model.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _repository;

  @override
  FutureOr<UserProfileModel> build() {
    _repository = ref.read(userRepo);
    return UserProfileModel.empty();
  }

  Future<void> createProfile(UserCredential userCredential) async {
    final form = ref.read(signUpForm);
    state = const AsyncValue.loading();
    final profile = UserProfileModel(
      bio: form['bio'],
      link: "undefined",
      uid: userCredential.user!.uid,
      username: form['username'] ?? userCredential.user!.displayName ?? 'Anon',
      email: userCredential.user!.email ?? 'anon@anon.com',
    );
    await _repository.createProfile(profile);
    state = AsyncValue.data(
      profile,
    );
  }
}

final usersProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
