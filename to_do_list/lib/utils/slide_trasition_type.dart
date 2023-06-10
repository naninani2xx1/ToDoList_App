enum SlideTransitionType {
  left(typeName: "left"),

  top(typeName: "top"),

  bottom(typeName: "bottoms"),

  right(typeName: "right");

  const SlideTransitionType({
    required this.typeName,
  });

  final String typeName;

  @override
  String toString() => typeName;
}
