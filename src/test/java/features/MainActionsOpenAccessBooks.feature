Feature: Main actions open access books

  Background:
    When I add "Palace Bookshelf" account from welcomeScreen
    And I open Catalog
    And I open search modal
    And I search for 'Flower Fables' and save bookName as 'bookNameInfo'

  @tier2
  Scenario: Check out from Book Detail View and Return from Books
    When Open EBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click GET action button on book details screen
      And I close Book Details for IOSTab
      And I open Books
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on books screen
    When Open EBOOK book with READ action button and 'bookInfo' bookInfo on books screen
      And Click DELETE action button on book details screen
      And I close Book Details for IOSTab
      And I open Books
    Then EBOOK book with GET action button and 'bookInfo' bookInfo is not present on books screen

  @tier2
  Scenario: Check out from Book Detail View and Return from Book Detail View
    When Open EBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click GET action button on book details screen
    And Click DELETE action button on book details screen
    Then I check that book contains GET action button on book details screen

  @tier2
  Scenario: Check out from Book Detail View and Read from Book Detail View
    When Open EBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click GET action button on book details screen
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen

  @tier2
  Scenario: Check out from Subcategory List View and Return from Books
    When Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And I open Books
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on books screen
    When Open EBOOK book with READ action button and 'bookInfo' bookInfo on books screen
    And Click DELETE action button on book details screen
    And I close Book Details for IOSTab
    And I open Books
    Then EBOOK book with GET action button and 'bookInfo' bookInfo is not present on books screen

  @tier2
  Scenario: Check out from Subcategory List View and Read from Subcategory List View
    When Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And EBOOK book with READ action button and 'bookInfo' bookInfo is present on catalog books screen
    And Click READ action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    Then 'bookInfo' book is present on epub reader screen

  @tier2
  Scenario: Check out from Subcategory List View and Return from Subcategory List View
    When Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click DELETE action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    Then EBOOK book with GET action button and 'bookInfo' bookInfo is present on catalog books screen
