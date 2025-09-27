# Project Architecture: Automated Code Quality and DevOps Assistant

## 1. Architectural Philosophy

The architecture for this project is not about building a new software application, but rather designing a robust and scalable **system of configuration and integration** that leverages the Codegen platform. The Codegen service is the core processing engine, and our architecture defines how we interact with it and how it interacts with our ecosystem.

The key principles of this architecture are:

* **Configuration as Code**: Wherever possible, configurations are stored in version-controlled files within our repositories (`AGENTS.md`, setup scripts) rather than just in a web UI. This provides history, reviewability, and consistency.
* **Decentralized Rules, Centralized Execution**: Each repository defines its own specific rules and context, but the execution and orchestration are handled centrally by Codegen. This allows for both specialization and control.
* **Event-Driven and Asynchronous**: The system primarily operates on events (e.g., a PR creation, a failed build) and works asynchronously, mirroring real-world development workflows.

## 2. High-Level System Diagram

This diagram illustrates the flow of information and actions between the components:

```plaintext
+-----------------------+      +----------------------+      +------------------------+
|   Developer Tools     |      |   Development Hub    |      |    CodeGen Platform    |
| (IDE, Git, CLI)       |----->| (GitHub, Linear, Slack)|----->| (The "Brain")          |
+-----------------------+      +----------------------+      +------------------------+
          ^                               |                      |
          |                               |                      |  +-------------------+
          |                               v                      v  |   Agent           |
          |                      +----------------------+      |   Orchestrator    |
          |                      |   CI/CD Environment  |      |-------------------|
          |                      | (GitHub Actions)     |      |   Integration     |
          |                      +----------------------+      |   Layer (Webhooks)  |
          |                               ^                      |-------------------|
          |                               |                      |   Secure Sandboxes  |
          +----------------------------------------------------+   (Execution Env)   |
                                                                 +-------------------+
```

**Flow Explanation:**

1. A **Developer** pushes code or makes a comment from their tools.
2. This creates an event in the **Development Hub** (e.g., a GitHub PR, a Slack message).
3. The **CodeGen Platform's** Integration Layer receives this event via a webhook.
4. The **Agent Orchestrator** selects the appropriate agent (e.g., `PR_REVIEW` or `CHECKS_AUTOFIXER`).
5. The agent executes its task within a **Secure Sandbox**, which might involve running tests in the **CI/CD Environment**.
6. The agent then sends its output (a PR comment, a code commit, a Slack message) back to the **Development Hub**.

## 3. Repository Project Structure

To ensure the AI assistant works effectively and predictably, every repository it monitors must adhere to the following structure:

```
my-repository/
├── .github/
│   └── workflows/
│       └── ci.yml        # Defines the CI/CD pipeline (tests, linting, build)
├── app/                  # Application source code
├── tests/                # Unit and integration tests
|
├── AGENTS.md             # CRITICAL: The rulebook for the AI assistant for this repo
├── codegen-setup.sh      # A shell script for setting up the sandbox environment
├── .trufflehogignore     # Configuration for the secret scanner
└── package.json          # Project dependencies and scripts
```

### Key File Descriptions

* **`AGENTS.md`**: This is the most important file for guiding the AI. It's a version-controlled prompt that tells the agent *how* to behave within this specific repository.

    *Abstract Pseudocode for `AGENTS.md`*

    ```markdown
    # AI Agent Rulebook for my-repository

    ## Principle: Code Style
    - The primary language is Python 3.11.
    - All code MUST be formatted with 'black'.
    - All functions must have Google-style docstrings.

    ## Principle: Testing
    - Every new feature or bug fix requires a corresponding unit test in the `/tests` directory.
    - Do not allow the overall test coverage to decrease.

    ## Principle: Architecture
    - Use the `FastAPI` framework for all new API endpoints.
    - Database interactions should use the `SQLAlchemy ORM` layer. Avoid writing raw SQL queries.
    - For handling asynchronous tasks, use the `Celery` library.
    ```

* **`codegen-setup.sh`**: This script provides a consistent, version-controlled way to prepare the agent's sandbox. It's more robust than just relying on the UI.

    *Abstract Pseudocode for `codegen-setup.sh`*

    ```bash
    #!/bin/bash
    echo "--- Setting up Python environment ---"
    python -m venv venv
    source venv/bin/activate

    echo "--- Installing dependencies ---"
    pip install -r requirements.txt

    echo "--- Environment setup complete ---"
    ```

## 4. Configuration Architecture (Inside Codegen)

This is how the Codegen platform itself would be configured:

* **Organization-Level Configuration**:
  * **Integrations**: GitHub, Slack, and Linear/Jira are connected and authorized.
  * **LLM Configuration**: The model is set to **Claude 4 Sonnet** for optimal performance, as recommended by the documentation.
  * **Agent Permissions**: `Enable PR Creation` and `Enable Rules Detection` are toggled ON. `Enforce Organization-wide Signed Commits` is also ON to enhance security.

* **Repository-Level Configuration**:
  * **Setup Commands**: This is configured to simply execute the script from our repository:

        ```
        bash codegen-setup.sh
        ```

  * **Repository Secrets**: Securely stores necessary environment variables like `DATABASE_URL_STAGING` or `NPM_TOKEN` that the agent needs to run tests or install private packages.

## 5. Abstract Data & Control Flow

Here is an abstract, pseudocode representation of the system's logic for two key workflows:

### Workflow 1: Automated PR Review

```pseudocode
FUNCTION on_pull_request(event):
    // Event triggered by GitHub webhook
    IF event.action == 'opened' OR event.action == 'synchronize':
        // Get context for the agent
        repo_rules = read_file_from_repo(event.repo, 'AGENTS.md')
        pr_diff = get_pull_request_diff(event.pr)
        context = "Review this PR based on these rules:" + repo_rules + "Here is the diff:" + pr_diff

        // Trigger the Codegen agent
        agent_run_id = codegen_api.create_agent_run(prompt=context, type='PR_REVIEW')

        // The Codegen platform handles the rest asynchronously
        // and posts comments back to the PR.
    END IF
END FUNCTION
```

### Workflow 2: CI/CD Auto-Fixing

```pseudocode
FUNCTION on_check_suite_completed(event):
    // Event triggered by GitHub webhook when a CI build finishes
    IF event.status == 'failure':
        // Get context for the agent
        build_logs = get_build_logs(event.check_suite)
        repo_rules = read_file_from_repo(event.repo, 'AGENTS.md')
        context = "The build failed. Fix it. Rules:" + repo_rules + "Logs:" + build_logs

        // Trigger the Codegen agent
        agent_run_id = codegen_api.create_agent_run(prompt=context, type='CHECKS_AUTOFIXER')

        // The Codegen platform will attempt to commit a fix back to the PR branch.
    END IF
END FUNCTION
```

This architecture creates a powerful, predictable, and maintainable system for leveraging AI in the development lifecycle. It treats the AI's configuration and rules as first-class citizens of the codebase, which is essential for scaling and trust.
