import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../conscent_methods.dart';
import '../../constants.dart';
import '../../utils/utils.dart';
import '../../web_view_default.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class Paywall3A extends StatefulWidget {
  Function(bool) sessionCallback;

  Paywall3A(this.sessionCallback, {Key? key}) : super(key: key);

  @override
  _Paywall3AState createState() => _Paywall3AState();
}

class _Paywall3AState extends State<Paywall3A> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final paywallconfigResponse = Constants.paywallConfig;
  List<String> typeOfPurchase = ["subscription", ""];
  bool isContentButton = false;
  bool isPassButton = false;
  bool isSubscribeButton = true;

  double paywallHeight = 0.55;

  @override
  void initState() {
    ConscentMethods().paywallViewEvent();
    typeOfPurchase[0] = (paywallconfigResponse.data?.configuration?.mobile?.json
            ?.slotData?.slot?.contentDivBtn?.value ??
        "");
    typeOfPurchase[1] = (paywallconfigResponse.data?.configuration?.mobile?.json
            ?.slotData?.slot?.contentDivBtn?.url ??
        "");
    isSubscribeButton = paywallconfigResponse
            .data?.configuration?.mobile?.templateId?.numberOfCta !=
        1;
    super.initState();

    if (paywallconfigResponse
            .data?.configuration?.mobile?.templateId?.numberOfCta ==
        1) {
      paywallHeight = 0.41;
    }
    if (paywallconfigResponse
            .data?.configuration?.mobile?.templateId?.numberOfCta ==
        2) {
      paywallHeight = 0.41;
    }
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * paywallHeight,
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
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Text(
                      getTextWithTransform(
                          paywallconfigResponse.data?.configuration?.mobile
                              ?.json?.styleForText?.typography?.heading?.text,
                          'Don’t miss out on the full story',
                          paywallconfigResponse
                              .data
                              ?.configuration
                              ?.mobile
                              ?.json
                              ?.styleForText
                              ?.typography
                              ?.heading
                              ?.textTransform),
                      textAlign: getTextAlign(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.textAlign,
                        '',
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
                              ?.heading
                              ?.fontFamily,
                          'Playfair Display',
                        ),
                        color: colorFromCssString(valueOrDefault<String>(
                          paywallconfigResponse.data?.configuration?.mobile
                              ?.json?.styleForText?.typography?.heading?.color,
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
                              ?.heading
                              ?.textDecoration,
                          "",
                        )),
                        decorationColor:
                            colorFromCssString(valueOrDefault<String>(
                          paywallconfigResponse.data?.configuration?.mobile
                              ?.json?.styleForText?.typography?.heading?.color,
                          '#ffffff',
                        )),
                        fontSize: 22,
                        fontWeight: getFontWeight(valueOrDefault<String>(
                          paywallconfigResponse
                              .data
                              ?.configuration
                              ?.mobile
                              ?.json
                              ?.styleForText
                              ?.typography
                              ?.heading
                              ?.fontWeight,
                          "",
                        )),
                      ),
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(50, 12, 50, 0),
                      child: Text(
                        getTextWithTransform(
                            paywallconfigResponse
                                .data
                                ?.configuration
                                ?.mobile
                                ?.json
                                ?.styleForText
                                ?.typography
                                ?.subHeading
                                ?.text,
                            'Subscribe for unlimited, uninterrupted and easy digital access',
                            paywallconfigResponse
                                .data
                                ?.configuration
                                ?.mobile
                                ?.json
                                ?.styleForText
                                ?.typography
                                ?.subHeading
                                ?.textTransform),
                        textAlign: getTextAlign(valueOrDefault<String>(
                          paywallconfigResponse
                              .data
                              ?.configuration
                              ?.mobile
                              ?.json
                              ?.styleForText
                              ?.typography
                              ?.subHeading
                              ?.textAlign,
                          '',
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
                                ?.subHeading
                                ?.fontFamily,
                            'Roboto',
                          ),
                          color: colorFromCssString(valueOrDefault<String>(
                            paywallconfigResponse
                                .data
                                ?.configuration
                                ?.mobile
                                ?.json
                                ?.styleForText
                                ?.typography
                                ?.subHeading
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
                                ?.subHeading
                                ?.color,
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
                                ?.subHeading
                                ?.textDecoration,
                            "",
                          )),
                          fontSize: 12,
                          fontWeight: getFontWeight(valueOrDefault<String>(
                            paywallconfigResponse
                                .data
                                ?.configuration
                                ?.mobile
                                ?.json
                                ?.styleForText
                                ?.typography
                                ?.subHeading
                                ?.fontWeight,
                            "",
                          )),
                        ),
                      )),
                ],
              ),
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 10, 0),
                                child: InkWell(
                                    onTap: () {
                                      typeOfPurchase[0] = (paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.slotData
                                              ?.slot
                                              ?.contentDivBtn
                                              ?.value ??
                                          "");
                                      typeOfPurchase[1] = (paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.slotData
                                              ?.slot
                                              ?.contentDivBtn
                                              ?.url ??
                                          "");
                                      isContentButton = false;
                                      isPassButton = false;
                                      isSubscribeButton = isSubscribeButton =
                                          paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.templateId
                                                  ?.numberOfCta !=
                                              1;
                                      setState(() {});
                                    },
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
                                              ?.contentDivBtn
                                              ?.borderStyle,
                                          '',
                                        ))
                                      ],
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(
                                          valueOrDefault<double>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForBackground
                                            ?.border
                                            ?.contentDivBtn
                                            ?.radius
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
                                            ?.contentDivBtn
                                            ?.borderWidthValue
                                            ?.toDouble(),
                                        0,
                                      ),
                                      color: isSubscribeButton
                                          ? Colors.blue
                                          : colorFromCssString(
                                              valueOrDefault<String>(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForBackground
                                                  ?.border
                                                  ?.contentDivBtn
                                                  ?.borderColor,
                                              '#0164B1',
                                            )),
                                      strokeCap:
                                          getStrokeCap(valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForBackground
                                            ?.border
                                            ?.contentDivBtn
                                            ?.borderStyle,
                                        '',
                                      )),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          minHeight: 100,
                                          maxWidth: 150,
                                        ),
                                        decoration: BoxDecoration(
                                          color: colorFromCssString(
                                              valueOrDefault<String>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForBackground
                                                ?.border
                                                ?.contentDivBtn
                                                ?.backgroundColor,
                                            '#232323',
                                          )),
                                          borderRadius: BorderRadius.circular(
                                              valueOrDefault<double>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForBackground
                                                ?.border
                                                ?.contentDivBtn
                                                ?.radius
                                                ?.toDouble(),
                                            0,
                                          )),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(5, 0, 5, 0),
                                                child: Text(
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
                                                      'Weekly Micropayment',
                                                      paywallconfigResponse
                                                          .data
                                                          ?.configuration
                                                          ?.mobile
                                                          ?.json
                                                          ?.styleForText
                                                          ?.typography
                                                          ?.contentDivTitle
                                                          ?.textTransform),
                                                  textAlign: TextAlign.center,
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
                                                          ?.contentDivTitle
                                                          ?.color,
                                                      '#0056d6',
                                                    )),
                                                    decoration:
                                                        getTextDecoration(
                                                            valueOrDefault<
                                                                String>(
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
                                                    decorationColor:
                                                        colorFromCssString(
                                                            valueOrDefault<
                                                                String>(
                                                      paywallconfigResponse
                                                          .data
                                                          ?.configuration
                                                          ?.mobile
                                                          ?.json
                                                          ?.styleForText
                                                          ?.typography
                                                          ?.contentDivTitle
                                                          ?.color,
                                                      '#0056d6',
                                                    )),
                                                    fontSize: 16,
                                                    fontWeight: getFontWeight(
                                                        valueOrDefault<String>(
                                                      paywallconfigResponse
                                                          .data
                                                          ?.configuration
                                                          ?.mobile
                                                          ?.json
                                                          ?.styleForText
                                                          ?.typography
                                                          ?.contentDivTitle
                                                          ?.fontWeight,
                                                      "700",
                                                    )),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 5, 0, 0),
                                                child: Text(
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
                                                  textAlign: TextAlign.center,
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
                                                    decoration:
                                                        getTextDecoration(
                                                            valueOrDefault<
                                                                String>(
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
                                                    decorationColor:
                                                        colorFromCssString(
                                                            valueOrDefault<
                                                                String>(
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
                                                    fontSize: 16,
                                                    fontWeight: getFontWeight(
                                                        valueOrDefault<String>(
                                                      paywallconfigResponse
                                                          .data
                                                          ?.configuration
                                                          ?.mobile
                                                          ?.json
                                                          ?.styleForText
                                                          ?.typography
                                                          ?.contentDivPrice
                                                          ?.fontWeight,
                                                      "700",
                                                    )),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))),
                            if (paywallconfigResponse.data?.configuration
                                        ?.mobile?.templateId?.numberOfCta ==
                                    2 ||
                                paywallconfigResponse.data?.configuration
                                        ?.mobile?.templateId?.numberOfCta ==
                                    3)
                              Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      typeOfPurchase[0] = (paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.slotData
                                              ?.slot
                                              ?.passDivBtn
                                              ?.value ??
                                          "");
                                      typeOfPurchase[1] = (paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.slotData
                                              ?.slot
                                              ?.passDivBtn
                                              ?.url ??
                                          "");
                                      isContentButton = false;
                                      isPassButton = true;
                                      isSubscribeButton = false;
                                      setState(() {});
                                    },
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
                                              ?.passDivBtn
                                              ?.borderStyle,
                                          '',
                                        ))
                                      ],
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(
                                          valueOrDefault<double>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForBackground
                                            ?.border
                                            ?.passDivBtn
                                            ?.radius
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
                                            ?.passDivBtn
                                            ?.borderWidthValue
                                            ?.toDouble(),
                                        0,
                                      ),
                                      color: isPassButton
                                          ? Colors.blue
                                          : colorFromCssString(
                                              valueOrDefault<String>(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForBackground
                                                  ?.border
                                                  ?.passDivBtn
                                                  ?.borderColor,
                                              '#858080',
                                            )),
                                      strokeCap:
                                          getStrokeCap(valueOrDefault<String>(
                                        paywallconfigResponse
                                            .data
                                            ?.configuration
                                            ?.mobile
                                            ?.json
                                            ?.styleForBackground
                                            ?.border
                                            ?.passDivBtn
                                            ?.borderStyle,
                                        '',
                                      )),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          minHeight: 100,
                                          maxWidth: 150,
                                        ),
                                        decoration: BoxDecoration(
                                          color: colorFromCssString(
                                              valueOrDefault<String>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForBackground
                                                ?.border
                                                ?.passDivBtn
                                                ?.backgroundColor,
                                            '#232323',
                                          )),
                                          borderRadius: BorderRadius.circular(
                                              valueOrDefault<double>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForBackground
                                                ?.border
                                                ?.passDivBtn
                                                ?.radius
                                                ?.toDouble(),
                                            0,
                                          )),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
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
                                                    'Weekly Pass',
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.passDivTitle
                                                        ?.textTransform),
                                                textAlign: TextAlign.center,
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
                                                        ?.passDivTitle
                                                        ?.textDecoration,
                                                    "",
                                                  )),
                                                  decorationColor:
                                                      colorFromCssString(
                                                          valueOrDefault<
                                                              String>(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.passDivTitle
                                                        ?.color,
                                                    '#0056d6',
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
                                                        ?.passDivTitle
                                                        ?.color,
                                                    '#0056d6',
                                                  )),
                                                  fontSize: 16,
                                                  fontWeight: getFontWeight(
                                                      valueOrDefault<String>(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.passDivTitle
                                                        ?.fontWeight,
                                                    "700",
                                                  )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 5, 0, 0),
                                                child: Text(
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
                                                  textAlign: TextAlign.center,
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
                                                    fontSize: 16,
                                                    decoration:
                                                        getTextDecoration(
                                                            valueOrDefault<
                                                                String>(
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
                                                    decorationColor:
                                                        colorFromCssString(
                                                            valueOrDefault<
                                                                String>(
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
                                                    fontWeight: getFontWeight(
                                                        valueOrDefault<String>(
                                                      paywallconfigResponse
                                                          .data
                                                          ?.configuration
                                                          ?.mobile
                                                          ?.json
                                                          ?.styleForText
                                                          ?.typography
                                                          ?.passDivPrice
                                                          ?.fontWeight,
                                                      "700",
                                                    )),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                          ],
                        ),
                      ),
                      if (paywallconfigResponse.data?.configuration?.mobile
                              ?.templateId?.numberOfCta ==
                          3)
                        Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 5, 0, 0),
                            child: InkWell(
                                onTap: () async {
                                  typeOfPurchase[0] = (paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.slotData
                                          ?.slot
                                          ?.subDivBtn
                                          ?.value ??
                                      "");
                                  typeOfPurchase[1] = (paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.slotData
                                          ?.slot
                                          ?.subDivBtn
                                          ?.url ??
                                      "");
                                  isContentButton = true;
                                  isPassButton = false;
                                  isSubscribeButton = false;
                                  setState(() {});
                                },
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
                                            ?.subDivBtn
                                            ?.borderStyle,
                                        '',
                                      ))
                                    ],
                                    borderType: BorderType.RRect,
                                    radius:
                                        Radius.circular(valueOrDefault<double>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForBackground
                                          ?.border
                                          ?.subDivBtn
                                          ?.radius
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
                                          ?.subDivBtn
                                          ?.borderWidthValue
                                          ?.toDouble(),
                                      0,
                                    ),
                                    color: isContentButton
                                        ? Colors.blue
                                        : colorFromCssString(
                                            valueOrDefault<String>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForBackground
                                                ?.border
                                                ?.subDivBtn
                                                ?.borderColor,
                                            '#858080',
                                          )),
                                    strokeCap:
                                        getStrokeCap(valueOrDefault<String>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForBackground
                                          ?.border
                                          ?.subDivBtn
                                          ?.borderStyle,
                                      '',
                                    )),
                                    child: Container(
                                      constraints: const BoxConstraints(
                                          minHeight: 100, maxWidth: 150),
                                      decoration: BoxDecoration(
                                        color: colorFromCssString(
                                            valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForBackground
                                              ?.border
                                              ?.subDivBtn
                                              ?.backgroundColor,
                                          '#232323',
                                        )),
                                        borderRadius: BorderRadius.circular(
                                            valueOrDefault<double>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForBackground
                                              ?.border
                                              ?.subDivBtn
                                              ?.radius
                                              ?.toDouble(),
                                          0,
                                        )),
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              getTextWithTransform(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subDivTitle
                                                      ?.text,
                                                  'Subscription',
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subDivTitle
                                                      ?.textTransform),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.getFont(
                                                valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subDivTitle
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
                                                      ?.subDivTitle
                                                      ?.color,
                                                  '#0056d6',
                                                )),
                                                fontSize: 16,
                                                decoration: getTextDecoration(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subDivTitle
                                                      ?.textDecoration,
                                                  "",
                                                )),
                                                decorationColor:
                                                    colorFromCssString(
                                                        valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subDivTitle
                                                      ?.color,
                                                  '#0056d6',
                                                )),
                                                fontWeight: getFontWeight(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subDivTitle
                                                      ?.fontWeight,
                                                  "700",
                                                )),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),
                                              child: Text(
                                                getTextWithTransform(
                                                    "${paywallconfigResponse.data?.configuration?.mobile?.json?.styleForText?.typography?.subDivPrice?.text}${Constants.subscriptionPrice}",
                                                    'RS 999',
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.subDivPrice
                                                        ?.textTransform),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.getFont(
                                                  valueOrDefault<String>(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.subDivPrice
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
                                                        ?.subDivPrice
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
                                                        ?.subDivPrice
                                                        ?.textDecoration,
                                                    "",
                                                  )),
                                                  decorationColor:
                                                      colorFromCssString(
                                                          valueOrDefault<
                                                              String>(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.subDivPrice
                                                        ?.color,
                                                    '#ffffff',
                                                  )),
                                                  fontSize: 16,
                                                  fontWeight: getFontWeight(
                                                      valueOrDefault<String>(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.subDivPrice
                                                        ?.fontWeight,
                                                    "700",
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )))),
                    ],
                  )),
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
                      decorationColor:
                          colorFromCssString(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.conscentBalance?.color,
                        '#ffffff',
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 10),
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
                          if (typeOfPurchase[0] == "") {
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
                        width: MediaQuery.of(context).size.width * 0.8,
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
