class AppConstants {
  static const appName = 'Taka Manager';
  static const defaultCurrency = 'BDT';
  static const defaultLanguage = 'bn';

  static const paymentMethods = [
    'Cash',
    'bKash',
    'Nagad',
    'Rocket',
    'Bank',
    'Card',
  ];

  static const defaultCategories = [
    {'name_bn': 'খাবার', 'name_en': 'Food', 'type': 'expense'},
    {'name_bn': 'যাতায়াত', 'name_en': 'Transport', 'type': 'expense'},
    {'name_bn': 'শপিং', 'name_en': 'Shopping', 'type': 'expense'},
    {'name_bn': 'বিল', 'name_en': 'Bills', 'type': 'expense'},
    {'name_bn': 'চিকিৎসা', 'name_en': 'Medical', 'type': 'expense'},
    {'name_bn': 'শিক্ষা', 'name_en': 'Education', 'type': 'expense'},
    {'name_bn': 'বেতন', 'name_en': 'Salary', 'type': 'income'},
    {'name_bn': 'ব্যবসা', 'name_en': 'Business', 'type': 'income'},
    {'name_bn': 'উপহার', 'name_en': 'Gift', 'type': 'gift'},
    {'name_bn': 'অন্যান্য', 'name_en': 'Other', 'type': 'other'},
  ];
}
