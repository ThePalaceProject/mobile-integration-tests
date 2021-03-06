package screens.pdf.readerPdf;

import aquality.appium.mobile.screens.Screen;
import framework.utilities.swipe.directions.EntireScreenDragDirection;
import org.openqa.selenium.By;
import screens.pdf.navigationBarPdf.NavigationBarPdfScreen;
import screens.pdf.searchPdf.SearchPdfScreen;

public abstract class ReaderPdfScreen extends Screen {
    public ReaderPdfScreen(By locator) {
        super(locator, "ReaderPdf");
    }

    public abstract String getBookName();

    public abstract int getPageNumber();

    public abstract void goToNextPage();

    public abstract void goToPreviousPage();

    public abstract void openToc();

    public abstract void returnToPreviousScreen();

    public abstract void openNavigationBar();

    public abstract NavigationBarPdfScreen getNavigationBarScreen();

    public abstract SearchPdfScreen getSearchPdfScreen();

    public abstract void slidePageSlider(EntireScreenDragDirection entireScreenDragDirection);
}
