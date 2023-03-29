import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ValueChangedCallback = void Function(List<String> arg1, List<String> arg2);

class JoypadButton extends StatefulWidget {
  final ValueChangedCallback? onButtonChanged;

  const JoypadButton({Key? key, this.onButtonChanged}) : super(key: key);

  @override
  JoypadButtonState createState() => JoypadButtonState();
}

class JoypadButtonState extends State<JoypadButton> {
  final List<String> _buttonList = ['X', 'Y', 'A', 'B'];
  final List<String> _buttonStateList = [];
  final List<String> _buttonLongPressStateList = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 140,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x88ffffff),
          borderRadius: BorderRadius.circular(70),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
              child: Column(
            children: <Widget>[
              createButton(0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    for(int i = 1; i < 3; i++) ... {
                      createButton(i)
                    }
                    ]
              ),
              createButton(3),
            ],
          )),
        ),
      ),
    );
  }

  Widget createButton(int index) {
    return GestureDetector(
      onLongPressStart: (details) => onLongPressStart(_buttonList[index]),
      onTapDown: (details) => onTapDown(_buttonList[index]),
      onTapUp: (details) => onTapUp(_buttonList[index]),
      onLongPressMoveUpdate: (details) => onLongPressMoveUpdate(_buttonList[index]),
      onLongPressEnd: (details) => onLongPressEnd(_buttonList[index]),
      child: SizedBox(
        height: 40,
        width: 40,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xccffffff),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  void updateButton() {
    widget.onButtonChanged!(_buttonStateList, _buttonLongPressStateList);
    // setState(() {
    //   delta = newDelta;
    // });
  }

  void onTapDown(String type) {
    _buttonStateList.add(type);
    updateButton();
  }

  void onTapUp(String type) {
    _buttonStateList.removeWhere((item) => item == type);
    updateButton();
  }

  void onLongPressStart(String type) {
    _buttonLongPressStateList.add(type);
    updateButton();
  }

  void onLongPressMoveUpdate(String type) {
    updateButton();
  }

  void onLongPressEnd(String type) {
    _buttonStateList.removeWhere((item) => item == type);
    _buttonLongPressStateList.removeWhere((item) => item == type);
    updateButton();
  }
}
