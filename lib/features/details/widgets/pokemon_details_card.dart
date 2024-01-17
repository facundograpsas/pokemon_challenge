import 'package:flutter/material.dart';
import 'package:pokemon_challenge/l10n/l10n.dart';
import 'package:pokemon_challenge/models/pokemon_details.dart';

class PokemonDetailsCard extends StatelessWidget {
  final PokemonDetails pokemon;

  const PokemonDetailsCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Image.network(
            pokemon.sprites?.frontDefault ?? '',
            width: 150,
            scale: 0.1,
          ),
        ),
        Text(
          pokemon.name!.toUpperCase() ?? '',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        _buildDetailCard(l10n.abilities, pokemon.abilities, l10n),
        _buildDetailCard(l10n.types, pokemon.types, l10n),
        _buildCharacteristicCard(l10n),
      ],
    );
  }

  Widget _buildDetailCard(
      String title, List<dynamic>? items, AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (title == l10n.abilities)
              for (var ability in items ?? [])
                Text(ability.ability?.name ?? ''),
            if (title == l10n.types)
              for (var type in items ?? []) Text(type.type?.name ?? ''),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacteristicCard(AppLocalizations l10n) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.characteristics,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('${l10n.height}: ${pokemon.height}'),
            Text('${l10n.weight}: ${pokemon.weight}'),
            Text('${l10n.species}: ${pokemon.species!.name}'),
          ],
        ),
      ),
    );
  }
}
