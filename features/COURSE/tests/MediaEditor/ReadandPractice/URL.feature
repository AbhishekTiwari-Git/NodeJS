@Course @Smoke  @API
Feature: Verify that MediaEditor is able to create URL in Read & Practice Template

    @delete-Courses
    Scenario: Verify that MediaEditor is able to create a custom task with URL in Read & Practice Template

       Given I login to Achieve-CW as "media_editor_1"
         When I create a course as "media_editor_1" with the following data
            | name                                | short_name | format | status | product_model_id | is_course_template | owner_id            | course_type   | warn_prebuilt | isbn             | template_version  |
            | Read & Practice URL Template        | E2E 301    | topics | draft  | 1                | true               | 0050n000002Wt0fAAC  | template      |  false        |  9781464199490   | 1                 |                 

        And I search for "Read & Practice URL Template" course                       
        And I click on "Read & Practice URL Template" card
        And I click on "Production" Tab

        And I add URL link to "Create" 
            | field             | link                         |
            | addUrlLinkinput   | https://www.google.com       |

        Then I verify that "URL Link Added to "Your Content"." message is displayed

        When I click on go to your content

        Then I verify that activties are added in "Create"
            | activity                                      |    
            | Google                                        |

        And I add custom activity to Content Library
            | activity                                      |    
            | Google                                        |
 
        Then I verify that activties are added in "Content Library"
            | activity                                      |    
            | Google                                        | 


       