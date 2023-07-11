import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../conscent_methods.dart';
import '../../constants.dart';
import '../../datamodel/paywall_config.dart';
import '../../utils/utils.dart';
import '../../web_view_default.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class Inarticle5A3CTAWidget extends StatefulWidget {
  Function(bool) sessionCallback;

  Inarticle5A3CTAWidget(this.sessionCallback, {Key? key}) : super(key: key);

  @override
  _Inarticle5A3CTAWidgetState createState() => _Inarticle5A3CTAWidgetState();
}

class _Inarticle5A3CTAWidgetState extends State<Inarticle5A3CTAWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  List<String> typeOfPurchase = ["subscription", ""];
  bool isContentButton = false;
  bool isPassButton = false;
  bool isSubscribeButton = true;

  @override
  void initState() {
    ConscentMethods().paywallViewEvent();
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PaywallConfig paywallconfigResponse = Constants.paywallConfig;

    double boxWidth = 0.35;
    double innerPadding = 15;
    if (paywallconfigResponse
            .data?.configuration?.mobile?.templateId?.numberOfCta ==
        3) {
      boxWidth = 0.28;
      innerPadding = 10;
    }

    if (paywallconfigResponse
            .data?.configuration?.mobile?.templateId?.numberOfCta ==
        1) {
      typeOfPurchase[0] = (paywallconfigResponse.data?.configuration?.mobile
              ?.json?.slotData?.slot?.contentDivBtn?.value ??
          "");
      // isContentButton = true;
      // isPassButton = false;
      // isSubscribeButton = false;
      // setState(() {});
    }

    return Container(
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
        padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 28),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    getTextWithTransform(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.text,
                        'Don’t miss out on the full story',
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.textTransform),
                    textAlign: getTextAlign(valueOrDefault<String>(
                      paywallconfigResponse.data?.configuration?.mobile?.json
                          ?.styleForText?.typography?.heading?.textAlign,
                      '',
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
                      fontSize: 22,
                      fontWeight: getFontWeight(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.fontWeight,
                        "",
                      )),
                      decoration: getTextDecoration(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.textDecoration,
                        "",
                      )),
                      decorationColor:
                          colorFromCssString(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.heading?.color,
                        '#ffffff',
                      )),
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
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (paywallconfigResponse.data?.configuration?.mobile
                            ?.templateId?.numberOfCta ==
                        1)
                      InkWell(
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
                          isContentButton = true;
                          isPassButton = false;
                          isSubscribeButton = false;
                          // setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.2,
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
                                      ?.contentDiv
                                      ?.borderStyle,
                                  '',
                                ))
                              ],
                              borderType: BorderType.RRect,
                              radius: Radius.circular(valueOrDefault<double>(
                                paywallconfigResponse
                                    .data
                                    ?.configuration
                                    ?.mobile
                                    ?.json
                                    ?.styleForBackground
                                    ?.border
                                    ?.contentDiv
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
                                    ?.contentDiv
                                    ?.borderWidthValue
                                    ?.toDouble(),
                                0,
                              ),
                              color: isContentButton
                                  ? Colors.blue
                                  : colorFromCssString(valueOrDefault<String>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForBackground
                                          ?.border
                                          ?.contentDiv
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
                                    ?.contentDiv
                                    ?.borderStyle,
                                '',
                              )),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(
                                  color:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForBackground
                                        ?.border
                                        ?.contentDiv
                                        ?.backgroundColor,
                                    '#000000',
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
                                        ?.contentDiv
                                        ?.radius
                                        ?.toDouble(),
                                    0,
                                  )),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
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
                                                ?.contentHeader
                                                ?.backgroundColor,
                                            '#FFFFFF',
                                          )),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                const Radius.circular(0),
                                            bottomRight:
                                                const Radius.circular(0),
                                            topLeft: Radius.circular(
                                                valueOrDefault<double>(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForBackground
                                                  ?.border
                                                  ?.contentDiv
                                                  ?.radius
                                                  ?.toDouble(),
                                              0,
                                            )),
                                            topRight: Radius.circular(
                                                valueOrDefault<double>(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForBackground
                                                  ?.border
                                                  ?.contentDiv
                                                  ?.radius
                                                  ?.toDouble(),
                                              0,
                                            )),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 5, 0, 2),
                                            child: AutoSizeText(
                                              getTextWithTransform(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.contentHeader
                                                      ?.text,
                                                  'Day Pass',
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.contentHeader
                                                      ?.textTransform),
                                              textAlign: getTextAlign(
                                                  valueOrDefault<String>(
                                                paywallconfigResponse
                                                    .data
                                                    ?.configuration
                                                    ?.mobile
                                                    ?.json
                                                    ?.styleForText
                                                    ?.typography
                                                    ?.contentHeader
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
                                                      ?.contentHeader
                                                      ?.fontFamily,
                                                  'Roboto',
                                                ),
                                                fontWeight: getFontWeight(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.contentHeader
                                                      ?.fontWeight,
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
                                                      ?.contentHeader
                                                      ?.color,
                                                  '#0164B1',
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
                                                      ?.contentHeader
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
                                                      ?.contentHeader
                                                      ?.color,
                                                  '#ffffff',
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 12, 0, 0),
                                        child: AutoSizeText(
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
                                          textAlign: getTextAlign(
                                              valueOrDefault<String>(
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
                                                  ?.contentDivPrice
                                                  ?.fontFamily,
                                              'Roboto',
                                            ),
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
                                                  ?.contentDivPrice
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
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12, 8, 12, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
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
                                                      ?.contentDivCutPrice
                                                      ?.text,
                                                  '50% off',
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.contentDivCutPrice
                                                      ?.textTransform),
                                              textAlign: getTextAlign(
                                                  valueOrDefault<String>(
                                                paywallconfigResponse
                                                    .data
                                                    ?.configuration
                                                    ?.mobile
                                                    ?.json
                                                    ?.styleForText
                                                    ?.typography
                                                    ?.contentDivCutPrice
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
                                                      ?.contentDivCutPrice
                                                      ?.fontFamily,
                                                  'Roboto',
                                                ),
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
                                                  "200",
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
                                                      ?.contentDivCutPrice
                                                      ?.color,
                                                  '#ffffff',
                                                )),
                                                fontSize: 10,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                getTextWithTransform(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.contentDivSymbolPrice
                                                        ?.text,
                                                    '@₹80',
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.contentDivSymbolPrice
                                                        ?.textTransform),
                                                textAlign: getTextAlign(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.contentDivSymbolPrice
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
                                                        ?.contentDivSymbolPrice
                                                        ?.fontFamily,
                                                    'Roboto',
                                                  ),
                                                  fontWeight: getFontWeight(
                                                      valueOrDefault<String>(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.contentDivSymbolPrice
                                                        ?.fontWeight,
                                                    "200",
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
                                                        ?.contentDivSymbolPrice
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
                                                        ?.contentDivSymbolPrice
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
                                                        ?.contentDivSymbolPrice
                                                        ?.color,
                                                    '#ffffff',
                                                  )),
                                                  fontSize: 10,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 10, 0, 5),
                                        child: AutoSizeText(
                                          getTextWithTransform(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.contentDivDiscription
                                                  ?.text,
                                              '24 hours unlimited access',
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.contentDivDiscription
                                                  ?.textTransform),
                                          textAlign: getTextAlign(
                                              valueOrDefault<String>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForText
                                                ?.typography
                                                ?.contentDivDiscription
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
                                                  ?.contentDivDiscription
                                                  ?.fontFamily,
                                              'Roboto',
                                            ),
                                            fontWeight: getFontWeight(
                                                valueOrDefault<String>(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.contentDivDiscription
                                                  ?.fontWeight,
                                              "300",
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
                                                  ?.contentDivDiscription
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
                                                  ?.contentDivDiscription
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
                                                  ?.contentDivDiscription
                                                  ?.color,
                                              '#ffffff',
                                            )),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (paywallconfigResponse.data?.configuration?.mobile
                                ?.templateId?.numberOfCta ==
                            2 ||
                        paywallconfigResponse.data?.configuration?.mobile
                                ?.templateId?.numberOfCta ==
                            3)
                      InkWell(
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
                          isContentButton = true;
                          isPassButton = false;
                          isSubscribeButton = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, 0, innerPadding, 0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * boxWidth,
                            height: MediaQuery.of(context).size.height * 0.2,
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
                              radius: Radius.circular(valueOrDefault<double>(
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
                              color: isContentButton
                                  ? Colors.blue
                                  : colorFromCssString(valueOrDefault<String>(
                                      paywallconfigResponse
                                          .data
                                          ?.configuration
                                          ?.mobile
                                          ?.json
                                          ?.styleForBackground
                                          ?.border
                                          ?.contentDivBtn
                                          ?.borderColor,
                                      '#858080',
                                    )),
                              strokeCap: getStrokeCap(valueOrDefault<String>(
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
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(
                                  color:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForBackground
                                        ?.border
                                        ?.contentDivBtn
                                        ?.backgroundColor,
                                    '#000000',
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
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
                                                ?.contentHeader
                                                ?.backgroundColor,
                                            '#FFFFFF',
                                          )),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                const Radius.circular(0),
                                            bottomRight:
                                                const Radius.circular(0),
                                            topLeft: Radius.circular(
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
                                            topRight: Radius.circular(
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
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 5, 0, 2),
                                            child: AutoSizeText(
                                              getTextWithTransform(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.contentHeader
                                                      ?.text,
                                                  'Day Pass',
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.contentHeader
                                                      ?.textTransform),
                                              textAlign: getTextAlign(
                                                  valueOrDefault<String>(
                                                paywallconfigResponse
                                                    .data
                                                    ?.configuration
                                                    ?.mobile
                                                    ?.json
                                                    ?.styleForText
                                                    ?.typography
                                                    ?.contentHeader
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
                                                      ?.contentHeader
                                                      ?.fontFamily,
                                                  'Roboto',
                                                ),
                                                fontWeight: getFontWeight(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.contentHeader
                                                      ?.fontWeight,
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
                                                      ?.contentHeader
                                                      ?.color,
                                                  '#0164B1',
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
                                                      ?.contentHeader
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
                                                      ?.contentHeader
                                                      ?.color,
                                                  '#ffffff',
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 12, 0, 0),
                                        child: AutoSizeText(
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
                                          textAlign: getTextAlign(
                                              valueOrDefault<String>(
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
                                                  ?.contentDivPrice
                                                  ?.fontFamily,
                                              'Roboto',
                                            ),
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
                                                  ?.contentDivPrice
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
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12, 8, 12, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
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
                                                      ?.contentDivCutPrice
                                                      ?.text,
                                                  '50% off',
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.contentDivCutPrice
                                                      ?.textTransform),
                                              textAlign: getTextAlign(
                                                  valueOrDefault<String>(
                                                paywallconfigResponse
                                                    .data
                                                    ?.configuration
                                                    ?.mobile
                                                    ?.json
                                                    ?.styleForText
                                                    ?.typography
                                                    ?.contentDivCutPrice
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
                                                      ?.contentDivCutPrice
                                                      ?.fontFamily,
                                                  'Roboto',
                                                ),
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
                                                  "200",
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
                                                      ?.contentDivCutPrice
                                                      ?.color,
                                                  '#ffffff',
                                                )),
                                                fontSize: 10,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                getTextWithTransform(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.contentDivSymbolPrice
                                                        ?.text,
                                                    '@₹80',
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.contentDivSymbolPrice
                                                        ?.textTransform),
                                                textAlign: getTextAlign(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.contentDivSymbolPrice
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
                                                        ?.contentDivSymbolPrice
                                                        ?.fontFamily,
                                                    'Roboto',
                                                  ),
                                                  fontWeight: getFontWeight(
                                                      valueOrDefault<String>(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.contentDivSymbolPrice
                                                        ?.fontWeight,
                                                    "200",
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
                                                        ?.contentDivSymbolPrice
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
                                                        ?.contentDivSymbolPrice
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
                                                        ?.contentDivSymbolPrice
                                                        ?.color,
                                                    '#ffffff',
                                                  )),
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 10, 0, 5),
                                        child: AutoSizeText(
                                          getTextWithTransform(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.contentDivDiscription
                                                  ?.text,
                                              '24 hours unlimited access',
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.contentDivDiscription
                                                  ?.textTransform),
                                          textAlign: getTextAlign(
                                              valueOrDefault<String>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForText
                                                ?.typography
                                                ?.contentDivDiscription
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
                                                  ?.contentDivDiscription
                                                  ?.fontFamily,
                                              'Roboto',
                                            ),
                                            fontWeight: getFontWeight(
                                                valueOrDefault<String>(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.contentDivDiscription
                                                  ?.fontWeight,
                                              "300",
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
                                                  ?.contentDivDiscription
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
                                                  ?.contentDivDiscription
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
                                                  ?.contentDivDiscription
                                                  ?.color,
                                              '#ffffff',
                                            )),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (paywallconfigResponse.data?.configuration?.mobile
                                ?.templateId?.numberOfCta ==
                            2 ||
                        paywallconfigResponse.data?.configuration?.mobile
                                ?.templateId?.numberOfCta ==
                            3)
                      InkWell(
                        onTap: () {
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
                                  ?.contentDivBtn
                                  ?.url ??
                              "");
                          isContentButton = false;
                          isPassButton = true;
                          isSubscribeButton = false;
                          setState(() {});
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              innerPadding, 0, 0, 0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * boxWidth,
                            height: MediaQuery.of(context).size.height * 0.2,
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
                              radius: Radius.circular(valueOrDefault<double>(
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
                                  : colorFromCssString(valueOrDefault<String>(
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
                              strokeCap: getStrokeCap(valueOrDefault<String>(
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
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(
                                  color:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForBackground
                                        ?.border
                                        ?.passDivBtn
                                        ?.backgroundColor,
                                    '#000000',
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
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
                                                ?.passHeader
                                                ?.backgroundColor,
                                            '#ffffff',
                                          )),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                const Radius.circular(0),
                                            bottomRight:
                                                const Radius.circular(0),
                                            topLeft: Radius.circular(
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
                                            topRight: Radius.circular(
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
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 5, 0, 2),
                                            child: AutoSizeText(
                                              getTextWithTransform(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.passHeader
                                                      ?.text,
                                                  'Weekly Pass',
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.passHeader
                                                      ?.textTransform),
                                              textAlign: getTextAlign(
                                                  valueOrDefault<String>(
                                                paywallconfigResponse
                                                    .data
                                                    ?.configuration
                                                    ?.mobile
                                                    ?.json
                                                    ?.styleForText
                                                    ?.typography
                                                    ?.passHeader
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
                                                      ?.passHeader
                                                      ?.fontFamily,
                                                  'Roboto',
                                                ),
                                                fontWeight: getFontWeight(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.passHeader
                                                      ?.fontWeight,
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
                                                      ?.passHeader
                                                      ?.color,
                                                  '#0164B1',
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
                                                      ?.passHeader
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
                                                      ?.passHeader
                                                      ?.color,
                                                  '#ffffff',
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 12, 0, 0),
                                        child: AutoSizeText(
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
                                          textAlign: getTextAlign(
                                              valueOrDefault<String>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForText
                                                ?.typography
                                                ?.passDivPrice
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
                                                  ?.passDivPrice
                                                  ?.fontFamily,
                                              'Roboto',
                                            ),
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
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12, 8, 12, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
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
                                                      ?.passDivCutPrice
                                                      ?.text,
                                                  '50% off',
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.passDivCutPrice
                                                      ?.textTransform),
                                              textAlign: getTextAlign(
                                                  valueOrDefault<String>(
                                                paywallconfigResponse
                                                    .data
                                                    ?.configuration
                                                    ?.mobile
                                                    ?.json
                                                    ?.styleForText
                                                    ?.typography
                                                    ?.passDivCutPrice
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
                                                      ?.passDivCutPrice
                                                      ?.fontFamily,
                                                  'Roboto',
                                                ),
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
                                                  "200",
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
                                                      ?.passDivCutPrice
                                                      ?.color,
                                                  '#ffffff',
                                                )),
                                                fontSize: 10,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                getTextWithTransform(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.passDivSymbolCutPrice
                                                        ?.text,
                                                    '@80',
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.passDivSymbolCutPrice
                                                        ?.textTransform),
                                                textAlign: getTextAlign(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.passDivSymbolCutPrice
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
                                                        ?.passDivSymbolCutPrice
                                                        ?.fontFamily,
                                                    'Roboto',
                                                  ),
                                                  fontWeight: getFontWeight(
                                                      valueOrDefault<String>(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.passDivSymbolCutPrice
                                                        ?.fontWeight,
                                                    "200",
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
                                                        ?.passDivSymbolCutPrice
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
                                                        ?.passDivSymbolCutPrice
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
                                                        ?.passDivSymbolCutPrice
                                                        ?.color,
                                                    '#ffffff',
                                                  )),
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 10, 0, 5),
                                        child: AutoSizeText(
                                          getTextWithTransform(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.passDivDiscription
                                                  ?.text,
                                              '7 Days unlimited premium stories access',
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.passDivDiscription
                                                  ?.textTransform),
                                          textAlign: getTextAlign(
                                              valueOrDefault<String>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForText
                                                ?.typography
                                                ?.passDivDiscription
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
                                                  ?.passDivDiscription
                                                  ?.fontFamily,
                                              'Roboto',
                                            ),
                                            fontWeight: getFontWeight(
                                                valueOrDefault<String>(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.passDivDiscription
                                                  ?.fontWeight,
                                              "300",
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
                                                  ?.passDivDiscription
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
                                                  ?.passDivDiscription
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
                                                  ?.passDivDiscription
                                                  ?.color,
                                              '#ffffff',
                                            )),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (paywallconfigResponse.data?.configuration?.mobile
                            ?.templateId?.numberOfCta ==
                        3)
                      InkWell(
                        onTap: () {
                          typeOfPurchase.first = (paywallconfigResponse
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

                          isContentButton = false;
                          isPassButton = false;
                          isSubscribeButton = true;
                          setState(() {});
                        },
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * boxWidth,
                            height: MediaQuery.of(context).size.height * 0.2,
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
                              radius: Radius.circular(valueOrDefault<double>(
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
                              color: isSubscribeButton
                                  ? Colors.blue
                                  : colorFromCssString(valueOrDefault<String>(
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
                              strokeCap: getStrokeCap(valueOrDefault<String>(
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
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: MediaQuery.of(context).size.height * 1,
                                decoration: BoxDecoration(
                                  color:
                                      colorFromCssString(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForBackground
                                        ?.border
                                        ?.subDivBtn
                                        ?.backgroundColor,
                                    '#000000',
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
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
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
                                                ?.subscriptionHeader
                                                ?.backgroundColor,
                                            '#ffffff',
                                          )),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft:
                                                const Radius.circular(0),
                                            bottomRight:
                                                const Radius.circular(0),
                                            topLeft: Radius.circular(
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
                                            topRight: Radius.circular(
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
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 5, 0, 2),
                                            child: AutoSizeText(
                                              getTextWithTransform(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subscriptionHeader
                                                      ?.text,
                                                  'Anually',
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subscriptionHeader
                                                      ?.textTransform),
                                              textAlign: getTextAlign(
                                                  valueOrDefault<String>(
                                                paywallconfigResponse
                                                    .data
                                                    ?.configuration
                                                    ?.mobile
                                                    ?.json
                                                    ?.styleForText
                                                    ?.typography
                                                    ?.subscriptionHeader
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
                                                      ?.subscriptionHeader
                                                      ?.fontFamily,
                                                  'Roboto',
                                                ),
                                                fontWeight: getFontWeight(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subscriptionHeader
                                                      ?.fontWeight,
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
                                                      ?.subscriptionHeader
                                                      ?.color,
                                                  '#0164B1',
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
                                                      ?.subscriptionHeader
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
                                                      ?.subscriptionHeader
                                                      ?.color,
                                                  '#ffffff',
                                                )),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 12, 0, 0),
                                        child: AutoSizeText(
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
                                          textAlign: getTextAlign(
                                              valueOrDefault<String>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForText
                                                ?.typography
                                                ?.subDivPrice
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
                                                  ?.subDivPrice
                                                  ?.fontFamily,
                                              'Roboto',
                                            ),
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
                                            decorationColor: colorFromCssString(
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
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(12, 8, 12, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
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
                                                      ?.subscriptionDivCutPrice
                                                      ?.text,
                                                  '50% off',
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subscriptionDivCutPrice
                                                      ?.textTransform),
                                              textAlign: getTextAlign(
                                                  valueOrDefault<String>(
                                                paywallconfigResponse
                                                    .data
                                                    ?.configuration
                                                    ?.mobile
                                                    ?.json
                                                    ?.styleForText
                                                    ?.typography
                                                    ?.subscriptionDivCutPrice
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
                                                      ?.subscriptionDivCutPrice
                                                      ?.fontFamily,
                                                  'Roboto',
                                                ),
                                                fontWeight: getFontWeight(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subscriptionDivCutPrice
                                                      ?.fontWeight,
                                                  "200",
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
                                                      ?.subscriptionDivCutPrice
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
                                                      ?.subscriptionDivCutPrice
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
                                                      ?.subscriptionDivCutPrice
                                                      ?.color,
                                                  '#ffffff',
                                                )),
                                                fontSize: 10,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                getTextWithTransform(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.subscriptionDivSymbolPrice
                                                        ?.text,
                                                    '@80',
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.subscriptionDivSymbolPrice
                                                        ?.textTransform),
                                                textAlign: getTextAlign(
                                                    valueOrDefault<String>(
                                                  paywallconfigResponse
                                                      .data
                                                      ?.configuration
                                                      ?.mobile
                                                      ?.json
                                                      ?.styleForText
                                                      ?.typography
                                                      ?.subscriptionDivSymbolPrice
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
                                                        ?.subscriptionDivSymbolPrice
                                                        ?.fontFamily,
                                                    'Roboto',
                                                  ),
                                                  fontWeight: getFontWeight(
                                                      valueOrDefault<String>(
                                                    paywallconfigResponse
                                                        .data
                                                        ?.configuration
                                                        ?.mobile
                                                        ?.json
                                                        ?.styleForText
                                                        ?.typography
                                                        ?.subscriptionDivSymbolPrice
                                                        ?.fontWeight,
                                                    "200",
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
                                                        ?.subscriptionDivSymbolPrice
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
                                                        ?.subscriptionDivSymbolPrice
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
                                                        ?.subscriptionDivSymbolPrice
                                                        ?.color,
                                                    '#ffffff',
                                                  )),
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 10, 0, 5),
                                        child: AutoSizeText(
                                          getTextWithTransform(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.subDivDiscription
                                                  ?.text,
                                              'Enjoy Premium stories for 365 days',
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.subDivDiscription
                                                  ?.textTransform),
                                          textAlign: getTextAlign(
                                              valueOrDefault<String>(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForText
                                                ?.typography
                                                ?.subDivDiscription
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
                                                  ?.subDivDiscription
                                                  ?.fontFamily,
                                              'Roboto',
                                            ),
                                            fontWeight: getFontWeight(
                                                valueOrDefault<String>(
                                              paywallconfigResponse
                                                  .data
                                                  ?.configuration
                                                  ?.mobile
                                                  ?.json
                                                  ?.styleForText
                                                  ?.typography
                                                  ?.subDivDiscription
                                                  ?.fontWeight,
                                              "300",
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
                                                  ?.subDivDiscription
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
                                                  ?.subDivDiscription
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
                                                  ?.subDivDiscription
                                                  ?.color,
                                              '#ffffff',
                                            )),
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
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
                    radius: Radius.circular(valueOrDefault<double>(
                      paywallconfigResponse.data?.configuration?.mobile?.json
                          ?.styleForBackground?.border?.contentDivBtn?.radius
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
                    color: colorFromCssString(valueOrDefault<String>(
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
                    strokeCap: getStrokeCap(valueOrDefault<String>(
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
                      },
                      text: getTextWithTransform(
                          paywallconfigResponse
                              .data
                              ?.configuration
                              ?.mobile
                              ?.json
                              ?.styleForText
                              ?.typography
                              ?.contentDivBtn
                              ?.text,
                          'Subscribe',
                          paywallconfigResponse
                              .data
                              ?.configuration
                              ?.mobile
                              ?.json
                              ?.styleForText
                              ?.typography
                              ?.contentDivBtn
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
                              ?.contentDivBtn
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
                                ?.contentDivBtn
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
                                ?.contentDivBtn
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
                                ?.contentDivBtn
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
                                ?.contentDivBtn
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
                              ?.contentDivBtn
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
                                      ?.couponLeftText
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
                                  if (context.mounted) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              WebViewDefaultApp(
                                                  redirectUrl: redirectUrl),
                                        )).then((value) {
                                      if (value != null) {
                                        bool response = value['response'];
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
