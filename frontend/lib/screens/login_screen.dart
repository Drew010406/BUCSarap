import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/constants.dart';
import 'package:frontend/models/owner_model.dart';
import 'package:frontend/providers/dio_provider.dart';
import 'package:frontend/providers/owner_provider.dart';
import 'package:frontend/providers/owner_stall_provider.dart';
import 'package:frontend/services/auth/auth_service.dart';

import '../shared/back_button_container.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dio = ref.watch(dioProvider);
    final authService = AuthService(dio: dio);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Color(0xFFEFE2D3),
        leadingWidth: 140,
        leading: BackButtonContainer(
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 150,
            bottom: 250,
            left: 40,
            right: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 30, fontFamily: "flame"),
              ),
              Expanded(flex: 1, child: SizedBox()),
              TextField(
                controller: usernameController,
                style: TextStyle(color: Colors.black, fontFamily: "Flame"),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.0,
                    ),
                  ),
                  hintStyle: TextStyle(color: Colors.black45),
                  hintText: 'Username',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.black, fontFamily: "Flame"),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.brown,
                      width: 0.0,
                    ),
                  ),
                  hintStyle: TextStyle(color: Colors.black45),
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () async {
                  try {
                    final response = await authService.loginUser(
                      OwnerModel(
                        username: usernameController.text,
                        password: passwordController.text
                      )
                    );
                    if(response.statusCode == 200) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Login successful!'),
                          ),
                        );
                      }
                      ref.watch(ownerNotifierProvider.notifier).addOwner(response.data["owner_id"]);
                      Navigator.pushNamed(context, '/stall_holder_screen');
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
                  }
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFDA782B),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Flame",
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
