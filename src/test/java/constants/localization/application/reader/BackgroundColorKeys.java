package constants.localization.application.reader;

import constants.localization.providers.AbstractILocalizationProvider;
import constants.localization.providers.LocalizationProviderFactory;
import constants.localization.providers.LocalizedValue;
import lombok.NonNull;

import java.util.Locale;

public enum BackgroundColorKeys implements LocalizedValue {
    BLACK_TEXT_ON_WHITE("black_text_on_white"),
    BLACK_TEXT_ON_SEPIA("black_text_on_sepia"),
    WHITE_TEXT_ON_BLACK("white_text_on_black");

    private String color;
    private static final AbstractILocalizationProvider localizationProvider =
            LocalizationProviderFactory.getProvider("reader.FontBackgroundKeys");

    BackgroundColorKeys(String color) {
        this.color = color;
    }

    @Override
    public String i18n() {
        return localizationProvider.getLocalization(color);
    }

    @Override
    public String i18n(@NonNull Locale locale) {
        return localizationProvider.getLocalization(color, locale);
    }
}
