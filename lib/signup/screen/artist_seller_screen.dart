import 'package:artsays_app/config/size_config.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/enums.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/string_constant.dart';
import 'package:artsays_app/login/login.dart';
import 'package:artsays_app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';

import '../../model/auth_models/otp_verification_model.dart';
import '../../services/api_services/auth_apis/auth_api_service.dart';

class SellerScreen extends StatefulWidget {
  const SellerScreen({super.key});

  @override
  State<SellerScreen> createState() => _SellerScreenState();
}

class _SellerScreenState extends State<SellerScreen> {
  late String userType;
  late TabController tabController;
  bool showSendOtpButton = false;

  bool showPassword = false;
  bool showConfirmPassword = false;
  bool verified = false, otpSent = false, isPhone = false, isEnabled = true;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController _artistNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      final text = emailController.text.trim();

      bool shouldShow = false;

      shouldShow = text.isNotEmpty;

      if (shouldShow != showSendOtpButton) {
        setState(() {
          showSendOtpButton = shouldShow;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    otpController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    _artistNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //
      child: Builder(
        builder: (context) {
          tabController = DefaultTabController.of(context);

          return SafeArea(
            bottom: true,
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    height: SizeConfig.getHeight(350),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorConstant.backgroundColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(62),
                        bottomRight: Radius.circular(62),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: TabBarView(
                              children: [
                                _buildImageWithBackButton(
                                  context,
                                  ImageAssetConstant.artistImage,
                                  SizeConfig.getHeight(40),
                                ),
                                _buildImageWithBackButton(
                                  context,
                                  ImageAssetConstant.sellerImage,
                                  SizeConfig.getHeight(40),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: TabBar(
                            // controller: tabController,
                            dividerColor: Colors.transparent,
                            tabs: [
                              Tab(text: "Artist"),
                              Tab(text: "Seller"),
                            ],
                            indicator: CustomTabIndicator(
                              fillColor: ColorConstant.backgroundColor,
                              borderColor: Colors.transparent,
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelColor: Colors.white,
                            unselectedLabelColor: ColorConstant.backgroundColor,
                            labelStyle: TextStyle(
                              fontSize: SizeConfig.getFont(20),
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle: TextStyle(
                              fontSize: SizeConfig.getFont(20),
                              fontWeight: FontWeight.bold,
                            ),
                            labelPadding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.getWidth(15),
                              vertical: SizeConfig.getHeight(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildArtistForm(context),
                        _buildSellerForm(context),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.getHeight(10)),
                  SizedBox(
                    height: SizeConfig.getWidth(37),
                    width: SizeConfig.getWidth(150),
                    child: MyButton(
                      onpressed: () async {
                        if (tabController.index == 0) {
                          userType = UserType.Artist.name;
                        } else {
                          userType = UserType.Seller.name;
                        }
                        String firstName = firstNameController.text;
                        String lastName = lastNameController.text;
                        String email = emailController.text;
                        String phone = emailController.text;
                        String password = passwordController.text;
                        String confirmPassword = confirmPasswordController.text;
                        String role = userType.toLowerCase();
                        String artistName = _artistNameController.text;

                        OtpVerificationModel res;
                        if (isPhone) {
                          res = await register(
                            firstName: firstName,
                            lastName: lastName,
                            password: password,
                            confirmPassword: confirmPassword,
                            userType: userType,
                            role: role,
                            isPhone: isPhone,
                            phone: phone,
                            numberVerified: verified,
                            artistName: artistName,
                          );
                        } else {
                          res = await register(
                            firstName: firstName,
                            lastName: lastName,
                            email: email,
                            password: password,
                            confirmPassword: confirmPassword,
                            userType: userType,
                            role: role,
                            isPhone: isPhone,
                            emailVerified: verified,
                            artistName: artistName,
                          );
                        }
                        if (res.success!.isNotEmpty) {
                          if (!context.mounted) return;
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        } else {
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(res.message)));
                        }
                      },
                      color: ColorConstant.orange,
                      text: StringConstant.signup,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.getFont(20),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.getHeight(10)),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 0,
                          endIndent: 20,
                        ),
                      ),
                      Text(
                        "Or Login With",
                        style: TextStyle(
                          fontSize: SizeConfig.getFont(14),
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 20,
                          endIndent: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.getHeight(10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        ImageAssetConstant.facebookLogo,
                        height: SizeConfig.getHeight(39),
                        width: SizeConfig.getWidth(39),
                      ),
                      Image.asset(
                        ImageAssetConstant.googleLogo,
                        height: SizeConfig.getHeight(30),
                        width: SizeConfig.getWidth(30),
                      ),
                      Image.asset(
                        ImageAssetConstant.appleLogoBlack,
                        height: SizeConfig.getHeight(39),
                        width: SizeConfig.getWidth(39),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.getHeight(10)),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: SizeConfig.getFont(18),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageWithBackButton(
    BuildContext context,
    String imagePath,
    double imageTopPadding,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: SizeConfig.getHeight(20),
            top: 30,
            left: 10,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        SizedBox(width: SizeConfig.getWidth(10)),

        Padding(
          padding: EdgeInsets.only(top: imageTopPadding),
          child: Image.asset(
            imagePath,
            height: SizeConfig.getHeight(300),
            width: SizeConfig.getWidth(300),
          ),
        ),
      ],
    );
  }

  Widget _buildSellerForm(BuildContext context) {
    userType = UserType.Seller.name;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: SizeConfig.getHeight(20)),
          ),
          SizedBox(height: SizeConfig.getHeight(10)),
          Text(
            "New to Artsays?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.getFont(14),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(10)),
          Text(
            "Create Account",
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.getFont(25),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.getHeight(35),
                width: SizeConfig.getWidth(190),

                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                      child: Icon(Icons.person, color: ColorConstant.grey),
                    ),
                    hintText: "First Name",
                    hintStyle: TextStyle(
                      color: ColorConstant.grey,
                      fontSize: SizeConfig.getFont(16),
                      fontWeight: FontWeight.w500,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.getWidth(12)),
              SizedBox(
                height: SizeConfig.getHeight(35),
                width: SizeConfig.getWidth(190),
                child: TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                      child: Icon(Icons.person, color: ColorConstant.grey),
                    ),
                    hintText: "Last Name",
                    hintStyle: TextStyle(
                      color: ColorConstant.grey,
                      fontSize: SizeConfig.getFont(16),
                      fontWeight: FontWeight.w500,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getHeight(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              controller: _artistNameController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.person, color: ColorConstant.grey),
                ),
                hintText: "Business Name",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              controller: emailController,
              enabled: isEnabled,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.call, color: ColorConstant.grey),
                ),
                hintText: "Email/Phone Number",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: showSendOtpButton
                    ? Padding(
                        padding: EdgeInsets.all(6),
                        child: ElevatedButton(
                          onPressed: isEnabled
                              ? () async {
                                  isPhone = isPhoneNumber(emailController.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "We are sending OTP please wait...!",
                                      ),
                                    ),
                                  );
                                  var res = await sendOtp(
                                    emailController.text,
                                    isPhone,
                                  );
                                  setState(() {
                                    if (res.success == null) {
                                      otpSent = false;
                                    }
                                    if (res.success == "true") {
                                      otpSent = true;
                                    }
                                  });
                                  if (!context.mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(res.message)),
                                  );
                                }
                              : () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.orange,
                            // theme color
                            foregroundColor: Colors.white,
                            // text color
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 0,
                            ),
                            minimumSize: const Size(0, 32),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            "Send OTP",
                            style: TextStyle(fontSize: SizeConfig.getFont(15)),
                          ),
                        ),
                      )
                    : null,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),

          /// OTP verification button
          if (otpSent) ...[
            SizedBox(height: SizeConfig.getHeight(8)),
            SizedBox(
              height: SizeConfig.getWidth(35),
              width: SizeConfig.getWidth(390),
              child: TextField(
                controller: otpController,
                enabled: isEnabled,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                    child: Icon(Icons.password, color: ColorConstant.grey),
                  ),
                  hintText: "Enter OTP",
                  hintStyle: TextStyle(
                    color: ColorConstant.grey,
                    fontSize: SizeConfig.getFont(16),
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: showSendOtpButton
                      ? Padding(
                          padding: EdgeInsets.all(6),
                          child: ElevatedButton(
                            onPressed: isEnabled
                                ? () async {
                                    var res = await verifyOtp(
                                      emailController.text,
                                      otpController.text,
                                      isPhone,
                                    );
                                    if (res.success == null) {
                                      verified = false;
                                    }
                                    if (res.success == "true") {
                                      verified = true;
                                      setState(() {
                                        isEnabled = false;
                                      });
                                    }
                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(res.message)),
                                    );
                                  }
                                : () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.orange,
                              // theme color
                              foregroundColor: Colors.white,
                              // text color
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 0,
                              ),
                              minimumSize: const Size(0, 32),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text(
                              "Verify OTP",
                              style: TextStyle(
                                fontSize: SizeConfig.getFont(15),
                              ),
                            ),
                          ),
                        )
                      : null,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorConstant.grey,
                      width: SizeConfig.getWidth(1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorConstant.grey,
                      width: SizeConfig.getWidth(1),
                    ),
                  ),
                ),
              ),
            ),
          ],
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              controller: passwordController,
              obscureText: showPassword,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.lock, color: ColorConstant.grey),
                ),
                hintText: "Password",
                suffixIcon: showPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(Icons.visibility),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(Icons.visibility_off),
                      ),
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              controller: confirmPasswordController,
              obscureText: showConfirmPassword,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.lock, color: ColorConstant.grey),
                ),
                hintText: "Confirm Password",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: showConfirmPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            showConfirmPassword = !showConfirmPassword;
                          });
                        },
                        icon: Icon(Icons.visibility),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            showConfirmPassword = !showConfirmPassword;
                          });
                        },
                        icon: Icon(Icons.visibility_off),
                      ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Artist Form Widget
  Widget _buildArtistForm(BuildContext context) {
    userType = UserType.Artist.name;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: SizeConfig.getHeight(20)),
          ),
          SizedBox(height: SizeConfig.getHeight(10)),
          Text(
            "New to Artsays?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.getFont(14),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(10)),
          Text(
            "Create Account",
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.getFont(25),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.getHeight(35),
                width: SizeConfig.getWidth(190),
                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                      child: Icon(Icons.person, color: ColorConstant.grey),
                    ),
                    hintText: "First Name",
                    hintStyle: TextStyle(
                      color: ColorConstant.grey,
                      fontSize: SizeConfig.getFont(16),
                      fontWeight: FontWeight.w500,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.getWidth(12)),

              SizedBox(
                height: SizeConfig.getHeight(35),
                width: SizeConfig.getWidth(190),
                child: TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                      child: Icon(Icons.person, color: ColorConstant.grey),
                    ),
                    hintText: "Last Name",
                    hintStyle: TextStyle(
                      color: ColorConstant.grey,
                      fontSize: SizeConfig.getFont(16),
                      fontWeight: FontWeight.w500,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              controller: _artistNameController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.person, color: ColorConstant.grey),
                ),
                hintText: "Artist Name",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              controller: emailController,
              enabled: isEnabled,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.call, color: ColorConstant.grey),
                ),
                hintText: "Email/Phone Number",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: showSendOtpButton
                    ? Padding(
                        padding: EdgeInsets.all(6),
                        child: ElevatedButton(
                          onPressed: isEnabled
                              ? () async {
                                  isPhone = isPhoneNumber(emailController.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "We are sending OTP please wait...!",
                                      ),
                                    ),
                                  );
                                  var res = await sendOtp(
                                    emailController.text,
                                    isPhone,
                                  );
                                  setState(() {
                                    if (res.success == null) {
                                      otpSent = false;
                                    }
                                    if (res.success == "true") {
                                      otpSent = true;
                                    }
                                  });
                                  if (!context.mounted) return;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(res.message)),
                                  );
                                }
                              : () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstant.orange,
                            // theme color
                            foregroundColor: Colors.white,
                            // text color
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 0,
                            ),
                            minimumSize: const Size(0, 32),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            "Send OTP",
                            style: TextStyle(fontSize: SizeConfig.getFont(15)),
                          ),
                        ),
                      )
                    : null,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),

          /// OTP verification button
          if (otpSent) ...[
            SizedBox(height: SizeConfig.getHeight(8)),
            SizedBox(
              height: SizeConfig.getWidth(35),
              width: SizeConfig.getWidth(390),
              child: TextField(
                controller: otpController,
                enabled: isEnabled,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                    child: Icon(Icons.password, color: ColorConstant.grey),
                  ),
                  hintText: "Enter OTP",
                  hintStyle: TextStyle(
                    color: ColorConstant.grey,
                    fontSize: SizeConfig.getFont(16),
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: showSendOtpButton
                      ? Padding(
                          padding: EdgeInsets.all(6),
                          child: ElevatedButton(
                            onPressed: isEnabled
                                ? () async {
                                    var res = await verifyOtp(
                                      emailController.text,
                                      otpController.text,
                                      isPhone,
                                    );
                                    if (res.success == null) {
                                      verified = false;
                                    }
                                    if (res.success == "true") {
                                      verified = true;
                                      setState(() {
                                        isEnabled = false;
                                      });
                                    }
                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(res.message)),
                                    );
                                  }
                                : () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.orange,
                              // theme color
                              foregroundColor: Colors.white,
                              // text color
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 0,
                              ),
                              minimumSize: const Size(0, 32),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text(
                              "Verify OTP",
                              style: TextStyle(
                                fontSize: SizeConfig.getFont(15),
                              ),
                            ),
                          ),
                        )
                      : null,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorConstant.grey,
                      width: SizeConfig.getWidth(1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorConstant.grey,
                      width: SizeConfig.getWidth(1),
                    ),
                  ),
                ),
              ),
            ),
          ],
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              controller: passwordController,
              obscureText: showPassword,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.lock, color: ColorConstant.grey),
                ),
                hintText: "Password",
                suffixIcon: showPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(Icons.visibility),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: Icon(Icons.visibility_off),
                      ),
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              controller: confirmPasswordController,
              obscureText: showConfirmPassword,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.lock, color: ColorConstant.grey),
                ),
                hintText: "Confirm Password",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: showConfirmPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            showConfirmPassword = !showConfirmPassword;
                          });
                        },
                        icon: Icon(Icons.visibility),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            showConfirmPassword = !showConfirmPassword;
                          });
                        },
                        icon: Icon(Icons.visibility_off),
                      ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  const CustomTabIndicator({
    this.fillColor = Colors.white,
    this.borderColor = ColorConstant.backgroundColor,
    this.borderWidth = 1,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(
      fillColor: fillColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
    );
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  _CustomTabIndicatorPainter({
    required this.fillColor,
    required this.borderColor,
    this.borderWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;

    final Paint fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    // Left tab (Artist)
    if (offset.dx < configuration.size!.width / 2) {
      final rrect = RRect.fromRectAndCorners(
        rect,
        bottomLeft: const Radius.circular(62),
        topLeft: const Radius.circular(0),
        topRight: const Radius.circular(0),
        bottomRight: const Radius.circular(0),
      );
      canvas.drawRRect(rrect, fillPaint);
    }
    // Right tab (Seller)
    else {
      final rrect = RRect.fromRectAndCorners(
        rect,
        bottomRight: const Radius.circular(62),
        topLeft: const Radius.circular(0),
        topRight: const Radius.circular(0),
        bottomLeft: const Radius.circular(0),
      );
      canvas.drawRRect(rrect, fillPaint);
    }
  }
}

bool isPhoneNumber(String input) {
  final phoneRegex = RegExp(r'^[0-9]{10}$');
  return phoneRegex.hasMatch(input);
}
