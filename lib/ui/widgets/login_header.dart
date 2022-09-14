import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key, required this.textController, this.errorMessage})
      : super(key: key);

  final TextEditingController textController;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Login",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text("Enter a number between 1 - 10"),
        LoginTextField(textController: textController),
        const SizedBox(height: 10),
        Text(
          errorMessage!,
          style: const TextStyle(color: Colors.red),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class LoginTextField extends StatelessWidget {
  const LoginTextField({Key? key, required this.textController})
      : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: const InputDecoration(hintText: "Enter digit"),
        controller: textController,
      ),
    );
  }
}
