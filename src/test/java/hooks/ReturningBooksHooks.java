package hooks;

import aquality.appium.mobile.application.AqualityServices;
import com.google.inject.Inject;
import constants.keysForContext.ScenarioContextKey;
import framework.utilities.ScenarioContext;
import framework.utilities.returningBooksUtil.APIUtil;
import io.cucumber.java.After;

import java.util.Map;

public class ReturningBooksHooks {
    private ScenarioContext context;

    @Inject
    public ReturningBooksHooks(ScenarioContext scenarioContext) {
        context = scenarioContext;
    }

    @After(value = "@returnBooks", order = 0)
    public void returnBooks() {
        AqualityServices.getLogger().info("Test finished - returning books");
        Map<String, String> map = context.get(ScenarioContextKey.lIST_OF_CREDENTIALS_KEY);
        if (map.size() == 0) {
            throw new RuntimeException("There are not barcodes for returning books");
        }
        for (Map.Entry<String, String> m : map.entrySet()) {
            APIUtil.returnBooks(m.getKey(), m.getValue());
            APIUtil.enterBooksAfterReturningBooks(m.getKey(), m.getValue());
        }
    }
}
