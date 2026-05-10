// Developed by Muhammad FaheeM
// All rights reserved © 2024

class AppConstants {
  // App Info
  static const String appName = 'File Converter Pro';
  static const String developerName = 'Muhammad FaheeM';
  static const String version = '1.0.0';
  static const String buildNumber = '1';
  
  // Branding
  static const String copyrightText = '© 2024 Developed by Muhammad FaheeM';
  static const String appTagline = 'Convert Any File, Any Format - By Muhammad FaheeM';
  
  // Supported Formats
  static const List<String> supportedInputFormats = [
    'JPEG', 'JPG', 'PNG', 'GIF', 'BMP', 'TIFF', 
    'WEBP', 'HEIC', 'PDF', 'DOC', 'DOCX'
  ];
  
  static const List<String> supportedOutputFormats = [
    'JPEG', 'PNG', 'GIF', 'PDF', 'WEBP', 
    'HEIC', 'BMP', 'TIFF', 'DOCX'
  ];
  
  // File Size Limits
  static const int maxFileSizeMB = 50;
  static const int maxBatchFiles = 20;
  
  // Quality Settings
  static const int defaultQualityHigh = 95;
  static const int defaultQualityMedium = 80;
  static const int defaultQualityLow = 60;
  
  // Scanner Settings
  static const int scannerDefaultDPI = 200;
  static const int scannerHighDPI = 300;
  static const int maxScanPages = 50;
  
  // Animation Durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration splashDuration = Duration(seconds: 2);
  
  // Routes
  static const String homeRoute = '/';
  static const String scannerRoute = '/scanner';
  static const String converterRoute = '/converter';
  static const String galleryRoute = '/gallery';
  static const String historyRoute = '/history';
  static const String settingsRoute = '/settings';
  
  // Storage Paths
  static const String convertedFilesFolder = 'ConvertedFiles';
  static const String scannedDocumentsFolder = 'ScannedDocuments';
  static const String tempFolder = 'TempConversion';
  
  // Advertisement (if using)
  static const bool showAds = false;
  static const String adUnitId = '';
  
  // API Keys (if using cloud services)
  static const String googleDriveApiKey = '';
  static const String dropboxApiKey = '';
  
  // Contact & Support
  static const String supportEmail = 'muhammadfaheem@example.com';
  static const String websiteUrl = 'https://github.com/muhammadfaheem';
  static const String privacyPolicyUrl = '';
  static const String termsOfServiceUrl = '';
  
  // Social Media
  static const String githubUrl = 'https://github.com/muhammadfaheem';
  static const String linkedinUrl = '';
  static const String twitterUrl = '';
}