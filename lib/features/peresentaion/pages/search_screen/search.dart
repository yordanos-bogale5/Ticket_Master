// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketMasterSearchScreen extends SearchDelegate<String> {
  List<String> _recentSearches = [];
  List<String> _autofillSuggestions = [];
  final TextEditingController _searchTextController = TextEditingController();

  TicketMasterSearchScreen() {
    _loadRecentSearches(); // Load recent searches when the widget initializes
  }

  Future<void> _loadRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Fetch recent searches from local storage
    List<String>? recentSearches = prefs.getStringList('recentSearches');

    if (recentSearches != null) {
      _recentSearches = recentSearches;
    }
  }

  Future<List<String>> _getAutofillSuggestions(String value) async {
    // Assuming suggestions are fetched from an external source or predefined list
    // For simplicity, using a predefined list of suggestions

    List<String> predefinedSuggestions = [
      'Concerts',
      'Sports Events',
      'Art Exhibitions',
      'Theatre Shows',
    ];

    // Filter suggestions based on the entered value
    _autofillSuggestions = predefinedSuggestions
        .where((suggestion) =>
            suggestion.toLowerCase().contains(value.toLowerCase()))
        .toList();

    return _autofillSuggestions;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          _searchTextController.clear();
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: Implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = _autofillSuggestions;

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            _searchTextController.text = suggestions[index];
            close(context, suggestions[index]);
          },
        );
      },
    );
  }

  @override
  void close(BuildContext context, String? result) {
    super.close(context, result!);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicketMaster Search'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchTextController,
            decoration: const InputDecoration(
              labelText: 'Search for events, venues, or artists',
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              _showAutofillSuggestions(context, value);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _recentSearches.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_recentSearches[index]),
                  onTap: () {
                    _searchTextController.text = _recentSearches[index];
                    close(context, _recentSearches[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAutofillSuggestions(BuildContext context, String value) async {
    List<String> suggestions = await _getAutofillSuggestions(value);

    // Use a separate method to pass suggestions
    showAutofillSuggestions(context, suggestions);
  }

  void showAutofillSuggestions(BuildContext context, List<String> suggestions) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AutofillSuggestionsPage(suggestions),
      ),
    );
  }
}

class AutofillSuggestionsPage extends StatelessWidget {
  final List<String> suggestions;

  const AutofillSuggestionsPage(this.suggestions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Autofill Suggestions'),
      ),
      body: ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(suggestions[index]),
            onTap: () {
              Navigator.of(context).pop(suggestions[index]);
            },
          );
        },
      ),
    );
  }
}
