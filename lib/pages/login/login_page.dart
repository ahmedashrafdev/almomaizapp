import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../components/custom_button.dart';
import '../../components/custom_icons.dart';
import '../../components/social_icon.dart';
import '../../components/text_form_field.dart';
import '../../routes/routes.dart';
import '../../utils/constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 80,
                        ),
                      ),
                      Text(
                        'sign_in'.tr(),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      WidgetSignin(),
                      Expanded(
                        child: SizedBox(
                          height: 20,
                        ),
                      ),
                      SafeArea(
                        child: Center(
                          child: Wrap(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  'dont_have_an_account'.tr(),
                                  style: TextStyle(
                                    color: Color(0xffbcbcbc),
                                    fontSize: 12,
                                    fontFamily: 'NunitoSans',
                                  ),
                                ),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(2),
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.signup);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    'register_now'.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        .copyWith(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class WidgetSignin extends StatefulWidget {
  @override
  _WidgetSigninState createState() => _WidgetSigninState();
}

class _WidgetSigninState extends State<WidgetSignin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'email_dot'.tr(),
          style: kInputTextStyle,
        ),
        CustomTextFormField(
          controller: _emailController,
          hintText: 'bhr.tawfik@gmail.com',
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'password_dot'.tr(),
          style: kInputTextStyle,
        ),
        CustomTextFormField(
          controller: _passwordController,
          hintText: '* * * * * *',
          obscureText: true,
        ),
        SizedBox(
          height: 35,
        ),
        CustomButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed(Routes.home);
          },
          text: 'login'.tr(),
        )
      ],
    );
  }
}
