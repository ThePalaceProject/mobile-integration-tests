package screens.addaccount.ios;

import aquality.appium.mobile.actions.SwipeDirection;
import aquality.appium.mobile.application.AqualityServices;
import aquality.appium.mobile.application.PlatformName;
import aquality.appium.mobile.elements.interfaces.IButton;
import aquality.appium.mobile.screens.screenfactory.ScreenType;
import org.openqa.selenium.By;
import org.openqa.selenium.Point;
import screens.addaccount.AddAccountScreen;

@ScreenType(platform = PlatformName.IOS)
public class IosAddAccountScreen extends AddAccountScreen {
    private static final String MAIN_ELEMENT = "//XCUIElementTypeSheet[@name=\"Add Your Library\"]";
    private static final String LIBRARY_BUTTON_PATTERN_NOT_WELCOME_SCREEN = "//XCUIElementTypeButton[@name = \"%s\"]";
    private static final String LIBRARY_BUTTON_PATTERN_WELCOME_SCREEN = "//XCUIElementTypeButton/following-sibling::XCUIElementTypeStaticText[@name = \"%s\"]";

    public IosAddAccountScreen() {
        super(By.xpath(MAIN_ELEMENT));
    }

    @Override
    public void selectLibrary(String libraryName) {
        IButton libraryButton = getLibraryButton(libraryName, LIBRARY_BUTTON_PATTERN_NOT_WELCOME_SCREEN);
        int sch = 0;
        if (libraryName.toLowerCase().equals("LYRASIS".toLowerCase())) {
            while (sch < 8) {
                Point startPoint = new Point(10, 130);
                Point endPoint = new Point(10, 700);
                AqualityServices.getTouchActions().swipeWithLongPress(endPoint, startPoint);
                sch++;
            }
        } else if (libraryName.toLowerCase().equals("Digital Public Library of America".toLowerCase())) {
            while (sch < 4) {
                Point startPoint = new Point(10, 130);
                Point endPoint = new Point(10, 700);
                AqualityServices.getTouchActions().swipeWithLongPress(endPoint, startPoint);
                sch++;
            }
        }

        libraryButton.getTouchActions().scrollToElement(SwipeDirection.DOWN);
        libraryButton.state().waitForDisplayed();
        libraryButton.click();
    }

    @Override
    public void selectLibraryWelcomeScreen(String libraryName) {
        IButton libraryButton = getLibraryButton(libraryName, LIBRARY_BUTTON_PATTERN_WELCOME_SCREEN);
        int sch = 0;
        if (libraryName.toLowerCase().equals("Digital Public Library of America".toLowerCase())) {
            while (sch < 6) {
                Point startPoint = new Point(10, 50);
                Point endPoint = new Point(10, 910);
                AqualityServices.getTouchActions().swipeWithLongPress(endPoint, startPoint);
                sch++;
            }
        } else if (libraryName.toLowerCase().equals("LYRASIS".toLowerCase())) {
            while (sch < 11) {
                Point startPoint = new Point(10, 35);
                Point endPoint = new Point(10, 910);
                AqualityServices.getTouchActions().swipeWithLongPress(endPoint, startPoint);
                sch++;
            }
        }

        libraryButton.getTouchActions().scrollToElement(SwipeDirection.DOWN);
        libraryButton.state().waitForDisplayed();
        libraryButton.click();
    }

    private IButton getLibraryButton(String libraryName, String libraryButtonPattern) {
        return getElementFactory().getButton(By.xpath(String.format(libraryButtonPattern, libraryName)), libraryName);
    }
}
