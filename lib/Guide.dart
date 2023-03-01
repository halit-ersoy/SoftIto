class Guide {
  static void GuideRun(List<String> number, String numberCode) {
    int counter = 0;
    for (String singleNumber in number) {
      singleNumber = singleNumber.split(' ')[0];
      if (singleNumber == numberCode) {
        counter++;
      }
    }
    print("area code: ${counter}");
  }
}
