
package BuildMateFunctional {
    private import BuildMateDomain::*;

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

    // Распределение требований по модулям системы
    satisfy BuildMateFunctional::buildMateSpec::catalogGroup::func003
        by BuildMateDomain::buildMate.catalogModule;

    satisfy BuildMateFunctional::buildMateSpec::catalogGroup::func004
        by BuildMateDomain::buildMate.catalogModule;

    satisfy BuildMateFunctional::buildMateSpec::selectionGroup::func005
        by BuildMateDomain::buildMate.selectionModule;

    satisfy BuildMateFunctional::buildMateSpec::compatibilityGroup::func006
        by BuildMateDomain::buildMate.compatibilityModule;

    satisfy BuildMateFunctional::buildMateSpec::selectionGroup::func007
        by BuildMateDomain::buildMate.selectionModule;

    satisfy BuildMateFunctional::buildMateSpec::selectionGroup::func009
        by BuildMateDomain::buildMate.selectionModule;

    satisfy BuildMateFunctional::buildMateSpec::compatibilityGroup::func012
        by BuildMateDomain::buildMate.compatibilityModule;

    satisfy BuildMateFunctional::buildMateSpec::savedGroup::func014
        by BuildMateDomain::buildMate.accountModule;

    satisfy BuildMateFunctional::buildMateSpec::savedGroup::func017
        by BuildMateDomain::buildMate.notificationModule;

    satisfy BuildMateFunctional::buildMateSpec::accessAndRoles::func001
        by BuildMateDomain::buildMate.accountModule;
}

