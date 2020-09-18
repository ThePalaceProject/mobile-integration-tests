package framework.utilities.swipe;

import aquality.appium.mobile.elements.interfaces.IElement;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;

public final class SwipeElementUtils {
    private SwipeElementUtils() {

    }

    public static void swipeElementLeft(IElement element) {
        Point upperLeft = element.getElement().getLocation();
        Dimension dimensions = element.getElement().getSize();
        element.getTouchActions().swipe(new Point(upperLeft.x, upperLeft.y + dimensions.height / 2));
    }

    public static void swipeElementDown(IElement element) {
        Point upperLeft = element.getElement().getLocation();
        Dimension dimensions = element.getElement().getSize();
        element.getTouchActions().swipe(new Point(upperLeft.x + dimensions.width / 2, upperLeft.y + dimensions.height));
    }

    public static void swipeElementUp(IElement element) {
        Point upperLeft = element.getElement().getLocation();
        Point center = element.getElement().getCenter();
        Dimension dimensions = element.getElement().getSize();
        element.getTouchActions().swipe(new Point(center.x, upperLeft.y));
    }
}
