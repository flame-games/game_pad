import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'helpers/direction.dart';
import 'components/controller.dart';

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {
  final Controller _controller = Controller();
  final TextPaint _textPaint = TextPaint(
    style: const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 16.0,
      fontFamily: 'Roboto',
    ),
  );

  late Direction _joyPadDirection = Direction.none;
  List<String> _buttonStateList = [];
  List<String> _buttonLongPressStateList = [];

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(_controller);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _textPaint.render(
      canvas,
      'JoyPad Direction: $_joyPadDirection',
      Vector2(20, 20),
    );
    _textPaint.render(
      canvas,
      'Button State: $_buttonStateList',
      Vector2(20, 40),
    );
    _textPaint.render(
      canvas,
      'Long Press Button State: $_buttonLongPressStateList',
      Vector2(20, 60),
    );
  }

  @override
  KeyEventResult onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    Direction? keyDirection = null;

    if (event.logicalKey == LogicalKeyboardKey.keyA) {
      keyDirection = Direction.left;
    } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
      keyDirection = Direction.right;
    } else if (event.logicalKey == LogicalKeyboardKey.keyW) {
      keyDirection = Direction.up;
    } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
      keyDirection = Direction.down;
    }

    print(isKeyDown);
    print(keyDirection);

    return super.onKeyEvent(event, keysPressed);
  }

  void onJoyPadDirectionChanged(Direction direction) {
    _joyPadDirection = direction;
  }

  void onButtonChanged(List<String> buttonStateList, List<String> buttonLongPressStateList) {
    _buttonStateList = buttonStateList;
    _buttonLongPressStateList = buttonLongPressStateList;
  }
}
