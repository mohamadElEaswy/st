import 'package:flutter/material.dart';
import 'package:st/src/core/navigation/navigation_methods.dart';
import 'package:st/src/ui/theme/theme.dart';
import 'package:st/src/ui/widgets/global_spacer.dart';
import 'package:st/src/ui/widgets/global_text_form_widget.dart';
const String _pageTitle = 'Register';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const String route = '/register';

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController name = TextEditingController();
    final TextEditingController password = TextEditingController();
    final FocusNode nameFocusNode = FocusNode();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceBetweenFields(),
            const Text(
              _pageTitle,
              style: AppTheme.header2TextStyle,
            ),
            spaceBetweenFields(),
            //user name input filed
            GlobalTextFormField(
              iconData: Icons.person_outline_rounded,
              lable: 'user name',
              hintText: 'Ahmed ',
              errorText: 'name is required',
              controller: name,
              onChanged: (String name) {},
              enabled: false,
              focusNode: emailFocusNode,
              obscureText: false,
              onEditingComplete: () {},
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.text,
            ),
            spaceBetweenFields(),
            //email input filed
            GlobalTextFormField(
              iconData: Icons.email,
              lable: 'email',
              hintText: 'info@gmail.com',
              errorText: 'email is required',
              controller: email,
              onChanged: (String email) {},
              enabled: false,
              focusNode: emailFocusNode,
              obscureText: false,
              onEditingComplete: () {},
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
            ),
            spaceBetweenFields(),
            GlobalTextFormField(
              iconData: Icons.password,
              lable: 'password',
              hintText: '*********',
              errorText: 'password is required',
              controller: password,
              onChanged: (String password) {},
              enabled: false,
              focusNode: emailFocusNode,
              obscureText: false,
              onEditingComplete: () {},
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
              suffix: const Icon(Icons.password),
            ),
            // spaceBetweenFields(),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value){print(value.toString());}),
                const Text('Agree on'),
                TextButton(
                    onPressed: () {},
                    child: const Text('Terms and conditions')),
              ],
            ),
            // spaceBetweenFields(),
            //login with email button
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xfff022741)),
                    onPressed: () {},
                    child: const Text(_pageTitle))),
            spaceBetweenFields(),
            const Center(child: Text('or')),
            spaceBetweenFields(),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white, elevation: 0.5),
                    onPressed: () {},
                    child: const Text('Login with GOOGLE',
                        style: TextStyle(color: Colors.black)))),
            spaceBetweenFields(),SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo, elevation: 0.5),
                    onPressed: () {},
                    child: const Text('Login with FaceBook',
                        style: TextStyle(color: Colors.white)))),
            spaceBetweenFields(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Do you have an account?'),
                TextButton(onPressed: () =>RouteMethods.navigateTo(context: context, routeName: RegisterPage.route), child: const Text('Login')),
              ],
            ),spaceBetweenFields(),
          ],
        ),
      ),
    );
  }
}
