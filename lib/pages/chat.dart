import 'package:chatapp/constants/costants.dart';
import 'package:chatapp/pages/cubits/chat_cubit/chat_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/message.dart';
import '../widgets/custom_chat_buble.dart';

class ChatScreenS extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();
  List<Message> messagesList = [];
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              KLogo,
              height: 50,
            ),
            Text("Chat")
          ],
        ),
        centerTitle: true,
        backgroundColor: KPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubitCubit, ChatCubitState>(
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubitCubit>(context).messagesList;
                return ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? ChatBuble(
                            message: messagesList[index],
                          )
                        : ChatBubleForFrind(message: messagesList[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                controller.clear();
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.send,
                    color: KPrimaryColor,
                  ),
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: KPrimaryColor,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
