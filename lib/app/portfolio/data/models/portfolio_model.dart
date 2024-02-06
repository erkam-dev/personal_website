import 'package:equatable/equatable.dart';

class PortfolioModel extends Equatable {
  final String? title;
  final String? description;
  final Map<String, String>? redirectionUrls;
  final Map<String, String>? highlights;
  final List<String>? screenshots;
  final String? projectStructureTitle;
  final String? projectStructureText;
  final String? myJourneyTitle;
  final String? myJourneyText;

  const PortfolioModel({
    this.title,
    this.description,
    this.redirectionUrls,
    this.highlights,
    this.screenshots,
    this.projectStructureTitle,
    this.projectStructureText,
    this.myJourneyTitle,
    this.myJourneyText,
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
  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      title: json['title'],
      description: json['description'],
      redirectionUrls: json['redirection_urls'],
      highlights: json['highlights'],
      screenshots: json['screenshots'],
      projectStructureTitle: json['project_structure_title'],
      projectStructureText: json['project_structure_text'],
      myJourneyTitle: json['my_journey_title'],
      myJourneyText: json['my_journey_text'],
    );
  }
}
