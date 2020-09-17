package screens.reader.android;

import aquality.appium.mobile.application.AqualityServices;
import aquality.appium.mobile.application.PlatformName;
import aquality.appium.mobile.elements.interfaces.ILabel;
import aquality.appium.mobile.screens.screenfactory.ScreenType;
import framework.utilities.swipe.SwipeElementUtils;
import io.appium.java_client.TouchAction;
import io.appium.java_client.touch.offset.PointOption;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;
import screens.reader.ReaderScreen;

@ScreenType(platform = PlatformName.ANDROID)
public class AndroidReaderScreen extends ReaderScreen {
    private final ILabel lblBookName =
            getElementFactory().getLabel(By.xpath("//android.widget.TextView[@resource-id=\"org.nypl.simplified.simplye:id/reader_title_text\"]"), "Book Cover");
    private final ILabel lblPageNumber =
            getElementFactory().getLabel(By.xpath("//android.widget.TextView[@resource-id=\"org.nypl.simplified.simplye:id/reader_position_text\"]"), "Page Number Info");
    private final ILabel lblPage =
            getElementFactory().getLabel(By.xpath("//android.webkit.WebView"), "Page View");

    public AndroidReaderScreen() {
        super(By.id("//android.view.View[@resource-id=\"reflowable-book-frame\"]"));
    }

    @Override
    public String getBookName() {
        String text = lblBookName.getText();
        AqualityServices.getLogger().info("Book name - " + text);
        return text;
    }

    @Override
    public void swipeFromLeftToRight() {
        SwipeElementUtils.swipeFromLeftToRight(lblPage);
    }

    @Override
    public void swipeFromRightToLeft() {
        SwipeElementUtils.swipeFromRightToLeft(lblPage);
    }

    @Override
    public void clickLeftCorner() {
        TouchAction action = new TouchAction(AqualityServices.getApplication().getDriver());
        action.tap(PointOption.point(0, lblPage.getElement().getCenter().y)).perform();
    }

    @Override
    public void clickRightCorner() {
        TouchAction action = new TouchAction(AqualityServices.getApplication().getDriver());
        Point upperLeftCorner = lblPage.getElement().getLocation();
        Point center = lblPage.getElement().getCenter();
        Dimension dimensions = lblPage.getElement().getSize();
        action.tap(PointOption.point(upperLeftCorner.x + dimensions.width - 1, center.y)).perform();
    }

    @Override
    public String getPageNumberInfo() {
        return lblPageNumber.getText();
    }
}
