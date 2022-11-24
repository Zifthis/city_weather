// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "city_weather": MessageLookupByLibrary.simpleMessage("City Weather"),
        "dio_error": MessageLookupByLibrary.simpleMessage("Dio Error"),
        "error_search": MessageLookupByLibrary.simpleMessage(
            "Search and add your locations to the list"),
        "location_list":
            MessageLookupByLibrary.simpleMessage("Saved Locations"),
        "search_city": MessageLookupByLibrary.simpleMessage("Search City"),
        "server_error": MessageLookupByLibrary.simpleMessage("Server Error"),
        "server_error_description":
            MessageLookupByLibrary.simpleMessage("Something went wrong!"),
        "weather_screen": MessageLookupByLibrary.simpleMessage("Weather Screen")
      };
}
