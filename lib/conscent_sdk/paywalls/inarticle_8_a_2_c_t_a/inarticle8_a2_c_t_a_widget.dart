import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../conscent_methods.dart';
import '../../constants.dart';
import '../../utils/slicedTextComponent.dart';
import '../../utils/utils.dart';
import '../../web_view_default.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class Inarticle8A2CTAWidget extends StatefulWidget {
  Function(bool) sessionCallback;

  Inarticle8A2CTAWidget(this.sessionCallback, {Key? key}) : super(key: key);

  @override
  _Inarticle8A2CTAWidgetState createState() => _Inarticle8A2CTAWidgetState();
}

class _Inarticle8A2CTAWidgetState extends State<Inarticle8A2CTAWidget> {
  List<String> typeOfPurchase = ["subscription", ""];
  int? _value = 1;
  final paywallconfigResponse = Constants.paywallConfig;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    ConscentMethods().paywallViewEvent();
    typeOfPurchase[0] = (paywallconfigResponse.data?.configuration?.mobile?.json
            ?.slotData?.slot?.radioBtnOne?.value ??
        "");
    typeOfPurchase[1] = (paywallconfigResponse.data?.configuration?.mobile?.json
            ?.slotData?.slot?.radioBtnOne?.url ??
        "");
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ConscentMethods().paywallViewEvent();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.51,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(valueOrDefault<double>(
          paywallconfigResponse.data?.configuration?.mobile?.json
              ?.styleForBackground?.border?.mainDiv?.radius
              ?.toDouble(),
          0,
        )),
        border: Border.all(
          color: colorFromCssString(valueOrDefault<String>(
            paywallconfigResponse.data?.configuration?.mobile?.json
                ?.styleForBackground?.border?.mainDiv?.borderColor,
            '#000000',
          )),
          width: valueOrDefault<double>(
            paywallconfigResponse.data?.configuration?.mobile?.json
                ?.styleForBackground?.border?.mainDiv?.borderWidthValue
                ?.toDouble(),
            0,
          ),
        ),
        color: colorFromCssString(valueOrDefault<String>(
          paywallconfigResponse.data?.configuration?.mobile?.json
              ?.styleForBackground?.border?.mainDiv?.backgroundColor,
          '#000000',
        )),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(28, 21, 28, 12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getTextWithTransform(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.text,
                        'Enjoy Mid-Day Gold Subscription',
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.textTransform),
                    textAlign: getTextAlign(valueOrDefault<String>(
                      paywallconfigResponse.data?.configuration?.mobile?.json
                          ?.styleForText?.typography?.heading?.textAlign,
                      'left',
                    )),
                    style: GoogleFonts.getFont(
                      valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.fontFamily,
                        'Playfair Display',
                      ),
                      color: colorFromCssString(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.color,
                        '#ffffff',
                      )),
                      decorationColor:
                          colorFromCssString(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.color,
                        '#ffffff',
                      )),
                      decoration: getTextDecoration(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.textDecoration,
                        "",
                      )),
                      fontSize: 36,
                      fontWeight: getFontWeight(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.fontWeight,
                        "700",
                      )),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                getTextWithTransform(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.contentDivTitle
                                        ?.text,
                                    'Continue with subscription',
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.contentDivTitle
                                        ?.textTransform),
                                textAlign: getTextAlign(valueOrDefault<String>(
                                  paywallconfigResponse
                                      .data
                                      ?.configuration
                                      ?.mobile
                                      ?.json
                                      ?.styleForText
                                      ?.typography
                                      ?.contentDivTitle
                                      ?.textAlign,
                                  'left',
                                )),
                                style: GoogleFonts.getFont(
                                  valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.contentDivTitle
                                        ?.fontFamily,
                                    'Playfair Display',
                                  ),
                                  color:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.contentDivTitle
                                        ?.color,
                                    '#ffffff',
                                  )),
                                  decorationColor:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.contentDivTitle
                                        ?.color,
                                    '#ffffff',
                                  )),
                                  fontSize: 16,
                                  decoration:
                                      getTextDecoration(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.contentDivTitle
                                        ?.textDecoration,
                                    "",
                                  )),
                                  fontWeight:
                                      getFontWeight(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.contentDivTitle
                                        ?.fontWeight,
                                    "",
                                  )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    getTextWithTransform(
                                        "${paywallconfigResponse.data?.configuration?.mobile?.json?.styleForText?.typography?.contentDivPrice?.text}${Constants.contentPrice}",
                                        'RS 999',
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.contentDivPrice
                                            ?.textTransform),
                                    textAlign:
                                        getTextAlign(valueOrDefault<String>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForText
                                          ?.typography
                                          ?.contentDivPrice
                                          ?.textAlign,
                                      'right',
                                    )),
                                    style: GoogleFonts.getFont(
                                      valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.contentDivPrice
                                            ?.fontFamily,
                                        'Roboto',
                                      ),
                                      color: colorFromCssString(
                                          valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.contentDivPrice
                                            ?.color,
                                        '#ffffff',
                                      )),
                                      fontSize: 20,
                                      decoration: getTextDecoration(
                                          valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.contentDivPrice
                                            ?.textDecoration,
                                        "",
                                      )),
                                      decorationColor: colorFromCssString(
                                          valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.contentDivPrice
                                            ?.color,
                                        '#ffffff',
                                      )),
                                      fontWeight:
                                          getFontWeight(valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.contentDivPrice
                                            ?.fontWeight,
                                        "",
                                      )),
                                    ),
                                  ),
                                  CustomPaint(
                                    foregroundPainter:
                                        StationPointPainter(Colors.white),
                                    child: Text(
                                      getTextWithTransform(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.contentDivCutPrice
                                              ?.text,
                                          'RS 3999',
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.contentDivCutPrice
                                              ?.textTransform),
                                      textAlign:
                                          getTextAlign(valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.contentDivCutPrice
                                            ?.textAlign,
                                        'right',
                                      )),
                                      style: GoogleFonts.getFont(
                                        valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.contentDivCutPrice
                                              ?.fontFamily,
                                          'Roboto',
                                        ),
                                        decoration: getTextDecoration(
                                            valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.contentDivCutPrice
                                              ?.textDecoration,
                                          "",
                                        )),
                                        color: colorFromCssString(
                                            valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.contentDivCutPrice
                                              ?.color,
                                          '#ffffff',
                                        )),
                                        decorationColor: colorFromCssString(
                                            valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.contentDivCutPrice
                                              ?.color,
                                          '#ffffff',
                                        )),
                                        fontSize: 12,
                                        fontWeight: getFontWeight(
                                            valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.contentDivCutPrice
                                              ?.fontWeight,
                                          "",
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Radio(
                              value: 1,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.blue),
                              toggleable: true,
                              groupValue: _value,
                              onChanged: (int? value) {
                                setState(() {
                                  _value = value;
                                  typeOfPurchase[0] = (paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.slotData
                                          ?.slot
                                          ?.radioBtnOne
                                          ?.value ??
                                      "");
                                  typeOfPurchase[1] = (paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.slotData
                                          ?.slot
                                          ?.radioBtnOne
                                          ?.url ??
                                      "");
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                getTextWithTransform(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.passDivTitle
                                        ?.text,
                                    'Buy this now',
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.passDivTitle
                                        ?.textTransform),
                                textAlign: getTextAlign(valueOrDefault<String>(
                                  paywallconfigResponse
                                      .data
                                      ?.configuration
                                      ?.mobile
                                      ?.json
                                      ?.styleForText
                                      ?.typography
                                      ?.passDivTitle
                                      ?.textAlign,
                                  'left',
                                )),
                                style: GoogleFonts.getFont(
                                  valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.passDivTitle
                                        ?.fontFamily,
                                    'Playfair Display',
                                  ),
                                  color:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.passDivTitle
                                        ?.color,
                                    '#ffffff',
                                  )),
                                  decorationColor:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.passDivTitle
                                        ?.color,
                                    '#ffffff',
                                  )),
                                  fontSize: 16,
                                  decoration:
                                      getTextDecoration(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.passDivTitle
                                        ?.textDecoration,
                                    "",
                                  )),
                                  fontWeight:
                                      getFontWeight(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.passDivTitle
                                        ?.fontWeight,
                                    "",
                                  )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    getTextWithTransform(
                                        "${paywallconfigResponse.data?.configuration?.mobile?.json?.styleForText?.typography?.passDivPrice?.text}${Constants.passPrice}",
                                        'RS 999',
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.passDivPrice
                                            ?.textTransform),
                                    textAlign:
                                        getTextAlign(valueOrDefault<String>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForText
                                          ?.typography
                                          ?.passDivPrice
                                          ?.textAlign,
                                      'right',
                                    )),
                                    style: GoogleFonts.getFont(
                                      valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.passDivPrice
                                            ?.fontFamily,
                                        'Roboto',
                                      ),
                                      color: colorFromCssString(
                                          valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.passDivPrice
                                            ?.color,
                                        '#ffffff',
                                      )),
                                      decoration: getTextDecoration(
                                          valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.passDivPrice
                                            ?.textDecoration,
                                        "",
                                      )),
                                      decorationColor: colorFromCssString(
                                          valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.passDivPrice
                                            ?.color,
                                        '#ffffff',
                                      )),
                                      fontSize: 20,
                                      fontWeight:
                                          getFontWeight(valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.passDivPrice
                                            ?.fontWeight,
                                        "",
                                      )),
                                    ),
                                  ),
                                  CustomPaint(
                                    foregroundPainter:
                                        StationPointPainter(Colors.white),
                                    child: Text(
                                      getTextWithTransform(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.passDivCutPrice
                                              ?.text,
                                          'RS 3999',
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.passDivCutPrice
                                              ?.textTransform),
                                      textAlign:
                                          getTextAlign(valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForText
                                            ?.typography
                                            ?.passDivCutPrice
                                            ?.textAlign,
                                        'right',
                                      )),
                                      style: GoogleFonts.getFont(
                                        valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.passDivCutPrice
                                              ?.fontFamily,
                                          'Roboto',
                                        ),
                                        decoration: getTextDecoration(
                                            valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.passDivCutPrice
                                              ?.textDecoration,
                                          "",
                                        )),
                                        decorationColor: colorFromCssString(
                                            valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.passDivCutPrice
                                              ?.color,
                                          '#ffffff',
                                        )),
                                        color: colorFromCssString(
                                            valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.passDivCutPrice
                                              ?.color,
                                          '#ffffff',
                                        )),
                                        fontSize: 12,
                                        fontWeight: getFontWeight(
                                            valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.passDivCutPrice
                                              ?.fontWeight,
                                          "",
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Radio(
                              value: 0,
                              // activeColor: Color(0xFF2196F3),
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.blue),
                              toggleable: true,
                              groupValue: _value,
                              onChanged: (int? value) {
                                setState(() {
                                  _value = value;
                                  typeOfPurchase[0] = (paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.slotData
                                          ?.slot
                                          ?.radioBtnTwo
                                          ?.value ??
                                      "");
                                  typeOfPurchase[1] = (paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.slotData
                                          ?.slot
                                          ?.radioBtnTwo
                                          ?.url ??
                                      "");
                                });

                                typeOfPurchase[0] = (paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.slotData
                                        ?.slot
                                        ?.radioBtnTwo
                                        ?.value ??
                                    "");
                                typeOfPurchase[1] = (paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.slotData
                                        ?.slot
                                        ?.radioBtnTwo
                                        ?.url ??
                                    "");
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (functions.conscentBalanceVisibilty())
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    getTextWithTransform(
                        'Conscent Balance: ₹${Constants.conscentBalance}',
                        "Conscent Balance: ₹0",
                        paywallconfigResponse
                            .data
                            ?.configuration
                            ?.mobile
                            ?.json
                            ?.styleForText
                            ?.typography
                            ?.conscentBalance
                            ?.textTransform),
                    style: GoogleFonts.getFont(
                      valueOrDefault<String>(
                        paywallconfigResponse
                            .data
                            ?.configuration
                            ?.mobile
                            ?.json
                            ?.styleForText
                            ?.typography
                            ?.conscentBalance
                            ?.fontFamily,
                        'Roboto',
                      ),
                      color: colorFromCssString(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.conscentBalance?.color,
                        '#ffffff',
                      )),
                      decorationColor:
                          colorFromCssString(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.conscentBalance?.color,
                        '#ffffff',
                      )),
                      decoration: getTextDecoration(valueOrDefault<String>(
                        paywallconfigResponse
                            .data
                            ?.configuration
                            ?.mobile
                            ?.json
                            ?.styleForText
                            ?.typography
                            ?.conscentBalance
                            ?.textDecoration,
                        "",
                      )),
                      fontWeight: getFontWeight(valueOrDefault<String>(
                        paywallconfigResponse
                            .data
                            ?.configuration
                            ?.mobile
                            ?.json
                            ?.styleForText
                            ?.typography
                            ?.conscentBalance
                            ?.fontWeight,
                        "600",
                      )),
                    ),
                  ),
                ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                  child: DottedBorder(
                    dashPattern: [
                      0,
                      getDashPattern(valueOrDefault<String>(
                        paywallconfigResponse
                            .data
                            ?.configuration
                            ?.mobile
                            ?.json
                            ?.styleForBackground
                            ?.border
                            ?.mainSubmitBtn
                            ?.borderStyle,
                        '',
                      ))
                    ],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(valueOrDefault<double>(
                      paywallconfigResponse.data?.configuration?.mobile?.json
                          ?.styleForBackground?.border?.mainSubmitBtn?.radius
                          ?.toDouble(),
                      0,
                    )),
                    strokeWidth: valueOrDefault<double>(
                      paywallconfigResponse
                          .data
                          ?.configuration
                          ?.mobile
                          ?.json
                          ?.styleForBackground
                          ?.border
                          ?.mainSubmitBtn
                          ?.borderWidthValue
                          ?.toDouble(),
                      0,
                    ),
                    color: colorFromCssString(valueOrDefault<String>(
                      paywallconfigResponse
                          .data
                          ?.configuration
                          ?.mobile
                          ?.json
                          ?.styleForBackground
                          ?.border
                          ?.mainSubmitBtn
                          ?.borderColor,
                      '#0164B1',
                    )),
                    strokeCap: getStrokeCap(valueOrDefault<String>(
                      paywallconfigResponse
                          .data
                          ?.configuration
                          ?.mobile
                          ?.json
                          ?.styleForBackground
                          ?.border
                          ?.mainSubmitBtn
                          ?.borderStyle,
                      '',
                    )),
                    child: FFButtonWidget(
                      onPressed: () async {
                        String redirectUrl = await ConscentMethods()
                            .prepareLoginChallenge(typeOfPurchase);

                        if (typeOfPurchase[0] == "subscription") {
                          ConscentMethods().paywallClickEvent("SUBS");
                        } else {
                          if (typeOfPurchase[0] == "" ||
                              typeOfPurchase[0] == null) {
                            ConscentMethods().paywallClickEvent("CONTENT");
                          } else {
                            ConscentMethods().paywallClickEvent(
                                typeOfPurchase[0].toUpperCase());
                          }
                        }

                        if (mounted) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WebViewDefaultApp(redirectUrl: redirectUrl),
                              )).then((value) {
                            if (value != null) {
                              dynamic response = value['response'];
                              widget.sessionCallback(response);
                            }
                          });
                        }
                      },
                      text: getTextWithTransform(
                          paywallconfigResponse
                              .data
                              ?.configuration
                              ?.mobile
                              ?.json
                              ?.styleForText
                              ?.typography
                              ?.mainSubmitBtn
                              ?.text,
                          'Subscribe',
                          paywallconfigResponse
                              .data
                              ?.configuration
                              ?.mobile
                              ?.json
                              ?.styleForText
                              ?.typography
                              ?.mainSubmitBtn
                              ?.textTransform),
                      options: FFButtonOptions(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.06,
                        color: colorFromCssString(valueOrDefault<String>(
                          paywallconfigResponse
                              .data
                              ?.configuration
                              ?.mobile
                              ?.json
                              ?.styleForBackground
                              ?.border
                              ?.mainSubmitBtn
                              ?.backgroundColor,
                          '#0164B1',
                        )),
                        textStyle: GoogleFonts.getFont(
                          valueOrDefault<String>(
                            paywallconfigResponse
                                .data
                                ?.configuration
                                ?.mobile
                                ?.json
                                ?.styleForText
                                ?.typography
                                ?.mainSubmitBtn
                                ?.fontFamily,
                            'Roboto',
                          ),
                          fontSize: 18,
                          decoration: getTextDecoration(valueOrDefault<String>(
                            paywallconfigResponse
                                .data
                                ?.configuration
                                ?.mobile
                                ?.json
                                ?.styleForText
                                ?.typography
                                ?.mainSubmitBtn
                                ?.textDecoration,
                            "",
                          )),
                          decorationColor:
                              colorFromCssString(valueOrDefault<String>(
                            paywallconfigResponse
                                .data
                                ?.configuration
                                ?.mobile
                                ?.json
                                ?.styleForText
                                ?.typography
                                ?.mainSubmitBtn
                                ?.color,
                            '#ffffff',
                          )),
                          color: colorFromCssString(valueOrDefault<String>(
                            paywallconfigResponse
                                .data
                                ?.configuration
                                ?.mobile
                                ?.json
                                ?.styleForText
                                ?.typography
                                ?.mainSubmitBtn
                                ?.color,
                            '#ffffff',
                          )),
                        ),
                        borderRadius:
                            BorderRadius.circular(valueOrDefault<double>(
                          paywallconfigResponse
                              .data
                              ?.configuration
                              ?.mobile
                              ?.json
                              ?.styleForBackground
                              ?.border
                              ?.mainSubmitBtn
                              ?.radius
                              ?.toDouble(),
                          0,
                        )),
                      ),
                    ),
                  )),
              Align(
                alignment: const AlignmentDirectional(-0.05, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (Constants.contentDetails2?.couponForPass?.code !=
                              null &&
                          Constants.contentDetails2?.couponForPass?.code != "")
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              getTextWithTransform(
                                  'Have a coupon code? ',
                                  'Have a coupon code? ',
                                  paywallconfigResponse
                                      .data
                                      ?.configuration
                                      ?.mobile
                                      ?.json
                                      ?.styleForText
                                      ?.typography
                                      ?.couponLeftText
                                      ?.textTransform),
                              style: GoogleFonts.getFont(
                                valueOrDefault<String>(
                                  paywallconfigResponse
                                      .data
                                      ?.configuration
                                      ?.mobile
                                      ?.json
                                      ?.styleForText
                                      ?.typography
                                      ?.couponLeftText
                                      ?.fontFamily,
                                  'Roboto',
                                ),
                                fontSize: 14,
                                color:
                                    colorFromCssString(valueOrDefault<String>(
                                  paywallconfigResponse
                                      .data
                                      ?.configuration
                                      ?.mobile
                                      ?.json
                                      ?.styleForText
                                      ?.typography
                                      ?.couponLeftText
                                      ?.color,
                                  '#ffffff',
                                )),
                                decorationColor:
                                    colorFromCssString(valueOrDefault<String>(
                                  paywallconfigResponse
                                      .data
                                      ?.configuration
                                      ?.mobile
                                      ?.json
                                      ?.styleForText
                                      ?.typography
                                      ?.couponLeftText
                                      ?.color,
                                  '#ffffff',
                                )),
                                decoration:
                                    getTextDecoration(valueOrDefault<String>(
                                  paywallconfigResponse
                                      .data
                                      ?.configuration
                                      ?.mobile
                                      ?.json
                                      ?.styleForText
                                      ?.typography
                                      ?.couponLeftText
                                      ?.textDecoration,
                                  "",
                                )),
                                fontWeight:
                                    getFontWeight(valueOrDefault<String>(
                                  paywallconfigResponse
                                      .data
                                      ?.configuration
                                      ?.mobile
                                      ?.json
                                      ?.styleForText
                                      ?.typography
                                      ?.couponLeftText
                                      ?.fontWeight,
                                  "",
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                typeOfPurchase.first = "";
                                String redirectUrl = await ConscentMethods()
                                    .prepareLoginChallenge(typeOfPurchase);

                                if (typeOfPurchase[0] == "subscription") {
                                  ConscentMethods().paywallClickEvent("SUBS");
                                } else {
                                  ConscentMethods().paywallClickEvent(
                                      typeOfPurchase[0].toUpperCase());
                                }

                                if (mounted) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WebViewDefaultApp(
                                            redirectUrl: redirectUrl),
                                      )).then((value) {
                                    if (value != null) {
                                      dynamic response = value['response'];
                                      widget.sessionCallback(response);
                                    }
                                  });
                                }
                              },
                              child: Text(
                                getTextWithTransform(
                                    '${Constants.contentDetails2?.couponForPass?.code}',
                                    'Click here',
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.couponRightText
                                        ?.textTransform),
                                style: GoogleFonts.getFont(
                                  valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.couponRightText
                                        ?.fontFamily,
                                    'Roboto',
                                  ),
                                  fontSize: 14,
                                  color:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.couponRightText
                                        ?.color,
                                    '#ffffff',
                                  )),
                                  decorationColor:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.couponRightText
                                        ?.color,
                                    '#ffffff',
                                  )),
                                  fontWeight:
                                      getFontWeight(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.couponRightText
                                        ?.fontWeight,
                                    "500",
                                  )),
                                  decoration:
                                      getTextDecoration(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.couponRightText
                                        ?.textDecoration,
                                    "",
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      if (!Constants.logIn)
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                getTextWithTransform(
                                    'Already Purchased? ',
                                    'Already Purchased? ',
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.alreadyLeftText
                                        ?.textTransform),
                                style: GoogleFonts.getFont(
                                  valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.alreadyLeftText
                                        ?.fontFamily,
                                    'Roboto',
                                  ),
                                  fontSize: 14,
                                  color:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.alreadyLeftText
                                        ?.color,
                                    '#ffffff',
                                  )),
                                  fontWeight:
                                      getFontWeight(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.alreadyLeftText
                                        ?.fontWeight,
                                    "",
                                  )),
                                  decoration:
                                      getTextDecoration(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.alreadyLeftText
                                        ?.textDecoration,
                                    "",
                                  )),
                                  decorationColor:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.alreadyLeftText
                                        ?.color,
                                    '#ffffff',
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  typeOfPurchase.first = "";
                                  String redirectUrl = await ConscentMethods()
                                      .prepareLoginChallenge(typeOfPurchase);
                                  if (typeOfPurchase[0] == "subscription") {
                                    ConscentMethods().paywallClickEvent("SUBS");
                                  } else {
                                    ConscentMethods().paywallClickEvent(
                                        typeOfPurchase[0].toUpperCase());
                                  }
                                  if (mounted) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              WebViewDefaultApp(
                                                  redirectUrl: redirectUrl),
                                        )).then((value) {
                                      if (value != null) {
                                        dynamic response = value['response'];
                                        widget.sessionCallback(response);
                                      }
                                    });
                                  }
                                },
                                child: Text(
                                  getTextWithTransform(
                                      'Login',
                                      'Login',
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForText
                                          ?.typography
                                          ?.loginText
                                          ?.textTransform),
                                  style: GoogleFonts.getFont(
                                    valueOrDefault<String>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForText
                                          ?.typography
                                          ?.loginText
                                          ?.fontFamily,
                                      'Roboto',
                                    ),
                                    fontSize: 14,
                                    color: colorFromCssString(
                                        valueOrDefault<String>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForText
                                          ?.typography
                                          ?.loginText
                                          ?.color,
                                      '#ffffff',
                                    )),
                                    fontWeight:
                                        getFontWeight(valueOrDefault<String>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForText
                                          ?.typography
                                          ?.loginText
                                          ?.fontWeight,
                                      "500",
                                    )),
                                    decoration: getTextDecoration(
                                        valueOrDefault<String>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForText
                                          ?.typography
                                          ?.loginText
                                          ?.textDecoration,
                                      "",
                                    )),
                                    decorationColor: colorFromCssString(
                                        valueOrDefault<String>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForText
                                          ?.typography
                                          ?.loginText
                                          ?.color,
                                      '#ffffff',
                                    )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
