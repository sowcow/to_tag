Feature: CLI
  In order to be happy
  As a human being with desire to structure information
  I want to start a new project for this tool

  Scenario: view help info
    When I successfully run `totag`
    Then the output should contain "Commands:"

  Scenario: start new project
    When I successfully run `totag ideas`
    Then the output should not contain "Usage"
    And a directory named "ideas" should exist
    And a directory named "ideas/input" should exist
    And a directory named "ideas/output" should exist
    And a file named "ideas/Rakefile" should exist
    And a file named "ideas/input/example.rb" should exist
    And a file named "ideas/output/run rake" should exist

    When I cd to "ideas"
    And I successfully run `rake`
    And a file named "ideas/output/run rake" should not exist
