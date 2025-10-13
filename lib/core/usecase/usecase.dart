abstract interface class Usecase<T, P> {
  T call(P params);
}
