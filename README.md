# Qumulo Documentation Portal
Welcome to the Qumulo Documentation Portal repository!
This project uses docs-as-code principles to provide guidance about deploying, configuring, and working with Qumulo offerings.

## Repository Maintainers
The current owner and primary maintainer of this repository is [🍊 Lucía M. Polis](https://github.com/shefulloflight).

The secondary maintainers of this repository are:

* [🍊 Andrew Abrahamowicz](https://github.com/andrewabrahamowicz)

* [🍊 Martin Metke](https://github.com/mmetke-qumulo)


## Contributing to this Project
You can contribute content to this repository by sending feedback to this repository's maintainer or by opening a GitHub issue. Before you begin, familiarize yourself with our [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md) and [Contributing Guidelines](CONTRIBUTING.md).

* [Send Feedback](https://qumulo.atlassian.net/jira/software/form/a3eaa618-84a6-47ec-8a9e-5a0c3b016bc5)

* [Open an Issue](https://github.com/Qumulo/docs/issues/new/choose)

### 🍊 As a Qumulon
* Docs-as-Code Workflows

  * [🔒 Docs as Code Quick-Start Guide for Engineering Teams](https://qumulo.atlassian.net/wiki/spaces/QON/pages/2858385431/)

  * [🔒 Onboarding to the Docs-as-Code Process at Qumulo](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1585774639/Contributing+to+Docs+as+Code#Onboarding-to-the-Docs-as-Code-Process-at-Qumulo)

  * [🔒 Best Practices for Working with Docs as Code](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1755676699/)

* Working with Git and GitHub

  * [🔒 Working with the GitHub Web UI](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1755185184/)

  * [🔒 Working with the Git CLI](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1755643921/)

  * [🔒 Useful Git Commands](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1755512871/)

* Contributing Content

  * [🔒 Preparing Hardware Platform Documentation](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1942586089/)

  * [🔒 Preparing Release Notes](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1817215088/)

  * [🔒 Preparing Collateral for a Qumulo Core Release](https://qumulo.atlassian.net/wiki/spaces/QON/pages/2976874578/)

  * [🔒 Publishing a Qumulo Core Release (Engineering)](https://qumulo.atlassian.net/wiki/spaces/EN/pages/765231733/)

  * [🔒 Style Guide for Technical Documentation](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1814036510/)

    * [🔒 Preparing to Contribute Content](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1813741669/)

    * [🔒 Structuring a Topic](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1813610636/)
   
    * [🔒 Formatting Text and Ordering Information](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1813741718/)

    * [🔒 Best Practices for Writing and Editing Technical Documentation](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1814069393/)


## Running Tests and Builds
Everything you need to successfully test and build the documentation is located in the `dm` tool, which you can run from [`./tools/docs-menu.sh`](tools/docs-menu.sh) for the first time.

### 🍊 As a Qumulon
* [🔒 Building and Checking HTML Documentation](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1755217988/)

* [🔒 Building the `qq` CLI and REST API Guides](https://qumulo.atlassian.net/wiki/spaces/QON/pages/2259550614/)

* [🔒 Building PDF Documentation](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1841070245)

* [🔒 Preparing Collateral for a Qumulo Core Release](https://qumulo.atlassian.net/wiki/spaces/QON/pages/2976874578/)

* [🔒 Publishing a Qumulo Core Release (Engineering)](https://qumulo.atlassian.net/wiki/spaces/EN/pages/765231733/)

* [🔒 Documentation Runbooks](https://qumulo.atlassian.net/wiki/spaces/QON/pages/1953660967/)


## How Automation Works in this Repository
This repository runs a test workflow on every commit. For more information, see [`test.yml`](/.github/workflows/test.yml).

When the repository owner merges a pull request to `mainline`, this repository runs a publish workflow. For more information, see [`publish.yml`](/.github/workflows/publish.yml).


## About this Project's Infrastructure
The following diagram outlines the most current project infrastructure.

![Qumulo Documentation Infrastructure](images/qumulo-documentation-infrastructure.png)

## Licenses
This project uses the [Creative Commons Attribution 4.0 International](/LICENSE) overall and the [BSD 3-Clause License](/LICENSE-BSD-NAVGOCO) for the Navgoco jQuery component.

All content is Copyright &copy; Qumulo, Inc. except where specified otherwise.
