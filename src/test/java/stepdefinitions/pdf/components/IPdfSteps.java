package stepdefinitions.pdf.components;

import framework.utilities.swipe.directions.EntireScreenDragDirection;

public interface IPdfSteps {
    void checkPdfBookPresent(String bookInfoKey);

    void checkPdfPageNumberIsEqualTo(int pageNumber);

    void goToPreviousPdfPage();

    void goToNextPdfPage();

    void checkEachChapterOfPdfBookCanBeOpenedFromTocPdfScreen();

    void savePdfPageNumber(String pageNumberKey);

    void swipePdfPageForwardSeveralTimes(int minValue, int maxValue);

    void slidePdfPageSlider(EntireScreenDragDirection entireScreenDragDirection);

    void checkPdfSavedPageNumberIsNotEqualsToCurrentPdfPageNumber(String pageNumberKey);

    void checkSavedPdfPageNumberIsEqualsToCurrentPdfPageNumber(String pageNumberKey);

    void openGalleryPdfScreen();

    void openRandomPdfPageAndSavePageNumberOnGalleryScreen(String pageNumberKey);

    void openSearchPdfScreen();

    void checkSearchPdfScreenIsOpened();

    void checkGalleryPdfScreenIsOpened();

    void searchTextOnSearchPdfScreen(String text);

    void checkThatPdfFoundLinesContainText(String textThatShouldBe);

    void openTheFirstFoundText();

    void savePageNumberOfTheFirstFoundText(String pageNumberKey);
}