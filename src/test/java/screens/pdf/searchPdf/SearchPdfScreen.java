package screens.pdf.searchPdf;

import aquality.appium.mobile.screens.Screen;
import org.openqa.selenium.By;

import java.util.List;

public abstract class SearchPdfScreen extends Screen {
    public SearchPdfScreen(By locator) {
        super(locator, "Pdf search");
    }

    public abstract void findTextInDocument(String text);

    public abstract List<String> getListOfFoundTexts();

    public abstract void openTheFirstFoundText();

    public abstract int getNumberOfTheFirstFoundText();
}
