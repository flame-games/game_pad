import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

import 'helpers/direction.dart';
import 'components/controller.dart';

class MainGame extends FlameGame with KeyboardEvents, HasGameRef {
  final Controller _controller = Controller();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(_controller);
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
    print(direction);
  }

  void onButtonChanged(List<String> buttonStateList, List<String> buttonLongPressStateList) {
    print(buttonStateList);
    print(buttonLongPressStateList);
  }
}
