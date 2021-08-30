package screens.holds;

import aquality.appium.mobile.screens.Screen;
import constants.localization.application.catalog.EnumActionButtonsForBooksAndAlertsKeys;
import org.openqa.selenium.By;

public abstract class HoldsScreen extends Screen {
    protected HoldsScreen(By locator) {
        super(locator, "Holds");
    }

    public abstract boolean isNoBooksMessagePresent();

    public abstract boolean isBookPresent(String bookTitle);

    public abstract boolean isBookNotPresent(String bookInfo);

    public abstract void performActionOnBook(String title, EnumActionButtonsForBooksAndAlertsKeys key);

    public abstract boolean isActionButtonPresentOnBook(String bookTitle, EnumActionButtonsForBooksAndAlertsKeys key);
}
