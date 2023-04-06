import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/inbox/repos/messages_repo.dart';

//AsyncNotifierFamily 사용하게 될 수도 있음. 특정 채팅방의 뷰 모델을 만들어야 하므로.
class MessagesViewModel extends AsyncNotifier<void> {
  late final MessagesRepo _repo;

  @override
  FutureOr<void> build() {

    _repo = ref.read(messagesRepo);
  }

  Future<void> sendMessage(String text){

  }
}
