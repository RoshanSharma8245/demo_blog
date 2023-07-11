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

class InArticle8A1CTAWidget extends StatefulWidget {
  Function(bool) sessionCallback;

  InArticle8A1CTAWidget(this.sessionCallback, {Key? key}) : super(key: key);

  @override
  _InArticle8A1CTAWidgetState createState() => _InArticle8A1CTAWidgetState();
}

class _InArticle8A1CTAWidgetState extends State<InArticle8A1CTAWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  List<String> typeOfPurchase = ["subscription", ""];
  final paywallconfigResponse = Constants.paywallConfig;

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
    typeOfPurchase[0] = (paywallconfigResponse.data?.configuration?.mobile?.json
            ?.slotData?.slot?.contentDivBtn?.value ??
        "");
    typeOfPurchase[1] = (paywallconfigResponse.data?.configuration?.mobile?.json
            ?.slotData?.slot?.contentDivBtn?.url ??
        "");
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.44,
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
        padding: const EdgeInsetsDirectional.fromSTEB(28, 31, 28, 0),
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
                        'Don’t miss out on the full story',
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
                      fontSize: 36,
                      fontWeight: getFontWeight(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForText?.typography?.subHeading?.fontWeight,
                        "700",
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 28, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 10, 0, 30),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                  textAlign:
                                      getTextAlign(valueOrDefault<String>(
                                    paywallconfigResponse
                                        .data
                                        ?.configuration
                                        ?.mobile
                                        ?.json
                                        ?.styleForText
                                        ?.typography
                                        ?.subHeading
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
                                          ?.subHeading
                                          ?.fontFamily,
                                      'Playfair Display',
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
                                          ?.subHeading
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
                                          ?.subHeading
                                          ?.color,
                                      '#ffffff',
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
                                          ?.subHeading
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
                                          ?.subHeading
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
                                          "${paywallconfigResponse.data?.configuration?.mobile?.json?.styleForText?.typography?.priceText?.text}${Constants.contentPrice}",
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
                                            ?.priceText
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
                                              ?.priceText
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
                                              ?.priceText
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
                                              ?.priceText
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
                                              ?.priceText
                                              ?.color,
                                          '#ffffff',
                                        )),
                                        fontSize: 20,
                                        fontWeight: getFontWeight(
                                            valueOrDefault<String>(
                                          paywallconfigResponse
                                              .data
                                              ?.configuration
                                              ?.mobile
                                              ?.json
                                              ?.styleForText
                                              ?.typography
                                              ?.priceText
                                              ?.fontWeight,
                                          "",
                                        )),
                                      ),
                                    ),
                                    CustomPaint(
                                      foregroundPainter:
                                          StationPointPainter(Colors.white),
                                      size: const Size(0, 0),
                                      child: Text(
                                        getTextWithTransform(
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForText
                                                ?.typography
                                                ?.cutPriceText
                                                ?.text,
                                            'RS 3999',
                                            paywallconfigResponse
                                                .data
                                                ?.configuration
                                                ?.mobile
                                                ?.json
                                                ?.styleForText
                                                ?.typography
                                                ?.cutPriceText
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
                                              ?.cutPriceText
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
                                                ?.cutPriceText
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
                                                ?.cutPriceText
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
                                                ?.cutPriceText
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
                                                ?.cutPriceText
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
                                                ?.cutPriceText
                                                ?.fontWeight,
                                            "",
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 10),
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
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForBtn?.contentDivBtn?.text,
                        'Subscribe',
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForBtn?.contentDivBtn?.textTransform),
                    options: FFButtonOptions(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      color: colorFromCssString(valueOrDefault<String>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForBtn?.contentDivBtn?.backgroundColor,
                        '#0164B1',
                      )),
                      textStyle: GoogleFonts.getFont(
                        valueOrDefault<String>(
                          paywallconfigResponse.data?.configuration?.mobile
                              ?.json?.styleForBtn?.contentDivBtn?.fontFamily,
                          'Roboto',
                        ),
                        fontSize: 18,
                        decoration: getTextDecoration(valueOrDefault<String>(
                          paywallconfigResponse
                              .data
                              ?.configuration
                              ?.mobile
                              ?.json
                              ?.styleForBtn
                              ?.contentDivBtn
                              ?.textDecoration,
                          "",
                        )),
                        decorationColor:
                            colorFromCssString(valueOrDefault<String>(
                          paywallconfigResponse.data?.configuration?.mobile
                              ?.json?.styleForBtn?.contentDivBtn?.color,
                          '#ffffff',
                        )),
                        color: colorFromCssString(valueOrDefault<String>(
                          paywallconfigResponse.data?.configuration?.mobile
                              ?.json?.styleForBtn?.contentDivBtn?.color,
                          '#ffffff',
                        )),
                      ),
                      borderRadius:
                          BorderRadius.circular(valueOrDefault<double>(
                        paywallconfigResponse.data?.configuration?.mobile?.json
                            ?.styleForBackground?.border?.contentDivBtn?.radius
                            ?.toDouble(),
                        0,
                      )),
                    ),
                  ),
                ),
              ),
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
