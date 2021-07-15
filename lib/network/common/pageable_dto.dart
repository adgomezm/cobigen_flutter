import 'package:flutter_springboot/network/common/pageable_sort_dto.dart';

part 'pageable_dto.g.dart';

class PageableDto {
  final int pageSize;
  final int pageNumber;
  final List<PageableSortDto> sort;

  PageableDto(this.pageSize, this.pageNumber, this.sort);

  factory PageableDto.fromJson(Map<String, dynamic> json) =>
      _$PageableDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PageableDtoToJson(this);

  @override
  String toString() {
    return "(pageSize: $pageSize, pageNumber: $pageNumber, sort: $sort)";
  }
}
