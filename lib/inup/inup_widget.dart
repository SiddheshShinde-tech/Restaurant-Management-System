import '../repeat/repeat_animations.dart';
import '../repeat/repeat_theme.dart';
import '../repeat/repeat_util.dart';
import '../repeat/repeat_widgets.dart';
import '../signin/signin_widget.dart';
import '../signup/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InupWidget extends StatefulWidget {
  const InupWidget({Key key}) : super(key: key);

  @override
  _InupWidgetState createState() => _InupWidgetState();
}

class _InupWidgetState extends State<InupWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 100,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        scale: 0.4,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: RepEatTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/isdp.webp',
                  width: 180,
                  height: 180,
                  fit: BoxFit.fitHeight,
                ).animated([animationsMap['imageOnPageLoadAnimation']]),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Text(
                    'Food.io',
                    style: RepEatTheme.of(context).title1.override(
                          fontFamily: 'Itim',
                          color: Color(0xFFF7941E),
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                  ).animated([animationsMap['textOnPageLoadAnimation1']]),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                  child: Text(
                    'serving happiness',
                    style: RepEatTheme.of(context).title3.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF8CC63F),
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                  ).animated([animationsMap['textOnPageLoadAnimation2']]),
                ),
                REButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SigninWidget(),
                      ),
                    );
                  },
                  text: 'Sign in',
                  options: REButtonOptions(
                    width: 130,
                    height: 40,
                    color: Color(0xFFF7941E),
                    textStyle: RepEatTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    elevation: 10,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 12,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: REButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupWidget(key: null,),
                        ),
                      );
                    },
                    text: 'Sign up',
                    options: REButtonOptions(
                      width: 130,
                      height: 40,
                      color: Color(0xFFF7941E),
                      textStyle:
                          RepEatTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      elevation: 10,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  ),
                ),
              ],
            ).animated([animationsMap['columnOnPageLoadAnimation']]),
          ),
        ),
      ),
    );
  }
}
