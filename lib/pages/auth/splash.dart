import 'package:flutter/material.dart';
import 'package:lucy/pages/main/account/create_user.dart';
import 'package:lucy/pages/main/components/main_scaffold.dart';
import 'package:lucy/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart' as apple_sign_in;

class Splash extends StatelessWidget {
  final AuthService authService = AuthService();
  Splash({Key? key}) : super(key: key);

  Widget _getHeader() {
    return const Text("Lucy");
  }

  Widget _getSubHeaderText() {
    return const Text("Sampel Subheader Text");
  }

  Widget _getLogo() {
    return const Text("Logo here");
  }

  Widget _getAppleSignInButton(BuildContext context){
    return apple_sign_in.AppleSignInButton(
      style: apple_sign_in.ButtonStyle.black,
      type: apple_sign_in.ButtonType.signIn,
      onPressed: () => _signInWithApple(context),
    );
  }

  Future<void> _signInWithApple(BuildContext context) async {
    bool isSuccess = true;
    try{
      var user = await authService.signInWithApple(
          scopes: [
            apple_sign_in.Scope.email,
            apple_sign_in.Scope.fullName]);
    } catch(e){
      isSuccess = !isSuccess;
    }
    if(isSuccess){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => CreateUser()),
              (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getHeader(),
            _getLogo(),
            _getSubHeaderText(),
            _getAppleSignInButton(context)
          ],
        ),
      ),
    );
  }
}
