# AI Agent Rules

The `AGENTS.md` file is a crucial part of this project. It acts as a rulebook for the AI agent, guiding its behavior and ensuring that its work aligns with the project's standards and conventions.

This document explains the purpose of the `AGENTS.md` file and provides guidance on how to write effective rules.

## The Purpose of `AGENTS.md`

The `AGENTS.md` file is a version-controlled prompt that is automatically injected into the AI agent's context every time it performs a task for this repository. It allows you to define repository-specific guidelines for:

* **Code Style**: Enforce formatting, naming conventions, and other stylistic rules.
* **Architecture**: Specify preferred frameworks, libraries, and design patterns.
* **Testing**: Define testing requirements and best practices.
* **Security**: Outline security policies and best practices.

By defining these rules in a file that is part of the repository, you ensure that they are version-controlled, reviewable, and consistently applied.

## How to Write Effective Rules

When writing rules for the AI agent, keep the following principles in mind:

* **Be Clear and Specific**: The agent is an AI, so it needs clear and unambiguous instructions. Avoid vague or subjective language.
* **Use Markdown**: The `AGENTS.md` file is a Markdown file, so you can use headings, lists, and other formatting to structure your rules.
* **Provide Examples**: Whenever possible, provide examples to illustrate your rules. This will help the agent to understand your expectations.

### Example Rules

Here are some examples of effective rules, taken from this project's `AGENTS.md` file:

```markdown
# AI Agent Rulebook for this Repository

## 1. General Principles

- **Primary Language**: This project is written in TypeScript.
- **Code Style**: All code MUST be formatted using the Prettier configuration defined in this project. Run `npx prettier --write .` before committing.
- **Commit Messages**: All commit messages must follow the Conventional Commits specification (e.g., `feat: add user authentication`).

## 2. React Development

- **Component Style**: Use functional components with Hooks. Avoid class-based components.
- **State Management**: For simple component state, use `useState`. For complex global state, use the `Zustand` library.

## 4. Testing

- **Framework**: Use `Jest` and `React Testing Library` for all tests.
- **Requirement**: Every new feature or bug fix MUST be accompanied by corresponding unit or integration tests.
```

By following these guidelines, you can create a comprehensive set of rules that will help the AI agent to become a valuable and productive member of your development team.
