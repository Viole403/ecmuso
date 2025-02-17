import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ecmus/util/country_code_picker.dart';

import 'color_category.dart';
import 'constant.dart';

showToast(String s, BuildContext context) {
  if (s.isNotEmpty) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 12);

    // Toast.show(s, context,
    //     duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }
}

Widget getAssetImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return Image.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getSvgImage(String image,
    {double? width,
    double? height,
    Color? color,
    BoxFit boxFit = BoxFit.contain}) {
  return SvgPicture.asset(
    Constant.assetImagePath + image,
    color: color,
    width: width,
    height: height,
    fit: boxFit,
  );
}

Widget getVerSpace(double verSpace) {
  return SizedBox(
    height: verSpace,
  );
}

Widget getHorSpace(double verSpace) {
  return SizedBox(
    width: verSpace,
  );
}

Widget getRichText(
    String firstText,
    Color firstColor,
    FontWeight firstWeight,
    double firstSize,
    String secondText,
    Color secondColor,
    FontWeight secondWeight,
    double secondSize,
    String thirdText,
    Color thirdColor,
    FontWeight thirdWeight,
    double thirdSize,
    {TextAlign textAlign = TextAlign.center,
    double? txtHeight}) {
  return RichText(
    textAlign: textAlign,
    text: TextSpan(
        text: firstText,
        style: TextStyle(
          color: firstColor,
          fontWeight: firstWeight,
          fontFamily: Constant.fontsFamily,
          fontSize: firstSize,
          height: txtHeight,
        ),
        children: [
          TextSpan(
              text: secondText,
              style: TextStyle(
                  color: secondColor,
                  fontWeight: secondWeight,
                  fontFamily: Constant.fontsFamily,
                  fontSize: secondSize,
                  height: txtHeight)),
          TextSpan(
              text: thirdText,
              style: TextStyle(
                color: thirdColor,
                fontWeight: thirdWeight,
                fontFamily: Constant.fontsFamily,
                fontSize: thirdSize,
                height: txtHeight,
              ))
        ]),
  );
}

Widget getSearchWidget(
    BuildContext context, String s, TextEditingController textEditingController,
    {bool withSufix = false,
    bool minLines = false,
    bool isPass = false,
    bool isEnable = true,
    bool isprefix = false,
    Widget? prefix,
    double? height,
    String? suffiximage,
    Function? imagefunction,
    List<TextInputFormatter>? inputFormatters,
    FormFieldValidator<String>? validator,
    BoxConstraints? constraint,
    ValueChanged<String>? onChanged,
    double vertical = 17,
    double horizontal = 20,
    int? length,
    String obscuringCharacter = '•',
    GestureTapCallback? onTap,
    bool isReadonly = false,
    ValueChanged<String>? onSubmit}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        height: 60.h,
        decoration: BoxDecoration(
            color: lightBg, borderRadius: BorderRadius.circular(22.h)),
        alignment: Alignment.centerLeft,
        child: TextFormField(
          onFieldSubmitted: onSubmit,
          readOnly: isReadonly,
          onTap: onTap,
          onChanged: onChanged,
          validator: validator,
          enabled: true,
          inputFormatters: inputFormatters,
          maxLines: (minLines) ? null : 1,
          controller: textEditingController,
          obscuringCharacter: obscuringCharacter,
          autofocus: false,
          obscureText: isPass,
          showCursor: true,
          cursorColor: accentColor,
          maxLength: length,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              fontFamily: Constant.fontsFamily),
          decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.symmetric(
                  vertical: vertical.h, horizontal: horizontal.h),
              isDense: true,
              filled: true,
              suffixIconConstraints: BoxConstraints(
                maxHeight: 24.h,
              ),
              border: InputBorder.none,
              suffixIcon: withSufix == true
                  ? GestureDetector(
                      onTap: () {
                        imagefunction!();
                      },
                      child: getSvgImage(suffiximage.toString(),
                              width: 24.h, height: 24.h)
                          .paddingOnly(right: 18.h))
                  : null,
              prefixIconConstraints: constraint,
              prefixIcon: isprefix == true ? prefix : null,
              hintText: s,
              hintStyle: TextStyle(
                  color: searchHint,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  fontFamily: Constant.fontsFamily)),
        ),
      );
    },
  );
}

Widget getTwoRichText(
    String firstText,
    Color firstColor,
    FontWeight firstWeight,
    double firstSize,
    String secondText,
    Color secondColor,
    FontWeight secondWeight,
    double secondSize,
    {TextAlign textAlign = TextAlign.center,
    double? txtHeight,
    Function? function}) {
  return RichText(
    textAlign: textAlign,
    text: TextSpan(
        text: firstText,
        style: TextStyle(
          color: firstColor,
          fontWeight: firstWeight,
          fontFamily: Constant.fontsFamily,
          fontSize: firstSize,
          height: txtHeight,
        ),
        children: [
          TextSpan(
              text: secondText,
              style: TextStyle(
                  color: secondColor,
                  fontWeight: secondWeight,
                  fontFamily: Constant.fontsFamily,
                  fontSize: secondSize,
                  height: txtHeight),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  function!();
                }),
        ]),
  );
}

Widget getButton(BuildContext context, Color bgColor, String text,
    Color textColor, Function function, double fontsize,
    {bool isBorder = false,
    EdgeInsetsGeometry? insetsGeometry,
    borderColor = Colors.transparent,
    FontWeight weight = FontWeight.bold,
    bool isIcon = false,
    String? image,
    Color? imageColor,
    double? imageWidth,
    double? imageHeight,
    bool smallFont = false,
    double? buttonHeight,
    double? buttonWidth,
    List<BoxShadow> boxShadow = const [],
    EdgeInsetsGeometry? insetsGeometrypadding,
    BorderRadius? borderRadius,
    double? borderWidth}) {
  return InkWell(
    onTap: () {
      function();
    },
    child: Container(
      margin: insetsGeometry,
      padding: insetsGeometrypadding,
      width: buttonWidth,
      height: buttonHeight,
      decoration: getButtonDecoration(
        bgColor,
        borderRadius: borderRadius,
        shadow: boxShadow,
        border: (isBorder)
            ? Border.all(color: borderColor, width: borderWidth!)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (isIcon) ? getSvgImage(image!) : getHorSpace(0),
          (isIcon) ? getHorSpace(15.h) : getHorSpace(0),
          getCustomFont(text, fontsize, textColor, 1,
              textAlign: TextAlign.center,
              fontWeight: weight,
              fontFamily: Constant.fontsFamily)
        ],
      ),
    ),
  );
}

Widget getCustomFont(String text, double fontSize, Color fontColor, int maxLine,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    maxLines: maxLine,
    softWrap: true,
    textAlign: textAlign,
  );
}

BoxDecoration getButtonDecoration(Color bgColor,
    {BorderRadius? borderRadius,
    Border? border,
    List<BoxShadow> shadow = const [],
    DecorationImage? image}) {
  return BoxDecoration(
      color: bgColor,
      borderRadius: borderRadius,
      border: border,
      boxShadow: shadow,
      image: image);
}

Widget defaultTextField(
  BuildContext context,
  TextEditingController controller,
  String hint,
  String prefixImage, {
  bool isPass = false,
  FormFieldValidator<String>? validator,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  bool isEnable = true,
  bool isReadonly = false,
}) {
  return TextFormField(
    enabled: isEnable,
    readOnly: isReadonly,
    validator: validator,
    obscureText: isPass,
    controller: controller,
    style: TextStyle(
        color: hintColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
          color: hintColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: dividerColor, width: 1.h),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: dividerColor, width: 1.h),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: accentColor, width: 1.h),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: errorColor, width: 1.h),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: errorColor, width: 1.h),
      ),
      errorStyle: TextStyle(
          color: errorColor, fontSize: 12.sp, fontWeight: FontWeight.w400),
      prefixIcon: getSvgImage(prefixImage, width: 24.h, height: 24.h)
          .paddingSymmetric(horizontal: 18.h),
      prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 60.h),
      filled: true,
    ),
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
  );
}

Widget getProfileTextField(
  BuildContext context,
  TextEditingController controller,
  String hint,
  String prefixImage, {
  bool isPass = false,
  FormFieldValidator<String>? validator,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
  bool isEnable = true,
  bool isReadonly = false,
}) {
  return TextFormField(
    enabled: isEnable,
    readOnly: isReadonly,
    validator: validator,
    obscureText: isPass,
    controller: controller,
    style: TextStyle(
        color: isReadonly == true ? searchHint : Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
          color: searchHint, fontSize: 16.sp, fontWeight: FontWeight.w400),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: dividerColor, width: 1.h),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: dividerColor, width: 1.h),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: accentColor, width: 1.h),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: errorColor, width: 1.h),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: errorColor, width: 1.h),
      ),
      errorStyle: TextStyle(
          color: errorColor, fontSize: 12.sp, fontWeight: FontWeight.w400),
      prefixIcon: getSvgImage(prefixImage, width: 24.h, height: 24.h)
          .paddingSymmetric(horizontal: 18.h),
      prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 60.h),
      filled: true,
    ),
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
  );
}

Widget getCountryTextFiled(BuildContext context,
    TextEditingController controller, String hint, String prefixImage,
    {bool isPass = false, FormFieldValidator<String>? validator}) {
  return TextFormField(
    validator: validator,
    obscureText: isPass,
    controller: controller,
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ],
    style: TextStyle(
        color: hintColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
          color: hintColor, fontSize: 16.sp, fontWeight: FontWeight.w400),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: dividerColor, width: 1.h),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: dividerColor, width: 1.h),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: accentColor, width: 1.h),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: errorColor, width: 1.h),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: errorColor, width: 1.h),
      ),
      errorStyle: TextStyle(
          color: errorColor, fontSize: 12.sp, fontWeight: FontWeight.w400),
      prefixIcon: Row(
        children: [
          getSvgImage(prefixImage, width: 24.h, height: 24.h)
              .paddingOnly(right: 18.h),
          Expanded(
            child: CountryCodePicker(
              onChanged: print,
              initialSelection: 'IN',
              flagWidth: 24.h,
              padding: EdgeInsets.zero,
              textStyle: TextStyle(
                  color: hintColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
              favorite: const ['+91', 'IN'],
              showCountryOnly: false,
              showDropDownButton: true,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 18.h),
      prefixIconConstraints: BoxConstraints(maxHeight: 24.h, maxWidth: 160.h),
      filled: true,
    ),
  );
}

Widget getDivider(
    {double dividerHeight = 0,
    Color setColor = Colors.grey,
    double endIndent = 0,
    double indent = 0,
    double thickness = 1}) {
  return Divider(
    height: dividerHeight.h,
    color: setColor,
    endIndent: endIndent.w,
    indent: indent.w,
    thickness: thickness,
  );
}

Widget getMultilineCustomFont(String text, double fontSize, Color fontColor,
    {String fontFamily = Constant.fontsFamily,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign textAlign = TextAlign.start,
    txtHeight = 1.0}) {
  return Text(
    text,
    style: TextStyle(
        decoration: decoration,
        fontSize: fontSize,
        fontStyle: FontStyle.normal,
        color: fontColor,
        fontFamily: fontFamily,
        height: txtHeight,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}

Widget getToolbarWithIcon(Function function) {
  return Stack(alignment: Alignment.topCenter, children: [
    getAssetImage("splash_logo.png", height: 88.h, width: 68.h),
    Align(
        alignment: Alignment.topLeft,
        child: GestureDetector(
            onTap: () {
              function();
            },
            child: getSvgImage("arrow_back.svg", width: 24.h, height: 24.h)))
  ]);
}

Widget getAppBar(Function function, String title) {
  return Row(
    children: [
      GestureDetector(
          onTap: () {
            function();
          },
          child: getSvgImage("arrow_back.svg", height: 24.h, width: 24.h)),
      getHorSpace(20.h),
      getCustomFont(title, 20.sp, Colors.white, 1, fontWeight: FontWeight.w700)
    ],
  );
}

Widget getProfileWidget(Function function, String image, String name) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Column(
      children: [
        Row(
          children: [
            getSvgImage(image, width: 24.h, height: 24.h)
                .marginOnly(left: 18.h),
            getHorSpace(18.h),
            Expanded(
              flex: 1,
              child: getCustomFont(name, 16.sp, hintColor, 1,
                  fontWeight: FontWeight.w400),
            ),
            getSvgImage("arrow_right.svg", height: 16.h, width: 16.h)
          ],
        ).paddingOnly(top: 20.h, bottom: 16.h),
        getDivider(setColor: dividerColor)
      ],
    ),
  );
}
