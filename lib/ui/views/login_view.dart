import 'package:flutter/material.dart';
import 'package:provider_guide/ui/views/base_view.dart';
import 'package:provider_guide/ui/widgets/login_header.dart';
import '../../core/enums/viewstate.dart';
import '../../core/viewmodels/login_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("Login View")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoginHeader(
                textController: _textController,
                errorMessage: model.errorMessage,
              ),
              model.getState == ViewState.idle
                  ? ElevatedButton(
                      onPressed: () async {
                        var loginSuccess =
                            await model.login(_textController.text.trim());
                        if (loginSuccess) {
                          if (!mounted) return;
                          Navigator.pushNamed(context, "/");
                        }
                      },
                      child: const Text("Login"),
                    )
                  : const CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
