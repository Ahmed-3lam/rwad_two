class OnboardingModel {
  String? title;
  String? description;
  String? image;
  String? next;
  OnboardingModel({
    this.image,
    this.description,
    this.title,
    this.next,
  });
}

List<OnboardingModel> onBoardingList = [
  OnboardingModel(
    title: "Welcome",
    description: "description1",
    image: "onboarding1.png",
    next: "next1.png",
  ),
  OnboardingModel(
    title: "Welcome",
    description: "description1",
    image: "onboarding2.png",
    next: "next2.png",
  ),
  OnboardingModel(
    title: "Welcome",
    description: "description1",
    image: "onboarding3.png",
    next: "next3.png",
  ),
];
