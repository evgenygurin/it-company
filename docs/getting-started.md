# Getting Started

This guide will walk you through the process of setting up the Automated Code Quality and DevOps Assistant for your repository.

## Prerequisites

Before you begin, ensure you have the following:

* A GitHub repository containing a software project.
* An account on the Codegen platform.
* Your repository connected to the Codegen platform.

## 1. Set Up Your Repository

To enable the AI assistant to work effectively, you need to add a few files to your repository:

* **`AGENTS.md`**: Create this file in the root of your repository to define the coding standards and rules for the AI agent. See the [AI Agent Rules](./agent-rules.md) documentation for more details.
* **`scripts/codegen-setup.sh`**: Create this shell script to define the setup commands for the agent's sandbox environment (e.g., installing dependencies).
* **CI/CD Pipeline**: Ensure you have a CI/CD pipeline configured (e.g., using GitHub Actions) that runs your tests and builds your project.

## 2. Configure Codegen Platform

In the Codegen platform settings for your repository, you need to:

* **Configure Setup Commands**: Point the setup command to your `scripts/codegen-setup.sh` script.
* **Add Repository Secrets**: Add any necessary environment variables (e.g., API keys for testing) as secrets.

## 3. Using the AI Assistant

Once the setup is complete, the AI assistant will start working automatically. Here are a few ways you can interact with it:

* **Pull Requests**: When you create a pull request, the agent will automatically review your code and provide feedback.
* **Failed Builds**: If your CI/CD pipeline fails, the agent will attempt to fix the issue automatically.
* **Task Automation**: You can assign tasks to the agent via your integrated project management tool (e.g., Linear, Jira) or by mentioning it in Slack.

For more details on the architecture and how the assistant works, please refer to the [Architecture](./architecture.md) documentation.
