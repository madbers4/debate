import 'package:v1/common/features/infrastructure/dto/DTO.dart';
import 'package:v1/common/features/infrastructure/endpoint/EndpointAccess.dart';
import 'package:v1/common/features/infrastructure/socket/SocketDTO.dart';

class EndpointHandler<T extends DTO> {
  String path;
  List<EndpointAccess> accesses;
  DTOFactory<T> dtoFactory;
  ToDTOFactory<T>? customToDTOFactory;

  EndpointHandler(
      {required this.path,
      required this.accesses,
      required this.dtoFactory,
      this.customToDTOFactory});
}
