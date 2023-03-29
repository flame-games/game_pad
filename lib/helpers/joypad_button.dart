import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'direction.dart';

class JoypadButton extends StatefulWidget {
  final ValueChanged<Direction>? onDirectionChanged;

  const JoypadButton({Key? key, this.onDirectionChanged}) : super(key: key);

  @override
  JoypadButtonState createState() => JoypadButtonState();
}

class JoypadButtonState extends State<JoypadButton> {
  final List<String> _buttonList = ['X', 'Y', 'A', 'B'];

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

  void onTapDown(String type) {
    print('onTapDown(): $type');
  }

  void onTapUp(String type) {
    print('onTapUp(): $type');
  }

  void onLongPressStart(String type) {
    print('onLongPressStart(): $type');
  }

  void onLongPressMoveUpdate(String type) {
    print('onLongPressMoveUpdate(): $type');
  }

  void onLongPressEnd(String type) {
    print('onLongPressEnd(): $type');
  }
}
