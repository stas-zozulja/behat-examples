Feature: Google Homepage
  As a user
  I want to ensure that Google's homepage is functional
  So that I can use its search capabilities in multiple languages

Background:
  Given I am not logged in
    And I am on homepage

Scenario Outline:
   When I switch to locale "<locale>"
    And I wait for the page to be loaded
   Then I should see cookie settings button "<reject_all>"
    And I should see cookie settings button "<accept_all>"
   When I click cookie settings button "<reject_all>"
   Then I should see the Google logo
    And I should see the search bar with title "<search_textarea_title>"
    And I should see the button "<search_button_text>"
    And I should see the button "<feeling_lucky_button_text>"

  Examples:
    | locale | reject_all    | accept_all        | search_textarea_title | search_button_text | feeling_lucky_button_text |
    | en-GB  | Reject all    | Accept all        | Search                | Google Search      | I'm Feeling Lucky         |
    | de     | Alle ablehnen | Alle akzeptieren  | Suche                 | Google Suche       | Auf gut Glück!            |
    | es     | Rechazar todo | Aceptar todo      | Buscar                | Buscar con Google  | Voy a tener suerte        |
    | fr     | Tout refuser  | Tout accepter     | Rechercher            | Recherche Google   | J'ai de la chance         |
    | uk     | Відхилити всі | Прийняти всі      | Пошук                 | Пошук Google       | Мені пощастить            |
    | it     | Rifiuta tutto | Accetta tutto     | Cerca                 | Cerca con Google   | Mi sento fortunato        |