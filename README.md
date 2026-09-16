> **Important:** To contribute content to the [Qumulo Hardware Servicing Guide](https://docs.qumulo.com/hardware-guide/), use the [`docs-hardware`](https://github.com/Qumulo/docs-hardware) repository.

# Qumulo Documentation Portal
Welcome to the Qumulo Documentation Portal repository! This project uses docs-as-code principles to provide guidance about deploying, configuring, and working with cloud and on-premises Qumulo offerings, developer tools and interfaces, and external alerts and monitoring for Qumulo Core. 

**Table of Contents**
* [Repository Maintainers](#repository-maintainers)
* [Contributing to this Project](#contributing-to-this-project)
  * [🍊&thinsp;As a Qumulon](#as-a-qumulon)
* [Running Tests and Builds](#running-tests-and-builds)
  * [🍊&thinsp;As a Qumulon](#as-a-qumulon-1)
  * [How Automation Works in the `docs-internal` Repository](#how-automation-works-in-the-docs-internal-repository)
* [Features and Functionality](#features-and-functionality)
* [Pinned Versions](#pinned-versions)
* [Project Infrastructure Overview](#project-infrastructure-overview)
* [Licenses](#licenses)


## Repository Maintainers
The current owner and primary maintainer of this repository is [🍊&thinsp;Lucía M. Polis](https://github.com/shefulloflight).

The secondary maintainer of this repository is [🍊&thinsp;Andrew Abrahamowicz](https://github.com/andrewabrahamowicz).


## Contributing to this Project
You can contribute content to this repository by sending feedback to this repository's maintainer or by opening a GitHub issue. Before you begin, familiarize yourself with our [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md) and [Contributing Guidelines](CONTRIBUTING.md).

* [Send Feedback](https://qumulo.atlassian.net/jira/software/form/a3eaa618-84a6-47ec-8a9e-5a0c3b016bc5)

* [Open an Issue](https://github.com/Qumulo/docs/issues/new/choose)

### 🍊&thinsp;As a Qumulon
* ⚡ [🔒 Qontent QuickStart for Engineers](https://qumulo.atlassian.net/wiki/spaces/QON/pages/3705241605/)

  * [🔒 Qontent Best Practices for Engineers](https://qumulo.atlassian.net/wiki/spaces/QON/pages/3704684580/)

  * [🔒 To Begin Planning New Feature Documentation](https://qumulo.atlassian.net/wiki/spaces/QON/pages/3704750093/)

  * [🔒 To Contribute New or Revised Content to the Docs Portal](https://qumulo.atlassian.net/wiki/spaces/QON/pages/3704815656/)

  * [🔒 To Request Page Migration from Qumulo Care to the Docs Portal](https://qumulo.atlassian.net/wiki/spaces/QON/pages/3704651805/)

* 🤝 [🔒 Working with Team Qontent](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1788936376/)

* ⚙️ Working with Git and GitHub

  * [🔒 Working with the GitHub Web UI](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1755185184/)

  * [🔒 Working with the Git CLI](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1755643921/)

  * [🔒 Useful Git Workflows and Commands](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1755512871/)

* 📖 Reference

  * [🔒 Acronym and Abbreviation Glossary](https://qumulo.atlassian.net/wiki/spaces/QON/pages/512197065/)

  * [🔒 Best Practices for Docs as Code](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1755676699/)

  * [🔒 Qumulo Style Guide for Tech Docs](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1814036510/)

  * [🔒 Documentation Runbooks](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1953660967/)


## Running Tests and Builds
Everything you need to successfully test and build the documentation from the `docs-internal` repository is located in the `dm` tool, which you can run from [`./tools/docs-menu.sh`](tools/docs-menu.sh) for the first time.

### 🍊&thinsp;As a Qumulon
* 👷‍♀️ [🔒 Building and Checking HTML Docs](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1755217988/)

* 🔧 [🔒 Building the REST API and `qq` CLI Guides](https://qumulo.atlassian.net/wiki/spaces/QON/pages/2259550614/)

* 📄 [🔒 Building PDF Documentation](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1841070245/)

### How Automation Works in the `docs-internal` Repository
* **Testing:** This repository runs the `.github/workflows/test.yml` workflow on every commit to the `docs-internal` repository.

* **Publishing:** When the repository owner merges a pull request to `mainline`, the `docs-internal` repository runs the `.github/workflows/publish.yml` workflow.


## Features and Functionality
This project began from [Jekyll Doc Theme 6.0](https://github.com/tomjoht/documentation-theme-jekyll) by [Tom Johnson](https://idratherbewriting.com/aboutme/) and received additional custom features and enhancements over time.

* User Experience and Feedback (JS and jQuery)
  * [Copy code to clipboard](js/copy-code.js)
  * [Favorite pages in browser local storage](js/list-favorites.js)
    * [Retrieval of page favorite status](js/check-favorites.js)
  * [Platform Admin Guide switcher](js/switch-admin-guide.js)
  * [Cookie consent banner](js/grt-cookie-consent.js) (adapted from [GRT Cookie Consent](https://grt107.github.io/grt-cookie-consent/))
  * [Modal pop-up for reporting documentation issues directly into a Jira backlog](js/send-feedback.js)
  * [RAG-driven search](js/vectara.js) with [Vectara](https://www.vectara.com/)
    * [Custom parametrized URLs with history states](js/search-specs.js)
* Layout and navigation ([Liquid Templating Language](https://shopify.github.io/liquid/))
  * [Breadcrumbs](_includes/crumb)
  * [Parent landing pages](_layouts/parent_landing_page.html)
  * [Child landing pages](_layouts/landing_page.html)
* Content creation (Python)
  * [Custom generation of REST API documentation from `openapi.json` with dynamic labeling of REST APIs with versions, **PREVIEW**, and **DEPRECATED** tags](tools/gen-api.py)
  * [Custom generation of REST API change summaries from `openapi.json](tools/gen-api-changes.py)
  * 🔒 Custom generation of `qq` CLI documentation from the code base


## Pinned Versions
* Docs & PDF builds in `docs-builder` container ([`docker/build/Dockerfile`](docker/build/Dockerfile))
  * Ruby 3.4.1
  * Bundler 4.0.21
  * Jekyll 4.4.1
  * PrinceXML 14.4 (local builds)
* Hot Topic build in `google-analytics-script` container ([`tools/hot-topic/Dockerfile`](tools/hot-topic/Dockerfile))
  * Python 3.11
  * Pip 26.2.1 

## Project Infrastructure Overview
The following diagram outlines the most current project infrastructure.

![Qumulo Documentation Infrastructure](images/qumulo-documentation-infrastructure.png)


## Licenses
This project uses the [Creative Commons Attribution 4.0 International](/LICENSE) overall and the [BSD 3-Clause License](/LICENSE-BSD-NAVGOCO) for the Navgoco jQuery component.

All content is Copyright &copy; Qumulo, Inc. except where specified otherwise.
