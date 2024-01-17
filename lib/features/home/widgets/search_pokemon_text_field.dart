import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/features/home/bloc/home_bloc.dart';
import 'package:pokemon_challenge/features/home/bloc/home_events.dart';
import 'package:pokemon_challenge/l10n/l10n.dart';

class SearchPokemonTextField extends StatelessWidget {
  const SearchPokemonTextField({
    super.key,
    required TextEditingController searchController,
    required this.l10n,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: l10n.searchTextFieldPlaceholder,
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              context.read<HomePageBloc>().add(SearchPokemonEvent(''));
              _searchController.clear();
            },
          ),
        ),
        onChanged: (value) {
          context.read<HomePageBloc>().add(SearchPokemonEvent(value));
        },
      ),
    );
  }
}
