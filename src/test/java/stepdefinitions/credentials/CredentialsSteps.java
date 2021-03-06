package stepdefinitions.credentials;

import com.google.inject.Inject;
import framework.utilities.ScenarioContext;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import stepdefinitions.BaseSteps;
import stepdefinitions.credentials.components.AbstractCredentialsSteps;
import stepdefinitions.credentials.components.ICredentialsSteps;

public class CredentialsSteps extends BaseSteps implements ICredentialsSteps {
    private final AbstractCredentialsSteps abstractCredentialsSteps;

    @Inject
    public CredentialsSteps(ScenarioContext context) {
        this.abstractCredentialsSteps = stepsFactory.getSteps(AbstractCredentialsSteps.class, context);
    }

    @Then("Login is performed successfully")
    public void checkLoginIsPerformedSuccessfully() {
        abstractCredentialsSteps.checkLoginIsPerformedSuccessfully();
    }

    @Then("Logout is performed successfully")
    public void isLogoutSuccessfully() {
        abstractCredentialsSteps.isLogoutSuccessfully();
    }

    @When("I click the log out button on the account screen")
    public void clickLogOut() {
        abstractCredentialsSteps.clickLogOut();
    }

    @And("I enter credentials for {string} account")
    public void enterCredentialsForLibraryAccount(String libraryName) {
        abstractCredentialsSteps.enterCredentialsForLibraryAccount(libraryName);
    }
}
