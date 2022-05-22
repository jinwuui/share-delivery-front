import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

Widget MyLoaderOverlay({
  required PreferredSizeWidget appBar,
  required Widget body,
  Widget? bottomSheet,
}) {
  return LoaderOverlay(
    child: Scaffold(
      appBar: appBar,
      body: body,
      bottomSheet: bottomSheet,
    ),
    overlayColor: Colors.black45,
    useDefaultLoading: false,
    overlayWidget: const Center(
      child: SpinKitThreeBounce(
        size: 25,
        color: Colors.white,
      ),
    ),
  );
}
