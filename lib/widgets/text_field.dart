import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration inputFormat(BuildContext context, {required String label}) {
  return InputDecoration(
    errorStyle: const TextStyle(color: Colors.white),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    filled: true,
    fillColor: Colors.white,
    labelText: label,
    border: OutlineInputBorder(
      borderSide:
      const BorderSide(color: Colors.white, width: 2, style: BorderStyle.none),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

bool validateSignUpForm({required String name, required String email, required String password}) {
  if (name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      password.length >= 6) return true;

  return false;
}

bool validateSignInForm({required String email, required String password}) {
  if (email.isNotEmpty && password.isNotEmpty && password.length >= 6) {
    return true;
  }

  return false;
}

inputFormat2(BuildContext context, {String label = 'null'}) {
  return InputDecoration(
    border: InputBorder.none,
    // filled: true,
    fillColor: Colors.white,
    hintText: label,
    hintStyle: const TextStyle(color: Colors.black45),
    contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
    labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 18),
    isDense: true,
  );
}

bool validateAndSaveForm(GlobalKey<FormState> formKey) {
  final form = formKey.currentState;
  if (form!.validate()) {
    form.save();

    return true;
  }
  return false;
}

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final Function(dynamic)? onSave;
  final bool readOnly;
  final String? initialValue;
  final int maxLines;
  const CustomTextFormField({super.key,
    this.label,
    this.onSave,
    this.readOnly = false,
    this.initialValue,
    this.maxLines = 1,
  }) ;
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null; // Return null if the input is valid
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.012.sh),
      child: Container(
        margin: const EdgeInsets.only(top: 0, left: 10, right: 10),
        child: TextFormField(
          maxLines: maxLines,
          initialValue: initialValue,
          onSaved: onSave,
          validator: validate,
          readOnly: readOnly,
          decoration: inputFormat2(context, label: label!),
        ),
      ),
    );
  }
}
