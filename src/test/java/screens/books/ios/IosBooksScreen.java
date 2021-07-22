package screens.books.ios;

import aquality.appium.mobile.actions.SwipeDirection;
import aquality.appium.mobile.application.PlatformName;
import aquality.appium.mobile.elements.ElementType;
import aquality.appium.mobile.elements.interfaces.IButton;
import aquality.appium.mobile.elements.interfaces.IElement;
import aquality.appium.mobile.elements.interfaces.ILabel;
import aquality.appium.mobile.screens.screenfactory.ScreenType;
import aquality.selenium.core.elements.ElementState;
import aquality.selenium.core.elements.ElementsCount;
import constants.localization.application.catalog.BookActionButtonKeys;
import framework.utilities.swipe.SwipeElementUtils;
import models.android.CatalogBookModel;
import org.openqa.selenium.By;
import screens.books.BooksScreen;

import java.util.List;

@ScreenType(platform = PlatformName.IOS)
public class IosBooksScreen extends BooksScreen {

    private static final String MAIN_ELEMENT_LOC = "//XCUIElementTypeButton[@name=\"All\"]";
    private static final String BOOK_ACTION_BUTTON_LOCATOR = "//XCUIElementTypeButton[contains(@name,\"%1$s\")]";
    private static final String BOOK_INFO_LOCATOR_PATTERN = "//XCUIElementTypeStaticText[contains(@name,\"%1$s\")]";
    private static final String BOOK_ITEM_LOCATOR_PATTERN = "//XCUIElementTypeCollectionView//XCUIElementTypeCell[.%1$s]";

    private static final String BOOKS_WITH_ACTION_LOC = String.format(BOOK_ITEM_LOCATOR_PATTERN, BOOK_ACTION_BUTTON_LOCATOR);
    private static final String BOOKS_BY_TITLE_LOC = String.format(BOOK_ITEM_LOCATOR_PATTERN, BOOK_INFO_LOCATOR_PATTERN);
    private static final String BOOKS_LABELS_XPATH = "//XCUIElementTypeCollectionView//XCUIElementTypeCell";
    private static final String ACTION_BUTTON_XPATH_LOCATOR = "//XCUIElementTypeCell//XCUIElementTypeButton";

    private final ILabel mainBooksElementCollection = getElementFactory().getLabel(
            By.xpath("//XCUIElementTypeCollectionView"), "Elements collection container");
    private final ILabel lblNoBooks =
            getElementFactory().getLabel(By.xpath("//XCUIElementTypeStaticText[contains(@name,'Visit the Catalog')]"), "No Books Present");
    private final ILabel lblScreen = getElementFactory().getLabel(By.xpath("//XCUIElementTypeCollectionView"), "Screen");

    public IosBooksScreen() {
        super(By.xpath(MAIN_ELEMENT_LOC));
    }

    @Override
    public boolean isNoBooksMessagePresent() {
        return lblNoBooks.state().waitForDisplayed();
    }

    @Override
    public boolean isBookPresent(CatalogBookModel bookInfo) {
        ILabel book = getElementFactory()
                .getLabel(By.xpath(String.format(BOOK_INFO_LOCATOR_PATTERN, bookInfo.getTitle())),
                        "No Books Present");
        book.getTouchActions().scrollToElement(SwipeDirection.DOWN);
        return book.state().isDisplayed();
    }

    @Override
    public int getCountOfBooks() {
        return getBooks().size();
    }

    @Override
    public void refreshList() {
        SwipeElementUtils.swipeElementDown(mainBooksElementCollection);
    }

    @Override
    public void readBook(CatalogBookModel bookInfo) {
        String readButtonName = BookActionButtonKeys.READ.i18n();
        IButton btnBookName =
                getElementFactory().getButton(By.xpath(String.format(BOOKS_BY_TITLE_LOC, bookInfo.getTitle())), "The book " + bookInfo.getTitle());
        btnBookName.state().waitForDisplayed();
        btnBookName.findChildElement(By.xpath(String.format(BOOK_ACTION_BUTTON_LOCATOR, readButtonName)), ElementType.BUTTON).click();
    }

    private List<IElement> getBooks() {
        return getElementFactory().findElements(By.xpath(BOOKS_LABELS_XPATH), ElementType.LABEL, ElementsCount.ANY, ElementState.EXISTS_IN_ANY_STATE);
    }
}
