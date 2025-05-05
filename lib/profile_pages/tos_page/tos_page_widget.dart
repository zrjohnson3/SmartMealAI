import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tos_page_model.dart';
export 'tos_page_model.dart';

class TosPageWidget extends StatefulWidget {
  const TosPageWidget({super.key});

  static String routeName = 'tosPage';
  static String routePath = '/tosPage';

  @override
  State<TosPageWidget> createState() => _TosPageWidgetState();
}

class _TosPageWidgetState extends State<TosPageWidget> {
  late TosPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TosPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'tosPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: 24.0,
            ),
            onPressed: () async {
              logFirebaseEvent('TOS_arrow_back_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed(ProfilePageWidget.routeName);
            },
          ),
          title: Text(
            'Terms of Service',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(22.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Welcome to SmartMealAI. By using our application, you agree to the following Terms of Service. Please read them carefully.\n\n1. Acceptance of Terms\nBy accessing or using SmartMealAI, you agree to be bound by these Terms of Service and our Privacy Policy. If you do not agree to these terms, do not use the app.\n\n2. Description of Service\nSmartMealAI is a digital platform that provides users with meal suggestions based on their dietary preferences, goals, and restrictions. We do not provide professional medical or nutritional advice. Always consult with a qualified health provider before making any major dietary changes.\n\n3. User Accounts\nTo use certain features, you must create an account. You agree to provide accurate, complete information and to update your information as needed. You are responsible for maintaining the confidentiality of your account credentials.\n\n4. User Responsibilities\nYou agree not to:\n\nUse the app for any unlawful purpose.\n\nAttempt to gain unauthorized access to our systems.\n\nUse the app in a way that may harm or interfere with our systems or other users.\n\n5. Subscription & Payments\nSmartMealAI may offer premium features for a fee. By subscribing, you agree to pay all applicable charges and fees. All sales are final unless otherwise stated.\n\n6. Data & Privacy\nWe collect and use your data as described in our Privacy Policy. By using SmartMealAI, you consent to our data practices.\n\n7. Intellectual Property\nAll content, features, and functionality of SmartMealAI, including but not limited to text, graphics, logos, and software, are the property of SmartMealAI and are protected by intellectual property laws.\n\n8. Termination\nWe reserve the right to suspend or terminate your access to SmartMealAI at our discretion, with or without notice, if you violate these terms or use the service inappropriately.\n\n9. Disclaimer of Warranties\nSmartMealAI is provided \"as is\" and \"as available.\" We do not guarantee the service will be uninterrupted, timely, or error-free. Meal suggestions are algorithm-generated and not reviewed by a licensed dietitian.\n\n10. Limitation of Liability\nIn no event will SmartMealAI be liable for any indirect, incidental, or consequential damages arising from your use of the service.\n\n11. Changes to the Terms\nWe may update these Terms from time to time. Continued use of the service after changes are posted constitutes your acceptance of the updated terms.',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
