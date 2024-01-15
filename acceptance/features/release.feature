Feature: Golden Container Image

    Scenario: Red Hat collection
        Given there is a sample golden-container policy input
        And there is a policy config
            """
            {
                "sources": [
                    {
                        "policy": [
                            "$GITROOT/policy/lib",
                            "$GITROOT/policy/release"
                        ],
                        "data": [
                            "$GITROOT/example/data"
                        ],
                        "config": {
                            "include": [
                                "@redhat"
                            ],
                            "exclude": [
                                "sbom_cyclonedx.found",
                                "redhat_manifests.redhat_manifests_missing",
                                "cve.deprecated_cve_result_name"
                            ]
                        }
                    }
                ]
            }
            """
        When input is validated with policy config
        Then there should be no violations in the result
        Then there should be no warnings in the result
