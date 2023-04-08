class MainQuery {
  final int? id;

  MainQuery({this.id});

  String toQuery() => "?id=${id ?? ""}";
}