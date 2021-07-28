import 'package:equatable/equatable.dart';

class PaginateData extends Equatable {
  const PaginateData({
    required this.hasMore,
    required this.quotaMax,
    required this.quotaRemaining,
  });

  factory PaginateData.fromJson(Map<String, dynamic> json) {
    return PaginateData(
      hasMore: json['has_more'],
      quotaMax: json['quota_max'],
      quotaRemaining: json['quota_remaining'],
    );
  }

  final bool hasMore;
  final int quotaMax;
  final int quotaRemaining;

  Map<String, dynamic> toJson() {
    return {
      'has_more': hasMore,
      'quota_max': quotaMax,
      'quota_remaining': quotaRemaining,
    };
  }

  @override
  List<Object?> get props => [hasMore, quotaMax, quotaRemaining];
}
