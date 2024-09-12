import 'package:clean_arc/features/home/domain/entities/quran_entity.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

class QuranModels extends QuranEntity {
  String? kind;
  String? idd;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  QuranModels({
    this.kind,
    this.idd,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
          authors:
              volumeInfo?.authors?.first ?? 'No Name', // Safely access authors
          description: volumeInfo?.description ?? 'No Description',
          id: idd ?? '', // Provide a default value if idd is null
          previewLink:
              volumeInfo?.previewLink ?? '', // Safely access previewLink
          smallThumbnail: volumeInfo?.imageLinks?.smallThumbnail ??
              '"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCRRdvpS3KRcG9a43mI5-vbU2kysPylGtfHw&s"', // Safely access smallThumbnail
          subtitle: volumeInfo?.subtitle ?? '', // Safely access subtitle
          thumbnail: volumeInfo?.imageLinks?.thumbnail ??
              '"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCRRdvpS3KRcG9a43mI5-vbU2kysPylGtfHw&s"', // Safely access thumbnail
          title: volumeInfo?.title ?? 'No Title', // Safely access title
        );

  factory QuranModels.fromJson(Map<String, dynamic> json) => QuranModels(
        kind: json['kind'] as String?,
        idd: json['id'] as String?,
        etag: json['etag'] as String?,
        selfLink: json['selfLink'] as String?,
        volumeInfo: json['volumeInfo'] == null
            ? null
            : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
        saleInfo: json['saleInfo'] == null
            ? null
            : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
        accessInfo: json['accessInfo'] == null
            ? null
            : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
        searchInfo: json['searchInfo'] == null
            ? null
            : SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'id': idd,
        'etag': etag,
        'selfLink': selfLink,
        'volumeInfo': volumeInfo?.toJson(),
        'saleInfo': saleInfo?.toJson(),
        'accessInfo': accessInfo?.toJson(),
        'searchInfo': searchInfo?.toJson(),
      };
}
