
package BuildMateUseCases {
    private import BuildMateDomain::*;

    use case def SelectConfiguration {
        subject system : BuildMate;
        actor user : Visitor;

        objective {
            doc /* Получить совместимые варианты конфигурации по бюджету и требованиям. */
        }
    }

    use case def CheckAssembly {
        subject system : BuildMate;
        actor user : Visitor;

        objective {
            doc /* Проверить совместимость собственной сборки. */
        }
    }

    use case def MaintainCatalog {
        subject system : BuildMate;
        actor admin : Administrator;

        objective {
            doc /* Вести каталог, прайс-листы и профили назначения. */
        }
    }

    use case def TrackPrice {
        subject system : BuildMate;
        actor user : Visitor;
        actor mail : MailServer;

        objective {
            doc /* Получить письмо при изменении цены сохранённой конфигурации. */
        }
    }
}

