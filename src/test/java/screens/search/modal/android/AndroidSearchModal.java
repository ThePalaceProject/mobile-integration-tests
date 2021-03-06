package screens.search.modal.android;

import aquality.appium.mobile.application.PlatformName;
import aquality.appium.mobile.elements.interfaces.IButton;
import aquality.appium.mobile.elements.interfaces.ITextBox;
import aquality.appium.mobile.screens.screenfactory.ScreenType;
import org.openqa.selenium.By;
import screens.search.modal.SearchModal;

@ScreenType(platform = PlatformName.ANDROID)
public class AndroidSearchModal extends SearchModal {
    private final ITextBox txbSearch =
            getElementFactory().getTextBox(By.xpath("//*[contains(@resource-id,\"searchDialogText\")]"), "Search value input");
    private final IButton btnSearch =
            getElementFactory().getButton(By.xpath("//*[contains(@resource-id,\"buttonPanel\")]//android.widget.Button[contains(@text,'SEARCH')]"), "Apply search");
    private final IButton btnCancel =
            getElementFactory().getButton(By.xpath("//android.widget.Button[@text=\"CANCEL\"]"), "Cancel button");

    public AndroidSearchModal() {
        super(By.xpath("//*[contains(@resource-id,\"parentPanel\")]"));
    }

    @Override
    public void setSearchedText(String text) {
        txbSearch.sendKeys(text);
    }

    @Override
    public void applySearch() {
        btnSearch.click();
    }

    @Override
    public void clearSearchField() {
        //only for iOS
    }

    @Override
    public boolean isSearchFieldEmpty() {
        //only for iOS
        return false;
    }

    @Override
    public void closeSearchScreen() {
        btnCancel.click();
    }
}
