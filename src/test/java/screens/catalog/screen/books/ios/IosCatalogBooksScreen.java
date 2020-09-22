package screens.catalog.screen.books.ios;

import aquality.appium.mobile.actions.SwipeDirection;
import aquality.appium.mobile.application.PlatformName;
import aquality.appium.mobile.elements.ElementType;
import aquality.appium.mobile.elements.interfaces.IButton;
import aquality.appium.mobile.elements.interfaces.IElement;
import aquality.appium.mobile.elements.interfaces.ILabel;
import aquality.appium.mobile.screens.screenfactory.ScreenType;
import constants.localization.application.catalog.BookActionButtonKeys;
import constants.application.timeouts.BooksTimeouts;
import models.android.CatalogBookModel;
import org.openqa.selenium.By;
import screens.catalog.screen.books.CatalogBooksScreen;

import java.time.Duration;
import java.util.List;
import java.util.Objects;

@ScreenType(platform = PlatformName.IOS)
public class IosCatalogBooksScreen extends CatalogBooksScreen {
    private static final String MAIN_ELEMENT = "//XCUIElementTypeCollectionView";

    private static final String ADD_BOOK_BUTTON_PATTERN = "//XCUIElementTypeStaticText[@name=\"%1$s\"]";
    private static final String BOOKS_LOC = ".//XCUIElementTypeCell";
    private static final String BOOK_BLOCK_BY_TITLE_LOC = "//XCUIElementTypeCell"
            + "[.//XCUIElementTypeStaticText[@name=\"%1$s\"]]";
    private static final String BOOK_BLOCK_BY_BUTTON_LOC = "//XCUIElementTypeCell[.//XCUIElementTypeButton[@name=\"%1$s\"]]";

    private static final String BOOK_IMAGE_LOC = "//XCUIElementTypeImage";
    private static final String BOOK_TITLE_LOC = "//XCUIElementTypeStaticText[@name][1]";
    private static final String BOOK_AUTHOR_LOC = "//XCUIElementTypeStaticText[@name][2]";
    private static final String BOOK_TYPE_LOC = ""; // does not exist on ios
    private static final String BOOK_ADD_BUTTON_LOC = "//XCUIElementTypeStaticText[@name=\"%1$s\"]";

    private static final String BTN_APPROVE_BOOK_ACTION = "//XCUIElementTypeScrollView[.//XCUIElementTypeStaticText[@name=\"%1$s\"]]"
            + "/following-sibling::XCUIElementTypeScrollView//XCUIElementTypeButton[@name=\"%1$s\"]";

    private final IButton btnDontAllowNotifications = getElementFactory().getButton(By.xpath("//XCUIElementTypeButton[@name=\"Don’t Allow\"]"),
            "Dont allow notifications");
    private final ILabel lblFirstFoundBook = getElementFactory().getLabel(
            By.xpath(BOOKS_LOC), "First found book");
    private final IButton btnOkCannotAddBook = getElementFactory().getButton(
            By.xpath("//XCUIElementTypeScrollView[.//XCUIElementTypeStaticText[@name=\"Borrowing failed\"]]"
                    + "/following-sibling::XCUIElementTypeScrollView//XCUIElementTypeButton[@name=\"OK\"]"),
            "Button ok");


    public IosCatalogBooksScreen() {
        super(By.xpath(MAIN_ELEMENT));
    }

    @Override
    public CatalogBookModel selectFirstFoundBook() {
        CatalogBookModel catalogBookModel = getBookModel(BOOKS_LOC);
        lblFirstFoundBook.click();
        return catalogBookModel;
    }

    private List<ILabel> getFoundBooks() {
        return getElementFactory().findElements(By.xpath(BOOKS_LOC), ElementType.LABEL);
    }

    @Override
    public int getFoundBooksCount() {
        return getFoundBooks().size();
    }

    @Override
    public CatalogBookModel getBookInfo(final String title) {
        final String blockLoc = String.format(BOOK_BLOCK_BY_TITLE_LOC, title);
        return getBookModel(blockLoc);
    }

    private CatalogBookModel getBookModel(String mainLocator) {
        return new CatalogBookModel()
                .setTitle(getBookParameter(mainLocator, BOOK_TITLE_LOC, "Book title"))
                .setAuthor(getBookParameter(mainLocator, BOOK_AUTHOR_LOC, "Book author"));
    }

    private String getBookParameter(String mainLocator, String subLocator, String name) {
        return Objects.requireNonNull(
                getElementFactory().getLabel(By.xpath(mainLocator + subLocator), name)
                        .getText());
    }


    @Override
    public CatalogBookModel scrollToTheBookAndClickAddButton(BookActionButtonKeys bookAddButtonKey) {
        return performActionOnBook(bookAddButtonKey);
    }

    @Override
    public void clickTheBookByTitleBtnWithKey(String title, BookActionButtonKeys key) {
        final String blockLoc = String.format(BOOK_BLOCK_BY_TITLE_LOC, title);
        final IButton bookAddBtn = getElementFactory().getButton(
                By.xpath(blockLoc + String.format(BOOK_ADD_BUTTON_LOC,
                        key.i18n())), String.format("Book %1$s button", key.i18n()));
        clickOnTheSpecificBookElement(bookAddBtn);

        if (btnDontAllowNotifications.state().waitForDisplayed()) {
            btnDontAllowNotifications.click();
        }
    }

    @Override
    public void openBookDetailsWithAction(BookActionButtonKeys action) {
        clickOnTheSpecificBookElement(getBookJacketWithGivenButtonLabel(action));
    }

    @Override
    public boolean isBookAddButtonTextEqualTo(String bookTitle, BookActionButtonKeys key) {
        final String blockLoc = String.format(BOOK_BLOCK_BY_TITLE_LOC, bookTitle);
        final IButton bookAddBtn = getElementFactory().getButton(
                By.xpath(blockLoc + String.format(BOOK_ADD_BUTTON_LOC, key.i18n())),
                String.format("Book %1$s button", key.i18n()));
        return bookAddBtn.state().waitForDisplayed(
                Duration.ofMillis(BooksTimeouts.TIMEOUT_BOOK_CHANGES_STATUS.getTimeoutMillis()));
    }

    @Override
    public CatalogBookModel scrollToTheBookAndClickAddButton(BookActionButtonKeys actionButtonKey, String bookType) {
        String key = actionButtonKey.i18n();
        IButton button = getElementFactory().getButton(By.xpath(getBookAddButtonLocatorWithGivenType(actionButtonKey, bookType)), key);
        button.getTouchActions().scrollToElement(SwipeDirection.DOWN);

        String bookTitle =
                getElementFactory().getButton(By.xpath(getBookAddButtonLocatorWithGivenType(actionButtonKey, bookType)), key).getText();
        CatalogBookModel androidCatalogBookModel = getBookInfo(bookTitle);
        button.click();
        return androidCatalogBookModel;
    }

    private CatalogBookModel performActionOnBook(BookActionButtonKeys buttonName) {
        IButton button = getAddBookButton(buttonName);
        button.getTouchActions().scrollToElement(SwipeDirection.DOWN);
        String bookTitle =
                getBookJacketWithGivenButtonLabel(buttonName).findChildElement(By.xpath(BOOK_TITLE_LOC), ElementType.LABEL).getText();
        CatalogBookModel catalogBookModel = getBookInfo(bookTitle);
        button.click();

        if (btnDontAllowNotifications.state().waitForDisplayed()) {
            btnDontAllowNotifications.click();
        }
        if (btnOkCannotAddBook.state().isDisplayed()) {
            btnOkCannotAddBook.click();
        }

        IButton btnApproveAction = getElementFactory().getButton(By.xpath(String.format(BTN_APPROVE_BOOK_ACTION, buttonName.i18n())), buttonName.i18n());
        if (btnApproveAction.state().isDisplayed()) {
            btnApproveAction.click();
        }
        return catalogBookModel;
    }

    private ILabel getBookJacketWithGivenButtonLabel(BookActionButtonKeys button) {
        String key = button.i18n();
        return getElementFactory().getLabel(By.xpath(String.format(BOOK_BLOCK_BY_BUTTON_LOC, key)),
                "Book jacket with btn " + key);
    }

    private void clickOnTheSpecificBookElement(IElement bookWithSpecificAddBtn) {
        bookWithSpecificAddBtn.getTouchActions().scrollToElement(SwipeDirection.DOWN);
        bookWithSpecificAddBtn.click();
    }

    private String getBookAddButtonLocatorWithGivenType(BookActionButtonKeys actionButtonKey, String bookType) {
        String key = actionButtonKey.i18n();
        return String.format("", bookType, key);
    }

    private IButton getAddBookButton(BookActionButtonKeys button) {
        String key = button.i18n();
        return getElementFactory().getButton(By.xpath(String.format(ADD_BOOK_BUTTON_PATTERN, key)), key);
    }
}
