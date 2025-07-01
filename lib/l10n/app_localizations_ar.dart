// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'قائمة المهام';

  @override
  String get addNewTodo => 'إضافة مهمة جديدة';

  @override
  String get editTodo => 'تعديل المهمة';

  @override
  String get title => 'العنوان';

  @override
  String get description => 'الوصف (اختياري)';

  @override
  String get cancel => 'إلغاء';

  @override
  String get add => 'إضافة';

  @override
  String get update => 'تحديث';

  @override
  String get pleaseEnterTitle => 'يرجى إدخال عنوان';

  @override
  String get allTodos => 'الكل';

  @override
  String get activeTodos => 'نشطة';

  @override
  String get completedTodos => 'مكتملة';

  @override
  String get noTodosFound => 'لا توجد مهام';

  @override
  String get noActiveTodos => 'لا توجد مهام نشطة!\nجميع المهام مكتملة.';

  @override
  String get noCompletedTodos =>
      'لا توجد مهام مكتملة بعد.\nابدأ في إكمال بعض المهام!';

  @override
  String get welcomeMessage =>
      'مرحباً بك في قائمة المهام!\nانقر على زر + لإضافة مهمتك الأولى!\n\nنصيحة: اضغط طويلاً على أي عنصر لإعادة ترتيبه.';

  @override
  String get addYourFirstTodo => 'أضف مهمتك الأولى!';

  @override
  String errorLoadingTodos(String error) {
    return 'خطأ في تحميل المهام: $error';
  }

  @override
  String errorAddingTodo(String error) {
    return 'خطأ في إضافة المهمة: $error';
  }

  @override
  String errorUpdatingTodo(String error) {
    return 'خطأ في تحديث المهمة: $error';
  }

  @override
  String errorDeletingTodo(String error) {
    return 'خطأ في حذف المهمة: $error';
  }

  @override
  String get delete => 'حذف';

  @override
  String get edit => 'تعديل';

  @override
  String get confirmDelete => 'هل أنت متأكد من حذف هذه المهمة؟';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get toggleLanguage => 'تبديل اللغة';

  @override
  String get profileSettings => 'الملف الشخصي والإعدادات';

  @override
  String get userName => 'جون دو';

  @override
  String get userEmail => 'john.doe@example.com';

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get theme => 'السمة';
}
