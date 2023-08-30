import 'package:blog/screens/navigation/flow_state.dart';
import 'package:blog/screens/extensions/app_theme.dart';
import 'package:blog/screens/extensions/strings.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static Page page() => const MaterialPage(child: HomePage());

  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(Strings.home),
      ),
      body: FutureBuilder<SharedPreferences>(
        future: prefs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var prefs = snapshot.data as SharedPreferences;
            String? email = prefs.getString('email');

            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  _buildUserInfo(email),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context
                            .flow<FlowState>()
                            .update((_) => FlowState.welcome);
                      },
                      style: AppTheme.elevatedButtonStyle,
                      child: const Text(
                        Strings.logOut,
                        style: AppTheme.authButtonText,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Text _buildUserInfo(String? email) {
    var info = '${Strings.loggedIn}  ${email!}';
    return Text(
      info,
      style: const TextStyle(fontSize: 18),
    );
  }
}
