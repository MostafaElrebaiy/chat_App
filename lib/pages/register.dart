import 'package:chatapp/pages/cubits/register_cubit/cubit/register_cubit.dart';
import 'package:chatapp/pages/cubits/register_cubit/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/costants.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class RegisterScreen extends StatelessWidget {
  String? email;

  String? password;

  bool isLoading=false;

  GlobalKey<FormState> formkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterState>(
      listener: (context,state){
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, 'ChatScreen');
          isLoading = false;
        } else if (state is RegisterFailure) {
          showsnackbar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context,state){
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: KPrimaryColor,
            body: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkey,
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Image.asset(
                        "assets/images/scholar.png",
                        height: 100,
                      ),
                      Center(
                        child: const Text("Scholar Chat",
                            style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Pacifico',
                                color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          Text("Register",
                              style: TextStyle(fontSize: 24, color: Colors.white)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                        obscuretext: false,
                        onChanged: (data) {
                          email = data;
                        },
                        hinttext: 'Email',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextfield(
                        obscuretext: false,
                        onChanged: (data) {
                          password = data;
                        },
                        hinttext: 'Password',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        ontap: () async {
                          var auth = FirebaseAuth.instance;

                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context).registerUser(email: email!, password: password!);
                          }else{

                          }

                        },
                        name: 'REGISTER',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "already have an account ",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text("sign in",
                                  style: TextStyle(color: Color(0xffC7EDE6)))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

      },
    );
  }



  Future<void> registerUser(FirebaseAuth auth) async {
     UserCredential user =
        await auth.createUserWithEmailAndPassword(
            email: email!, password: password!);
  }
}
