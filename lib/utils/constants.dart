import 'package:flutter/material.dart';
import 'package:termii_app/utils/dimensions.dart';

import 'color.dart';

TextStyle kTextStyleCustom({
  Color color = kBLKCOLOUR,
  double fontSize = 16,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return TextStyle(
    fontSize: getScreenHeight(fontSize),
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    color: color,
  );
  // return TextStyle(
  //
  // );
}

// Future<dynamic> showLoadingDialogy(
//     BuildContext context, BuildContext dialogContext) {
//   return showDialog(
//       context: context,
//       barrierColor: Colors.white.withOpacity(0.6),
//       barrierDismissible: false,
//       builder: (dialogContext) {
//         return Dialog(
//           elevation: 0.0,
//           backgroundColor: Colors.transparent,
//           child: Container(
//             height: 60,
//             alignment: FractionalOffset.center,
//             child: SpinKitDoubleBounce(
//               color: kPRYCOLOUR,
//               size: getScreenWidth(60.0),
//             ),
//           ),
//         );
//       });
// }

// kToastMsgPopUp(String msg, ToastGravity toastGravity) {
//   Fluttertoast.showToast(
//     msg: msg,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: toastGravity,
//     timeInSecForIosWeb: 2,
//     backgroundColor: kPRYCOLOUR,
//     textColor: Colors.white,
//     fontSize: getScreenHeight(16),
//   );
// }
