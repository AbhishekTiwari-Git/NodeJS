@Course @Smoke @API
Feature: Instructor adds folder, remove folder and reorders it in Read & Practice Template

    
    @delete-Courses
    Scenario: Verify that Instructor is able to add folder, remove folder and reorder resources in Read & Practice Template

        Given I login to Achieve-CW as "media_producer_2"
        When I create a course as "media_producer_2" with the following data
            | name                                | short_name | format | status | product_model_id | is_course_template | owner_id            | course_type   | lo_framework_id                         | warn_prebuilt | isbn             | template_version  |
            | Quantitative Template               | E2E 301    | topics | draft  | 3                | true               | 0050n000002Wt0kAAC  | template      | 57ba5934-30c2-4558-b776-b4bef6954d99    |  false        |  9781464199490   |   1               |  
                                                   
        And I click on "COURSE TEMPLATES" tab
        And I click on "Read & Practice Template" card
        And I click on "Production" Tab

        And I add activities to "Content Library"
          | activities            |
          | Glossary              |
          | LCRP1550612138614     |
          | LCRP1551301608988     |

        And I copy course from "Read & Practice Template" as "media_producer_2" with the following data
           | name                     | short_name | c_account   | is_course_template | course_term | course_year | status  | course_type | isbn          | warn_prebuilt | enrollment_start_date | course_end_date   |
           | Read & Practice Course   | E2E 301    | null        | false              | spring      | 2020        | active  | course      | 9781464199490 | false         | todaydate             |  After3Months     |

        And I sign out of Achieve
        And I assign instructor to "Read & Practice Course" as a "customer_support_1"
            |   id     |   enrollments         | product_model_id  | course_type    |
            |   id     |   instructor_1        |   1               | course         |
        And I login to Achieve-CW as "instructor_1"
        And I add activities in "Read & Practice Course" courseplanner tab
            | activity                                                          |                                                        
            | LCRP1551301608988                                                 |
            | Glossary                                                          |
            | LCRP1550612138614                                                 |
        And I close the popup message
            
        And I reorder the resources on template in "COURSE PLAN"
            | actvities                                                         | reorder        |                                                    
            | LCRP1551301608988                                                 | movedownButton |
            | Glossary                                                          | moveToEnd      |
            | LCRP1550612138614                                                 | moveUpButton   |

        Then I verify that resources are reordered in "COURSE PLAN"
            | activities                                                        | orderNumber    |
            | LCRP1550612138614                                                 |  1             |                                                       
            | LCRP1551301608988                                                 |  2             |
            | Glossary                                                          |  3             |      

        And I add the activities to respective folders in "COURSE PLAN"
            | activity                                      | folders           | folderName                | message                                                                             |
            | LCRP1551301608988                             | Learning Curve    | Learning Curve folder     | 'LCRP1551301608988' was successfully moved to Learning Curve.                         |
            | Glossary                                      | Reading           | Reading folder            | 'Glossary' was successfully moved to Reading.                                     |
            | LCRP1550612138614                             | ReadandPractice   | ReadandPractice folder    | 'LCRP1550612138614' was successfully moved to ReadandPractice.                      |

        And I verify the activities are added in folders which are present in "COURSE PLAN"
            | activity                                      | folders           |
            | LCRP1551301608988                               | Learning Curve    |
            | Glossary                                      | Reading           |
            | LCRP1550612138614                             | ReadandPractice   |

        When I delete the resources from the Template in "COURSE PLAN"
            | folders           | message                                 |
            | Reading           | 'Reading' has been removed.             |
            | Learning Curve    | 'Learning Curve' has been removed.      |
            | ReadandPractice   | 'ReadandPractice' has been removed.     |

        Then I verify that resources are deleted from Template in "COURSE PLAN"
            | folders           |
            | Reading           |  
            | Learning Curve    |
            | ReadandPractice   |



 
        