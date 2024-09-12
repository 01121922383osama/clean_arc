abstract interface class UseCases<T, Params> {
  Future<T> call([Params? params]);
}
