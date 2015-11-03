Feature: Totalling items
  In order to display how much customers have spent, checkout operators should
  be able to scan in items and see a running subtotal of the cost

  Scenario: Scanning an item
    Given I haven't scanned anything yet
    When I scan an apple
    Then the subtotal should be 50p

  Scenario: Scanning items
    Given I haven't scanned anything yet
    When I scan two apples
    And I scan an aspirin
    Then the subtotal should be £1.28

  @wip
  Scenario: Buying aspirin
    Given an operator has scanned 2 aspirin packs
    When the operator scans an another aspirin pack
    Then an error should be raised
