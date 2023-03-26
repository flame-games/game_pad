import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'helpers/direction.dart';

class MainGame extends FlameGame with KeyboardEvents {

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
    print(direction);
  }
}
