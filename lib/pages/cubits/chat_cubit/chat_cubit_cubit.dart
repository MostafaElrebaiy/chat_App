import 'dart:ffi';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:chatapp/constants/costants.dart';
import 'package:chatapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_cubit_state.dart';

class ChatCubitCubit extends Cubit<ChatCubitState> {
  ChatCubitCubit() : super(ChatCubitInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessageCollections);
  List<Message> messagesList = [];

  void sendMessage({required String message, required String email}) {
    messages.add({KMessage: message, kCreatedAt: DateTime.now(), 'id': email});
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromjson(doc));
      }

      print(' success');
      emit(ChatCubitSucccess(messages: messagesList));
    });
  }
}
