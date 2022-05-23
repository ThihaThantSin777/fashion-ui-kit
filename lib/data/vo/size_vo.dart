class SizeVO{
  String title;
  bool isSelect;

  SizeVO(this.title, this.isSelect);

  @override
  String toString() {
    return 'SizeVO{title: $title, isSelect: $isSelect}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SizeVO &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          isSelect == other.isSelect;

  @override
  int get hashCode => title.hashCode ^ isSelect.hashCode;
}

List<SizeVO>sizeVOList=[
  SizeVO('S', false),
  SizeVO('M', false),
  SizeVO('L', false),
  SizeVO('XL', false),
  SizeVO('XXL', false),
];