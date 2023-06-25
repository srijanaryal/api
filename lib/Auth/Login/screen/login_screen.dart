import 'package:flutter/material.dart';
import 'package:flutter_learning/Auth/Login/entity/login_model.dart';
import 'package:flutter_learning/Auth/store/auth_store.dart';
import 'package:flutter_learning/shared/constants/fonts/size_config.dart';
import 'package:flutter_learning/shared/text_widgets/build_text.dart';
import 'package:flutter_learning/shared/widget/app_button.dart';
import 'package:flutter_learning/shared/widget/custom_loader.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:provider/provider.dart';

import '../../../project/post/screen/post_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "LoginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //height and width
  double height = 0.0;
  double width = 0.0;

  //store
  AuthStore authStore = AuthStore();

  //text Editing controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    authStore = Provider.of<AuthStore>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    height = SizeConfig.safeBlockVertical!;
    width = SizeConfig.safeBlockHorizontal!;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          _createBody(),
          Observer(
            builder: (context) {
              return Visibility(
                visible: authStore.isLoginLoading,
                child: const CustomProgressIndicatorWidget(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _createBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: BuildTextFieldBorder(
              containerWidth: width * 80,
              label: "Email",
              width: width,
              keyBoardType: TextInputType.emailAddress,
              controller: emailController),
        ),
        BuildTextFieldBorder(
            containerWidth: width * 80,
            label: "Password",
            width: width,
            obscureText: true,
            keyBoardType: TextInputType.text,
            controller: passwordController),
        SizedBox(height: height * 5),
        AppButton(
          buttonWidth: width * 80,
          title: "Login",
          onTap: () => _login(),
        )
      ],
    );
  }

  //methods
  _login() async {
    LoginModel model = LoginModel(
        username: emailController.text, password: passwordController.text);
    await authStore.login(model);

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const PostScreen()));
  }
}
