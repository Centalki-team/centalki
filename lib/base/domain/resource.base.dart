abstract class Resource {
  const Resource(this.path, {String? description})
      : description = description ?? path;

  final String path;

  ///
  /// Description được sử dụng để thông báo về việc api nào đang được chạy
  final String description;

  static Resource lazy(String path, {String description = ''}) =>
      _BaseResource(path, description: description);
}

class _BaseResource extends Resource {
  const _BaseResource(String path, {String? description})
      : super(
          path,
          description: description ?? path,
        );
}
