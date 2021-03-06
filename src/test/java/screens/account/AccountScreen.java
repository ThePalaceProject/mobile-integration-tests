package screens.account;

import aquality.appium.mobile.screens.Screen;
import framework.configuration.Credentials;
import org.openqa.selenium.By;

public abstract class AccountScreen extends Screen {
    public AccountScreen(By locator) {
        super(locator, "Account");
    }

    public abstract void enterCredentialsAndLogin(Credentials credentials);

    public abstract boolean isLoginSuccessful();

    public abstract boolean isLogoutSuccessful();

    public abstract void logOut();

    public abstract boolean isLogoutRequired();

    public abstract void openLicenseAgreement();

    public abstract boolean isLinkOpened();

    public abstract void openContentLicenses();

    public abstract boolean isContentLicOpened();

    public abstract void openAdvanced();

    public abstract boolean isButtonDisplayed(String buttonName);

    public abstract void clickDelete(String button);
}
