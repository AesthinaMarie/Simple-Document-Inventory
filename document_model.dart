class DocumentModel {
  final String referenceNumber;
  final String docName;
  final String documentType;
  final String description;
  final String year;
  final String localLink;
  final String onlineLink;
  DocumentModel({
    required this.referenceNumber,
    required this.docName,
    required this.documentType,
    required this.description,
    required this.year,
    required this.localLink,
    required this.onlineLink,
  });

  DocumentModel copyWith({
    String? referenceNumber,
    String? docName,
    String? documentType,
    String? description,
    String? year,
    String? localLink,
    String? onlineLink,
  }) {
    return DocumentModel(
      referenceNumber: referenceNumber ?? this.referenceNumber,
      docName: docName ?? this.docName,
      documentType: documentType ?? this.documentType,
      description: description ?? this.description,
      year: year ?? this.year,
      localLink: localLink ?? this.localLink,
      onlineLink: onlineLink ?? this.onlineLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'referenceNumber': referenceNumber,
      'docName': docName,
      'documentType': documentType,
      'description': description,
      'year': year,
      'localLink': localLink,
      'onlineLink': onlineLink,
    };
  }

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      referenceNumber: map['referenceNumber'] as String,
      docName: map['docName'] as String,
      documentType: map['documentType'] as String,
      description: map['description'] as String,
      year: map['year'] as String,
      localLink: map['localLink'] as String,
      onlineLink: map['onlineLink'] as String,
    );
  }

  @override
  String toString() {
    return 'DocumentModel(referenceNumber: $referenceNumber, docName: $docName, documentType: $documentType, description: $description, year: $year, localLink: $localLink, onlineLink: $onlineLink)';
  }

  @override
  bool operator ==(covariant DocumentModel other) {
    if (identical(this, other)) return true;

    return other.referenceNumber == referenceNumber &&
        other.docName == docName &&
        other.documentType == documentType &&
        other.description == description &&
        other.year == year &&
        other.localLink == localLink &&
        other.onlineLink == onlineLink;
  }

  @override
  int get hashCode {
    return referenceNumber.hashCode ^
        docName.hashCode ^
        documentType.hashCode ^
        description.hashCode ^
        year.hashCode ^
        localLink.hashCode ^
        onlineLink.hashCode;
  }
}
