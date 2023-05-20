// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Topic`
  String get topic {
    return Intl.message(
      'Topic',
      name: 'topic',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Centalki`
  String get appName {
    return Intl.message(
      'Centalki',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `E-mail address cannot be empty`
  String get txtEmailEmptyWarning {
    return Intl.message(
      'E-mail address cannot be empty',
      name: 'txtEmailEmptyWarning',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get txtEmailInvalidFormatWarning {
    return Intl.message(
      'Invalid email format',
      name: 'txtEmailInvalidFormatWarning',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get txtPasswordEmptyWarning {
    return Intl.message(
      'Password cannot be empty',
      name: 'txtPasswordEmptyWarning',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email!`
  String get txtNoUserFoundForEmail {
    return Intl.message(
      'No user found for that email!',
      name: 'txtNoUserFoundForEmail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get txtWrongPasswordProvided {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'txtWrongPasswordProvided',
      desc: '',
      args: [],
    );
  }

  /// `Sign in your account`
  String get txtSignInYourAccount {
    return Intl.message(
      'Sign in your account',
      name: 'txtSignInYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get txtNotAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'txtNotAccount',
      desc: '',
      args: [],
    );
  }

  /// `Your email used to sign in Centalki`
  String get txtForgotPasswordIntroduction {
    return Intl.message(
      'Your email used to sign in Centalki',
      name: 'txtForgotPasswordIntroduction',
      desc: '',
      args: [],
    );
  }

  /// `Return Sign In`
  String get txtReturnSignIn {
    return Intl.message(
      'Return Sign In',
      name: 'txtReturnSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Speak English Everyday`
  String get txtWelcomeSignIn {
    return Intl.message(
      'Speak English Everyday',
      name: 'txtWelcomeSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Connect and share your English knowledge`
  String get txtWelcomeForgotPassword {
    return Intl.message(
      'Connect and share your English knowledge',
      name: 'txtWelcomeForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get txtGetStarted {
    return Intl.message(
      'Get Started',
      name: 'txtGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Email address cannot be empty`
  String get txtEmailEmpty {
    return Intl.message(
      'Email address cannot be empty',
      name: 'txtEmailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get txtEmailInvalidFormat {
    return Intl.message(
      'Invalid email format',
      name: 'txtEmailInvalidFormat',
      desc: '',
      args: [],
    );
  }

  /// `Full name cannot be empty`
  String get txtFullNameEmpty {
    return Intl.message(
      'Full name cannot be empty',
      name: 'txtFullNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name must contain at least 2 non-whitespace characters`
  String get txtFullNameTooShort {
    return Intl.message(
      'Name must contain at least 2 non-whitespace characters',
      name: 'txtFullNameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot exceed 50 characters`
  String get txtFullNameTooLong {
    return Intl.message(
      'Name cannot exceed 50 characters',
      name: 'txtFullNameTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Full name just contains characters`
  String get txtFullNameOnlyCharacters {
    return Intl.message(
      'Full name just contains characters',
      name: 'txtFullNameOnlyCharacters',
      desc: '',
      args: [],
    );
  }

  /// `English name must contain at least 2 non-whitespace characters`
  String get txtEngNameTooShort {
    return Intl.message(
      'English name must contain at least 2 non-whitespace characters',
      name: 'txtEngNameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `English name cannot exceed 50 characters`
  String get txtEngNameTooLong {
    return Intl.message(
      'English name cannot exceed 50 characters',
      name: 'txtEngNameTooLong',
      desc: '',
      args: [],
    );
  }

  /// `English name just contains characters`
  String get txtEngNameOnlyCharacters {
    return Intl.message(
      'English name just contains characters',
      name: 'txtEngNameOnlyCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Your biography cannot exceed 200 characters`
  String get txtBioTooLong {
    return Intl.message(
      'Your biography cannot exceed 200 characters',
      name: 'txtBioTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get txtPasswordEmpty {
    return Intl.message(
      'Password cannot be empty',
      name: 'txtPasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 8 characters`
  String get txtPasswordTooShort {
    return Intl.message(
      'Password must contain at least 8 characters',
      name: 'txtPasswordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot exceed 100 characters`
  String get txtPasswordTooLong {
    return Intl.message(
      'Password cannot exceed 100 characters',
      name: 'txtPasswordTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 1 uppercase, 1 numeric and 1 special character`
  String get txtPasswordNotValid {
    return Intl.message(
      'Password must contain at least 1 uppercase, 1 numeric and 1 special character',
      name: 'txtPasswordNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password again`
  String get txtRetypePasswordEmpty {
    return Intl.message(
      'Please enter your password again',
      name: 'txtRetypePasswordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Retyped password mismatched`
  String get txtRetypePasswordNotMatch {
    return Intl.message(
      'Retyped password mismatched',
      name: 'txtRetypePasswordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please agree with our Terms & Conditions`
  String get txtTermsNotAgreed {
    return Intl.message(
      'Please agree with our Terms & Conditions',
      name: 'txtTermsNotAgreed',
      desc: '',
      args: [],
    );
  }

  /// `Email is used by another account`
  String get txtEmailUsed {
    return Intl.message(
      'Email is used by another account',
      name: 'txtEmailUsed',
      desc: '',
      args: [],
    );
  }

  /// `User not found for that email!`
  String get txtUserNotFound {
    return Intl.message(
      'User not found for that email!',
      name: 'txtUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password!`
  String get txtWrongPassword {
    return Intl.message(
      'Wrong password!',
      name: 'txtWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak!`
  String get txtWeakPassword {
    return Intl.message(
      'The password provided is too weak!',
      name: 'txtWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Cannot verify role!`
  String get txtNotValidateRole {
    return Intl.message(
      'Cannot verify role!',
      name: 'txtNotValidateRole',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get txtEmail {
    return Intl.message(
      'Email',
      name: 'txtEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get txtPassword {
    return Intl.message(
      'Password',
      name: 'txtPassword',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get txtFullName {
    return Intl.message(
      'Full name',
      name: 'txtFullName',
      desc: '',
      args: [],
    );
  }

  /// `Retype Password`
  String get txtRetypePassword {
    return Intl.message(
      'Retype Password',
      name: 'txtRetypePassword',
      desc: '',
      args: [],
    );
  }

  /// `Have no account?`
  String get txtHaveNoAccount {
    return Intl.message(
      'Have no account?',
      name: 'txtHaveNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Have an account?`
  String get txtHaveAnAccount {
    return Intl.message(
      'Have an account?',
      name: 'txtHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `I accept`
  String get txtTermsAccept {
    return Intl.message(
      'I accept',
      name: 'txtTermsAccept',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to start practicing your English speaking skill`
  String get txtSignInIntroduction {
    return Intl.message(
      'Sign in to start practicing your English speaking skill',
      name: 'txtSignInIntroduction',
      desc: '',
      args: [],
    );
  }

  /// `Sign up to discover Centalki`
  String get txtSignUpIntroduction {
    return Intl.message(
      'Sign up to discover Centalki',
      name: 'txtSignUpIntroduction',
      desc: '',
      args: [],
    );
  }

  /// `Enter the email address you used for Centalki`
  String get txtResetPasswordIntroduction {
    return Intl.message(
      'Enter the email address you used for Centalki',
      name: 'txtResetPasswordIntroduction',
      desc: '',
      args: [],
    );
  }

  /// `We'll send you a link to reset your password`
  String get txtResetPasswordDescription {
    return Intl.message(
      'We\'ll send you a link to reset your password',
      name: 'txtResetPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get txtSignIn {
    return Intl.message(
      'Sign In',
      name: 'txtSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get txtSignUp {
    return Intl.message(
      'Sign Up',
      name: 'txtSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get txtNext {
    return Intl.message(
      'Next',
      name: 'txtNext',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get txtResetPassword {
    return Intl.message(
      'Reset Password',
      name: 'txtResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Return to Sign In`
  String get txtReturnToSignIn {
    return Intl.message(
      'Return to Sign In',
      name: 'txtReturnToSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get txtForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'txtForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get txtTerms {
    return Intl.message(
      'Terms & Conditions',
      name: 'txtTerms',
      desc: '',
      args: [],
    );
  }

  /// `Elementary`
  String get txtElementary {
    return Intl.message(
      'Elementary',
      name: 'txtElementary',
      desc: '',
      args: [],
    );
  }

  /// `Pre-Intermediate`
  String get txtPreIntermediate {
    return Intl.message(
      'Pre-Intermediate',
      name: 'txtPreIntermediate',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get txtIntermediate {
    return Intl.message(
      'Intermediate',
      name: 'txtIntermediate',
      desc: '',
      args: [],
    );
  }

  /// `Upper-Intermediate`
  String get txtUpperIntermediate {
    return Intl.message(
      'Upper-Intermediate',
      name: 'txtUpperIntermediate',
      desc: '',
      args: [],
    );
  }

  /// `Topics name cannot exceed 100 characters`
  String get txtSearchError {
    return Intl.message(
      'Topics name cannot exceed 100 characters',
      name: 'txtSearchError',
      desc: '',
      args: [],
    );
  }

  /// `Topic Detail`
  String get txtTopicDetail {
    return Intl.message(
      'Topic Detail',
      name: 'txtTopicDetail',
      desc: '',
      args: [],
    );
  }

  /// `Talk`
  String get txtTalk {
    return Intl.message(
      'Talk',
      name: 'txtTalk',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get txtTopicCategory {
    return Intl.message(
      'Category',
      name: 'txtTopicCategory',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get txtTopicLevel {
    return Intl.message(
      'Level',
      name: 'txtTopicLevel',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get txtTopicDescription {
    return Intl.message(
      'Description',
      name: 'txtTopicDescription',
      desc: '',
      args: [],
    );
  }

  /// `Vocabulary`
  String get txtTopicVocab {
    return Intl.message(
      'Vocabulary',
      name: 'txtTopicVocab',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Questions`
  String get txtTopicQuestions {
    return Intl.message(
      'Recommended Questions',
      name: 'txtTopicQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Example`
  String get txtTopicPhraseExample {
    return Intl.message(
      'Example',
      name: 'txtTopicPhraseExample',
      desc: '',
      args: [],
    );
  }

  /// `Answers`
  String get txtTopicAnswers {
    return Intl.message(
      'Answers',
      name: 'txtTopicAnswers',
      desc: '',
      args: [],
    );
  }

  /// `No Result Found`
  String get txtNoResultFound {
    return Intl.message(
      'No Result Found',
      name: 'txtNoResultFound',
      desc: '',
      args: [],
    );
  }

  /// `Sorry! We could not find any topic that matches your search criteria.`
  String get txtSearchSr {
    return Intl.message(
      'Sorry! We could not find any topic that matches your search criteria.',
      name: 'txtSearchSr',
      desc: '',
      args: [],
    );
  }

  /// `Please consider trying again with different keywords.`
  String get txtSearchPlsTryAgain {
    return Intl.message(
      'Please consider trying again with different keywords.',
      name: 'txtSearchPlsTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `It is possible that the topics you are looking for are not yet available in our system.`
  String get txtSearchSuggestTopic {
    return Intl.message(
      'It is possible that the topics you are looking for are not yet available in our system.',
      name: 'txtSearchSuggestTopic',
      desc: '',
      args: [],
    );
  }

  /// `Suggest Topic`
  String get txtSuggestTopicBtn {
    return Intl.message(
      'Suggest Topic',
      name: 'txtSuggestTopicBtn',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get txtCancel {
    return Intl.message(
      'Cancel',
      name: 'txtCancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get txtYes {
    return Intl.message(
      'Yes',
      name: 'txtYes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get txtNo {
    return Intl.message(
      'No',
      name: 'txtNo',
      desc: '',
      args: [],
    );
  }

  /// `Cancel connecting`
  String get txtCancelTitle {
    return Intl.message(
      'Cancel connecting',
      name: 'txtCancelTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to cancel connecting to teacher?`
  String get txtCancelContent {
    return Intl.message(
      'Are you sure to cancel connecting to teacher?',
      name: 'txtCancelContent',
      desc: '',
      args: [],
    );
  }

  /// `Finding teacher for you...`
  String get txtFindTeacher {
    return Intl.message(
      'Finding teacher for you...',
      name: 'txtFindTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Teacher found. Connecting...`
  String get txtFoundedTeacher {
    return Intl.message(
      'Teacher found. Connecting...',
      name: 'txtFoundedTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get txtTryAgain {
    return Intl.message(
      'Try Again',
      name: 'txtTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Connect`
  String get txtConnect {
    return Intl.message(
      'Connect',
      name: 'txtConnect',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get txtBack {
    return Intl.message(
      'Back',
      name: 'txtBack',
      desc: '',
      args: [],
    );
  }

  /// `Go to back`
  String get txtGoBack {
    return Intl.message(
      'Go to back',
      name: 'txtGoBack',
      desc: '',
      args: [],
    );
  }

  /// `Please sign in your account`
  String get txtNotSignIn {
    return Intl.message(
      'Please sign in your account',
      name: 'txtNotSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Failure to connect`
  String get txtNotSignInTitle {
    return Intl.message(
      'Failure to connect',
      name: 'txtNotSignInTitle',
      desc: '',
      args: [],
    );
  }

  /// `Successfully Cancel`
  String get txtSuccessfullyCancel {
    return Intl.message(
      'Successfully Cancel',
      name: 'txtSuccessfullyCancel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get txtOk {
    return Intl.message(
      'OK',
      name: 'txtOk',
      desc: '',
      args: [],
    );
  }

  /// `Connected to teacher `
  String get txtConnectedTeacher {
    return Intl.message(
      'Connected to teacher ',
      name: 'txtConnectedTeacher',
      desc: '',
      args: [],
    );
  }

  /// `. Launching session...`
  String get txtLaunchSession {
    return Intl.message(
      '. Launching session...',
      name: 'txtLaunchSession',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled session`
  String get txtCancelledTitle {
    return Intl.message(
      'Cancelled session',
      name: 'txtCancelledTitle',
      desc: '',
      args: [],
    );
  }

  /// `The teacher cancelled this session.\n  Do you want to try with another?`
  String get txtCancelledContent {
    return Intl.message(
      'The teacher cancelled this session.\n  Do you want to try with another?',
      name: 'txtCancelledContent',
      desc: '',
      args: [],
    );
  }

  /// `No teacher available`
  String get txtNotTeacherAvailableTitle {
    return Intl.message(
      'No teacher available',
      name: 'txtNotTeacherAvailableTitle',
      desc: '',
      args: [],
    );
  }

  /// `You can try again after 5 minutes`
  String get txtNotTeacherAvailableContent {
    return Intl.message(
      'You can try again after 5 minutes',
      name: 'txtNotTeacherAvailableContent',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection and try again.`
  String get txtInternetConnection {
    return Intl.message(
      'Please check your internet connection and try again.',
      name: 'txtInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load your profile!`
  String get txtLoadFailed {
    return Intl.message(
      'Failed to load your profile!',
      name: 'txtLoadFailed',
      desc: '',
      args: [],
    );
  }

  /// `Student Profile`
  String get txtStudentProfile {
    return Intl.message(
      'Student Profile',
      name: 'txtStudentProfile',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get txtWallet {
    return Intl.message(
      'Wallet',
      name: 'txtWallet',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get txtHistory {
    return Intl.message(
      'History',
      name: 'txtHistory',
      desc: '',
      args: [],
    );
  }

  /// `Account Information`
  String get txtAccountInformation {
    return Intl.message(
      'Account Information',
      name: 'txtAccountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get txtChangePassword {
    return Intl.message(
      'Change Password',
      name: 'txtChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get txtDeleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'txtDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get txtSignOut {
    return Intl.message(
      'Sign Out',
      name: 'txtSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to sign out of the current account?`
  String get txtSignOutContent {
    return Intl.message(
      'Are you sure to sign out of the current account?',
      name: 'txtSignOutContent',
      desc: '',
      args: [],
    );
  }

  /// `Remaining sessions`
  String get txtRemainingSessions {
    return Intl.message(
      'Remaining sessions',
      name: 'txtRemainingSessions',
      desc: '',
      args: [],
    );
  }

  /// `Completed sessions`
  String get txtCompletedSessions {
    return Intl.message(
      'Completed sessions',
      name: 'txtCompletedSessions',
      desc: '',
      args: [],
    );
  }

  /// `Failed to update your profile!`
  String get txtProfileUpdateFailed {
    return Intl.message(
      'Failed to update your profile!',
      name: 'txtProfileUpdateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Successfully updated your profile!!`
  String get txtProfileUpdateSuccess {
    return Intl.message(
      'Successfully updated your profile!!',
      name: 'txtProfileUpdateSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get txtSaveChanges {
    return Intl.message(
      'Save Changes',
      name: 'txtSaveChanges',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get txtFullNameTitle {
    return Intl.message(
      'Full Name',
      name: 'txtFullNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `English Name`
  String get txtEnglishNameTitle {
    return Intl.message(
      'English Name',
      name: 'txtEnglishNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get txtBioTitle {
    return Intl.message(
      'Bio',
      name: 'txtBioTitle',
      desc: '',
      args: [],
    );
  }

  /// `Interested Topics`
  String get txtInterestedTopics {
    return Intl.message(
      'Interested Topics',
      name: 'txtInterestedTopics',
      desc: '',
      args: [],
    );
  }

  /// `Change Avatar`
  String get txtChangeAvatar {
    return Intl.message(
      'Change Avatar',
      name: 'txtChangeAvatar',
      desc: '',
      args: [],
    );
  }

  /// `File is not supported`
  String get txtFileNotSupported {
    return Intl.message(
      'File is not supported',
      name: 'txtFileNotSupported',
      desc: '',
      args: [],
    );
  }

  /// `The maximum size per file is 2MB.`
  String get txtFileMaximumPerFile {
    return Intl.message(
      'The maximum size per file is 2MB.',
      name: 'txtFileMaximumPerFile',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get txtFacebook {
    return Intl.message(
      'Facebook',
      name: 'txtFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get txtGoogle {
    return Intl.message(
      'Google',
      name: 'txtGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Apple`
  String get txtApple {
    return Intl.message(
      'Apple',
      name: 'txtApple',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get txtPhoneNumberTitle {
    return Intl.message(
      'Phone Number',
      name: 'txtPhoneNumberTitle',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get txtDateOfBirthTitle {
    return Intl.message(
      'Date of Birth',
      name: 'txtDateOfBirthTitle',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get txtGenderTitle {
    return Intl.message(
      'Gender',
      name: 'txtGenderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Connections`
  String get txtConnectionsTitle {
    return Intl.message(
      'Connections',
      name: 'txtConnectionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Connected`
  String get txtConnected {
    return Intl.message(
      'Connected',
      name: 'txtConnected',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get txtPaymentMethodTitle {
    return Intl.message(
      'Payment Method',
      name: 'txtPaymentMethodTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete result`
  String get txtDeleteAccountResult {
    return Intl.message(
      'Delete result',
      name: 'txtDeleteAccountResult',
      desc: '',
      args: [],
    );
  }

  /// `Re-authenticate your account`
  String get txtReauthenticateAccount {
    return Intl.message(
      'Re-authenticate your account',
      name: 'txtReauthenticateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Re-authenticate`
  String get txtReauthenticate {
    return Intl.message(
      'Re-authenticate',
      name: 'txtReauthenticate',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get txtConfirmDeleteAccount {
    return Intl.message(
      'Confirm Delete',
      name: 'txtConfirmDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password to continue`
  String get txtEnterPasswordToDelete {
    return Intl.message(
      'Please enter your password to continue',
      name: 'txtEnterPasswordToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Delete your account?`
  String get txtConfirmDeleteAccountTitle {
    return Intl.message(
      'Delete your account?',
      name: 'txtConfirmDeleteAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `You are requesting that your account be deleted.\nDeleting the account will:\n   • Remove account information and images\n   • Remove all messages\n   • Unable to restore`
  String get txtConfirmDeleteAccountContent {
    return Intl.message(
      'You are requesting that your account be deleted.\nDeleting the account will:\n   • Remove account information and images\n   • Remove all messages\n   • Unable to restore',
      name: 'txtConfirmDeleteAccountContent',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong when delete account!\nTry again after some minutes.`
  String get txtDeleteAccountError {
    return Intl.message(
      'Something wrong when delete account!\nTry again after some minutes.',
      name: 'txtDeleteAccountError',
      desc: '',
      args: [],
    );
  }

  /// `Please sign in again to delete your account`
  String get txtSignInAgainToDelete {
    return Intl.message(
      'Please sign in again to delete your account',
      name: 'txtSignInAgainToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Total Completed Sessions`
  String get txtTotalCompletedSessions {
    return Intl.message(
      'Total Completed Sessions',
      name: 'txtTotalCompletedSessions',
      desc: '',
      args: [],
    );
  }

  /// `Total time is`
  String get txtTotalTime {
    return Intl.message(
      'Total time is',
      name: 'txtTotalTime',
      desc: '',
      args: [],
    );
  }

  /// `hours`
  String get txtHours {
    return Intl.message(
      'hours',
      name: 'txtHours',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get txtMinutes {
    return Intl.message(
      'minutes',
      name: 'txtMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Sessions`
  String get txtSessions {
    return Intl.message(
      'Sessions',
      name: 'txtSessions',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get txtNoData {
    return Intl.message(
      'No data',
      name: 'txtNoData',
      desc: '',
      args: [],
    );
  }

  /// `Tap to load more sessions`
  String get txtTapToLoadMoreSessions {
    return Intl.message(
      'Tap to load more sessions',
      name: 'txtTapToLoadMoreSessions',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get txtBalance {
    return Intl.message(
      'Balance',
      name: 'txtBalance',
      desc: '',
      args: [],
    );
  }

  /// `Or log in with`
  String get txtOrLoginWith {
    return Intl.message(
      'Or log in with',
      name: 'txtOrLoginWith',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get txtOr {
    return Intl.message(
      'or',
      name: 'txtOr',
      desc: '',
      args: [],
    );
  }

  /// `The duration of each session is 30 minutes`
  String get txtEachSessionDuration {
    return Intl.message(
      'The duration of each session is 30 minutes',
      name: 'txtEachSessionDuration',
      desc: '',
      args: [],
    );
  }

  /// `The price of each session is `
  String get txtEachSessionPrice {
    return Intl.message(
      'The price of each session is ',
      name: 'txtEachSessionPrice',
      desc: '',
      args: [],
    );
  }

  /// `/30 minutes`
  String get txt30Minutes {
    return Intl.message(
      '/30 minutes',
      name: 'txt30Minutes',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get txtTransactions {
    return Intl.message(
      'Transactions',
      name: 'txtTransactions',
      desc: '',
      args: [],
    );
  }

  /// `Charged`
  String get txtCharged {
    return Intl.message(
      'Charged',
      name: 'txtCharged',
      desc: '',
      args: [],
    );
  }

  /// `New password cannot be empty`
  String get txtNewPasswordEmptyWarning {
    return Intl.message(
      'New password cannot be empty',
      name: 'txtNewPasswordEmptyWarning',
      desc: '',
      args: [],
    );
  }

  /// `New password must contain at least 6 characters`
  String get txtNewPasswordTooShort {
    return Intl.message(
      'New password must contain at least 6 characters',
      name: 'txtNewPasswordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `New password cannot exceed 100 characters`
  String get txtNewPasswordTooLong {
    return Intl.message(
      'New password cannot exceed 100 characters',
      name: 'txtNewPasswordTooLong',
      desc: '',
      args: [],
    );
  }

  /// `New password must contain at least 1 uppercase, 1 numeric and 1 special character`
  String get txtNewPasswordNotValid {
    return Intl.message(
      'New password must contain at least 1 uppercase, 1 numeric and 1 special character',
      name: 'txtNewPasswordNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed password must match the new password`
  String get txtConfirmedPassword {
    return Intl.message(
      'Confirmed password must match the new password',
      name: 'txtConfirmedPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed password cannot be empty`
  String get txtConfirmedPasswordEmptyWarning {
    return Intl.message(
      'Confirmed password cannot be empty',
      name: 'txtConfirmedPasswordEmptyWarning',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password cannot exceed 100 characters`
  String get txtConfirmedPasswordTooLong {
    return Intl.message(
      'Confirm password cannot exceed 100 characters',
      name: 'txtConfirmedPasswordTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password must match the new password`
  String get txtConfirmedPasswordMatchWarning {
    return Intl.message(
      'Confirm password must match the new password',
      name: 'txtConfirmedPasswordMatchWarning',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Please try again later!`
  String get txtChangePasswordError {
    return Intl.message(
      'Something went wrong. Please try again later!',
      name: 'txtChangePasswordError',
      desc: '',
      args: [],
    );
  }

  /// `User does not sign in!`
  String get txtUserNotSignIn {
    return Intl.message(
      'User does not sign in!',
      name: 'txtUserNotSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Change password result`
  String get txtChangePasswordResult {
    return Intl.message(
      'Change password result',
      name: 'txtChangePasswordResult',
      desc: '',
      args: [],
    );
  }

  /// `Successfully changed!`
  String get txtSuccessfullyChanged {
    return Intl.message(
      'Successfully changed!',
      name: 'txtSuccessfullyChanged',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get txtCurrentPassword {
    return Intl.message(
      'Current password',
      name: 'txtCurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get txtNewPassword {
    return Intl.message(
      'New password',
      name: 'txtNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get txtConfirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'txtConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `This feature does not work with accounts signed in with third-party`
  String get txtThirdPartyChangePassword {
    return Intl.message(
      'This feature does not work with accounts signed in with third-party',
      name: 'txtThirdPartyChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get txtMale {
    return Intl.message(
      'Male',
      name: 'txtMale',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get txtFemale {
    return Intl.message(
      'Female',
      name: 'txtFemale',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get txtOthers {
    return Intl.message(
      'Others',
      name: 'txtOthers',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get txtNotification {
    return Intl.message(
      'Notification',
      name: 'txtNotification',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get txtAppearance {
    return Intl.message(
      'Appearance',
      name: 'txtAppearance',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get txtLanguage {
    return Intl.message(
      'Language',
      name: 'txtLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Give Feedback`
  String get txtGiveFeedback {
    return Intl.message(
      'Give Feedback',
      name: 'txtGiveFeedback',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get txtAbout {
    return Intl.message(
      'About',
      name: 'txtAbout',
      desc: '',
      args: [],
    );
  }

  /// `Application Theme`
  String get txtApplicationTheme {
    return Intl.message(
      'Application Theme',
      name: 'txtApplicationTheme',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get txtDarkMode {
    return Intl.message(
      'Dark Mode',
      name: 'txtDarkMode',
      desc: '',
      args: [],
    );
  }

  /// `Notify me about`
  String get txtNotifyMeAbout {
    return Intl.message(
      'Notify me about',
      name: 'txtNotifyMeAbout',
      desc: '',
      args: [],
    );
  }

  /// `Deals and Discounts`
  String get txtDealsAndDiscounts {
    return Intl.message(
      'Deals and Discounts',
      name: 'txtDealsAndDiscounts',
      desc: '',
      args: [],
    );
  }

  /// `New Topics`
  String get txtNewTopics {
    return Intl.message(
      'New Topics',
      name: 'txtNewTopics',
      desc: '',
      args: [],
    );
  }

  /// `New Teachers`
  String get txtNewTeachers {
    return Intl.message(
      'New Teachers',
      name: 'txtNewTeachers',
      desc: '',
      args: [],
    );
  }

  /// `Sounds`
  String get txtSounds {
    return Intl.message(
      'Sounds',
      name: 'txtSounds',
      desc: '',
      args: [],
    );
  }

  /// `Vibrations`
  String get txtVibrations {
    return Intl.message(
      'Vibrations',
      name: 'txtVibrations',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get txtEnglish {
    return Intl.message(
      'English',
      name: 'txtEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Tiếng Việt`
  String get txtVietnamese {
    return Intl.message(
      'Tiếng Việt',
      name: 'txtVietnamese',
      desc: '',
      args: [],
    );
  }

  /// `Rate Our App`
  String get txtRateOurApp {
    return Intl.message(
      'Rate Our App',
      name: 'txtRateOurApp',
      desc: '',
      args: [],
    );
  }

  /// `Please tell us what you think`
  String get txtPleaseTellUsWatUThink {
    return Intl.message(
      'Please tell us what you think',
      name: 'txtPleaseTellUsWatUThink',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get txtSend {
    return Intl.message(
      'Send',
      name: 'txtSend',
      desc: '',
      args: [],
    );
  }

  /// `centalki`
  String get txtCentalkiTitle {
    return Intl.message(
      'centalki',
      name: 'txtCentalkiTitle',
      desc: '',
      args: [],
    );
  }

  /// `Practice English speaking with foreign teachers`
  String get txtCentalkiDescription {
    return Intl.message(
      'Practice English speaking with foreign teachers',
      name: 'txtCentalkiDescription',
      desc: '',
      args: [],
    );
  }

  /// `Developed by Centalki Team\n2023, All Rights Reserved\nContact: centalki.dev@gmail.com`
  String get txtCentalkiSource {
    return Intl.message(
      'Developed by Centalki Team\n2023, All Rights Reserved\nContact: centalki.dev@gmail.com',
      name: 'txtCentalkiSource',
      desc: '',
      args: [],
    );
  }

  /// `Version 0.4.0`
  String get txtCentalkiVersion {
    return Intl.message(
      'Version 0.4.0',
      name: 'txtCentalkiVersion',
      desc: '',
      args: [],
    );
  }

  /// `Last updated: Mar 03, 2023`
  String get txtLastUpdated {
    return Intl.message(
      'Last updated: Mar 03, 2023',
      name: 'txtLastUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Rating cannot be empty`
  String get txtRatingEmptyError {
    return Intl.message(
      'Rating cannot be empty',
      name: 'txtRatingEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Feedback cannot be empty`
  String get txtFeedbackEmptyError {
    return Intl.message(
      'Feedback cannot be empty',
      name: 'txtFeedbackEmptyError',
      desc: '',
      args: [],
    );
  }

  /// `Send feedback successfully`
  String get txtSuccessFeedback {
    return Intl.message(
      'Send feedback successfully',
      name: 'txtSuccessFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get txtSuccess {
    return Intl.message(
      'Success',
      name: 'txtSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Load failed`
  String get txtLoadFail {
    return Intl.message(
      'Load failed',
      name: 'txtLoadFail',
      desc: '',
      args: [],
    );
  }

  /// `Feedback cannot exceed 500 characters`
  String get txtFeedbackTooLong {
    return Intl.message(
      'Feedback cannot exceed 500 characters',
      name: 'txtFeedbackTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Buy More Sessions`
  String get txtBuyMoreSessions {
    return Intl.message(
      'Buy More Sessions',
      name: 'txtBuyMoreSessions',
      desc: '',
      args: [],
    );
  }

  /// `Choose payment method`
  String get txtChoosePaymentMethod {
    return Intl.message(
      'Choose payment method',
      name: 'txtChoosePaymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Payment Information`
  String get txtPaymentInformation {
    return Intl.message(
      'Payment Information',
      name: 'txtPaymentInformation',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get txtInstructions {
    return Intl.message(
      'Instructions',
      name: 'txtInstructions',
      desc: '',
      args: [],
    );
  }

  /// `The price for each session is`
  String get txtPricePerSessionAnnounce {
    return Intl.message(
      'The price for each session is',
      name: 'txtPricePerSessionAnnounce',
      desc: '',
      args: [],
    );
  }

  /// `Multiply it with the number of session you want to buy, then transfer the money using the QR Code provided above.`
  String get txtPaymentInstructionDetail {
    return Intl.message(
      'Multiply it with the number of session you want to buy, then transfer the money using the QR Code provided above.',
      name: 'txtPaymentInstructionDetail',
      desc: '',
      args: [],
    );
  }

  /// `Upload your bill so that we can verify your payment`
  String get txtPaymentBillUpload {
    return Intl.message(
      'Upload your bill so that we can verify your payment',
      name: 'txtPaymentBillUpload',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get txtUpload {
    return Intl.message(
      'Upload',
      name: 'txtUpload',
      desc: '',
      args: [],
    );
  }

  /// `Choose from Gallery`
  String get txtChooseFromLibrary {
    return Intl.message(
      'Choose from Gallery',
      name: 'txtChooseFromLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Using Camera`
  String get txtTakeAPic {
    return Intl.message(
      'Using Camera',
      name: 'txtTakeAPic',
      desc: '',
      args: [],
    );
  }

  /// `Please tell us your current English level`
  String get txtSelfReviewTitle {
    return Intl.message(
      'Please tell us your current English level',
      name: 'txtSelfReviewTitle',
      desc: '',
      args: [],
    );
  }

  /// `This information will enable us to guide you better and recommend suitable contents for you`
  String get txtSelfReviewContent {
    return Intl.message(
      'This information will enable us to guide you better and recommend suitable contents for you',
      name: 'txtSelfReviewContent',
      desc: '',
      args: [],
    );
  }

  /// `Add favorite topic successfully!`
  String get txtAddFavoriteSuccess {
    return Intl.message(
      'Add favorite topic successfully!',
      name: 'txtAddFavoriteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get txtRemove {
    return Intl.message(
      'Remove',
      name: 'txtRemove',
      desc: '',
      args: [],
    );
  }

  /// `Remove from Favorite`
  String get txtConfirmRemoveFavoriteTitle {
    return Intl.message(
      'Remove from Favorite',
      name: 'txtConfirmRemoveFavoriteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to remove this from your favorite topics? You can still add them back later.`
  String get txtConfirmRemoveFavoriteContent {
    return Intl.message(
      'Are you sure to remove this from your favorite topics? You can still add them back later.',
      name: 'txtConfirmRemoveFavoriteContent',
      desc: '',
      args: [],
    );
  }

  /// `Remove favorite topic successfully!`
  String get txtRemoveFavoriteSuccess {
    return Intl.message(
      'Remove favorite topic successfully!',
      name: 'txtRemoveFavoriteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Remove from Saved`
  String get txtConfirmRemoveSavedTitle {
    return Intl.message(
      'Remove from Saved',
      name: 'txtConfirmRemoveSavedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to remove this from your saved vocabularies? You can still add them back later.`
  String get txtConfirmRemoveSavedContent {
    return Intl.message(
      'Are you sure to remove this from your saved vocabularies? You can still add them back later.',
      name: 'txtConfirmRemoveSavedContent',
      desc: '',
      args: [],
    );
  }

  /// `Topics`
  String get txtTopicsTab {
    return Intl.message(
      'Topics',
      name: 'txtTopicsTab',
      desc: '',
      args: [],
    );
  }

  /// `Vocabularies`
  String get txtVocabsTab {
    return Intl.message(
      'Vocabularies',
      name: 'txtVocabsTab',
      desc: '',
      args: [],
    );
  }

  /// `You Have No Favorite Topic`
  String get txtNoFavoriteTopicsTitle {
    return Intl.message(
      'You Have No Favorite Topic',
      name: 'txtNoFavoriteTopicsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Explore our topics and tap the heart icon to save topics you love.`
  String get txtNoFavoriteTopicsContent {
    return Intl.message(
      'Explore our topics and tap the heart icon to save topics you love.',
      name: 'txtNoFavoriteTopicsContent',
      desc: '',
      args: [],
    );
  }

  /// `You Have Not Saved Any Phrases`
  String get txtNoFavoriteVocabsTitle {
    return Intl.message(
      'You Have Not Saved Any Phrases',
      name: 'txtNoFavoriteVocabsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Explore our topics contents and tap the bookmark icon to save any word or phrase you want to learn.`
  String get txtNoFavoriteVocabsContent {
    return Intl.message(
      'Explore our topics contents and tap the bookmark icon to save any word or phrase you want to learn.',
      name: 'txtNoFavoriteVocabsContent',
      desc: '',
      args: [],
    );
  }

  /// `Congrats!`
  String get txtCongrats {
    return Intl.message(
      'Congrats!',
      name: 'txtCongrats',
      desc: '',
      args: [],
    );
  }

  /// `You have completed a 30-minute session.\nKeep up your good work!`
  String get txtSessionCompletedBody {
    return Intl.message(
      'You have completed a 30-minute session.\nKeep up your good work!',
      name: 'txtSessionCompletedBody',
      desc: '',
      args: [],
    );
  }

  /// `What are your thoughts on the teacher?`
  String get txtSessionCompletedAskForFeedback {
    return Intl.message(
      'What are your thoughts on the teacher?',
      name: 'txtSessionCompletedAskForFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Feedback for Teacher Now`
  String get txtSessionCompletedFeedbackBtn {
    return Intl.message(
      'Feedback for Teacher Now',
      name: 'txtSessionCompletedFeedbackBtn',
      desc: '',
      args: [],
    );
  }

  /// `I will do it later`
  String get txtDoItLater {
    return Intl.message(
      'I will do it later',
      name: 'txtDoItLater',
      desc: '',
      args: [],
    );
  }

  /// `Any issue while studying?`
  String get txtSessionCompletedAskForReport {
    return Intl.message(
      'Any issue while studying?',
      name: 'txtSessionCompletedAskForReport',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get txtSessionCompletedReportBtn {
    return Intl.message(
      'Report',
      name: 'txtSessionCompletedReportBtn',
      desc: '',
      args: [],
    );
  }

  /// `Session Feedback`
  String get txtSessionFeedback {
    return Intl.message(
      'Session Feedback',
      name: 'txtSessionFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get txtRating {
    return Intl.message(
      'Rating',
      name: 'txtRating',
      desc: '',
      args: [],
    );
  }

  /// `What did the teacher make you satisfied with?`
  String get txtSatisfiedDesciptionLabel {
    return Intl.message(
      'What did the teacher make you satisfied with?',
      name: 'txtSatisfiedDesciptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `What did the teacher make you not satisfied with?`
  String get txtNotSatisfiedDesciptionLabel {
    return Intl.message(
      'What did the teacher make you not satisfied with?',
      name: 'txtNotSatisfiedDesciptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get txtDescriptionLabel {
    return Intl.message(
      'Description',
      name: 'txtDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `It would be nice if you could tell teacher more about what made your experiences good.`
  String get txtSatisfiedDescriptionHint {
    return Intl.message(
      'It would be nice if you could tell teacher more about what made your experiences good.',
      name: 'txtSatisfiedDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `It would be nice if you could tell teacher more about what made your experiences not good.`
  String get txtNotSatisfiedDescriptionHint {
    return Intl.message(
      'It would be nice if you could tell teacher more about what made your experiences not good.',
      name: 'txtNotSatisfiedDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions for Teacher`
  String get txtSuggetionsLabel {
    return Intl.message(
      'Suggestions for Teacher',
      name: 'txtSuggetionsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Teachers are always welcomed to hear any suggestion that you believe will improve your overall experiences for future sessions.`
  String get txtSuggetionsHint {
    return Intl.message(
      'Teachers are always welcomed to hear any suggestion that you believe will improve your overall experiences for future sessions.',
      name: 'txtSuggetionsHint',
      desc: '',
      args: [],
    );
  }

  /// `Please choose at least one option`
  String get txtSatisfiedChipNotEmpty {
    return Intl.message(
      'Please choose at least one option',
      name: 'txtSatisfiedChipNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Description cannot be empty`
  String get txtDescriptionNotEmpty {
    return Intl.message(
      'Description cannot be empty',
      name: 'txtDescriptionNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Description cannot exceed 500 characters`
  String get txtDescriptionTooLong {
    return Intl.message(
      'Description cannot exceed 500 characters',
      name: 'txtDescriptionTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions cannot exceed 500 characters`
  String get txtSuggestionsTooLong {
    return Intl.message(
      'Suggestions cannot exceed 500 characters',
      name: 'txtSuggestionsTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Send feedback successfully`
  String get txtSendFeedbackSuccess {
    return Intl.message(
      'Send feedback successfully',
      name: 'txtSendFeedbackSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Send feedback failed`
  String get txtSendFeedbackFailed {
    return Intl.message(
      'Send feedback failed',
      name: 'txtSendFeedbackFailed',
      desc: '',
      args: [],
    );
  }

  /// `Feedback for Teacher`
  String get txtFeedbackForTeacherBtn {
    return Intl.message(
      'Feedback for Teacher',
      name: 'txtFeedbackForTeacherBtn',
      desc: '',
      args: [],
    );
  }

  /// `Rating from Teacher`
  String get txtRatingFromTeacher {
    return Intl.message(
      'Rating from Teacher',
      name: 'txtRatingFromTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Feedback from Teacher`
  String get txtFeedbackFromTeacher {
    return Intl.message(
      'Feedback from Teacher',
      name: 'txtFeedbackFromTeacher',
      desc: '',
      args: [],
    );
  }

  /// `Pronunciation`
  String get txtPronunciation {
    return Intl.message(
      'Pronunciation',
      name: 'txtPronunciation',
      desc: '',
      args: [],
    );
  }

  /// `Vocabularies`
  String get txtVocabularies {
    return Intl.message(
      'Vocabularies',
      name: 'txtVocabularies',
      desc: '',
      args: [],
    );
  }

  /// `Grammar`
  String get txtGrammar {
    return Intl.message(
      'Grammar',
      name: 'txtGrammar',
      desc: '',
      args: [],
    );
  }

  /// `Idea`
  String get txtIdea {
    return Intl.message(
      'Idea',
      name: 'txtIdea',
      desc: '',
      args: [],
    );
  }

  /// `Fluency`
  String get txtFluency {
    return Intl.message(
      'Fluency',
      name: 'txtFluency',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get txtSuggestions {
    return Intl.message(
      'Suggestions',
      name: 'txtSuggestions',
      desc: '',
      args: [],
    );
  }

  /// `No Feedback Yet`
  String get txtFeedbackEmptyHeadline {
    return Intl.message(
      'No Feedback Yet',
      name: 'txtFeedbackEmptyHeadline',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a notification right after the teacher provides feedback.`
  String get txtFeedbackEmptyContent {
    return Intl.message(
      'You will receive a notification right after the teacher provides feedback.',
      name: 'txtFeedbackEmptyContent',
      desc: '',
      args: [],
    );
  }

  /// `Topic Feedback`
  String get txtTopicFeedback {
    return Intl.message(
      'Topic Feedback',
      name: 'txtTopicFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get txtBackBtn {
    return Intl.message(
      'Back',
      name: 'txtBackBtn',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get txtNextBtn {
    return Intl.message(
      'Next',
      name: 'txtNextBtn',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get txtSendBtn {
    return Intl.message(
      'Send',
      name: 'txtSendBtn',
      desc: '',
      args: [],
    );
  }

  /// `Unfinished Feedback Submission`
  String get txtNotFinishFeedback {
    return Intl.message(
      'Unfinished Feedback Submission',
      name: 'txtNotFinishFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit and return to the previous screen? Your feedbacks are invaluable to us.`
  String get txtNotFinishFeedbackContent {
    return Intl.message(
      'Are you sure you want to exit and return to the previous screen? Your feedbacks are invaluable to us.',
      name: 'txtNotFinishFeedbackContent',
      desc: '',
      args: [],
    );
  }

  /// `Feedback Sent Successfully`
  String get txtFeedbackSuccess {
    return Intl.message(
      'Feedback Sent Successfully',
      name: 'txtFeedbackSuccess',
      desc: '',
      args: [],
    );
  }

  /// `We are deeply appreciated the efforts you took to help us further improve our contents.\nWe always look forward to hearing more ideas from you.`
  String get txtFeedbackSuccessContent {
    return Intl.message(
      'We are deeply appreciated the efforts you took to help us further improve our contents.\nWe always look forward to hearing more ideas from you.',
      name: 'txtFeedbackSuccessContent',
      desc: '',
      args: [],
    );
  }

  /// `Stay`
  String get txtStayBtn {
    return Intl.message(
      'Stay',
      name: 'txtStayBtn',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get txtExitBtn {
    return Intl.message(
      'Exit',
      name: 'txtExitBtn',
      desc: '',
      args: [],
    );
  }

  /// `This feature works better with\nat least 10 saved phrases.`
  String get txtVocabLearningSuggestion {
    return Intl.message(
      'This feature works better with\nat least 10 saved phrases.',
      name: 'txtVocabLearningSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get txtStartBtn {
    return Intl.message(
      'Start',
      name: 'txtStartBtn',
      desc: '',
      args: [],
    );
  }

  /// `You have completed studying 5 phrases.\nTry to maintain this every day.`
  String get txtCompleteRemind {
    return Intl.message(
      'You have completed studying 5 phrases.\nTry to maintain this every day.',
      name: 'txtCompleteRemind',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get txtEndBtn {
    return Intl.message(
      'End',
      name: 'txtEndBtn',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get txtCompleteBtn {
    return Intl.message(
      'Complete',
      name: 'txtCompleteBtn',
      desc: '',
      args: [],
    );
  }

  /// `End progress`
  String get txtEndProgress {
    return Intl.message(
      'End progress',
      name: 'txtEndProgress',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to finish to learn vocabularies?`
  String get txtEndProgressContent {
    return Intl.message(
      'Are you sure to finish to learn vocabularies?',
      name: 'txtEndProgressContent',
      desc: '',
      args: [],
    );
  }

  /// `Still want to learn more?`
  String get txtStillWantToLearnMore {
    return Intl.message(
      'Still want to learn more?',
      name: 'txtStillWantToLearnMore',
      desc: '',
      args: [],
    );
  }

  /// `Of course`
  String get txtOfCourse {
    return Intl.message(
      'Of course',
      name: 'txtOfCourse',
      desc: '',
      args: [],
    );
  }

  /// `That is enough for today`
  String get txtThatEnoughForToday {
    return Intl.message(
      'That is enough for today',
      name: 'txtThatEnoughForToday',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get txtNotifications {
    return Intl.message(
      'Notifications',
      name: 'txtNotifications',
      desc: '',
      args: [],
    );
  }

  /// `No Notifications To Show`
  String get txtNoNotiToShow {
    return Intl.message(
      'No Notifications To Show',
      name: 'txtNoNotiToShow',
      desc: '',
      args: [],
    );
  }

  /// `This screen will update whenever there is something new for you.`
  String get txtNotiWillUpdateRemind {
    return Intl.message(
      'This screen will update whenever there is something new for you.',
      name: 'txtNotiWillUpdateRemind',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get txtToday {
    return Intl.message(
      'Today',
      name: 'txtToday',
      desc: '',
      args: [],
    );
  }

  /// `This week`
  String get txtThisWeek {
    return Intl.message(
      'This week',
      name: 'txtThisWeek',
      desc: '',
      args: [],
    );
  }

  /// `Previous Notifications`
  String get txtPrevious {
    return Intl.message(
      'Previous Notifications',
      name: 'txtPrevious',
      desc: '',
      args: [],
    );
  }

  /// `Topic Suggestion`
  String get txtTopicSuggestion {
    return Intl.message(
      'Topic Suggestion',
      name: 'txtTopicSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Subject and Category`
  String get txtSubjectLabel {
    return Intl.message(
      'Subject and Category',
      name: 'txtSubjectLabel',
      desc: '',
      args: [],
    );
  }

  /// `You can give us general ideas of the topics you wish to be available. It's best to suggest 1 idea every time, so that we can manage them more efficiently.`
  String get txtSubjectSubTitle {
    return Intl.message(
      'You can give us general ideas of the topics you wish to be available. It\'s best to suggest 1 idea every time, so that we can manage them more efficiently.',
      name: 'txtSubjectSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `e.g. I want a topic about extracurricular activities in college and university, pros and cons of fast food, studying abroad, etc.`
  String get txtSubjectHint {
    return Intl.message(
      'e.g. I want a topic about extracurricular activities in college and university, pros and cons of fast food, studying abroad, etc.',
      name: 'txtSubjectHint',
      desc: '',
      args: [],
    );
  }

  /// `Level and Difficulty`
  String get txtLevelLabel {
    return Intl.message(
      'Level and Difficulty',
      name: 'txtLevelLabel',
      desc: '',
      args: [],
    );
  }

  /// `You could provide us the desired difficulty of the topics you wish for`
  String get txtLevelSubTitle {
    return Intl.message(
      'You could provide us the desired difficulty of the topics you wish for',
      name: 'txtLevelSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description and Specific Requirements`
  String get txtDescriptionAndRequirementsLabel {
    return Intl.message(
      'Description and Specific Requirements',
      name: 'txtDescriptionAndRequirementsLabel',
      desc: '',
      args: [],
    );
  }

  /// `We are thankful if you could share with us the details, preferences, and other specific ideas for the topic`
  String get txtDescriptionAndRequirementsSubTitle {
    return Intl.message(
      'We are thankful if you could share with us the details, preferences, and other specific ideas for the topic',
      name: 'txtDescriptionAndRequirementsSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `e.g. explores the pros and cons of fast food, examining both sides of the debate and providing insight into the potential benefits and drawbacks of this popular food choice.`
  String get txtDescriptionAndRequirementsHint {
    return Intl.message(
      'e.g. explores the pros and cons of fast food, examining both sides of the debate and providing insight into the potential benefits and drawbacks of this popular food choice.',
      name: 'txtDescriptionAndRequirementsHint',
      desc: '',
      args: [],
    );
  }

  /// `Subject and Category cannot be empty`
  String get txtSubjectNotEmpty {
    return Intl.message(
      'Subject and Category cannot be empty',
      name: 'txtSubjectNotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Subject and Category cannot exceed 200 characters`
  String get txtSubjectTooLong {
    return Intl.message(
      'Subject and Category cannot exceed 200 characters',
      name: 'txtSubjectTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Description and Specific Requirements cannot exceed 500 characters`
  String get txtDescriptionAndRequirementsTooLong {
    return Intl.message(
      'Description and Specific Requirements cannot exceed 500 characters',
      name: 'txtDescriptionAndRequirementsTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Unfinished Topic Suggestion`
  String get txtNotFinishTopicSuggest {
    return Intl.message(
      'Unfinished Topic Suggestion',
      name: 'txtNotFinishTopicSuggest',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit and return to the previous screen? Your suggestions are invaluable to us.`
  String get txtNotFinishTopicSuggestContent {
    return Intl.message(
      'Are you sure you want to exit and return to the previous screen? Your suggestions are invaluable to us.',
      name: 'txtNotFinishTopicSuggestContent',
      desc: '',
      args: [],
    );
  }

  /// `Suggestion Sent Successfully`
  String get txtSendTopicSuggestSuccess {
    return Intl.message(
      'Suggestion Sent Successfully',
      name: 'txtSendTopicSuggestSuccess',
      desc: '',
      args: [],
    );
  }

  /// `We are deeply appreciated the efforts you took to help us further improve our contents.\nWe always look forward to hearing more ideas from you.`
  String get txtSendTopicSuggestSuccessContent {
    return Intl.message(
      'We are deeply appreciated the efforts you took to help us further improve our contents.\nWe always look forward to hearing more ideas from you.',
      name: 'txtSendTopicSuggestSuccessContent',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
