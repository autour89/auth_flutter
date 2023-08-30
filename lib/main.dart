import 'package:blog/screens/navigation/flow_state.dart';
import 'package:blog/screens/auth/login.dart';
import 'package:blog/screens/auth/signup.dart';
import 'package:blog/screens/extensions/strings.dart';
import 'package:blog/screens/home.dart';
import 'package:blog/screens/welcome.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.blog,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FlowBuilder<FlowState>(
        state: FlowState.welcome,
        onGeneratePages: (state, pages) {
          switch (state) {
            case FlowState.login:
              return [WelcomePage.page(), LoginPage.page()];
            case FlowState.signup:
              return [WelcomePage.page(), SignupPage.page()];
            case FlowState.home:
              return [HomePage.page()];
            default:
              return [WelcomePage.page()];
          }
        },
        onComplete: (state) {},
      ),
    );
  }
}
