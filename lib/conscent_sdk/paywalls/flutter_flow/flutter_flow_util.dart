import 'dart:io';

import 'package:demo_blog/conscent_sdk/utils/utils.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:intl/intl.dart';

export 'dart:convert' show jsonEncode, jsonDecode;
export 'dart:math' show min, max;
export 'dart:typed_data' show Uint8List;

export 'package:intl/intl.dart';

export 'lat_lng.dart';
export 'local_file.dart';
export 'nav/nav.dart';
export 'place.dart';

T valueOrDefault<T>(T? value, T defaultValue) =>
    (value is String && value.isEmpty && value == "") || value == null
        ? defaultValue
        : value;

String getTextWithTransform(
    String? text, String defaultValue, String? textTransform) {
  if (textTransform == "uppercase") {
    return valueOrDefault<String>(
      text,
      defaultValue,
    ).toUpperCase();
  } else if (textTransform == "lowercase") {
    return valueOrDefault<String>(
      text,
      defaultValue,
    ).toLowerCase();
  } else if (textTransform == "capitalize") {
    return valueOrDefault<String>(
      text,
      defaultValue,
    ).capitalizeText;
  } else {
    return valueOrDefault<String>(
      text,
      defaultValue,
    );
  }
}

FontWeight getFontWeight(String fontWeight) {
  if (fontWeight == "100") {
    return FontWeight.w100;
  } else if (fontWeight == "200") {
    return FontWeight.w200;
  } else if (fontWeight == "300") {
    return FontWeight.w300;
  } else if (fontWeight == "400") {
    return FontWeight.w400;
  } else if (fontWeight == "500") {
    return FontWeight.w500;
  } else if (fontWeight == "600") {
    return FontWeight.w600;
  } else if (fontWeight == "700") {
    return FontWeight.w700;
  } else if (fontWeight == "800") {
    return FontWeight.w800;
  } else if (fontWeight == "900") {
    return FontWeight.w900;
  }
  return FontWeight.normal;
}

TextDecoration getTextDecoration(String textDecoration) {
  if (textDecoration == "underline") {
    return TextDecoration.underline;
  } else if (textDecoration == "line-through") {
    return TextDecoration.lineThrough;
  }
  return TextDecoration.none;
}

TextAlign getTextAlign(String align) {
  if (align == "left") {
    return TextAlign.left;
  } else if (align == "center") {
    return TextAlign.center;
  } else if (align == "right") {
    return TextAlign.right;
  }
  return TextAlign.center;
}

String dateTimeFormat(String format, DateTime? dateTime, {String? locale}) {
  if (dateTime == null) {
    return '';
  }
  if (format == 'relative') {
    // return timeago.format(dateTime, locale: locale);
  }
  return DateFormat(format).format(dateTime);
}

Future launchURL(String url) async {
  var uri = Uri.parse(url).toString();
  try {
    // await launch(uri);
  } catch (e) {
    throw 'Could not launch $uri: $e';
  }
}

Color colorFromCssString(String color, {Color? defaultColor}) {
  try {
    return fromCssColor(color);
  } catch (_) {}
  return defaultColor ?? Colors.black;
}

enum FormatType {
  decimal,
  percent,
  scientific,
  compact,
  compactLong,
  custom,
}

enum DecimalType {
  automatic,
  periodDecimal,
  commaDecimal,
}

String formatNumber(
  num? value, {
  required FormatType formatType,
  DecimalType? decimalType,
  String? currency,
  bool toLowerCase = false,
  String? format,
  String? locale,
}) {
  if (value == null) {
    return '';
  }
  var formattedValue = '';
  switch (formatType) {
    case FormatType.decimal:
      switch (decimalType!) {
        case DecimalType.automatic:
          formattedValue = NumberFormat.decimalPattern().format(value);
          break;
        case DecimalType.periodDecimal:
          formattedValue = NumberFormat.decimalPattern('en_US').format(value);
          break;
        case DecimalType.commaDecimal:
          formattedValue = NumberFormat.decimalPattern('es_PA').format(value);
          break;
      }
      break;
    case FormatType.percent:
      formattedValue = NumberFormat.percentPattern().format(value);
      break;
    case FormatType.scientific:
      formattedValue = NumberFormat.scientificPattern().format(value);
      if (toLowerCase) {
        formattedValue = formattedValue.toLowerCase();
      }
      break;
    case FormatType.compact:
      formattedValue = NumberFormat.compact().format(value);
      break;
    case FormatType.compactLong:
      formattedValue = NumberFormat.compactLong().format(value);
      break;
    case FormatType.custom:
      final hasLocale = locale != null && locale.isNotEmpty;
      formattedValue =
          NumberFormat(format, hasLocale ? locale : null).format(value);
  }

  if (formattedValue.isEmpty) {
    return value.toString();
  }

  if (currency != null) {
    final currencySymbol = currency.isNotEmpty
        ? currency
        : NumberFormat.simpleCurrency().format(0.0).substring(0, 1);
    formattedValue = '$currencySymbol$formattedValue';
  }

  return formattedValue;
}

DateTime get getCurrentTimestamp => DateTime.now();

extension DateTimeComparisonOperators on DateTime {
  bool operator <(DateTime other) => isBefore(other);
  bool operator >(DateTime other) => isAfter(other);
  bool operator <=(DateTime other) => this < other || isAtSameMomentAs(other);
  bool operator >=(DateTime other) => this > other || isAtSameMomentAs(other);
}

// dynamic getJsonField(
//   dynamic response,
//   String jsonPath, [
//   bool isForList = false,
// ]) {
//   // final field = JsonPath(jsonPath).read(response);
//   // if (field.isEmpty) {
//   //   return null;
//   // }
//   // if (field.length > 1) {
//   //   return field.map((f) => f.value).toList();
//   // }
//   // final value = field.first.value;
//   return isForList && value is! Iterable ? [value] : value;
// }

Rect? getWidgetBoundingBox(BuildContext context) {
  try {
    final renderBox = context.findRenderObject() as RenderBox?;
    return renderBox!.localToGlobal(Offset.zero) & renderBox.size;
  } catch (_) {
    return null;
  }
}

bool get isAndroid => !kIsWeb && Platform.isAndroid;
bool get isiOS => !kIsWeb && Platform.isIOS;
bool get isWeb => kIsWeb;

const kMobileWidthCutoff = 479.0;
bool isMobileWidth(BuildContext context) =>
    MediaQuery.of(context).size.width < kMobileWidthCutoff;
bool responsiveVisibility({
  required BuildContext context,
  bool phone = true,
  bool tablet = true,
  bool tabletLandscape = true,
  bool desktop = true,
}) {
  final width = MediaQuery.of(context).size.width;
  if (width < kMobileWidthCutoff) {
    return phone;
  } else if (width < 767) {
    return tablet;
  } else if (width < 991) {
    return tabletLandscape;
  } else {
    return desktop;
  }
}

const kTextValidatorUsernameRegex = r'^[a-zA-Z][a-zA-Z0-9_-]{2,16}$';
const kTextValidatorEmailRegex =
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
const kTextValidatorWebsiteRegex =
    r'(https?:\/\/)?(www\.)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,10}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)|(https?:\/\/)?(www\.)?(?!ww)[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,10}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)';

extension IterableExt<T> on Iterable<T> {
  List<S> mapIndexed<S>(S Function(int, T) func) => toList()
      .asMap()
      .map((index, value) => MapEntry(index, func(index, value)))
      .values
      .toList();
}

// void setAppLanguage(BuildContext context, String language) =>
//     MyApp.of(context).setLocale(language);
//
// void setDarkModeSetting(BuildContext context, ThemeMode themeMode) =>
//     MyApp.of(context).setThemeMode(themeMode);

void showSnackbar(
  BuildContext context,
  String message, {
  bool loading = false,
  int duration = 4,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          if (loading)
            const Padding(
              padding: EdgeInsetsDirectional.only(end: 10.0),
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          Text(message),
        ],
      ),
      duration: Duration(seconds: duration),
    ),
  );
}

extension FFStringExt on String {
  String maybeHandleOverflow({int? maxChars, String replacement = ''}) =>
      maxChars != null && length > maxChars
          ? replaceRange(maxChars, null, replacement)
          : this;
}

extension ListFilterExt<T> on Iterable<T?> {
  List<T> get withoutNulls => where((s) => s != null).map((e) => e!).toList();
}
