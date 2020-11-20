import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum InputFormatType {
  length3,
  length8,
  email,
  password4,
  password6,
  password6Register,
  password8,
}

class ValidatedInput extends StatefulWidget {
  ValidatedInput(
      {Key key,
      @required this.label,
      this.icon,
      this.validator,
      this.onSaved,
      this.initialValue,
      this.suffixIcon = Icons.arrow_drop_down,
      this.suffixFunction,
      this.controller,
      this.formatType,
      this.obscureText = false,
      this.keyboardType,
      this.inputFormatter,
      this.onChange,
      this.showSufixIcon})
      : super(key: key);

  final String label;
  final String initialValue;
  final IconData icon;
  final IconData suffixIcon;
  final Function validator;
  final Function onSaved;
  final Function suffixFunction;
  final TextEditingController controller;
  final InputFormatType formatType;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatter;
  final Function(String value) onChange;
  final bool showSufixIcon;

  @override
  _ValidatedInputState createState() => _ValidatedInputState();
}

class _ValidatedInputState extends State<ValidatedInput> {
  bool showSufixIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        inputFormatters: widget.inputFormatter,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: (widget.onChange) ?? inputType,
        controller: widget.controller,
        initialValue:
            (widget.initialValue != null) ? widget.initialValue : null,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            suffixIcon: (widget.showSufixIcon != null && widget.showSufixIcon)
                ? Icon(Icons.check_circle_outline)
                : (!showSufixIcon)
                    ? (widget.suffixFunction != null)
                        ? IconButton(
                            icon: Icon(widget.suffixIcon),
                            onPressed: widget.suffixFunction)
                        : null
                    : Icon(Icons.check_circle_outline),
            icon: (widget.icon != null) ? Icon(widget.icon) : null,
            labelText: widget.label,
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, style: BorderStyle.solid))),
        onSaved: widget.onSaved,
        validator: widget.validator,
      ),
    );
  }

  void inputType(value) {
    setState(() {
      switch (widget.formatType) {
        case InputFormatType.length3:
          showSufixIcon = lenght3Format(value);
          break;
        case InputFormatType.length8:
          showSufixIcon = lenght8Format(value);
          break;
        case InputFormatType.email:
          showSufixIcon = emailFormat(value);
          break;
        case InputFormatType.password4:
          showSufixIcon = password4Format(value);
          break;
        case InputFormatType.password6:
          showSufixIcon = password6Format(value);
          break;
        case InputFormatType.password6Register:
          showSufixIcon = password6RegisterFormat(value);
          break;
        case InputFormatType.password8:
          showSufixIcon = password8Format(value);
          break;
      }
    });
  }

  bool lenght3Format(String value) {
    if (value.length >= 3) {
      return true;
    } else {
      return false;
    }
  }

  bool lenght8Format(String value) {
    if (value.length >= 8) {
      return true;
    } else {
      return false;
    }
  }

  bool emailFormat(String value) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.trim());
    return emailValid;
  }

  bool password4Format(String value) {
    if (value.length >= 4) {
      return true;
    } else {
      return false;
    }
  }

  bool password6Format(String value) {
    if (value.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  bool password6RegisterFormat(String value) {
    bool lower = RegExp(r'[a-z]').hasMatch(value);
    bool capital = RegExp(r'[A-Z]').hasMatch(value);
    bool number = RegExp(r'[0-9]').hasMatch(value);
    bool lenght = (value.trim().length >= 6);
    if (lower && capital && number && lenght) {
      return true;
    } else {
      return false;
    }
  }

  bool password8Format(String value) {
    if (value.length >= 8) {
      return true;
    } else {
      return false;
    }
  }
}

class PasswordIndication extends StatefulWidget {
  PasswordIndication({Key key, this.password}) : super(key: key);

  final String password;

  @override
  _PasswordIndicationState createState() => _PasswordIndicationState();
}

class _PasswordIndicationState extends State<PasswordIndication> {
  bool capital = false;
  bool lower = false;
  bool number = false;
  bool lenght = false;

  void match(String password) {
    // Verificamos que contenga al menos una minuscula
    lower = RegExp(r'[a-z]').hasMatch(password);
    capital = RegExp(r'[A-Z]').hasMatch(password);
    number = RegExp(r'[0-9]').hasMatch(password);
    lenght = (password.trim().length >= 6);
  }

  @override
  Widget build(BuildContext context) {
    match(widget.password);
    Size _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45),
      padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
      child: Column(
        children: [
          PassworIndicatorItem(
            condition: capital,
            text: "Al menos una mayuscula",
          ),
          PassworIndicatorItem(
            condition: lower,
            text: "Al menos una minuscula",
          ),
          PassworIndicatorItem(
            condition: number,
            text: "Al menos un número",
          ),
          PassworIndicatorItem(
            condition: lenght,
            text: "Al menos 6 carácteres",
          ),
        ],
      ),
    );
  }
}

class PassworIndicatorItem extends StatelessWidget {
  const PassworIndicatorItem({
    Key key,
    @required this.condition,
    this.text,
  }) : super(key: key);

  final bool condition;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          if (condition) ...[
            ZoomIn(
              child: Icon(
                FontAwesomeIcons.checkCircle,
                color: Colors.green,
                size: 15,
              ),
            )
          ] else ...[
            Icon(
              FontAwesomeIcons.circle,
              color: Colors.grey,
              size: 15,
            )
          ],
          SizedBox(
            width: 10,
          ),
          if (condition) ...[
            FadeIn(
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.lineThrough),
              ),
            )
          ] else ...[
            Text(
              text,
              style: TextStyle(color: Colors.grey),
            )
          ]
        ],
      ),
    );
  }
}
