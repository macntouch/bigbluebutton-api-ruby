Feature: Create rooms
  To be able to use BigBlueButton
  One needs to create a webconference room first

  @version-all
  Scenario: Create a new room
    When the create method is called with ALL the optional arguments
    Then the response is successful and well formatted
      And the meeting exists in the server

  @version-all
  Scenario: Create a new room with default parameters
    When the create method is called with NO optional argument
    Then the response is successful and well formatted
      And the meeting exists in the server

  @version-all
  Scenario: Try to create a room with a duplicated meeting id
    When the create method is called with a duplicated meeting id
    Then the response is an error with the key "idNotUnique"

  # TODO boot is not working in version 0.8 yet
  @version-07 @need-bot
  Scenario: Try to recreate a previously ended meeting
    Given the create method is called
      # meeting needs to be running to be ended in 0.7
      And the meeting is running
      And the meeting is forcibly ended
    When the create method is called again with the same meeting id
    Then the response is an error with the key "idNotUnique"
