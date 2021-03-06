Feature: Manage Libraries

  @tier1
  Scenario: Settings: Add library: general checks
    When I add "Palace Bookshelf" account from welcomeScreen
      And I open Settings
      And I open Libraries on settings screen
    Then Button Add Library is displayed on libraries screen
    When I click Add library button on libraries screen
    Then Add library screen is opened
      And Libraries are sorted in alphabetical order on add account screen

  @tier1
  Scenario: Navigate by Tutorial
    Then Tutorial screen is opened
      And Each tutorial page can be opened on tutorial screen for android and close tutorial screen
      And Welcome screen is opened

  @tier1
  Scenario: Welcome screen: Add Library
    When I add "LYRASIS Reads" account from welcomeScreen
    Then Account 'LYRASIS Reads' is present on Accounts screen

  @tier1
  Scenario: Settings: Add library
    When I add "Palace Bookshelf" account from welcomeScreen
      And I get names of books on screen and save them as 'nameOfBooks'
      And I add 'LYRASIS Reads' account
    Then Category rows are loaded
      And List of books on screen is not equal to list of books saved as 'nameOfBooks'

  @tier1
  Scenario: Settings: Add Library: Check of the added libraries sorting
    When I add "Palace Bookshelf" account from welcomeScreen
      And I add libraries through settings:
        | LYRASIS Reads            |
        | Plumas County Library    |
        | Escondido Public Library |
        | Granby Public Library    |
        | Victorville City Library |
      And I open Settings
      And I open Libraries on settings screen
    Then Libraries are sorted in alphabetical order on libraries screen
    When I click to 'Escondido Public Library' and save library name as 'libraryInfo' on libraries screen
    Then The screen with settings for 'libraryInfo' library is opened

  @tier1
  Scenario: Settings: Libraries: Remove library
    When I add "LYRASIS Reads" account from welcomeScreen
    And I add 'Palace Bookshelf' account
    And I switch to 'LYRASIS Reads' from side menu
    And I remove 'Palace Bookshelf' account
    Then Account 'Palace Bookshelf' is not present on Accounts screen

  @tier2 @exclude_ios
  Scenario: Switch library bookshelf (ANDROID)
    When I add "Palace Bookshelf" account from welcomeScreen
      And I add 'LYRASIS Reads' account
      And I open Catalog
      And I switch to 'Palace Bookshelf' from side menu
      And I open categories by chain and chain starts from CategoryScreen:
        | Fiction            |
        | Historical Fiction |
      And Click GET action button on the first EBOOK book on catalog books screen and save book as 'bookInfo'
      And I open Books
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on books screen
    When I open Catalog
      And I return to previous screen for epub and pdf
      And I switch to 'LYRASIS Reads' from side menu
      And I open Books
    Then There are not books on books screen

  @tier2 @exclude_android
  Scenario: Switch library bookshelf (IOS)
    When I add "Palace Bookshelf" account from welcomeScreen
      And I add 'LYRASIS Reads' account
      And I open Catalog
      And I switch to 'Palace Bookshelf' from side menu
      And I open categories by chain and chain starts from CategoryScreen:
        | Fiction            |
        | Historical Fiction |
      And Click GET action button on the first EBOOK book on catalog books screen and save book as 'bookInfo'
      And I open Books
    Then EBOOK book with READ action button and 'bookInfo' bookInfo is present on books screen
    When I open Catalog
      And I return to previous screen for epub and pdf
      And I switch to 'LYRASIS Reads' from side menu
      And I open Books
    Then There are not books on books screen

  @logout @returnBooks @tier2
  Scenario: Switch Library Reservations
    When I add "Plumas County Library" account from welcomeScreen
    When I add 'LYRASIS Reads' account
      And I enter credentials for 'LYRASIS Reads' account
    Then Login is performed successfully
    When I open Catalog
      And I switch to 'LYRASIS Reads' from side menu
      And I open search modal
      And I search 'unavailable' book of distributor 'Bibliotheca' and bookType 'EBOOK' and save as 'bookNameInfo'
      And I switch to 'eBooks' catalog tab
    Then Subcategory screen is present
    When Open EBOOK book with RESERVE action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
    Then Book 'bookInfo' is opened on book details screen
      And Click RESERVE action button on book details screen
    Then I check that book contains REMOVE action button on book details screen
    When I open Holds
    Then EBOOK book with REMOVE action button and 'bookInfo' bookInfo is present on holds screen
    When I open Catalog
      And I open Catalog
      And I switch to 'Plumas County Library' from side menu
      And I open Holds
      And There are not books on holds screen

  @logout @tier2
  Scenario: Store library card
    When I add "LYRASIS Reads" account from welcomeScreen
    Then Account 'LYRASIS Reads' is present on Accounts screen
    When I enter credentials for 'LYRASIS Reads' account
    Then Login is performed successfully
    When I open account 'LYRASIS Reads'
      And I click the log out button on the account screen
    Then Logout is performed successfully

  @tier1
  Scenario: Logo: Add library: Check of adding a library
    When I add "Palace Bookshelf" account from welcomeScreen
    Then Category rows are loaded
    When I add 'LYRASIS Reads' account by the logo
    Then Category rows are loaded

  @tier1
  Scenario: Logo: Add Library: Check of sorting libraries
    When I add "Palace Bookshelf" account from welcomeScreen
      And I add libraries by the logo:
        | LYRASIS Reads            |
        | Plumas County Library    |
        | Escondido Public Library |
        | Granby Public Library    |
        | Victorville City Library |
    And I save 5 amount as 'amountKey'
    When I tap the logo on catalog screen
    Then The sorting of 'amountKey' libraries is alphabetical on find your library screen
    When I tap cancel button on find your library screen
    Then Category rows are loaded

  @tier1
  Scenario: Logo: Switch library
    When I add "Palace Bookshelf" account from welcomeScreen
    Then Category rows are loaded
    When I add libraries by the logo:
      | LYRASIS Reads            |
      | Plumas County Library    |
      | Escondido Public Library |
      And I tap the logo on catalog screen
      And I choose 'Palace Bookshelf' library on find your library screen
    Then Category rows are loaded