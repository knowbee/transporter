import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/new_password_screen.dart';
import 'package:transporter/screens/authentication/signup_screen.dart';
import 'package:transporter/screens/home.dart';
import 'package:transporter/templates/responsive_layout.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/input/custom_button.dart';
import 'package:transporter/widgets/common/input/custom_form_field.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const routeName = '/authentication/signin';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(userRepository: context.read<UserRepository>())
        ..checkAuthState(),
      child: const SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: GenericHeader(
          backLabel: Strings.of(context).header_back_label,
        ),
      ),
      body: const ResponsiveLayout(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: SignInForm(),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          if (state.user.password == null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const SetNewPasswordScreen(),
              ),
            );
          } else if (state.user.isLoggedIn == true) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => HomePage(
                  user: state.user,
                ),
              ),
            );
          }
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              Strings.of(context).signin_heading,
              style: Styles.mediumBlackTitle,
            ),
            const SizedBox(height: 30),
            _buildEmailField(),
            const SizedBox(height: 16),
            _buildPasswordField(),
            _buildForgotPasswordButton(),
            const SizedBox(height: 24),
            _buildSignInButton(),
            const SizedBox(height: 24),
            _buildOrDivider(),
            const SizedBox(height: 50),
            _buildSignUpPrompt(),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TFormField(
      key: const Key('password_field'),
      fieldType: FieldType.password,
      labelText: Strings.of(context).signin_password_label,
      labelStyle: Styles.regularGreyParagraph,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Dimensions.marginDefault,
        horizontal: Dimensions.marginDefault,
      ),
      isObscured: _isObscured,
      hasSuffixIcon: true,
      suffixIcon: IconButton(
        icon: Icon(
          color: AppColors.greyIconColor,
          _isObscured
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
        onPressed: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).signin_password_validation_label;
        }
        return null;
      },
      controller: _passwordController,
    );
  }

  Widget _buildEmailField() {
    return TFormField(
      fieldType: FieldType.textField,
      labelText: Strings.of(context).signin_email_or_phone,
      labelStyle: Styles.regularGreyParagraph,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Dimensions.marginDefault,
        horizontal: Dimensions.marginDefault,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return Strings.of(context).signin_validation_email_or_phone;
        }
        return null;
      },
      controller: _identifierController,
    );
  }

  Widget _buildForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const SetNewPasswordScreen(),
              ),
            );
          },
          child: Text(
            Strings.of(context).signin_forgot_password_label,
            style: Styles.mediumRedHintText,
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton() {
    return SizedBox(
      width: double.infinity,
      child: TButton(
        key: const Key('sign_in_button'),
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            await context.read<AuthCubit>().logIn(
                  email: _identifierController.text,
                  password: _passwordController.text,
                );
            if (context.read<AuthCubit>().state == AuthenticationFailed() ||
                context.read<AuthCubit>().state == Unauthenticated()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    Strings.of(context).invalid_credentials_error_message,
                    style: Styles.mediumWhiteText,
                  ),
                  backgroundColor: AppColors.tRed,
                ),
              );
            } else if (context.read<AuthCubit>().state is Authenticated) {
              await Navigator.push(
                context,
                MaterialPageRoute<Material>(
                  builder: (context) => const HomePage(),
                ),
              );
            }
          }
        },
        title: Strings.of(context).signin_label,
      ),
    );
  }

  Widget _buildSignUpPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(Strings.of(context).signin_dont_have_account_label),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<Material>(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
          child: Text(
            Strings.of(context).signup_button_label,
            style: Styles.normalGreenTextStyle,
          ),
        ),
      ],
    );
  }

  Widget _buildOrDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.greyIconColor,
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              Strings.of(context).or_separator,
              style: Styles.orSeparatorTextStyle,
            ),
          ),
          const Expanded(
            child: Divider(
              color: AppColors.greyIconColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
