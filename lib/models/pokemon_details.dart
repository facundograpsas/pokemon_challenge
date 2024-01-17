class PokemonDetails {
  int? id;
  String? name;
  int? height;
  int? weight;
  List<Abilities>? abilities;
  Ability? species;
  Sprites? sprites;
  List<Types>? types;
  List<PastTypes>? pastTypes;

  PokemonDetails(
      {this.id,
      this.name,
      this.height,
      this.weight,
      this.abilities,
      this.species,
      this.sprites,
      this.types,
      this.pastTypes});

  PokemonDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    height = json['height'];
    weight = json['weight'];
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(new Abilities.fromJson(v));
      });
    }
    species =
        json['species'] != null ? new Ability.fromJson(json['species']) : null;
    sprites =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
    if (json['past_types'] != null) {
      pastTypes = <PastTypes>[];
      json['past_types'].forEach((v) {
        pastTypes!.add(new PastTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['height'] = this.height;
    data['weight'] = this.weight;
    if (this.abilities != null) {
      data['abilities'] = this.abilities!.map((v) => v.toJson()).toList();
    }
    if (this.species != null) {
      data['species'] = this.species!.toJson();
    }
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    if (this.pastTypes != null) {
      data['past_types'] = this.pastTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Abilities {
  bool? isHidden;
  int? slot;
  Ability? ability;

  Abilities({this.isHidden, this.slot, this.ability});

  Abilities.fromJson(Map<String, dynamic> json) {
    isHidden = json['is_hidden'];
    slot = json['slot'];
    ability =
        json['ability'] != null ? new Ability.fromJson(json['ability']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_hidden'] = this.isHidden;
    data['slot'] = this.slot;
    if (this.ability != null) {
      data['ability'] = this.ability!.toJson();
    }
    return data;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Sprites {
  String? backDefault;
  String? frontDefault;

  Sprites({this.backDefault, this.frontDefault});

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    frontDefault = json['front_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['back_default'] = this.backDefault;
    data['front_default'] = this.frontDefault;
    return data;
  }
}

class Types {
  int? slot;
  Ability? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? new Ability.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    return data;
  }
}

class PastTypes {
  Ability? generation;
  List<Types>? types;

  PastTypes({this.generation, this.types});

  PastTypes.fromJson(Map<String, dynamic> json) {
    generation = json['generation'] != null
        ? new Ability.fromJson(json['generation'])
        : null;
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(new Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.generation != null) {
      data['generation'] = this.generation!.toJson();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
