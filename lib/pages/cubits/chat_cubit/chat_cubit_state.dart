part of 'chat_cubit_cubit.dart';

@immutable
abstract class ChatCubitState {}

class ChatCubitInitial extends ChatCubitState {}

class ChatCubitSucccess extends ChatCubitState {
  List<Message> messages;
  ChatCubitSucccess({required this.messages});
}
