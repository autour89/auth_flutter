import 'package:blog/screens/navigation/flow_state.dart';
import 'package:blog/screens/extensions/app_theme.dart';
import 'package:blog/screens/extensions/strings.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  static Page page() => const MaterialPage(child: WelcomePage());

  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(Strings.welcome),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    context.flow<FlowState>().update((_) => FlowState.signup);
                  },
                  style: AppTheme.elevatedButtonStyle,
                  child: const Text(
                    Strings.signUpButton,
                    style: AppTheme.authButtonText,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.flow<FlowState>().update((_) => FlowState.login);
                },
                style: AppTheme.elevatedButtonStyle,
                child: const Text(
                  Strings.loginButton,
                  style: AppTheme.authButtonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
