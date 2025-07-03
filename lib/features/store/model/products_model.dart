// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Collection collection;

  Welcome({required this.collection});

  factory Welcome.fromJson(Map<String, dynamic> json) =>
      Welcome(collection: Collection.fromJson(json["collection"]));

  Map<String, dynamic> toJson() => {"collection": collection.toJson()};
}

class Collection {
  Info info;
  List<CollectionItem> item;

  Collection({required this.info, required this.item});

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    info: Info.fromJson(json["info"]),
    item: List<CollectionItem>.from(
      json["item"].map((x) => CollectionItem.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "info": info.toJson(),
    "item": List<dynamic>.from(item.map((x) => x.toJson())),
  };
}

class Info {
  String postmanId;
  String name;
  String schema;
  DateTime updatedAt;
  DateTime createdAt;
  String lastUpdatedBy;
  String uid;

  Info({
    required this.postmanId,
    required this.name,
    required this.schema,
    required this.updatedAt,
    required this.createdAt,
    required this.lastUpdatedBy,
    required this.uid,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    postmanId: json["_postman_id"],
    name: json["name"],
    schema: json["schema"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    lastUpdatedBy: json["lastUpdatedBy"],
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "_postman_id": postmanId,
    "name": name,
    "schema": schema,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "lastUpdatedBy": lastUpdatedBy,
    "uid": uid,
  };
}

class CollectionItem {
  String name;
  List<ItemItem>? item;
  String id;
  String uid;
  ProtocolProfileBehavior? protocolProfileBehavior;
  FluffyRequest? request;
  List<dynamic>? response;

  CollectionItem({
    required this.name,
    this.item,
    required this.id,
    required this.uid,
    this.protocolProfileBehavior,
    this.request,
    this.response,
  });

  factory CollectionItem.fromJson(Map<String, dynamic> json) => CollectionItem(
    name: json["name"],
    item:
        json["item"] == null
            ? []
            : List<ItemItem>.from(
              json["item"]!.map((x) => ItemItem.fromJson(x)),
            ),
    id: json["id"],
    uid: json["uid"],
    protocolProfileBehavior:
        json["protocolProfileBehavior"] == null
            ? null
            : ProtocolProfileBehavior.fromJson(json["protocolProfileBehavior"]),
    request:
        json["request"] == null
            ? null
            : FluffyRequest.fromJson(json["request"]),
    response:
        json["response"] == null
            ? []
            : List<dynamic>.from(json["response"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "item":
        item == null ? [] : List<dynamic>.from(item!.map((x) => x.toJson())),
    "id": id,
    "uid": uid,
    "protocolProfileBehavior": protocolProfileBehavior?.toJson(),
    "request": request?.toJson(),
    "response":
        response == null ? [] : List<dynamic>.from(response!.map((x) => x)),
  };
}

class ItemItem {
  String name;
  String id;
  ProtocolProfileBehavior protocolProfileBehavior;
  PurpleRequest request;
  List<dynamic> response;
  String uid;

  ItemItem({
    required this.name,
    required this.id,
    required this.protocolProfileBehavior,
    required this.request,
    required this.response,
    required this.uid,
  });

  factory ItemItem.fromJson(Map<String, dynamic> json) => ItemItem(
    name: json["name"],
    id: json["id"],
    protocolProfileBehavior: ProtocolProfileBehavior.fromJson(
      json["protocolProfileBehavior"],
    ),
    request: PurpleRequest.fromJson(json["request"]),
    response: List<dynamic>.from(json["response"].map((x) => x)),
    uid: json["uid"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "protocolProfileBehavior": protocolProfileBehavior.toJson(),
    "request": request.toJson(),
    "response": List<dynamic>.from(response.map((x) => x)),
    "uid": uid,
  };
}

class ProtocolProfileBehavior {
  bool disableBodyPruning;

  ProtocolProfileBehavior({required this.disableBodyPruning});

  factory ProtocolProfileBehavior.fromJson(Map<String, dynamic> json) =>
      ProtocolProfileBehavior(disableBodyPruning: json["disableBodyPruning"]);

  Map<String, dynamic> toJson() => {"disableBodyPruning": disableBodyPruning};
}

class PurpleRequest {
  String method;
  List<Header> header;
  PurpleBody? body;
  Url? url;

  PurpleRequest({
    required this.method,
    required this.header,
    this.body,
    this.url,
  });

  factory PurpleRequest.fromJson(Map<String, dynamic> json) => PurpleRequest(
    method: json["method"],
    header: List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
    body: json["body"] == null ? null : PurpleBody.fromJson(json["body"]),
    url: json["url"] == null ? null : Url.fromJson(json["url"]),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "header": List<dynamic>.from(header.map((x) => x.toJson())),
    "body": body?.toJson(),
    "url": url?.toJson(),
  };
}

class PurpleBody {
  String mode;
  String? raw;
  Options? options;
  List<Header>? formdata;

  PurpleBody({required this.mode, this.raw, this.options, this.formdata});

  factory PurpleBody.fromJson(Map<String, dynamic> json) => PurpleBody(
    mode: json["mode"],
    raw: json["raw"],
    options: json["options"] == null ? null : Options.fromJson(json["options"]),
    formdata:
        json["formdata"] == null
            ? []
            : List<Header>.from(
              json["formdata"]!.map((x) => Header.fromJson(x)),
            ),
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "raw": raw,
    "options": options?.toJson(),
    "formdata":
        formdata == null
            ? []
            : List<dynamic>.from(formdata!.map((x) => x.toJson())),
  };
}

class Header {
  String key;
  String value;
  Type type;
  String? uuid;

  Header({
    required this.key,
    required this.value,
    required this.type,
    this.uuid,
  });

  factory Header.fromJson(Map<String, dynamic> json) => Header(
    key: json["key"],
    value: json["value"],
    type: typeValues.map[json["type"]]!,
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
    "type": typeValues.reverse[type],
    "uuid": uuid,
  };
}

enum Type { TEXT }

final typeValues = EnumValues({"text": Type.TEXT});

class Options {
  Raw raw;

  Options({required this.raw});

  factory Options.fromJson(Map<String, dynamic> json) =>
      Options(raw: Raw.fromJson(json["raw"]));

  Map<String, dynamic> toJson() => {"raw": raw.toJson()};
}

class Raw {
  String language;

  Raw({required this.language});

  factory Raw.fromJson(Map<String, dynamic> json) =>
      Raw(language: json["language"]);

  Map<String, dynamic> toJson() => {"language": language};
}

class Url {
  String raw;
  List<Host> host;
  List<String> path;

  Url({required this.raw, required this.host, required this.path});

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    raw: json["raw"],
    host: List<Host>.from(json["host"].map((x) => hostValues.map[x]!)),
    path: List<String>.from(json["path"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "host": List<dynamic>.from(host.map((x) => hostValues.reverse[x])),
    "path": List<dynamic>.from(path.map((x) => x)),
  };
}

enum Host { MY_MOBLIE_API }

final hostValues = EnumValues({"{{my-moblie}}api": Host.MY_MOBLIE_API});

class FluffyRequest {
  String method;
  List<Header> header;
  FluffyBody body;
  Url url;

  FluffyRequest({
    required this.method,
    required this.header,
    required this.body,
    required this.url,
  });

  factory FluffyRequest.fromJson(Map<String, dynamic> json) => FluffyRequest(
    method: json["method"],
    header: List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
    body: FluffyBody.fromJson(json["body"]),
    url: Url.fromJson(json["url"]),
  );

  Map<String, dynamic> toJson() => {
    "method": method,
    "header": List<dynamic>.from(header.map((x) => x.toJson())),
    "body": body.toJson(),
    "url": url.toJson(),
  };
}

class FluffyBody {
  String mode;
  List<Header> formdata;

  FluffyBody({required this.mode, required this.formdata});

  factory FluffyBody.fromJson(Map<String, dynamic> json) => FluffyBody(
    mode: json["mode"],
    formdata: List<Header>.from(
      json["formdata"].map((x) => Header.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "formdata": List<dynamic>.from(formdata.map((x) => x.toJson())),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
