import 'associated_object.dart';

class EphemeralKeyModel {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EphemeralKeyModel.fromIdEphkey1RkqYspEfg4x4FUcBteXh95LObjectEphemeralKeyAssociatedObjectsIdCusSg6A7MyzHt9vkCTypeCustomerCreated1752515564Expires1752519164LivemodeFalseSecretEkTestYwNjdF8xUmd2b3dQrwZnNHg0RlVjLgfReDriWkVVeXzjwunstXc5VGs4M0R5b1Bjt1U5dWi00MjmiBxyE(
    Map<String, dynamic> json,
  ) {
    return EphemeralKeyModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      associatedObjects:
          (json['associated_objects'] as List<dynamic>?)
              ?.map(
                (e) =>
                    AssociatedObject.fromIdEphkey1RkqYspEfg4x4FUcBteXh95LObjectEphemeralKeyAssociatedObjectsIdCusSg6A7MyzHt9vkCTypeCustomerCreated1752515564Expires1752519164LivemodeFalseSecretEkTestYwNjdF8xUmd2b3dQrwZnNHg0RlVjLgfReDriWkVVeXzjwunstXc5VGs4M0R5b1Bjt1U5dWi00MjmiBxyE(
                      e as Map<String, dynamic>,
                    ),
              )
              .toList(),
      created: json['created'] as int?,
      expires: json['expires'] as int?,
      livemode: json['livemode'] as bool?,
      secret: json['secret'] as String?,
    );
  }

  Map<String, dynamic>
  toIdEphkey1RkqYspEfg4x4FUcBteXh95LObjectEphemeralKeyAssociatedObjectsIdCusSg6A7MyzHt9vkCTypeCustomerCreated1752515564Expires1752519164LivemodeFalseSecretEkTestYwNjdF8xUmd2b3dQrwZnNHg0RlVjLgfReDriWkVVeXzjwunstXc5VGs4M0R5b1Bjt1U5dWi00MjmiBxyE() {
    return {
      'id': id,
      'object': object,
      'associated_objects':
          associatedObjects
              ?.map(
                (e) =>
                    e.toIdEphkey1RkqYspEfg4x4FUcBteXh95LObjectEphemeralKeyAssociatedObjectsIdCusSg6A7MyzHt9vkCTypeCustomerCreated1752515564Expires1752519164LivemodeFalseSecretEkTestYwNjdF8xUmd2b3dQrwZnNHg0RlVjLgfReDriWkVVeXzjwunstXc5VGs4M0R5b1Bjt1U5dWi00MjmiBxyE(),
              )
              .toList(),
      'created': created,
      'expires': expires,
      'livemode': livemode,
      'secret': secret,
    };
  }
}
