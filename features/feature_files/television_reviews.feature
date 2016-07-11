@review @televisions
Feature: Review Televisions and Compare

  As a customer reviewing televisions
  In order to purchase a television
  I need to be able to select filter and compare televisions

  Background:
    Given I am on the televisions review page

  Scenario Outline: I am able to filter the televisions list by sizes

    When I filter the television list by screens of <size_range>
    Then the televisions displayed are of the size range <size_range>

    Examples:
      | size_range |
      | 17_22      |

  Scenario Outline: I am able to close the displayed informational banners

    When I click to close the <bannerType> banner
    Then I do not see the <bannerType> banner

    Examples:
      | bannerType             |
      | Informational lab test |
      | Find your best buy     |

  Scenario Outline: I am able to the television list by price

    When I sort the list with <sortType>
    Then the items listed have their <sortType>

    Examples:
      | sortType            |
      | Price (low to high) |
      | Price (high to low) |

  Scenario: I am able to see more Retailers by clicking the show more link

    When I click on the "Show more retailers" link
    Then the retailers list displays added retailers