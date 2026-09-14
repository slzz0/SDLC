package lab1.util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

public final class FormatUtils {
    private static final DecimalFormatSymbols SYMBOLS = DecimalFormatSymbols.getInstance(Locale.US);
    private static final DecimalFormat DECIMAL_FORMAT = new DecimalFormat("#,##0.##", SYMBOLS);
    private static final DecimalFormat INTEGER_FORMAT = new DecimalFormat("#,##0", SYMBOLS);

    private FormatUtils() {
    }

    public static double parseHours(String value) {
        String normalized = value.trim().replace(',', '.');
        if (normalized.isEmpty()) {
            throw new IllegalArgumentException("Введите количество часов.");
        }

        double parsed = Double.parseDouble(normalized);
        if (Double.isNaN(parsed) || Double.isInfinite(parsed) || parsed < 0.0 || parsed > 24.0) {
            throw new IllegalArgumentException("Количество часов должно быть числом от 0 до 24.");
        }

        return parsed;
    }

    public static String formatDecimal(double value) {
        return DECIMAL_FORMAT.format(value);
    }

    public static String formatInteger(long value) {
        return INTEGER_FORMAT.format(value);
    }

    public static String formatInput(double value) {
        return formatDecimal(value);
    }
}
