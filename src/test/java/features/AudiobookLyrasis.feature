Feature: Audiobook in Lyrasis

  Background:
    Given I add "LYRASIS Reads" account from welcomeScreen
    Then Account 'LYRASIS Reads' is present on Accounts screen
    When I enter credentials for 'LYRASIS Reads' account
    Then Login is performed successfully
    When I open Catalog
      And I open search modal

  @logout @returnBooks @tier2
  Scenario Outline: Open the audiobook at the last open chapter
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
      And Open toc audiobook screen
      And Open random chapter on toc audiobook screen and save chapter name as 'chapterNameKey'
      And Wait for 12 seconds
    Then Chapter name on audio player screen is equal to 'chapterNameKey' saved chapter name
      And Pause button is present on audio player screen
      And Book is playing on audio player screen
    When Return to previous screen from audio player screen
      And Click LISTEN action button on book details screen
      And Wait for 12 seconds
    Then Chapter name on audio player screen is equal to 'chapterNameKey' saved chapter name
    When Open toc audiobook screen
      And Open the 4 chapter on toc audiobook screen and save the chapter name as 'chapterNameKey2'
      And Wait for 12 seconds
      And I restart app
      And I open Books
      And Open AUDIOBOOK book with LISTEN action button and 'bookInfo' bookInfo on books screen
      And Click LISTEN action button on book details screen
      And Wait for 12 seconds
    Then Chapter name on audio player screen is equal to 'chapterNameKey2' saved chapter name

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2
  Scenario Outline: Navigate by Audiobook
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
      And Tap play button on audio player screen
    Then Pause button is present on audio player screen
    When Tap pause button on audio player screen
    Then Play button is present on audio player screen
      And Book is not playing on audio player screen
    When Tap play button on audio player screen
      And Save book play time as 'timeAhead' on audio player screen
      And Skip ahead 15 seconds on audio player screen
    Then Playback has been moved forward by 15 seconds from 'timeAhead' seconds on audio player screen
    When Save book play time as 'timeBehind' on audio player screen
      And Skip behind 15 seconds on audio player screen
    Then Playback has been moved behind by 15 seconds from 'timeBehind' seconds on audio player screen

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2
  Scenario Outline: Check time code of track after reload app
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
      And Tap play button on audio player screen
      And Wait for 5 seconds
      And I stretch slider on the time tracking line forward on audio player screen
      And Tap pause button on audio player screen
      And Save book play time as 'timeAhead' on audio player screen
      And Return to previous screen from audio player screen
      And Click LISTEN action button on book details screen
      And Wait for 12 seconds
    Then Play time is the same with 'timeAhead' play time before restart on books detail screen
      And I restart app
      And I open Books
      And Open AUDIOBOOK book with LISTEN action button and 'bookInfo' bookInfo on books screen
      And Click LISTEN action button on book details screen
    Then Play time is the same with 'timeAhead' play time before restart on books detail screen

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2
  Scenario Outline: Check end of chapter sleep timer
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
      And Open toc audiobook screen
      And Open the 1 chapter on toc audiobook screen and save the chapter name as 'chapterName' and chapter number as 'chapterNumber'
      And Set END_OF_CHAPTER sleep timer on sleep timer audiobook screen
      And Select 2X playback speed on playback speed audiobook screen
      And I stretch slider on the time tracking line forward on audio player screen
      And Listen a chapter on audio player screen
    Then Play button is present on audio player screen
      When Save the name of chapter as 'nextChapter' on audio player screen
      And Open toc audiobook screen
    Then Chapter name next to 'chapterNumber' on toc audiobook screen is equal to 'nextChapter' saved chapter name

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2 @exclude_android
  Scenario Outline: Check of line for time remaining
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
    Then Line for time remaining is displayed on audio player screen

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2
  Scenario Outline: Check of switching to the next time
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
      And Open toc audiobook screen
      And Open the 1 chapter on toc audiobook screen and save the chapter name as 'chapterName' and chapter number as 'chapterNumber'
      And Select 2X playback speed on playback speed audiobook screen
      And Listen a chapter on audio player screen
    Then Next chapter play automatically and chapter name is not 'chapterName' on audio player screen

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2
  Scenario Outline: Check of file numbers
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
      And Open toc audiobook screen
      And Open the 4 chapter on toc audiobook screen and save the chapter name as 'chapterName' and chapter number as 'chapterNumber'
    Then Chapter number is 'chapterNumber' on audio player screen

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2
  Scenario Outline: Check playback speed
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
    Then The speed by default is 1.0
    When Open playback speed on audio player screen
      And Close playback speed screen
    Then Play button is present on audio player screen

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2
  Scenario Outline: Check closing sleep timer
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
      And Set END_OF_CHAPTER sleep timer on sleep timer audiobook screen
    Then Sleep timer is set to endOfChapter on audio player screen
    When Open sleep timer on audio player screen
      And Close sleep timer screen
    Then Play button is present on audio player screen

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2
  Scenario Outline: Check time tracking line
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
      And Save book play time as 'timeInfo' on audio player screen
      And Tap play button on audio player screen
      And I stretch slider on the time tracking line forward on audio player screen
      And Tap pause button on audio player screen
    Then Playing time is not equal to 'timeInfo' on audio playing screen
    When Save book play time as 'timeInfo2' on audio player screen
      And Tap play button on audio player screen
      And I stretch slider on the time tracking line back on audio player screen
      And Tap pause button on audio player screen
    Then Playing time is not equal to 'timeInfo2' on audio playing screen

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2
  Scenario Outline: Check of not rewinding forward by tapping on time bar
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
      And I stretch slider on the time tracking line forward on audio player screen
      And Wait for 5 seconds
      And Save book play time as 'timeBehind' on audio player screen
      And I tap on the time bar forward on audio player screen
      And Save book play time as 'timeForward' on audio player screen
    Then Play times 'timeBehind' and 'timeForward' are equals
    When I tap on the time bar back on audio player screen
      And Save book play time as 'timeBackward' on audio player screen
    Then Play times 'timeBehind' and 'timeBackward' are equals

    Scenarios:
      | distributor        |
      | Bibliotheca        |
      | Palace Marketplace |
      | Axis 360           |
      | Biblioboard        |

  @logout @returnBooks @tier2
  Scenario Outline: Playback speed: Check of playback speed
    When I search 'available' book of distributor '<distributor>' and bookType 'AUDIOBOOK' and save as 'bookNameInfo'
      And I switch to 'Audiobooks' catalog tab
      And Open AUDIOBOOK book with GET action button and 'bookNameInfo' bookName on catalog books screen and save book as 'bookInfo'
      And Click GET action button on book details screen
    Then I check that book contains LISTEN action button on book details screen
    When Click LISTEN action button on book details screen
      And Select <speed>X playback speed on playback speed audiobook screen
    Then Current playback speed value is <speed>X on audio player screen
    When Return to previous screen from audio player screen
      And Click LISTEN action button on book details screen
    Then Current playback speed value is <speed>X on audio player screen
    When I restart app
      And I open Books
      And Open AUDIOBOOK book with LISTEN action button and 'bookInfo' bookInfo on books screen
      And Click LISTEN action button on book details screen
    Then Current playback speed value is <speed>X on audio player screen
    When Tap play button on audio player screen
      And Save book play time as 'timeAhead' on audio player screen
      And Wait for <secondsForWaiting> seconds
    Then Playback has been moved forward by <moveForwardSeconds> seconds from 'timeAhead' seconds on audio player screen

    Scenarios:
      | distributor        | speed | secondsForWaiting | moveForwardSeconds |
      | Bibliotheca        | 0.75  | 8                 | 6                  |
      | Bibliotheca        | 1.25  | 8                 | 10                 |
      | Bibliotheca        | 1.50  | 6                 | 9                  |
      | Bibliotheca        | 2     | 5                 | 10                 |
      | Palace Marketplace | 0.75  | 8                 | 6                  |
      | Palace Marketplace | 1.25  | 8                 | 10                 |
      | Palace Marketplace | 1.50  | 6                 | 9                  |
      | Palace Marketplace | 2     | 5                 | 10                 |
      | Axis 360           | 0.75  | 8                 | 6                  |
      | Axis 360           | 1.25  | 8                 | 10                 |
      | Axis 360           | 1.50  | 6                 | 9                  |
      | Axis 360           | 2     | 5                 | 10                 |
      | Biblioboard        | 0.75  | 8                 | 6                  |
      | Biblioboard        | 1.25  | 8                 | 10                 |
      | Biblioboard        | 1.50  | 6                 | 9                  |
      | Biblioboard        | 2     | 5                 | 10                 |