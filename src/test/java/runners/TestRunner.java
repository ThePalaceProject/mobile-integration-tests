package runners;

import courgette.api.CucumberOptions;
import io.cucumber.testng.AbstractTestNGCucumberTests;
import org.testng.annotations.DataProvider;

@CucumberOptions(
        features = {"src/test/java/features"},
        glue = {
                "hooks",
                "transformers",
                "stepdefinitions"
        },
        plugin = {
                "io.qameta.allure.cucumber6jvm.AllureCucumber6Jvm",
                //todo Aquality Tracking is temporary turned off until AqualityTrackingCucumber6Jvm is released
                //"aquality.tracking.integrations.cucumber5jvm.AqualityTrackingCucumber5Jvm",
        }
)
public class TestRunner extends AbstractTestNGCucumberTests {

    @Override
    @DataProvider(parallel = true)
    public Object[][] scenarios() {
        return super.scenarios();
    }
}
