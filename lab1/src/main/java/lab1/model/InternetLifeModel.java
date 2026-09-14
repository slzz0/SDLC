package lab1.model;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;

public class InternetLifeModel {
    public static final int LIFE_EXPECTANCY_YEARS = 75;
    public static final double DAYS_IN_YEAR = 365.25;
    public static final int MEMES_PER_HOUR = 18;
    public static final int ADS_PER_HOUR = 35;

    private final PropertyChangeSupport changeSupport = new PropertyChangeSupport(this);

    private double hoursPerDay;
    private InternetLifeResult result;
    private boolean dataEntered;

    public InternetLifeModel() {
        hoursPerDay = 0.0;
        result = InternetLifeResult.empty();
        dataEntered = false;
    }

    public double getHoursPerDay() {
        return hoursPerDay;
    }

    public InternetLifeResult getResult() {
        return result;
    }

    public boolean hasData() {
        return dataEntered;
    }

    public void setHoursPerDay(double hoursPerDay) {
        if (hoursPerDay < 0.0 || hoursPerDay > 24.0) {
            throw new IllegalArgumentException("Количество часов должно быть от 0 до 24.");
        }

        double oldHoursPerDay = this.hoursPerDay;
        InternetLifeResult oldResult = this.result;
        boolean oldDataEntered = this.dataEntered;

        this.hoursPerDay = hoursPerDay;
        this.result = calculate(hoursPerDay);
        this.dataEntered = true;

        changeSupport.firePropertyChange("hoursPerDay", oldHoursPerDay, this.hoursPerDay);
        changeSupport.firePropertyChange("result", oldResult, this.result);
        changeSupport.firePropertyChange("dataEntered", oldDataEntered, this.dataEntered);
    }

    public void addPropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.addPropertyChangeListener(listener);
    }

    public void removePropertyChangeListener(PropertyChangeListener listener) {
        changeSupport.removePropertyChangeListener(listener);
    }

    private InternetLifeResult calculate(double hoursPerDay) {
        double totalOnlineHours = hoursPerDay * DAYS_IN_YEAR * LIFE_EXPECTANCY_YEARS;
        double yearsOnline = totalOnlineHours / (24.0 * DAYS_IN_YEAR);
        long memesSeen = Math.round(totalOnlineHours * MEMES_PER_HOUR);
        long adsScrolled = Math.round(totalOnlineHours * ADS_PER_HOUR);

        return new InternetLifeResult(hoursPerDay, totalOnlineHours, yearsOnline, memesSeen, adsScrolled);
    }
}
