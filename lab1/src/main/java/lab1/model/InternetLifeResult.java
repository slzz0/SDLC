package lab1.model;

public class InternetLifeResult {
    private final double hoursPerDay;
    private final double totalOnlineHours;
    private final double yearsOnline;
    private final long memesSeen;
    private final long adsScrolled;

    public InternetLifeResult(
            double hoursPerDay,
            double totalOnlineHours,
            double yearsOnline,
            long memesSeen,
            long adsScrolled
    ) {
        this.hoursPerDay = hoursPerDay;
        this.totalOnlineHours = totalOnlineHours;
        this.yearsOnline = yearsOnline;
        this.memesSeen = memesSeen;
        this.adsScrolled = adsScrolled;
    }

    public static InternetLifeResult empty() {
        return new InternetLifeResult(0.0, 0.0, 0.0, 0L, 0L);
    }

    public double getHoursPerDay() {
        return hoursPerDay;
    }

    public double getTotalOnlineHours() {
        return totalOnlineHours;
    }

    public double getYearsOnline() {
        return yearsOnline;
    }

    public long getMemesSeen() {
        return memesSeen;
    }

    public long getAdsScrolled() {
        return adsScrolled;
    }
}
