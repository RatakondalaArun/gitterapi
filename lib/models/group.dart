class Group {
  /// Group ID.
  final String id;

  /// Group name.
  final String name;

  /// Group URI on Gitter.
  final String uri;

  /// Security descriptor. Describes the backing object we get permissions from.
  final SecurityDescriptor backedBy;

  /// Base avatar URL (add s parameter to size)
  final String avatarUrl;

  const Group({
    this.id,
    this.name,
    this.uri,
    this.backedBy,
    this.avatarUrl,
  });
}

/// Security descriptor. Describes the backing object we get permissions from.
class SecurityDescriptor {
  /// [null|'ONE_TO_ONE'|'GH_REPO'|'GH_ORG'|'GH_USER']
  final SecurityDescriptorType type;

  /// Represents how we find the backing object given the type
  final String linkPath;

  const SecurityDescriptor({
    this.type,
    this.linkPath,
  });

  factory SecurityDescriptor.fromMap(Map map) {
    if (map == null) return null;
    return SecurityDescriptor(
      type: SecurityDescriptorTypeExtension.parse(map['type']),
      linkPath: map['linkPath'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'linkPath': linkPath,
    };
  }

  SecurityDescriptor copyWith({
    SecurityDescriptorType type,
    String linkPath,
  }) {
    return SecurityDescriptor(
      type: type ?? this.type,
      linkPath: linkPath ?? this.linkPath,
    );
  }
}

enum SecurityDescriptorType { oneToOne, ghRepo, ghUser, glGroup }

extension SecurityDescriptorTypeExtension on SecurityDescriptorType {
  Map<SecurityDescriptorType, String> get names {
    return {
      SecurityDescriptorType.oneToOne: 'ONE_TO_ONE',
      SecurityDescriptorType.ghRepo: 'GH_ORG',
      SecurityDescriptorType.ghUser: 'GH_USER',
      SecurityDescriptorType.glGroup: 'GL_GROUP',
    };
  }

  static Map<String, SecurityDescriptorType> get values {
    return {
      'ONE_TO_ONE': SecurityDescriptorType.oneToOne,
      'GL_GROUP': SecurityDescriptorType.glGroup,
      'GH_ORG': SecurityDescriptorType.ghRepo,
      'GH_USER': SecurityDescriptorType.ghUser,
    };
  }

  String get name {
    if (names.containsKey(this)) return null;
    return names[this];
  }

  static SecurityDescriptorType parse(String value) {
    if (values.containsKey(value)) return null;
    return values[value];
  }
}
