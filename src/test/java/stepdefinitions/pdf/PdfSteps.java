package stepdefinitions.pdf;

import com.google.inject.Inject;
import framework.utilities.ScenarioContext;
import framework.utilities.swipe.directions.EntireScreenDragDirection;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import stepdefinitions.BaseSteps;
import stepdefinitions.pdf.components.AbstractPdfSteps;
import stepdefinitions.pdf.components.IPdfSteps;

public class PdfSteps extends BaseSteps implements IPdfSteps {
    private final AbstractPdfSteps abstractPdfSteps;

    @Inject
    public PdfSteps(ScenarioContext context) {
        this.abstractPdfSteps = stepsFactory.getSteps(AbstractPdfSteps.class, context);
    }

    @Then("{string} book is present on reader pdf screen")
    @Override
    public void checkPdfBookPresent(String bookInfoKey) {
        abstractPdfSteps.checkPdfBookPresent(bookInfoKey);
    }

    @Then("Pdf page number is {int} on reader pdf screen")
    @Override
    public void checkPdfPageNumberIsEqualTo(int pageNumber) {
        abstractPdfSteps.checkPdfPageNumberIsEqualTo(pageNumber);
    }

    @When("I go to previous page on reader pdf screen")
    @Override
    public void goToPreviousPdfPage() {
        abstractPdfSteps.goToPreviousPdfPage();
    }

    @When("I go to next page on reader pdf screen")
    @Override
    public void goToNextPdfPage() {
        abstractPdfSteps.goToNextPdfPage();
    }

    @And("Each chapter of pdf book can be opened from toc pdf screen")
    @Override
    public void checkEachChapterOfPdfBookCanBeOpenedFromTocPdfScreen() {
        abstractPdfSteps.checkEachChapterOfPdfBookCanBeOpenedFromTocPdfScreen();
    }

    @And("I save pdf page number as {string} on reader pdf screen")
    @Override
    public void savePdfPageNumber(String pageNumberKey) {
        abstractPdfSteps.savePdfPageNumber(pageNumberKey);
    }

    @When("I swipe pdf page forward from {int} to {int} times on reader pdf screen")
    @Override
    public void swipePdfPageForwardSeveralTimes(int minValue, int maxValue) {
        abstractPdfSteps.swipePdfPageForwardSeveralTimes(minValue, maxValue);
    }

    @And("Slide page slider {} on reader pdf screen")
    @Override
    public void slidePdfPageSlider(EntireScreenDragDirection entireScreenDragDirection) {
        abstractPdfSteps.slidePdfPageSlider(entireScreenDragDirection);
    }

    @Then("{string} pdf saved page number should not be equal to current page number on reader pdf screen")
    @Override
    public void checkPdfSavedPageNumberIsNotEqualsToCurrentPdfPageNumber(String pageNumberKey) {
        abstractPdfSteps.checkPdfSavedPageNumberIsNotEqualsToCurrentPdfPageNumber(pageNumberKey);
    }

    @Then("{string} pdf saved page number should be equal to current page number on reader pdf screen")
    @Override
    public void checkSavedPdfPageNumberIsEqualsToCurrentPdfPageNumber(String pageNumberKey) {
        abstractPdfSteps.checkSavedPdfPageNumberIsEqualsToCurrentPdfPageNumber(pageNumberKey);
    }

    @When("I open gallery pdf screen")
    @Override
    public void openGalleryPdfScreen() {
        abstractPdfSteps.openGalleryPdfScreen();
    }

    @When("I open random pdf page on gallery pdf screen and save pdf page number as {string}")
    @Override
    public void openRandomPdfPageAndSavePageNumberOnGalleryScreen(String pageNumberKey) {
        abstractPdfSteps.openRandomPdfPageAndSavePageNumberOnGalleryScreen(pageNumberKey);
    }

    @When("I open search pdf screen")
    @Override
    public void openSearchPdfScreen() {
        abstractPdfSteps.openSearchPdfScreen();
    }

    @Then("Search pdf screen is opened")
    @Override
    public void checkSearchPdfScreenIsOpened() {
        abstractPdfSteps.checkSearchPdfScreenIsOpened();
    }

    @Then("Gallery pdf screen is opened")
    @Override
    public void checkGalleryPdfScreenIsOpened() {
        abstractPdfSteps.checkGalleryPdfScreenIsOpened();
    }

    @When("I search {string} text on search pdf screen")
    @Override
    public void searchTextOnSearchPdfScreen(String text) {
        abstractPdfSteps.searchTextOnSearchPdfScreen(text);
    }

    @Then("Found lines should contain {string} in themselves on search pdf screen")
    @Override
    public void checkThatPdfFoundLinesContainText(String textThatShouldBe) {
        abstractPdfSteps.checkThatPdfFoundLinesContainText(textThatShouldBe);
    }

    @When("I open the first found text on search pdf screen")
    @Override
    public void openTheFirstFoundText() {
        abstractPdfSteps.openTheFirstFoundText();
    }

    @When("I save page number as {string} of the first found text on search pdf screen")
    @Override
    public void savePageNumberOfTheFirstFoundText(String pageNumberKey) {
        abstractPdfSteps.savePageNumberOfTheFirstFoundText(pageNumberKey);
    }
}