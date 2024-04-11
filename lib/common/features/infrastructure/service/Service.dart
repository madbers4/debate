import 'package:v1/common/features/infrastructure/Provider.dart';

class Service<T extends Service<T>> {
  Provider<T> serviceProvider;

  Service({required this.serviceProvider});
}
