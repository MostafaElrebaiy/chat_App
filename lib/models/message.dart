import '../constants/costants.dart';

class Message {
  final dynamic message;
  final dynamic id;

  Message(this.message, this.id);
  factory Message.fromjson(jsonData) {
    return Message(jsonData[KMessage],jsonData[KId]);
  }
}
