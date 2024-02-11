import 'package:equatable/equatable.dart';

class Portfolio extends Equatable {
  final String? title;
  final String? description;
  final Map<String, String>? redirectionUrls;
  final Map<String, String>? highlights;
  final List<String>? screenshots;
  final String? projectStructureTitle;
  final String? projectStructureText;
  final String? myJourneyTitle;
  final String? myJourneyText;

  const Portfolio({
    required this.title,
    required this.description,
    required this.redirectionUrls,
    required this.highlights,
    required this.screenshots,
    required this.projectStructureTitle,
    required this.projectStructureText,
    required this.myJourneyTitle,
    required this.myJourneyText,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        redirectionUrls,
        highlights,
        screenshots,
        projectStructureTitle,
        projectStructureText,
        myJourneyTitle,
        myJourneyText,
      ];
}
