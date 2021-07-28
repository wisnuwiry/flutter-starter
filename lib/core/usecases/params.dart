import 'package:equatable/equatable.dart';

/// Params for empty field
///
/// If you want to put `Params` in `UseCase` and in usecase no need param
/// You should use this Params
class NoParams {}

/// Params for getting data with **Paginating**
///
/// When implementing infinity load, or paginate get data
/// this params is very precise
class PaginateParams extends Equatable {
  /// All field must be initialize and can't null value
  ///
  /// - [page] required and not nullable
  /// - [perPage] required and not nullable
  ///
  /// Example:
  ///
  /// ```dart
  /// PaginateParams(
  ///   page: 2,
  ///   perPage: 10,
  /// );
  /// ```
  const PaginateParams({required this.page, required this.perPage});

  /// Page number params to send into usecase
  final int page;

  /// Amount of data in [page]
  final int perPage;

  @override
  List<Object?> get props => [page, perPage];
}

/// This params for searching data with keyword property
class SearchParams extends Equatable {
  /// field [query] must be initialize and can't nullable
  const SearchParams(this.query);

  /// Query keyword to search
  final String query;

  @override
  List<Object?> get props => [query];
}

/// This param for advance searching with Paginating
///
/// Param you can put [query] properties for search and
/// [page] & [perPage] for paginate handle
class SearchPaginateParams implements PaginateParams, SearchParams {
  /// All field must be initialize and can't null
  ///
  /// Params [query] for search with keyword
  ///
  /// Params [page] & [perPage] for handling paginate data
  SearchPaginateParams({
    required this.query,
    required this.page,
    required this.perPage,
  });

  @override
  final String query;

  @override
  final int page;

  @override
  final int perPage;

  @override
  List<Object?> get props => [query, page, perPage];

  @override
  bool? get stringify => false;
}
