import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home_page.dart';

class MyAppLoginPage extends StatefulWidget {
  const MyAppLoginPage({super.key});

  @override
  State<MyAppLoginPage> createState() => _MyAppLoginPageState();
}

class _MyAppLoginPageState extends State<MyAppLoginPage> {
  static const int loginTap = 0;
  static const int signUpTab = 1;
  int selectedTabIndex = loginTap;

  @override
  Widget build(BuildContext context) {
    final tabTextStyle = TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32, top: 55),
              child: Icon(Icons.account_circle, size: 100, color: Colors.blue),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    color: Colors.blue),
                child: Column(children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTabIndex = loginTap;
                            });
                          },
                          child: Text(
                            "Login".toUpperCase(),
                            style: tabTextStyle.apply(
                              color: selectedTabIndex == loginTap
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              selectedTabIndex = signUpTab;
                            });
                          },
                          child: Text("Sign Up".toUpperCase(),
                              style: tabTextStyle.apply(
                                  color: selectedTabIndex == signUpTab
                                      ? Colors.white
                                      : Colors.white54)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: selectedTabIndex == loginTap
                              ? _Login()
                              : _SignUp(),
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatefulWidget {
  const _Login();

  @override
  State<_Login> createState() => _LoginState();
}

class _LoginState extends State<_Login> {
  bool isLoading = false;

  void _handleLogin() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome back",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          "Sign in with your account",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 16),
        TextField(decoration: InputDecoration(label: Text("Username"))),
        PasswordTextField(),
        SizedBox(height: 10),

        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: isLoading
              ? Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                )
              : ElevatedButton(
                  key: ValueKey("loginButton"),
                  onPressed: _handleLogin,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 60),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                  ),
                  child: Text("Login".toUpperCase()),
                ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Forgot your password?"),
            TextButton(onPressed: () {}, child: Text("Reset here"))
          ],
        ),
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome To Our App",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          "Please enter your information",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 16),
        TextField(decoration: InputDecoration(label: Text("Fullname"))),
        TextField(decoration: InputDecoration(label: Text("Username"))),
        PasswordTextField(),
        SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60),
                ),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ))),
            child: Text("Sign up".toUpperCase())),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obscureText,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          label: Text("Password"),
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
        ));
  }
}
