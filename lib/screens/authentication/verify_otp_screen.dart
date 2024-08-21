import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:transporter/data/cubits/authentication/auth_cubit.dart';
import 'package:transporter/data/repositories/user_repository.dart';
import 'package:transporter/generated/l10n.dart';
import 'package:transporter/screens/authentication/new_password_screen.dart';
import 'package:transporter/templates/responsive_layout.dart';
import 'package:transporter/values/colors.dart';
import 'package:transporter/values/constants.dart';
import 'package:transporter/values/dimensions.dart';
import 'package:transporter/values/styles.dart';
import 'package:transporter/widgets/common/visual/generic_header.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});
  static const routeName = '/authentication/verify-otp';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(userRepository: context.read<UserRepository>()),
      child: const VerificationScreenView(),
    );
  }
}

class VerificationScreenView extends StatelessWidget {
  const VerificationScreenView({super.key});

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
        child: VerificationForm(),
      ),
    );
  }
}

class VerificationForm extends StatefulWidget {
  const VerificationForm({super.key});

  @override
  _VerificationFormState createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  final _pinInputController = TextEditingController();
  final _pinInputFocusNode = FocusNode();
  String _pinInputValue = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.of(context).verify_phone_heading,
                style: Styles.mediumBlackTitle,
              ),
              const SizedBox(height: 8),
              Text(
                Strings.of(context).verify_phone_subheading,
                style: Styles.regularGreyParagraph,
              ),
              const SizedBox(height: 24),
              _buildPinInput(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Strings.of(context).verify_didnt_receive_label,
                    style: Styles.smallLightBlackText,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle resend logic
                    },
                    child: Text(
                      Strings.of(context).verify_resend_label,
                      style: Styles.normalGreenTextStyle,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.tGreen,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    await context.read<AuthCubit>().verifyOTP(
                          _pinInputValue,
                        );

                    if (context.read<AuthCubit>().state
                        is AuthenticationFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            Strings.of(context).invalid_otp_verification,
                            style: Styles.mediumWhiteText,
                          ),
                          backgroundColor: AppColors.tRed,
                        ),
                      );
                    } else if (context.read<AuthCubit>().state
                        is Authenticated) {
                      await Navigator.push(
                        context,
                        MaterialPageRoute<Material>(
                          builder: (context) => const SetNewPasswordScreen(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    Strings.of(context).verify_button_label,
                    style: Styles.mediumWhiteText,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPinInput() => Container(
        padding: const EdgeInsets.only(bottom: Dimensions.marginMedium),
        child: Builder(
          builder: (context) => Center(
            child: Container(
              constraints:
                  const BoxConstraints.expand(height: Constants.inputHeight),
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.marginLarge,
              ),
              child: PinPut(
                key: const Key('pin_put'),
                textStyle: Styles.h5HeadingBlack,
                fieldsCount: 5,
                eachFieldMargin: EdgeInsets.zero,
                eachFieldPadding: EdgeInsets.zero,
                eachFieldHeight: Constants.inputHeight,
                eachFieldWidth: Constants.inputWidth,
                onChanged: (String pin) {
                  setState(() {
                    if (_pinInputValue.length == 4 && pin.length == 5) {
                      _pinInputFocusNode.unfocus();
                    }
                    _pinInputValue = _pinInputController.text;
                  });
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (!_validate(value)) return '';
                  return null;
                },
                focusNode: _pinInputFocusNode,
                controller: _pinInputController,
                submittedFieldDecoration: Styles.pinPutDecoration,
                selectedFieldDecoration: Styles.selectedPinPutDecoration,
                followingFieldDecoration: Styles.pinPutDecoration,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
          ),
        ),
      );

  bool _validate(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }
}
