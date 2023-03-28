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
              GestureDetector(
                onLongPressStart: (details) => onLongPressStart('X'),
                onTapDown: (details) => onTapDown('X'),
                onTapUp: (details) => onTapUp('X'),
                onLongPressMoveUpdate: (details) => onLongPressMoveUpdate('X'),
                onLongPressEnd: (details) => onLongPressEnd('X'),
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
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        onLongPressStart: (details) => onLongPressStart('Y'),
                        onTapDown: (details) => onTapDown('Y'),
                        onTapUp: (details) => onTapUp('Y'),
                        onLongPressMoveUpdate: (details) =>
                            onLongPressMoveUpdate('Y'),
                        onLongPressEnd: (details) => onLongPressEnd('Y'),
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xccffffff),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )),
                    GestureDetector(
                      onLongPressStart: (details) => onLongPressStart('A'),
                      onTapDown: (details) => onTapDown('A'),
                      onTapUp: (details) => onTapUp('A'),
                      onLongPressMoveUpdate: (details) =>
                          onLongPressMoveUpdate('A'),
                      onLongPressEnd: (details) => onLongPressEnd('A'),
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
                    ),
                  ]),
              GestureDetector(
                onLongPressStart: (details) => onLongPressStart('B'),
                onTapDown: (details) => onTapDown('B'),
                onTapUp: (details) => onTapUp('B'),
                onLongPressMoveUpdate: (details) => onLongPressMoveUpdate('B'),
                onLongPressEnd: (details) => onLongPressEnd('B'),
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
              ),
            ],
          )),
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
