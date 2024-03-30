<?php declare(strict_types=1);

namespace Zozulia\Testsuite\Context\Google;

use Behat\MinkExtension\Context\RawMinkContext;

class GoogleContext extends RawMinkContext
{
    /**
     * @Given I click cookie settings button :buttonText
     */
    public function iClickCookieSettingsButton(string $buttonText): void
    {
        $button = $this->getSession()->getPage()->find(
            'xpath',
            sprintf('//div[text()="%s"]/parent::button', $buttonText)
        );

        $button->click();
    }

    /**
     * @Then I should see cookie settings button :buttonText
     */
    public function iShouldSeeCookieSettingsButton(string $buttonText): void
    {
        $this->assertSession()->elementExists(
            'xpath', 
            sprintf('//div[text()="%s"]/parent::button', $buttonText)
        );
    }

    /**
     * @Given I switch to locale :locale
     */
    public function iSwitchToLocale(string $locale): void
    {
        $this->getSession()->reset();
        $url = $this->getSession()->getCurrentUrl();
        if (str_contains('?', $url)) {
            $url = sprintf('%s&hl=%s', $url, $locale);
        } else {
            $url = sprintf('%s?hl=%s', $url, $locale);
        }
        
        $this->getSession()->visit($url);
    }

    /**
     * @Given I wait for the page to be loaded
     */
    public function iWaitForThePageToBeLoaded(int $timeout = 10000): void
    {
        $this->getSession()->wait($timeout, "document.readyState === 'complete'");
    }

    /**
     * @Given I am not logged in
     */
    public function iAmNotLoggedIn(): void
    {
    }

    /**
     * @Then I should see the search bar with title :arg1
     */
    public function iShouldSeeTheSearchBarWithTitle(string $title): void
    {
        $this->assertSession()->elementExists(
            'css', 
            sprintf('textarea[title="%s"]', $title)
        );
    }

    /**
     * @Then I should see the button :title
     */
    public function iShouldSeeTheButton(string $title): void
    {
        $this->assertSession()->elementExists(
            'css', 
            sprintf('input[type="submit"][value="%s"]', $title)
        );
    }

    /**
     * @Then I should see the Google logo
     */
    public function iShouldSeeTheGoogleLogo(): void
    {
        $this->assertSession()->elementExists('css', 'img[alt="Google"]');
    }
}