class Feeling {
  final String name;
  final String image;
  final List<String> subFeelings;
  const Feeling({
    required this.name,
    required this.image,
    this.subFeelings = const [],
  });
}
