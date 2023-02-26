import 'package:dailydoc/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: EdgeInsets.only(top: DeviceUtils.getScaledWidth(context, 3.5),
              bottom: DeviceUtils.getScaledWidth(context, 3.5)),
          child: CircularProgressIndicator(
            strokeWidth: DeviceUtils.getScaledWidth(context, 0.5),
          ),
        ));
  }
}
