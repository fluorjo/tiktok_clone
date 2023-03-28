import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok_clone/features/users/models/user_profile_model.dart';
import 'package:tiktok_clone/features/users/repos/user_repo.dart';
import 'package:tiktok_clone/features/authentication/view_models/signup_view_model.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _usersRepository;
  late final AuthenticationRepository _authenticationRepository;

  @override
  FutureOr<UserProfileModel> build() async {
    _usersRepository = ref.read(userRepo);
    _authenticationRepository = ref.read(authRepo);

    if (_authenticationRepository.isLoggedIn) {
      final profile = await _usersRepository
          .findProfile(_authenticationRepository.user!.uid);
      if (profile != null) {
        return UserProfileModel.fromJson(profile);
      }
    }
    return UserProfileModel.empty();
  }

  Future<void> createProfile(UserCredential userCredential) async {
    final form = ref.read(signUpForm);
    state = const AsyncValue.loading();
    final profile = UserProfileModel(
      hasAvatar: false,
      bio: form['bio'],
      link: "undefined",
      uid: userCredential.user!.uid,
      name: form['name'] ?? userCredential.user!.displayName ?? 'Anon',
      email: userCredential.user!.email ?? 'anon@anon.com',
    );
    await _usersRepository.createProfile(profile);
    state = AsyncValue.data(
      profile,
    );
  }

  Future<void> onAvatarUpload() async {
    if (state.value == null) return;
    
      state = AsyncValue.data(state.value!.copyWith(hasAvatar: true));
      await _usersRepository.updateUser(state.value!.uid, {"hasAvatar": true});
  
  }
}

final usersProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
