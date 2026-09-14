package InternetLifeLab {
    private import ScalarValues::*;

    part def InternetLifeApplication {
        attribute hoursPerDay : Real;
        attribute lifeExpectancyYears : Real;
        attribute totalOnlineHours : Real;
        attribute yearsOnline : Real;
        attribute memesSeen : Integer;
        attribute adsScrolled : Integer;
    }

    action def EnterOnlineHours {
        in previousHoursPerDay : Real;
        out hoursPerDay : Real;
    }

    action def CalculateInternetLife {
        in hoursPerDay : Real;
        out yearsOnline : Real;
        out memesSeen : Integer;
        out adsScrolled : Integer;
    }
}
