import 'package:flutter/material.dart';
import 'package:st/src/ui/theme/theme.dart';
import 'package:st/src/ui/widgets/global_spacer.dart';
import 'package:st/src/ui/widgets/global_text_form_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
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
              'Login',
              style: AppTheme.header2TextStyle,
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
              // errorText: 'password is required',
              controller: password,
              onChanged: (String password) {print(password);},
              enabled: true,
              focusNode: emailFocusNode,
              obscureText: true,
              onEditingComplete: () {},
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
              suffix: InkWell(child: const Icon(Icons.password, color: Colors.indigo,), onTap: (){}),
            ),
            // spaceBetweenFields(),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: TextButton(
                    onPressed: () {},
                    child: const Text('Forget your password?'))),
            // spaceBetweenFields(),
            //login with email button
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xfff022741)),
                    onPressed: () {},
                    child: const Text('Login'))),
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
            spaceBetweenFields(),
            SizedBox(
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
                const Text('Don\'t have an account? '),
                TextButton(onPressed: () {}, child: const Text('Register')),
              ],
            ),
            spaceBetweenFields(),
          ],
        ),
      ),
    );
  }
}
