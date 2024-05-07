class order {
  final String date;
  final String id;
  final String status;
  final List<dynamic> data;
  final double total;

  order(
      {required this.date,
      required this.id,
      required this.data,
      required this.status,
      required this.total});
}

final List<order> ORDERS = [];
