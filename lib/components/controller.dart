import 'package:flame/components.dart';

class Controller extends SpriteComponent with HasGameRef {
  Controller()
      : super(
    size: Vector2(300.0, 184.5),
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await Sprite.load('controller.png');
    setPosition();
  }

  void setPosition() {
    final gameSize = gameRef.size;
    final centerX = gameSize.x / 2 - size.x / 2;
    position = Vector2(centerX, 200);
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    setPosition();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}