mixin UseCase<P, R> {
  Future<R> execute(P params);

  Future<R> call(P params) {
    return execute(params);
  }
}
