Feature: Read EPUB

  Background:
    When I add "Palace Bookshelf" account from welcomeScreen
      And I open Catalog
      And I open search modal
      And I search for 'Flower Fables' and save bookName as 'bookNameInfo'

  @tier1 @exclude_ios @oldOs
  Scenario: Navigate by Page(ANDROID)
    And Click DOWNLOAD action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    When I click on right book corner on epub reader screen
      And I save pageNumber as 'pageNumberKey' and chapterName as 'chapterNameKey' on epub reader screen
      And I click on right book corner on epub reader screen
    Then Next page is opened and old page has 'pageNumberKey' pageNumber and 'chapterNameKey' chapterName on epub reader screen
    When I save pageNumber as 'pageNumberKey' and chapterName as 'chapterNameKey' on epub reader screen
      And I click on left book corner on epub reader screen
    Then Previous page is opened and old page has 'pageNumberKey' pageNumber and 'chapterNameKey' chapterName on epub reader screen

  @tier1 @exclude_android @oldOs
  Scenario: Navigate by Page(IOS)
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    When I click on right book corner on epub reader screen
      And I save pageNumber as 'pageNumberKey' and chapterName as 'chapterNameKey' on epub reader screen
      And I click on right book corner on epub reader screen
    Then Next page is opened and old page has 'pageNumberKey' pageNumber and 'chapterNameKey' chapterName on epub reader screen
    When I save pageNumber as 'pageNumberKey' and chapterName as 'chapterNameKey' on epub reader screen
      And I click on left book corner on epub reader screen
    Then Previous page is opened and old page has 'pageNumberKey' pageNumber and 'chapterNameKey' chapterName on epub reader screen

  @tier1 @exclude_ios @oldOs
  Scenario: Navigate by Table of Contents Menu(ANDROID)
    And Click DOWNLOAD action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    Then Each chapter of epub book can be opened from table of contents

  @tier1 @exclude_android @oldOs
  Scenario: Navigate by Table of Contents Menu(IOS)
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    Then Each chapter of epub book can be opened from table of contents

  @tier1 @exclude_ios @oldOs
  Scenario: Navigate View options(ANDROID)
    And Click DOWNLOAD action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    When I return to previous screen for epub and pdf
      And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    When I open font choices on epub reader screen
    Then Epub font choices screen is opened
    When I close font choices
      And I open table of contents on epub reader screen
    Then Epub table of contents screen is opened

  @tier1 @exclude_android @oldOs
  Scenario: Navigate View options(IOS)
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    When I return to previous screen for epub and pdf
      And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    When I open font choices on epub reader screen
    Then Epub font choices screen is opened
    When I close font choices
      And I open table of contents on epub reader screen
    Then Epub table of contents screen is opened

  @tier1 @exclude_ios @oldOs
  Scenario: Change, View Font and Contrast Settings(ANDROID)
    And Click DOWNLOAD action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    When I save font size as 'fontSize'
    And I INCREASE_FONT of text
    Then Font size 'fontSize' is increased
    When I save font size as 'fontSize'
    And I DECREASE_FONT of text
    Then Font size 'fontSize' is decreased
    When I change font style to FONT_SERIF
    Then Book text displays in FONT_SERIF font
    When I change font style to FONT_SANS
    Then Book text displays in FONT_SANS font
    When I change font style to FONT_DYSLEXIC
    Then Book text displays in FONT_DYSLEXIC font
    When I change contrast to BLACK_TEXT_ON_WHITE
    Then The BLACK_TEXT_ON_WHITE background is correct
    When I change contrast to BLACK_TEXT_ON_SEPIA
    Then The BLACK_TEXT_ON_SEPIA background is correct
    When I change contrast to WHITE_TEXT_ON_BLACK
    Then The WHITE_TEXT_ON_BLACK background is correct

  @tier1 @exclude_android @oldOs
  Scenario: Change, View Font and Contrast Settings(IOS)
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    When I save font size as 'fontSize'
    And I INCREASE_FONT of text
    Then Font size 'fontSize' is increased
    When I save font size as 'fontSize'
    And I DECREASE_FONT of text
    Then Font size 'fontSize' is decreased
    When I change font style to FONT_SERIF
    Then Book text displays in FONT_SERIF font
    When I change font style to FONT_SANS
    Then Book text displays in FONT_SANS font
    When I change font style to FONT_DYSLEXIC
    Then Book text displays in FONT_DYSLEXIC font
    When I change contrast to BLACK_TEXT_ON_WHITE
    Then The BLACK_TEXT_ON_WHITE background is correct
    When I change contrast to BLACK_TEXT_ON_SEPIA
    Then The BLACK_TEXT_ON_SEPIA background is correct
    When I change contrast to WHITE_TEXT_ON_BLACK
    Then The WHITE_TEXT_ON_BLACK background is correct

  @tier1 @exclude_ios @oldOs
  Scenario: Return to Page (Bookmarking)(ANDROID)
    And Click DOWNLOAD action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    When I scroll page forward from 1 to 2 times
      And I save pageNumber as 'pageNumberKey' and chapterName as 'chapterNameKey' on epub reader screen
      And I wait for 3 seconds
      And I return to previous screen for epub and pdf
      And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
      And PageNumber 'pageNumberKey' is correct
    When I click on right book corner on epub reader screen
      And I save pageNumber as 'pageNumberKey' and chapterName as 'chapterNameKey' on epub reader screen
      And I wait for 3 seconds
      And I restart app
      And I open Books
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on books screen
    When Open EBOOK book with READ action button and 'bookInfo' bookInfo on books screen
      And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
      And PageNumber 'pageNumberKey' is correct

  @tier1 @exclude_android @oldOs
  Scenario: Return to Page (Bookmarking)(IOS)
    And Click GET action button on EBOOK book with 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Open EBOOK book with READ action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
    When I scroll page forward from 1 to 2 times
      And I save pageNumber as 'pageNumberKey' and chapterName as 'chapterNameKey' on epub reader screen
      And I wait for 3 seconds
      And I return to previous screen for epub and pdf
      And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
      And PageNumber 'pageNumberKey' is correct
    When I click on right book corner on epub reader screen
      And I save pageNumber as 'pageNumberKey' and chapterName as 'chapterNameKey' on epub reader screen
      And I wait for 3 seconds
      And I restart app
      And I open Books
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on books screen
    When Open EBOOK book with READ action button and 'bookInfo' bookInfo on books screen
      And Click READ action button on book details screen
    Then 'bookInfo' book is present on epub reader screen
      And PageNumber 'pageNumberKey' is correct
