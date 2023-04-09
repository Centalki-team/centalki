class TextDoc {
  // AUTHENTICATION
  // Validation error messages
  static const txtEmailEmpty = 'Email address cannot be empty';
  static const txtEmailInvalidFormat = 'Invalid email format';
  static const txtFullNameEmpty = 'Full name cannot be empty';
  static const txtFullNameTooShort =
      'Name must contain at least 2 non-whitespace characters';
  static const txtFullNameTooLong = 'Name cannot exceed 50 characters';
  static const txtFullNameOnlyCharacters = 'Full name just contains characters';
  static const txtEngNameTooShort =
      'English name must contain at least 2 non-whitespace characters';
  static const txtEngNameTooLong = 'English name cannot exceed 50 characters';
  static const txtEngNameOnlyCharacters =
      'English name just contains characters';
  static const txtBioTooLong = 'Your biography cannot exceed 200 characters';
  static const txtPasswordEmpty = 'Password cannot be empty';
  static const txtPasswordTooShort =
      'Password must contain at least 6 characters';
  static const txtPasswordTooLong = 'Password cannot exceed 100 characters';
  static const txtRetypePasswordEmpty = 'Please enter your password again';
  static const txtRetypePasswordNotMatch = 'Retyped password mismatched';
  static const txtTermsNotAgreed = 'Please agree with our Terms & Conditions';

  // Generic error messages
  static const txtEmailUsed = 'Email is used by another account';
  static const txtUserNotFound = 'User not found for that email!';
  static const txtWrongPassword = 'Wrong password!';
  static const txtWeakPassword = 'The password provided is too weak!';
  static const txtNotValidateRole = 'Cannot verify role!';

  // Prompts
  static const txtEmail = 'Email';
  static const txtPassword = 'Password';
  static const txtFullName = 'Full name';
  static const txtRetypePassword = 'Retype Password';
  static const txtHaveNoAccount = 'Have no account?';
  static const txtHaveAnAccount = 'Have an account?';
  static const txtTermsAccept = 'I accept';
  static const txtSignInIntroduction =
      'Sign in to start practicing your English speaking skill';
  static const txtSignUpIntroduction = 'Sign up to discover Centalki';
  static const txtResetPasswordIntroduction =
      'Enter the email address you used for Centalki';
  static const txtResetPasswordDescription =
      'We\'ll send you a link to reset your password';

  // UI elements
  static const txtSignIn = 'Sign In';
  static const txtSignUp = 'Sign Up';
  static const txtNext = 'Next';
  static const txtResetPassword = 'Reset Password';
  static const txtReturnSignIn = 'Return to Sign In';
  static const txtForgotPassword = 'Forgot Password?';
  static const txtTerms = 'Terms & Conditions';

  // TOPIC
  static const txtElementary = 'Elementary';
  static const txtPreIntermediate = 'Pre-Intermediate';
  static const txtIntermediate = 'Intermediate';
  static const txtUpperIntermediate = 'Upper-Intermediate';

  // TOPIC DETAIL
  static const txtTopicDetail = 'Topic Detail';
  static const txtTalk = 'Talk';
  static const txtTopicCategory = 'Category';
  static const txtTopicLevel = 'Level';
  static const txtTopicDescription = 'Description';
  static const txtTopicVocab = 'Vocabulary';
  static const txtTopicQuestions = 'Recommended Questions';
  static const txtTopicPhraseExample = 'Example';

  // CONNECT TEACHER
  static const txtCancel = 'Cancel';
  static const txtYes = 'Yes';
  static const txtNo = 'No';
  static const txtCancelTitle = 'Cancel connecting';
  static const txtCancelContent =
      'Are you sure to cancel connecting to teacher?';
  static const txtFindTeacher = 'Finding teacher for you...';
  static const txtFoundedTeacher = 'Teacher found. Connecting...';
  static const txtTryAgain = 'Try Again';
  static const txtConnect = 'Connect';
  static const txtBack = 'Back';
  static const txtGoBack = 'Go to back';
  static const txtNotSignIn = 'Please sign in your account';
  static const txtNotSignInTitle = 'Failure to connect';
  static const txtSuccessfullyCancel = 'Successfully Cancel';
  static const txtOk = 'OK';
  static const txtConnectedTeacher = 'Connected to teacher ';
  static const txtLaunchSession = '. Launching session...';
  static const txtCancelledTitle = 'Cancelled session';
  static const txtCancelledContent = '''The teacher cancelled this session.
  Do you want to try with another?''';
  static const txtNotTeacherAvailableTitle = 'No teacher available';
  static const txtNotTeacherAvailableContent =
      'You can try again after 5 minutes';
  static const txtInternetConnection =
      'Please check your internet connection and try again.';

  // YOUR ACCOUNT
  static const txtLoadFailed = 'Failed to load your profile!';
  static const txtStudentProfile = 'Student Profile';
  static const txtWallet = 'Wallet';
  static const txtHistory = 'History';
  static const txtAccountInformation = 'Account Information';
  static const txtChangePassword = 'Change Password';
  static const txtDeleteAccount = 'Delete Account';
  static const txtSignOut = 'Sign Out';
  static const txtSignOutContent =
      'Are you sure to sign out of the current account?';
  static const txtRemainingSessions = 'Remaining sessions';
  static const txtCompletedSessions = 'Completed sessions';

  // Account - Profile
  static const txtProfileUpdateFailed = 'Failed to update your profile!';
  static const txtProfileUpdateSuccess = 'Successfully updated your profile!!';
  static const txtSaveChanges = 'Save Changes';
  static const txtFullNameTitle = 'Full Name';
  static const txtEnglishNameTitle = 'English Name';
  static const txtBioTitle = 'Bio';
  static const txtInterestedTopics = 'Interested Topics';
  static const txtChangeAvatar = 'Change Avatar';
  static const txtFileNotSupported = 'File is not supported';
  static const txtFileMaximumPerFile = "The maximum size per file is 2MB.";

  // Account - Info
  static const txtFacebook = 'Facebook';
  static const txtGoogle = 'Google';
  static const txtApple = 'Apple';
  static const txtPhoneNumberTitle = 'Phone Number';
  static const txtDateOfBirthTitle = 'Date of Birth';
  static const txtGenderTitle = 'Gender';
  static const txtConnectionsTitle = 'Connections';
  static const txtConnected = 'Connected';
  static const txtPaymentMethodTitle = 'Payment Method';

  // Account - Delete Account
  static const txtDeleteAccountResult = 'Delete result';
  static const txtReauthenticateAccount = 'Re-authenticate your account';
  static const txtReauthenticate = 'Re-authenticate';
  static const txtConfirmDeleteAccount = 'Confirm Delete';
  static const txtEnterPasswordToDelete =
      'Please enter your password to continue';
  static const txtConfirmDeleteAccountTitle = 'Delete your account?';
  static const txtConfirmDeleteAccountContent =
      'You are requesting that your account be deleted.\nDeleting the account will:\n   \u{2022} Remove account information and images\n   \u{2022} Remove all messages\n   \u{2022} Unable to restore';
  static const txtDeleteAccountError =
      'Something wrong when delete account!\nTry again after some minutes.';
  static const txtSignInAgainToDelete =
      'Please sign in again to delete your account';

  // Account - History
  static const txtTotalCompletedSessions = 'Total Completed Sessions';
  static const txtTotalTime = 'Total time is';
  static const txtHours = 'hours';
  static const txtMinutes = 'minutes';
  static const txtSessions = 'Sessions';
  static const txtNoData = 'No data';
  static const txtTapToLoadMoreSessions = 'Tap to load more sessions';

  // Account - Wallet
  static const txtBalance = 'Balance';
  static const txtOrLoginWith = 'Or log in with';
  static const txtOr = 'or';
  static const txtEachSessionDuration =
      'The duration of each session is 30 minutes';
  static const txtEachSessionPrice = 'The price of each session is ';
  static const txt30Minutes = '/30 minutes';
  static const txtTransactions = 'Transactions';
  static const txtCharged = 'Charged';

  // Account - Change Password
  static const txtNewPasswordEmptyWarning = 'New password cannot be empty';
  static const txtNewPasswordTooShort =
      'New password must contain at least 6 characters';
  static const txtNewPasswordTooLong =
      'New password cannot exceed 100 characters';
  static const txtConfirmedPassword =
      'Confirmed password must match the new password';
  static const txtConfirmedPasswordEmptyWarning =
      'Confirmed password cannot be empty';
  static const txtConfirmedPasswordTooLong =
      'Confirm password cannot exceed 100 characters';
  static const txtConfirmedPasswordMatchWarning =
      'Confirm password must match the new password';
  static const txtChangePasswordError =
      'Something went wrong. Please try again later!';
  static const txtUserNotSignIn = 'User does not sign in!';
  static const txtChangePasswordResult = 'Change password result';
  static const txtSuccessfullyChanged = 'Successfully changed!';
  static const txtCurrentPassword = 'Current password';
  static const txtNewPassword = 'New password';
  static const txtConfirmPassword = 'Confirm password';
  static const txtThirdPartyChangePassword =
      'This feature does not work with accounts signed in with third-party';

  static const txtMale = 'Male';
  static const txtFemale = 'Female';
  static const txtOthers = 'Others';

  // SETTINGS
  static const txtNotification = 'Notification';
  static const txtAppearance = 'Appearance';
  static const txtLanguage = 'Language';
  static const txtGiveFeedback = 'Give Feedback';
  static const txtAbout = 'About';
  static const txtApplicationTheme = 'Application Theme';
  static const txtDarkMode = 'Dark Mode';
  static const txtNotifyMeAbout = 'Notify me about';
  static const txtDealsAndDiscounts = 'Deals and Discounts';
  static const txtNewTopics = 'New Topics';
  static const txtNewTeachers = 'New Teachers';
  static const txtSounds = 'Sounds';
  static const txtVibrations = 'Vibrations';
  static const txtEnglish = 'English';
  static const txtVietnamese = 'Tiếng Việt';
  static const txtRateOurApp = 'Rate Our App';
  static const txtPleaseTellUsWatUThink = 'Please tell us what you think';
  static const txtSend = 'Send';
  static const txtCentalkiTitle = 'centalki';
  static const txtCentalkiDescription =
      'Practice English speaking with foreign teachers';
  static const txtCentalkiSource =
      'Developed by Centalki Team\n2023, All Rights Reserved\nContact: centalki.dev@gmail.com';
  static const txtCentalkiVersion = 'Version 0.4.0';
  static const txtLastUpdated = 'Last updated: Mar 03, 2023';

  // Feedback
  // Validation error messages
  static const txtRatingEmpty = 'Rating cannot be empty';
  static const txtFeedbackEmpty = 'Feedback cannot be empty';
  static const txtSuccessFeedback = 'Send feedback successfully';
  static const txtSuccess = 'Success';
  static const txtLoadFail = 'Load failed';
  static const txtFeedbackTooLong = 'Feedback cannot exceed 500 characters';

  //Payment - Buy more sessions
  static const txtBuyMoreSessions = 'Buy More Sessions';
  static const txtChoosePaymentMethod = 'Choose payment method';
  static const txtPaymentInformation = 'Payment Information';
  static const txtInstructions = 'Instructions';
  static const txtPricePerSessionAnnounce = 'The price for each session is';
  static const txtPaymentInstructionDetail =
      'Multiply it with the number of session you want to buy, then transfer the money using the QR Code provided above.';
  static const txtPaymentBillUpload =
      'Upload your bill so that we can verify your payment';
  static const txtUpload = 'Upload';
  static const txtChooseFromLibrary = 'Choose from Gallery';
  static const txtTakeAPic = 'Using Camera';

  //Self Review
  static const txtSelfReviewTitle = 'Please tell us your current English level';
  static const txtSelfReviewContent =
      'This information will enable us to guide you better and recommend suitable contents for you';
}
