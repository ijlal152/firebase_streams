import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String title;

  const TextFormFieldWidget({
    super.key,
    required this.title,
  });

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              //buildEmail(),
              const SizedBox(height: 32),
              buildPassword(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      );
}

buildEmail(controller, hintText, labelText) => TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
          labelText: 'Email',
          border: const OutlineInputBorder(),
          hintText: hintText,
          label: labelText),
      validator: (value) {
        const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
        final regExp = RegExp(pattern);

        if (value!.isEmpty) {
          return 'Enter an email';
        } else if (!regExp.hasMatch(value)) {
          return 'Enter a valid email';
        } else {
          return null;
        }
      },

      // onSaved: (value) => setState(() => email = value!),
    );

setState(String Function() param0) {}

buildPassword() => TextFormField(
      keyboardType: TextInputType.text,

      ///  controller: Controller,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.visibility),
      ),
      validator: (value) {
        if (value!.length < 7) {
          return 'Password must be at least 7 characters long';
        } else {
          return null;
        }
      },
      
      // onSaved: (value) => setState(() => password = value!),
    );

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  String labelText;
  var controller = TextEditingController();
  final bool isForPassword;
  CustomTextFormField({
    Key? key,
    this.hintText = '',
    this.labelText = '',
    required this.controller,
    this.isForPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
