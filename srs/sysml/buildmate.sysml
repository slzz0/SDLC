package BuildMateRequirements {
    doc /* Требования к веб-приложению BuildMate (подбор конфигурации ПК). Версия 0.1. */

    import ScalarValues::*;

    // ---------- Участники и система ----------
    part def Visitor;
    part def Administrator;
    part def MailServer;

    part def BuildMate {
        part catalogModule;
        part selectionModule;
        part compatibilityModule;
        part accountModule;
        part notificationModule;
    }

    // ---------- Базовые определения требований ----------
    requirement def FunctionalRequirement {
        attribute priority : String;   // MoSCoW: Must | Should | Could
        subject system : BuildMate;
    }
    requirement def QualityRequirement {
        attribute metric : String;
        subject system : BuildMate;
    }

    // ---------- Функциональные требования ----------
    requirement buildMateSpec {
        doc /* Корневое требование: подбор совместимой конфигурации ПК по бюджету и требованиям пользователя. */

        requirement accessAndRoles {
            requirement <'REQ-FUNC-001'> func001 : FunctionalRequirement {
                doc /* Регистрация и вход. */
                attribute :>> priority = "Must";
            }
            requirement <'REQ-FUNC-002'> func002 : FunctionalRequirement {
                doc /* Роли и права доступа. */
                attribute :>> priority = "Must";
            }
        }

        requirement catalogGroup {
            requirement <'REQ-FUNC-003'> func003 : FunctionalRequirement {
                doc /* Каталог комплектующих. */
                attribute :>> priority = "Must";
            }
            requirement <'REQ-FUNC-004'> func004 : FunctionalRequirement {
                doc /* Импорт прайс-листа CSV. */
                attribute :>> priority = "Should";
            }
            requirement <'REQ-FUNC-008'> func008 : FunctionalRequirement {
                doc /* Профили назначения. */
                attribute :>> priority = "Should";
            }
            requirement <'REQ-FUNC-018'> func018 : FunctionalRequirement {
                doc /* Просмотр каталога. */
                attribute :>> priority = "Should";
            }
        }

        requirement selectionGroup {
            requirement <'REQ-FUNC-005'> func005 : FunctionalRequirement {
                doc /* Ввод требований пользователя. */
                attribute :>> priority = "Must";
            }
            requirement <'REQ-FUNC-007'> func007 : FunctionalRequirement {
                doc /* Подбор конфигураций. */
                attribute :>> priority = "Must";
            }
            requirement <'REQ-FUNC-009'> func009 : FunctionalRequirement {
                doc /* Индекс производительности и оценка соответствия. */
                attribute :>> priority = "Must";
            }
            requirement <'REQ-FUNC-010'> func010 : FunctionalRequirement {
                doc /* Просмотр конфигурации. */
                attribute :>> priority = "Must";
            }
            requirement <'REQ-FUNC-011'> func011 : FunctionalRequirement {
                doc /* Замена комплектующей. */
                attribute :>> priority = "Should";
            }
        }

        requirement compatibilityGroup {
            requirement <'REQ-FUNC-006'> func006 : FunctionalRequirement {
                doc /* Правила совместимости. */
                attribute :>> priority = "Must";
            }
            requirement <'REQ-FUNC-012'> func012 : FunctionalRequirement {
                doc /* Проверка собственной сборки. */
                attribute :>> priority = "Should";
            }
            requirement <'REQ-FUNC-013'> func013 : FunctionalRequirement {
                doc /* Предупреждение о дисбалансе процессора и видеокарты. */
                attribute :>> priority = "Could";
            }
        }

        requirement savedGroup {
            requirement <'REQ-FUNC-014'> func014 : FunctionalRequirement {
                doc /* Сохранение конфигураций. */
                attribute :>> priority = "Should";
            }
            requirement <'REQ-FUNC-015'> func015 : FunctionalRequirement {
                doc /* Сравнение конфигураций. */
                attribute :>> priority = "Should";
            }
            requirement <'REQ-FUNC-016'> func016 : FunctionalRequirement {
                doc /* Экспорт конфигурации в PDF. */
                attribute :>> priority = "Could";
            }
            requirement <'REQ-FUNC-017'> func017 : FunctionalRequirement {
                doc /* Отслеживание цены. */
                attribute :>> priority = "Could";
            }
        }
    }

    // ---------- Требования к качеству (выборка) ----------
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

    // ---------- Распределение требований по модулям ----------
    part buildMate : BuildMate;

    satisfy func003 by buildMate.catalogModule;
    satisfy func004 by buildMate.catalogModule;
    satisfy func005 by buildMate.selectionModule;
    satisfy func006 by buildMate.compatibilityModule;
    satisfy func007 by buildMate.selectionModule;
    satisfy func009 by buildMate.selectionModule;
    satisfy func012 by buildMate.compatibilityModule;
    satisfy func014 by buildMate.accountModule;
    satisfy func017 by buildMate.notificationModule;
    satisfy func001 by buildMate.accountModule;
    satisfy selectionLatency by buildMate.selectionModule;
    satisfy savedImmutability by buildMate.accountModule;
    satisfy compatibilityCoverage by buildMate.compatibilityModule;

    // ---------- Варианты использования ----------
    use case def SelectConfiguration {
        subject system : BuildMate;
        actor user : Visitor;
        objective { doc /* Получить совместимые варианты конфигурации по бюджету и требованиям. */ }
    }
    use case def CheckAssembly {
        subject system : BuildMate;
        actor user : Visitor;
        objective { doc /* Проверить совместимость собственной сборки. */ }
    }
    use case def MaintainCatalog {
        subject system : BuildMate;
        actor admin : Administrator;
        objective { doc /* Вести каталог, прайс-листы и профили назначения. */ }
    }
    use case def TrackPrice {
        subject system : BuildMate;
        actor user : Visitor;
        actor mail : MailServer;
        objective { doc /* Получить письмо при изменении цены сохранённой конфигурации. */ }
    }
}
