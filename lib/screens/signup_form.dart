import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup/helper/colors.dart';
import 'package:signup/screens/page3.dart';
import 'package:signup/screens/page_1.dart';
import 'package:signup/screens/page_2.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var list = [
    "Address",
    "Reason selling home",
    "Home facts",
    "Home facts",
    "Home facts",
    "Home facts",
  ];
  int _currentPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  TextEditingController? _streetAddressController;
  TextEditingController? _unitNumberController;
  TextEditingController? _cityNameController;
  TextEditingController? _zipCodeController;
  String? _dropDownValue;

  @override
  void initState() {
    super.initState();
    _streetAddressController = TextEditingController(text: '');
    _unitNumberController = TextEditingController(text: '');
    _cityNameController = TextEditingController(text: '');
    _zipCodeController = TextEditingController(text: '');
  }

  void _submit() {
    //Submit Button
  }
void _nextPage() {
    setState(() {
      if (_currentPageIndex < 5) {
        _currentPageIndex++;
        _pageController.animateToPage(
          _currentPageIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }

  void _previousPage() {
    setState(() {
      if (_currentPageIndex > 0) {
        _currentPageIndex--;
        _pageController.animateToPage(
          _currentPageIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5.0,top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {},
                  color: ColorLight.divider,
                  textColor: ColorDark.background,
                  padding: const EdgeInsets.all(12),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: ColorDark.background,
                    //size: 24,
                  ),
                ),

                const SizedBox(width: 20,),

                Text(
                  'Add New Property',
                  style: GoogleFonts.poppins(
                    color: ColorDark.background,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

            ],),
          ),
          const SizedBox(height: 15,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  list[_currentPageIndex],
                  style: GoogleFonts.openSans(
                    color: ColorDark.background,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),


                Container(
                    decoration: BoxDecoration(
                      color: ColorDark.background,
                        border: Border.all(
                          color: ColorDark.background,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
                      child: Text(
                        "0${_currentPageIndex+1}/06",
                        style: GoogleFonts.openSans(
                          color: ColorDark.fontTitle,
                          fontSize: 16,
                        ),
                      ),

                    )
                )



              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearProgressIndicator(
              minHeight: 6,
              value: (_currentPageIndex + 1) / 6,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(ColorLight.info),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                Page1(
                  streetAddressController: _streetAddressController,
                  unitNumberController: _unitNumberController,
                  cityNameController: _cityNameController,
                  zipCodeController: _zipCodeController,
                  dropDownValue: _dropDownValue,
                  onSelectedMenu: (v) {
                    setState(() => _dropDownValue = v);
                  },
                ),
                const Page2(),
                Page3(
                  streetAddressController: _streetAddressController,
                  unitNumberController: _unitNumberController,
                  cityNameController: _cityNameController,
                  zipCodeController: _zipCodeController,
                  dropDownValue: _dropDownValue,
                  onSelectedMenu: (v) {
                    setState(() => _dropDownValue = v);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (_currentPageIndex != 0)
                  ElevatedButton(
                    onPressed: _previousPage,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(ColorLight.background),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                side: const BorderSide(color: ColorLight.info)
                            )
                        )
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: ColorDark.background,
                        //size: 24,
                      ),
                    ),
                  ),
                const SizedBox(width: 10,),
                Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(ColorLight.info),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                              )
                          )
                      ),
                      onPressed: _currentPageIndex != 5?_nextPage:_submit,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:15.0),
                        child: Text(
                          _currentPageIndex != 5?'Next':'Submit',
                          style: GoogleFonts.openSans(
                            color: ColorDark.fontTitle,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}