import 'package:flutter/material.dart';

final BoxDecoration deliveryRoomInfoBox = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
);

final BoxDecoration deliveryTipBox = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  border: Border.all(color: Colors.black26),
);

const BoxDecoration topBorderBox = BoxDecoration(
  color: Colors.white,
  border: Border(
    top: BorderSide(color: Colors.black12, width: 0.7),
  ),
);

const BoxDecoration bottomBorderBox = BoxDecoration(
  color: Colors.white,
  border: Border(
    bottom: BorderSide(color: Colors.black12, width: 1),
  ),
);

const _distance = 2.0;
final BoxDecoration neumorphism = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(15),
  boxShadow: [
    BoxShadow(
      offset: Offset(_distance, _distance),
      color: Colors.black12,
      blurRadius: _distance,
      spreadRadius: 2,
    ),
    BoxShadow(
      offset: Offset(-_distance, -_distance),
      color: Colors.white70,
      blurRadius: _distance,
      spreadRadius: 2,
    ),
  ],
);
