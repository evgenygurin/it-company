# AI Agent Rulebook for this Repository

## 1. General Principles

- **Primary Language**: This project is written in TypeScript.
- **Code Style**: All code MUST be formatted using the Prettier configuration defined in this project. Run `npx prettier --write .` before committing.
- **Commit Messages**: All commit messages must follow the Conventional Commits specification (e.g., `feat: add user authentication`).

## 2. React Development

- **Component Style**: Use functional components with Hooks. Avoid class-based components.
- **State Management**: For simple component state, use `useState`. For complex global state, use the `Zustand` library.
- **Styling**: Use CSS Modules for component-level styling. Avoid inline styles.

## 3. API and Backend Development

- **Framework**: Use `Express.js` for the backend server.
- **Error Handling**: All API endpoints must have robust error handling. Return meaningful HTTP status codes and JSON error messages.
- **Authentication**: All protected endpoints must use JWT-based authentication.

## 4. Testing

- **Framework**: Use `Jest` and `React Testing Library` for all tests.
- **Requirement**: Every new feature or bug fix MUST be accompanied by corresponding unit or integration tests.
- **Goal**: The overall test coverage must not decrease. Aim for a minimum of 80% coverage for new code.

## 5. Security

- **Secret Management**: Never hard-code API keys, passwords, or other secrets in the source code. Use environment variables.
- **Input Validation**: All incoming data from users or external services must be validated and sanitized.
- **Dependencies**: Do not add dependencies with known critical vulnerabilities. Run `npm audit` regularly.
