import 'package:blog/screens/extensions/app_theme.dart';
import 'package:blog/screens/extensions/strings.dart';
import 'package:blog/screens/extensions/extensions.dart';
import 'package:blog/screens/navigation/flow_state.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  static Page page() => const MaterialPage(child: SignupPage());

  const SignupPage({super.key});

  @override
  SignupFormState createState() => SignupFormState();
}

class SignupFormState extends State<SignupPage> {
  late SharedPreferences prefs;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _repeatEmailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(Strings.signUp),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Strings.email,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: context.inputDecoration(Strings.emailHint),
                      validator: (value) {
                        return value.validateEmail(
                            repeatEmail: _repeatEmailController.text);
                      },
                    ),
                    const SizedBox(height: 30),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Strings.reEnterEmail,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _repeatEmailController,
                      decoration: context.inputDecoration(Strings.email),
                      validator: (value) {
                        return value.validateRepeatEmail(_emailController.text);
                      },
                    ),
                    const SizedBox(height: 30),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          Strings.password,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      decoration: context.inputDecoration(Strings.passwordHint),
                      obscureText: true,
                      validator: (value) {
                        return value.validatePassword();
                      },
                    ),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String email = _emailController.text;
                          prefs.setString('email', email);
                          context
                              .flow<FlowState>()
                              .update((_) => FlowState.home);
                        }
                      },
                      style: AppTheme.elevatedButtonStyle,
                      child: const Text(
                        Strings.signUpButton,
                        style: AppTheme.authButtonText,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
