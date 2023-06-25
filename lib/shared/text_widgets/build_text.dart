import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learning/shared/constants/color_constants.dart';
import 'package:flutter_learning/shared/constants/fonts/font_constants.dart';

class BuildText extends StatelessWidget {
  const BuildText(
      {Key? key,
      this.text = "",
      this.fontSize,
      this.color = ColorConstants.fontGreyColor,
      this.weight = FontWeight.w400,
      this.family,
      this.height = 1,
      this.decoration = TextDecoration.none,
      this.textAlign = TextAlign.start,
      this.maxLines = 4,
      this.italics = false})
      : super(key: key);

  final String text;
  final double? fontSize;
  final double height;
  final Color? color;
  final FontWeight weight;
  final TextDecoration decoration;
  final TextAlign textAlign;
  final int maxLines;
  final bool italics;
  final String? family;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: weight,
        fontSize: fontSize,
        height: height,
        color: color,
        fontStyle: italics ? FontStyle.italic : FontStyle.normal,
        decoration: decoration,
        fontFamily: family,
      ),
    );
  }
}

class BuildTextFieldBorder extends StatefulWidget {
  const BuildTextFieldBorder(
      {Key? key,
      required this.width,
      this.label = '',
      this.suffixText,
      required this.containerWidth,
      this.containerHeight,
      required this.keyBoardType,
      this.trailingIcon = false,
      this.obscureText = false,
      this.validator,
      this.textAction = TextInputAction.done,
      this.readOnly = false,
      required this.controller,
      this.textInputFormatter = const <TextInputFormatter>[],
      this.fontSize = 14,
      this.weight = FontWeight.w300,
      this.floatingLabelBehavior = FloatingLabelBehavior.auto,
      this.prefixIcon,
      this.enabled = true,
      this.onChanged,
      this.underline = false})
      : super(key: key);

  final double width;
  final double fontSize;
  final FontWeight weight;

  final double containerWidth;
  final double? containerHeight;
  final String label;
  final String? suffixText;
  final TextInputType keyBoardType;
  final bool obscureText;
  final bool trailingIcon;
  final TextEditingController controller;
  final TextInputAction textAction;
  final List<TextInputFormatter> textInputFormatter;
  final String? Function(String? val)? validator;

  final Function()? onChanged;
  final bool readOnly;
  final bool underline;
  final bool enabled;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final IconData? prefixIcon;

  @override
  _BuildTextFieldBorder createState() => _BuildTextFieldBorder();
}

class _BuildTextFieldBorder extends State<BuildTextFieldBorder> {
  FocusNode _focusNode = FocusNode();
  bool? obsecureText;

  @override
  void initState() {
    super.initState();
    obsecureText = widget.obscureText;
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.containerWidth,
      height: widget.containerHeight,
      child: TextFormField(
        enabled: widget.enabled,
        controller: widget.controller,
        validator: widget.validator,
        textInputAction: widget.textAction,
        onTap: () {
          setState(() {
            FocusScope.of(context).requestFocus(_focusNode);
          });
        },
        focusNode: _focusNode,
        keyboardType: widget.keyBoardType,
        obscureText: obsecureText!,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          suffixIcon: widget.trailingIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obsecureText = !obsecureText!;
                    });
                  },
                  padding: const EdgeInsets.all(0),
                  icon: Icon(
                    !obsecureText! ? Icons.visibility : Icons.visibility_off,
                    size: widget.width * 2.5,
                    color: Colors.grey,
                  ))
              : null,
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 108, 107, 107)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.dividerColor),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.dividerColor),
          ),
          labelText: widget.label,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.weight,
            color: _focusNode.hasFocus
                ? ColorConstants.fontGreyColor
                : Colors.black,
          ),
          suffixStyle: TextStyle(
              color: const Color(0xFF999999),
              fontWeight: FontWeight.w400,
              fontSize: widget.width,
              fontFamily: 'Roboto'),
          focusColor: Theme.of(context).primaryColor,
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        inputFormatters: widget.textInputFormatter,
        onChanged: (value) {
          value = widget.controller.text;
          if (widget.onChanged != null) {
            widget.onChanged!();
          }
        },
      ),
    );
  }
}

class BuildTextFieldWithBorder extends StatefulWidget {
  const BuildTextFieldWithBorder(
      {Key? key,
      required this.width,
      this.label = '',
      this.hint = '',
      this.suffixText,
      required this.keyBoardType,
      this.trailingIcon = false,
      this.color = ColorConstants.fontGreyColor,
      this.obscureText = false,
      this.validator,
      this.textAction = TextInputAction.done,
      this.readOnly = false,
      required this.controller,
      this.textInputFormatter = const <TextInputFormatter>[],
      this.fontSize = 14,
      this.maxLines,
      this.weight = FontWeight.w300,
      this.floatingLabelBehavior = FloatingLabelBehavior.auto,
      this.prefixIcon,
      this.enabled = true,
      this.onChanged,
      this.underline = false})
      : super(key: key);

  final double width;
  final double fontSize;
  final FontWeight weight;

  final String label;
  final Color color;
  final String hint;
  final String? suffixText;
  final TextInputType keyBoardType;
  final bool obscureText;
  final bool trailingIcon;
  final int? maxLines;
  final TextEditingController controller;
  final TextInputAction textAction;
  final List<TextInputFormatter> textInputFormatter;
  final String? Function(String? val)? validator;

  final Function()? onChanged;
  final bool readOnly;
  final bool underline;
  final bool enabled;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? prefixIcon;

  @override
  _BuildTextFieldWithBorder createState() => _BuildTextFieldWithBorder();
}

class _BuildTextFieldWithBorder extends State<BuildTextFieldWithBorder> {
  FocusNode _focusNode = FocusNode();
  bool? obsecureText;

  @override
  void initState() {
    super.initState();
    obsecureText = widget.obscureText;
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      validator: widget.validator,
      textInputAction: widget.textAction,
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(_focusNode);
        });
      },
      focusNode: _focusNode,
      keyboardType: widget.keyBoardType,
      obscureText: obsecureText!,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines!,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 25),
        hintText: widget.hint,
        alignLabelWithHint: true,
        hintStyle: TextStyle(
            fontSize: FontConstant().small13px(), color: widget.color),
        suffixIcon: widget.trailingIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText!;
                  });
                },
                padding: const EdgeInsets.all(0),
                icon: Icon(
                  !obsecureText! ? Icons.visibility : Icons.visibility_off,
                  size: widget.width * 2.5,
                  color: Colors.grey,
                ))
            : null,
        prefixIcon: widget.prefixIcon,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 108, 107, 107)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1, color: ColorConstants.dividerColor),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1, color: ColorConstants.dividerColor),
          borderRadius: BorderRadius.circular(5),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 1, color: ColorConstants.dividerColor),
          borderRadius: BorderRadius.circular(5),
        ),
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextStyle(
            fontSize: FontConstant().medium16px(),
            fontWeight: widget.weight,
            color: widget.color),
        suffixStyle: TextStyle(
            color: const Color(0xFF999999),
            fontWeight: FontWeight.w400,
            fontSize: widget.width,
            fontFamily: 'Roboto'),
        focusColor: Theme.of(context).primaryColor,
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      inputFormatters: widget.textInputFormatter,
      onChanged: (value) {
        value = widget.controller.text;
        if (widget.onChanged != null) {
          widget.onChanged!();
        }
      },
    );
  }
}

class BuildTextFieldUnderline extends StatefulWidget {
  const BuildTextFieldUnderline(
      {Key? key,
      required this.width,
      this.label = '',
      this.suffixText,
      required this.keyBoardType,
      this.trailingIcon = false,
      this.obscureText = false,
      this.validator,
      this.textAction = TextInputAction.done,
      this.readOnly = false,
      required this.controller,
      this.textInputFormatter = const <TextInputFormatter>[],
      this.fontSize = 14,
      this.weight = FontWeight.w300,
      this.floatingLabelBehavior = FloatingLabelBehavior.auto,
      this.prefixIcon,
      this.enabled = true,
      this.onChanged,
      this.underline = false})
      : super(key: key);

  final double width;
  final double fontSize;
  final FontWeight weight;

  final String label;
  final String? suffixText;
  final TextInputType keyBoardType;
  final bool obscureText;
  final bool trailingIcon;
  final TextEditingController controller;
  final TextInputAction textAction;
  final List<TextInputFormatter> textInputFormatter;
  final String? Function(String? val)? validator;

  final Function(String value)? onChanged;
  final bool readOnly;
  final bool underline;
  final bool enabled;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Widget? prefixIcon;

  @override
  _BuildTextFieldUnderline createState() => _BuildTextFieldUnderline();
}

class _BuildTextFieldUnderline extends State<BuildTextFieldUnderline> {
  FocusNode _focusNode = FocusNode();
  bool? obsecureText;

  @override
  void initState() {
    super.initState();
    obsecureText = widget.obscureText;
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      validator: widget.validator,
      textInputAction: widget.textAction,
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(_focusNode);
        });
      },
      focusNode: _focusNode,
      keyboardType: widget.keyBoardType,
      obscureText: obsecureText!,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.trailingIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obsecureText = !obsecureText!;
                  });
                },
                padding: const EdgeInsets.all(0),
                icon: Icon(
                  !obsecureText! ? Icons.visibility : Icons.visibility_off,
                  size: widget.width * 2.5,
                  color: Colors.grey,
                ))
            : null,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 108, 107, 107)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.dividerColor),
        ),
        enabledBorder: InputBorder.none,
        labelText: widget.suffixText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: widget.weight,
          color:
              _focusNode.hasFocus ? ColorConstants.fontGreyColor : Colors.black,
        ),
        suffixStyle: TextStyle(
            color: const Color(0xFF999999),
            fontWeight: FontWeight.w400,
            fontSize: widget.width,
            fontFamily: 'Roboto'),
        focusColor: Theme.of(context).primaryColor,
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      inputFormatters: widget.textInputFormatter,
      onChanged: (value) {
        value = widget.controller.text;
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}
