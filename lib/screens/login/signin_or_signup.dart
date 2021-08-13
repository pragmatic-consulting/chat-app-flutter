import 'package:chatapp/components/primary_button.dart';
import 'package:chatapp/constants.dart';
import 'package:chatapp/models/SignupUser.dart';
import 'package:chatapp/screens/chats/chats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SigninOrSignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final user = SignupUser();
  final nameFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/welcome_image.png"
                    : "assets/images/welcome_image.png",
                height: 146,
              ),
              Spacer(),
              Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enterez votre nom',
                      labelText: 'Nom',
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(30)],
                    validator: (userName) {
                      if (userName!.isEmpty) {
                        return 'Name is required';
                      }
                      if (userName.length < 3) {
                        return 'Name is too short';
                      }
                      return null;
                    },
                    onSaved: (userName) {
                      user.name = userName as String;
                    },
                  )),
              SizedBox(height: 24.0),
              PrimaryButton(text: "Sign In", press: () => _submitForm(context)),
              SizedBox(height: kDefaultPadding * 1.5),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    final FormState form = _formKey.currentState as FormState;

    if (form.validate()) {
      form.save();
      print('New user saved with signup data:\n');
      print(user.toJson());
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatsScreen(user),
        ),
      );
    }
  }
}
