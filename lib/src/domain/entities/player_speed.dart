enum PlayerSpeed {
  x0_5,
  x0_75,
  x1_0,
  x1_25,
  x1_5;

  double get ratio => switch (this) {
    PlayerSpeed.x0_5 => 0.5,
    PlayerSpeed.x0_75 => 0.75,
    PlayerSpeed.x1_0 => 1.0,
    PlayerSpeed.x1_25 => 1.25,
    PlayerSpeed.x1_5 => 1.5,
  };

  String get label => switch (this) {
    PlayerSpeed.x0_5 => "0.5x",
    PlayerSpeed.x0_75 => "0.75x",
    PlayerSpeed.x1_0 => "1x",
    PlayerSpeed.x1_25 => "1.25x",
    PlayerSpeed.x1_5 => "1.5x",
  };

  PlayerSpeed get next {
    final values = PlayerSpeed.values;
    final nextIndex = (values.indexOf(this) + 1) % values.length;
    return values[nextIndex];
  }
}
