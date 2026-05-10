// Developed by Muhammad FaheeM
// File Item Data Model

import 'dart:typed_data';

class FileItem {
  final String id;
  final String name;
  final String path;
  final FileType type;
  final int size;
  final DateTime createdAt;
  final DateTime? modifiedAt;
  final Uint8List? bytes;
  final String? mimeType;
  final Map<String, dynamic>? metadata;

  FileItem({
    required this.id,
    required this.name,
    required this.path,
    required this.type,
    required this.size,
    required this.createdAt,
    this.modifiedAt,
    this.bytes,
    this.mimeType,
    this.metadata,
  });

  // Formatted file size
  String get formattedSize {
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    if (size < 1024 * 1024 * 1024) return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(size / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  // File extension
  String get extension => name.split('.').last.toLowerCase();
  
  // File name without extension
  String get nameWithoutExtension => name.substring(0, name.lastIndexOf('.'));
  
  // Check if file is an image
  bool get isImage => type == FileType.image || 
    ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp', 'heic', 'tiff'].contains(extension);
  
  // Check if file is a PDF
  bool get isPdf => type == FileType.pdf || extension == 'pdf';
  
  // Check if file is a GIF
  bool get isGif => type == FileType.gif || extension == 'gif';

  // Convert to JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'path': path,
    'type': type.index,
    'size': size,
    'createdAt': createdAt.toIso8601String(),
    'modifiedAt': modifiedAt?.toIso8601String(),
    'mimeType': mimeType,
  };

  // Create from JSON
  factory FileItem.fromJson(Map<String, dynamic> json) => FileItem(
    id: json['id'],
    name: json['name'],
    path: json['path'],
    type: FileType.values[json['type']],
    size: json['size'],
    createdAt: DateTime.parse(json['createdAt']),
    modifiedAt: json['modifiedAt'] != null ? DateTime.parse(json['modifiedAt']) : null,
    mimeType: json['mimeType'],
  );

  // Copy with
  FileItem copyWith({
    String? id,
    String? name,
    String? path,
    FileType? type,
    int? size,
    DateTime? createdAt,
    DateTime? modifiedAt,
    Uint8List? bytes,
    String? mimeType,
    Map<String, dynamic>? metadata,
  }) {
    return FileItem(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
      type: type ?? this.type,
      size: size ?? this.size,
      createdAt: createdAt ?? this.createdAt,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      bytes: bytes ?? this.bytes,
      mimeType: mimeType ?? this.mimeType,
      metadata: metadata ?? this.metadata,
    );
  }

  @override
  String toString() => 'FileItem(name: $name, type: $type, size: $formattedSize)';
}

enum FileType {
  image,
  pdf,
  gif,
  document,
  audio,
  video,
  archive,
  unknown,
}

// Extension methods for FileType enum
extension FileTypeExtension on FileType {
  String get displayName {
    switch (this) {
      case FileType.image:
        return 'Image';
      case FileType.pdf:
        return 'PDF Document';
      case FileType.gif:
        return 'GIF Animation';
      case FileType.document:
        return 'Document';
      case FileType.audio:
        return 'Audio';
      case FileType.video:
        return 'Video';
      case FileType.archive:
        return 'Archive';
      case FileType.unknown:
        return 'Unknown';
    }
  }
  
  String get icon {
    switch (this) {
      case FileType.image:
        return '🖼️';
      case FileType.pdf:
        return '📄';
      case FileType.gif:
        return '🎬';
      case FileType.document:
        return '📝';
      case FileType.audio:
        return '🎵';
      case FileType.video:
        return '🎥';
      case FileType.archive:
        return '📦';
      case FileType.unknown:
        return '❓';
    }
  }
}