
package BuildMateQuality {
    private import BuildMateDomain::*;

    // Требования к качеству
    requirement <'REQ-PERF-002'> selectionLatency : QualityRequirement {
        doc /* Формирование трёх вариантов не более 5 с (95 % запросов). */
        attribute :>> metric = "p95 <= 5 s";
    }

    requirement <'REQ-REL-002'> savedImmutability : QualityRequirement {
        doc /* Сохранённая конфигурация не меняется при изменении каталога. */
        attribute :>> metric = "0 изменений";
    }

    requirement <'REQ-MAINT-001'> compatibilityCoverage : QualityRequirement {
        doc /* Покрытие модульными тестами модуля совместимости и подбора не менее 90 %. */
        attribute :>> metric = "coverage >= 90 %";
    }

    // Распределение требований к качеству по модулям
    satisfy BuildMateQuality::selectionLatency
        by BuildMateDomain::buildMate.selectionModule;

    satisfy BuildMateQuality::savedImmutability
        by BuildMateDomain::buildMate.accountModule;

    satisfy BuildMateQuality::compatibilityCoverage
        by BuildMateDomain::buildMate.compatibilityModule;
}

