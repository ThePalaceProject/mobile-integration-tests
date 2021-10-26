Feature: Read PDF IOS

  Background:
    Given I add "LYRASIS Reads" account from welcomeScreen
      And I enter credentials for 'LYRASIS Reads' account
    Then Login is performed successfully
    When I open Catalog
      And I switch to 'LYRASIS Reads' from side menu
      And I open search modal

  @logout @returnBooks @tier1 @exclude_android @oldOs
  Scenario: Open document
    When I search random pdf and save as 'bookNameInfo'
      And I switch to 'eBooks' catalog tab
    Then Subcategory screen is present
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on catalog books screen
    When Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click READ action button on book details screen
    Then Pdf book 'bookInfo' is present on screen
      And Pdf book page number is 1

  @logout @returnBooks @tier1 @exclude_android @oldOs
  Scenario: Navigate by page
    When I search random pdf and save as 'bookNameInfo'
      And I switch to 'eBooks' catalog tab
    Then Subcategory screen is present
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on catalog books screen
    When Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click READ action button on book details screen
    Then Pdf book 'bookInfo' is present on screen
      And Pdf book page number is 1
    When I go to next page in pdf book
    Then Pdf book page number is 2
    When I go to previous page in pdf book
    Then Pdf book page number is 1

  @logout @returnBooks @tier1 @exclude_android @oldOs
  Scenario: Navigate by Table of Contents Menu
    When I search random pdf and save as 'bookNameInfo'
      And I switch to 'eBooks' catalog tab
    Then Subcategory screen is present
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on catalog books screen
    When Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click READ action button on book details screen
    Then Pdf book 'bookInfo' is present on screen
      And Each chapter of pdf book can be opened from Table of Contents

  @logout @returnBooks @tier1 @exclude_android @oldOs
  Scenario: Open book to last page read
    When I search random pdf and save as 'bookNameInfo'
      And I switch to 'eBooks' catalog tab
    Then Subcategory screen is present
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on catalog books screen
    When Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click READ action button on book details screen
    Then Pdf book 'bookInfo' is present on screen
    When I scroll pdf page forward from 10 to 20 times
      And I save pdf page number as 'pageNumber'
      And I wait for 3 seconds
      And I return to previous screen for epub and pdf
      And Click READ action button on book details screen
    Then Pdf book 'bookInfo' is present on screen
      And Pdf page number 'pageNumber' is correct
      And I wait for 3 seconds
    When I restart app
      And I open Books
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on books screen
    When Open EBOOK book with READ action button and 'bookInfo' bookInfo on books screen
      And Click READ action button on book details screen
    Then Pdf book 'bookInfo' is present on screen
      And Pdf page number 'pageNumber' is correct

  @logout @returnBooks @tier1 @exclude_android @oldOs
  Scenario: Navigate by Gallery
    When I search random pdf and save as 'bookNameInfo'
      And I switch to 'eBooks' catalog tab
    Then Subcategory screen is present
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on catalog books screen
    When Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click READ action button on book details screen
    Then Pdf book 'bookInfo' is present on screen
    When I open gallery menu
    Then Gallery is opened
      And I open last page on the gallery
      And I save number of page on the gallery as 'numberOfPage'
    When I open gallery menu
    Then Gallery is opened
    When I scroll the gallery page DOWN
      And I open random page on the gallery
    Then Current page number is bigger than number 'numberOfPage'
      And Pdf book 'bookInfo' is present on screen

  @logout @returnBooks @tier1 @exclude_android @oldOs
  Scenario: Search document
    When I search random pdf and save as 'bookNameInfo'
      And I switch to 'eBooks' catalog tab
    Then Subcategory screen is present
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on catalog books screen
    When Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click READ action button on book details screen
    Then Pdf book 'bookInfo' is present on screen
    When I click the search in the pdf button
    Then The search in the pdf page opened
    When I am typing 'vocabulary list' to the search field and apply search
    Then Found lines should contain 'vocabulary list' in themselves

  @logout @returnBooks @tier1 @exclude_android @oldOs
  Scenario: Navigate to Search Term
    When I search for 'Communication Beginnings: An Introductory Listening and Speaking Text for English Language Learners' and save bookName as 'bookNameInfo'
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on catalog books screen
    When Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click READ action button on book details screen
    Then Pdf book 'bookInfo' is present on screen
    When I click the search in the pdf button
      And I am typing 'vocabulary list' to the search field and apply search
      And I save page number as 'pageNumber' of the first item
      And I open the first found item
    Then Pdf page number 'pageNumber' is correct
