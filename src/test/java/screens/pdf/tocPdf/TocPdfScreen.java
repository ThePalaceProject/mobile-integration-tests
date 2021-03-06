package screens.pdf.tocPdf;

import aquality.appium.mobile.screens.Screen;
import org.openqa.selenium.By;

import java.util.List;

public abstract class TocPdfScreen extends Screen {
    public TocPdfScreen(By locator) {
        super(locator, "TocPdf");
    }

    public abstract List<String> getListOfBookChapters();

    public abstract void openChapter(String chapter);

    public abstract int getChapterNumber(String chapter);

    public abstract void returnToReaderPdfScreen();
}
