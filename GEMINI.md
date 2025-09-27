# Gemini Project Context: Automated Code Quality and DevOps Assistant

## Project Overview

This project aims to create an **Automated Code Quality and DevOps Assistant** by leveraging the Codegen platform. It is not a standalone application, but rather a structured configuration of a repository designed to be monitored and managed by a Codegen AI agent.

The primary goal is to automate routine development tasks such as code reviews, CI/CD pipeline fixes, and dependency management, thereby improving code quality and developer productivity.

The main technologies used in this project are **TypeScript** and **Node.js**. The architecture is event-driven, relying on webhooks from GitHub to trigger AI agent workflows on the Codegen platform.

## Building and Running

This project is designed to be built and tested within a CI/CD environment, which is orchestrated by the Codegen agent. The key commands are defined in the `scripts` section of the `package.json` file.

* **Install Dependencies**:

    ```bash
    npm ci
    ```

* **Lint Code**:

    ```bash
    npm run lint
    ```

* **Run Tests**:

    ```bash
    npm run test
    ```

* **Build Project**:

    ```bash
    npm run build
    ```

The CI pipeline, defined in `.github/workflows/ci.yml`, automatically runs these commands on every pull request.

The Codegen agent's sandbox environment is prepared using the `scripts/codegen-setup.sh` script, which installs dependencies using `npm ci`.

## Development Conventions

The development conventions for this project are explicitly defined in the `AGENTS.md` file. This file serves as a rulebook for the Codegen AI agent.

Key conventions include:

* **Language**: TypeScript is the primary language.
* **Code Style**: Code must be formatted with Prettier. All commit messages must follow the Conventional Commits specification.
* **React Development**: Use functional components with Hooks and CSS Modules.
* **Backend Development**: Use Express.js for the backend, with JWT-based authentication.
* **Testing**: Use Jest and React Testing Library. New features and bug fixes must include tests.
* **Security**: No hard-coded secrets. All inputs must be validated. Dependencies must be audited for vulnerabilities.
