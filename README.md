
# Andrés Ruiz  - Luis Renteria

# INICIO DEL PROYECTO 
# Proyecto desarrolado en el framework Flutter y el lenguaje Dart
 * Version de flutter: 2.2.3 
 * Version de dart: 2.13.4
 - En caso de tener una versión distinta, configure Flutter version Manager (FVM) https://fvm.app/

# Arquitectura usuada : Clean Architecture

    |-lib
      |--src
         |--config/   
         |--core/   
         |--data
            |--local/
            |--repository/
            |--model/
         |--domain
            |--entities/
            |--repository/       
            |--usecase/
         |--presentation
            |--widgets/
            |--pages/
                |--authentication/
                |--complete_account/
                |--home
                    |--profile/
                    |--service_detail/
                    |--list_service/

# Paqueteria usada https://pub.dev/
- dartz:
- get_it:
- equatable
- flutter_bloc:
- image_picker:
- firebase_auth:
- cloud_firestore:
- firebase_storage:
- shared_preferences:
