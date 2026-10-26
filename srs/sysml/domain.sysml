
package BuildMateDomain {
    import ScalarValues::*;

    // Участники
    part def Visitor;
    part def Administrator;
    part def MailServer;

    // Структура системы
    part def BuildMate {
        part catalogModule;
        part selectionModule;
        part compatibilityModule;
        part accountModule;
        part notificationModule;
    }

    // Базовые определения требований
    requirement def FunctionalRequirement {
        attribute priority : String;
        subject system : BuildMate;
    }

    requirement def QualityRequirement {
        attribute metric : String;
        subject system : BuildMate;
    }

    // Экземпляр системы
    part buildMate : BuildMate;
}

