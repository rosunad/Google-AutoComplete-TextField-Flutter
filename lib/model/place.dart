class PlacesNewAutocompleteResponse {
  List<PlaceNew>? places;
  String? status;

  PlacesNewAutocompleteResponse({this.places, this.status});

  PlacesNewAutocompleteResponse.fromJson(Map<String, dynamic> json) {
    if (json['places'] != null) {
      places = [];
      json['places'].forEach((p) {
        places!.add(PlaceNew.fromJson(p));
      });
    }
  }
}

class PlaceNew {
  String? placeId;
  String? latitude;
  String? longitude;
  String? adrFormatAddress;
  String? displayName;
  String? languageCode;
  List<AddressComponent>? addressComponents;
  String? shotFormattedAddress;

  PlaceNew(
      {this.placeId,
      this.latitude,
      this.longitude,
      this.adrFormatAddress,
      this.displayName,
      this.languageCode,
      this.addressComponents,
      this.shotFormattedAddress});

  PlaceNew.fromJson(Map<String, dynamic> json) {
    placeId = json['id'];
    latitude = json['location']?['latitude'].toString() ?? '';
    longitude = json['location']?['longitude'].toString() ?? '';
    adrFormatAddress = json['adrFormatAddress'] ?? '';
    displayName = json['displayName']['text'] ?? '';
    languageCode = json['displayName']['languageCode'] ?? '';
    shotFormattedAddress = json['shortFormattedAddress'] ?? '';

    if (json['addressComponents'] != null) {
      addressComponents = [];
      json['addressComponents'].forEach((component) {
        addressComponents!.add(AddressComponent.fromJson(component));
      });
    }
  }
}

class AddressComponent {
  String? longText;
  String? shortText;
  List<String>? types;
  String? languageCode;

  AddressComponent(
      {this.longText, this.shortText, this.types, this.languageCode});

  AddressComponent.fromJson(Map<String, dynamic> json) {
    longText = json['longText'] ?? '';
    shortText = json['shortText'] ?? '';
    languageCode = json['languageCode'] ?? '';
    types = List.from(json['types']);
  }
}
