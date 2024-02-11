import 'package:personal_website/app/portfolio/domain/entities/portfolio.dart';

class PortfolioModel extends Portfolio {
  const PortfolioModel(
      {required super.title,
      required super.description,
      required super.redirectionUrls,
      required super.highlights,
      required super.screenshots,
      required super.projectStructureTitle,
      required super.projectStructureText,
      required super.myJourneyTitle,
      required super.myJourneyText});
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
