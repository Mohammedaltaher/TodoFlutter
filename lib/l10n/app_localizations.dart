import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Todo List'**
  String get appTitle;

  /// Title for adding a new todo
  ///
  /// In en, this message translates to:
  /// **'Add New Todo'**
  String get addNewTodo;

  /// Title for editing a todo
  ///
  /// In en, this message translates to:
  /// **'Edit Todo'**
  String get editTodo;

  /// Label for title field
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// Label for description field
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get description;

  /// Cancel button text
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Add button text
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Update button text
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Validation message for empty title
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get pleaseEnterTitle;

  /// Filter option for all todos
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allTodos;

  /// Filter option for active todos
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeTodos;

  /// Filter option for completed todos
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completedTodos;

  /// Message when no todos are available
  ///
  /// In en, this message translates to:
  /// **'No todos found'**
  String get noTodosFound;

  /// Message when no active todos are available
  ///
  /// In en, this message translates to:
  /// **'No active todos!\nAll tasks are completed.'**
  String get noActiveTodos;

  /// Message when no completed todos are available
  ///
  /// In en, this message translates to:
  /// **'No completed todos yet.\nStart completing some tasks!'**
  String get noCompletedTodos;

  /// Welcome message for new users
  ///
  /// In en, this message translates to:
  /// **'Welcome to your Todo List!\nTap the + button to add your first todo!\n\nTip: Long press any item to reorder.'**
  String get welcomeMessage;

  /// Message encouraging to add first todo
  ///
  /// In en, this message translates to:
  /// **'Add your first todo!'**
  String get addYourFirstTodo;

  /// Error message when loading todos fails
  ///
  /// In en, this message translates to:
  /// **'Error loading todos: {error}'**
  String errorLoadingTodos(String error);

  /// Error message when adding todo fails
  ///
  /// In en, this message translates to:
  /// **'Error adding todo: {error}'**
  String errorAddingTodo(String error);

  /// Error message when updating todo fails
  ///
  /// In en, this message translates to:
  /// **'Error updating todo: {error}'**
  String errorUpdatingTodo(String error);

  /// Error message when deleting todo fails
  ///
  /// In en, this message translates to:
  /// **'Error deleting todo: {error}'**
  String errorDeletingTodo(String error);

  /// Delete button text
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Edit button text
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Confirmation message for deleting a todo
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this todo?'**
  String get confirmDelete;

  /// Yes button text
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No button text
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Tooltip for language toggle button
  ///
  /// In en, this message translates to:
  /// **'Toggle Language'**
  String get toggleLanguage;

  /// Title for the profile and settings screen
  ///
  /// In en, this message translates to:
  /// **'Profile & Settings'**
  String get profileSettings;

  /// Placeholder for user name
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get userName;

  /// Placeholder for user email
  ///
  /// In en, this message translates to:
  /// **'john.doe@example.com'**
  String get userEmail;

  /// Section title for settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Label for language selection
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Label for theme selection
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
