import 'package:flutter/material.dart';
import 'package:mob_app/Theme/app_colors.dart';
import 'package:mob_app/Widgets/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColor.darkBlueColor),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColor.darkBlueColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        "/auth": (context) => const AuthWidget(),
        "/main_screen": (context) => const MainScreenWidget(),
      },
      initialRoute: "/auth",
    );
  }
}

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          InputWidget(),
          HeadersWidget(),
        ],
      ),
    );
  }
}

class HeadersWidget extends StatelessWidget {
  const HeadersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("first"),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          onPressed: () {},
          child: const Text('Register'),
        ),
        const Text(
            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using"),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: const Text('Verify email'),
        ),
      ],
    );
  }
}

class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth() {
    final _login = _loginTextController.text;
    final _password = _passwordTextController.text;
    if (_login == 'admin' && _password == 'admin') {
      errorText = null;
      final navigation = Navigator.of(context);

      navigation.pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Incorrect login or password';
      print("error");
    }
    setState(() {});
  }

  void _reset_password() {
    print('reset paswword');
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) Text(errorText),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Login",
        ),
        TextField(
          controller: _loginTextController,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Password"),
        TextField(
          controller: _passwordTextController,
          decoration: const InputDecoration(border: OutlineInputBorder()),
          obscureText: true,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                _auth();
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                _reset_password();
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Text'),
        const Text(
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using , making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for '),
      ],
    );
  }
}
