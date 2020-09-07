package screens.bookDetails;

import aquality.appium.mobile.actions.SwipeDirection;
import aquality.appium.mobile.application.PlatformName;
import aquality.appium.mobile.elements.interfaces.IButton;
import aquality.appium.mobile.elements.interfaces.ILabel;
import aquality.appium.mobile.screens.screenfactory.ScreenType;
import constants.android.AndroidBookDetailsScreenInformationBlockKeys;
import constants.android.catalog.AndroidBookAddButtonKeys;
import org.openqa.selenium.By;

@ScreenType(platform = PlatformName.ANDROID)
public class AndroidBookDetailsScreen extends BookDetailsScreen {
    private static final String INFORMATION_TAB_LABELS_NAME_PART = "Information tab %1$s value";

    private static final String CONTENT_ATTRIBUTE_NAME = "content-desc";
    private static final String INFORMATION_TAB_VALUE_LOC_PART = "//*[@resource-id=\"org.nypl.simplified.simplye:id/key\" "
            + "and @text=\"%1$s\"]/following-sibling::*[@resource-id=\"org.nypl.simplified.simplye:id/value\"]";
    private static final String BOOK_ADD_BUTTON_LOC = "//android.widget.Button[@content-desc=\"%1$s\"]";

    private final IButton btnDownload =
            getElementFactory().getButton(
                    By.xpath(String.format(BOOK_ADD_BUTTON_LOC, AndroidBookAddButtonKeys.DOWNLOAD.getKey())),
                    AndroidBookAddButtonKeys.DOWNLOAD.getKey());
    private final IButton btnRead =
            getElementFactory().getButton(
                    By.xpath(String.format(BOOK_ADD_BUTTON_LOC, AndroidBookAddButtonKeys.READ.getKey())),
                    AndroidBookAddButtonKeys.READ.getKey());
    private final IButton btnReserve =
            getElementFactory().getButton(
                    By.xpath(String.format(BOOK_ADD_BUTTON_LOC, AndroidBookAddButtonKeys.RESERVE.getKey())),
                    AndroidBookAddButtonKeys.RESERVE.getKey());
    private final IButton btnCancel =
            getElementFactory().getButton(
                    By.xpath(String.format(BOOK_ADD_BUTTON_LOC, AndroidBookAddButtonKeys.CANCEL.getKey())),
                    AndroidBookAddButtonKeys.CANCEL.getKey());
    private final ILabel lblBookInfo = getElementFactory().getLabel(By.id("bookDetailCoverImage"), "Cover Image");
    private final ILabel lblBookDescription = getElementFactory().getLabel(
            By.xpath("//*[@resource-id=\"org.nypl.simplified.simplye:id/bookDetailDescriptionText\"]"),
            "Description");
    private final IButton btnRelatedBooks = getElementFactory().getButton(
            By.xpath("//*[@resource-id=\"org.nypl.simplified.simplye:id/bookDetailRelated\"]"),
            "Related books button");

    public AndroidBookDetailsScreen() {
        super(By.id("bookDetailCover"));
    }

    @Override
    public void downloadBook() {
        btnDownload.click();
        btnRead.state().waitForDisplayed();
    }

    @Override
    public void reserveBook() {
        btnReserve.click();
    }

    @Override
    public String getBookInfo() {
        return lblBookInfo.getAttribute(CONTENT_ATTRIBUTE_NAME);
    }

    @Override
    public boolean isValueInTheInformationBlockPresent(AndroidBookDetailsScreenInformationBlockKeys key, String value) {
        ILabel lblInformationBlockValue = getElementFactory()
                .getLabel(By.xpath(String.format(INFORMATION_TAB_VALUE_LOC_PART, key.getKey())),
                        String.format(INFORMATION_TAB_LABELS_NAME_PART, key.getKey()));
        lblInformationBlockValue.getTouchActions().scrollToElement(SwipeDirection.DOWN);
        return lblInformationBlockValue.state()
                .waitForDisplayed();
    }

    @Override
    public boolean isDescriptionPresent() {
        return lblBookDescription.state().waitForDisplayed();
    }

    @Override
    public String getDescriptionText() {
        return lblBookDescription.getText();
    }

    @Override
    public void clickRelatedBooks() {
        btnRelatedBooks.click();
    }

    @Override
    public boolean isBookAddButtonTextEqualTo(String bookTitle, AndroidBookAddButtonKeys key) {
        final IButton bookAddBtn = getElementFactory().getButton(
                By.xpath(String.format(BOOK_ADD_BUTTON_LOC, key.getKey())),
                String.format("Book %1$s button", key.getKey()));
        return bookAddBtn.state().waitForDisplayed();
    }
}
