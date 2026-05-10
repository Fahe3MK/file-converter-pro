// Developed by Muhammad FaheeM
// Conversion Task Data Model

import 'package:file_converter_app/models/file_item.dart';

class ConversionTask {
  final String id;
  final FileItem sourceFile;
  final TargetFormat targetFormat;
  ConversionStatus status;
  FileItem? resultFile;
  String? errorMessage;
  double progress;
  final DateTime startedAt;
  DateTime? completedAt;
  final Map<String, dynamic>? options;

  ConversionTask({
    required this.id,
    required this.sourceFile,
    required this.targetFormat,
    this.status = ConversionStatus.pending,
    this.resultFile,
    this.errorMessage,
    this.progress = 0.0,
    required this.startedAt,
    this.completedAt,
    this.options,
  });

  // Duration of conversion
  Duration? get duration => completedAt != null 
    ? completedAt!.difference(startedAt) 
    : null;

  // Formatted duration
  String get formattedDuration {
    if (duration == null) return 'In progress...';
    if (duration!.inSeconds < 60) return '${duration!.inSeconds}s';
    return '${duration!.inMinutes}m ${duration!.inSeconds % 60}s';
  }

  // Progress percentage
  int get progressPercentage => (progress * 100).toInt();

  // Whether conversion is complete
  bool get isCompleted => status == ConversionStatus.completed;
  
  // Whether conversion failed
  bool get isFailed => status == ConversionStatus.failed;
  
  // Whether conversion is in progress
  bool get isProcessing => status == ConversionStatus.processing;
  
  // Target file extension
  String get targetExtension {
    switch (targetFormat) {
      case TargetFormat.jpeg:
        return 'jpg';
      case TargetFormat.png:
        return 'png';
      case TargetFormat.gif:
        return 'gif';
      case TargetFormat.pdf:
        return 'pdf';
      case TargetFormat.webp:
        return 'webp';
      case TargetFormat.heic:
        return 'heic';
      case TargetFormat.bmp:
        return 'bmp';
      case TargetFormat.tiff:
        return 'tiff';
      case TargetFormat.docx:
        return 'docx';
    }
  }

  ConversionTask copyWith({
    ConversionStatus? status,
    FileItem? resultFile,
    String? errorMessage,
    double? progress,
    DateTime? completedAt,
  }) {
    return ConversionTask(
      id: id,
      sourceFile: sourceFile,
      targetFormat: targetFormat,
      status: status ?? this.status,
      resultFile: resultFile ?? this.resultFile,
      errorMessage: errorMessage ?? this.errorMessage,
      progress: progress ?? this.progress,
      startedAt: startedAt,
      completedAt: completedAt ?? this.completedAt,
      options: options,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'sourceFile': sourceFile.toJson(),
    'targetFormat': targetFormat.index,
    'status': status.index,
    'resultFile': resultFile?.toJson(),
    'errorMessage': errorMessage,
    'progress': progress,
    'startedAt': startedAt.toIso8601String(),
    'completedAt': completedAt?.toIso8601String(),
  };

  @override
  String toString() => 'ConversionTask(${sourceFile.name} -> ${targetFormat.name}, $status)';
}

enum ConversionStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled,
}

enum TargetFormat {
  jpeg,
  png,
  gif,
  pdf,
  webp,
  heic,
  bmp,
  tiff,
  docx,
}

// Extension for TargetFormat
extension TargetFormatExtension on TargetFormat {
  String get displayName {
    switch (this) {
      case TargetFormat.jpeg:
        return 'JPEG';
      case TargetFormat.png:
        return 'PNG';
      case TargetFormat.gif:
        return 'GIF';
      case TargetFormat.pdf:
        return 'PDF';
      case TargetFormat.webp:
        return 'WebP';
      case TargetFormat.heic:
        return 'HEIC';
      case TargetFormat.bmp:
        return 'BMP';
      case TargetFormat.tiff:
        return 'TIFF';
      case TargetFormat.docx:
        return 'DOCX';
    }
  }
  
  String get icon {
    switch (this) {
      case TargetFormat.jpeg:
      case TargetFormat.png:
      case TargetFormat.webp:
      case TargetFormat.heic:
      case TargetFormat.bmp:
      case TargetFormat.tiff:
        return '🖼️';
      case TargetFormat.gif:
        return '🎬';
      case TargetFormat.pdf:
      case TargetFormat.docx:
        return '📄';
    }
  }
}