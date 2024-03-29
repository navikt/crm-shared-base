# crm-shared-base

Shared base repo for all smaller components for all teams. See below for component too large that they have their own repos.

All custom components should be added in [Confluence](https://confluence.adeo.no/display/PTC/Dokumentasjon+av+egenutviklede+komponenter) as well.

# This Repo

## Lightning Web Components

-   [Markdown Parser](force-app/components/markdownParser)
    -   Convert SObject Fields from Markdown to HTML
-   [Static Notification](force-app/components/staticNotification)
    -   Show a simple, static notification from a SOBject Field
    -   Customizable using Lightning Page Editor

![](img/staticNotification.png)

## Frameworks

-   Nothing to see here

# Other Repos

## Lightning Web Components

-   [crm-shared-timeline](https://github.com/navikt/crm-shared-timeline)
    -   Component to view any related record on a parent record, by putting the LWC on the parent flexipage
    -   Modular with custom metadata

## Frameworks

-   [crm-shared-email-scheduling](https://github.com/navikt/crm-shared-email-scheduling)
    -   Add emails to be sent in a queue or instant sending by creating a EmailQueue\_\_c record
    -   App to easily administrate queued, sent or failed emails

## Templates

-   [crm-shared-template](https://github.com/navikt/crm-shared-template)
    -   GitHub repo template to easily get a basic SFDX project
    -   Includes GitHub workflows, NPM dependencies and Prettier formatting
