class DomainLayerExeption implements Exception {
  String cause;

  DomainLayerExeption(this.cause);

  @override
  String toString() {
    return cause;
  }
}
