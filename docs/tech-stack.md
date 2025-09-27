# Claude Code UI - Technology Stack

## 📋 Обзор технологического стека

Этот документ определяет полный технологический стек для современной реализации Claude Code UI, включая обоснования выбора, версии и конфигурацию зависимостей.

## 🎯 Критерии выбора технологий

### Основные критерии

1. **Современность**: Использование последних стабильных версий
2. **Performance**: Максимальная производительность и UX
3. **DX (Developer Experience)**: Отличный опыт разработки
4. **Ecosystem**: Богатая экосистема и community support
5. **Vercel Integration**: Оптимизация под Vercel platform
6. **CLI Tools Integration**: Совместимость с `fd`, `rg`, `ast-grep`, `jq`, `yq`

## 🏗️ Основной стек

### Frontend Framework

```json
{
  "framework": "Next.js",
  "version": "15.0.x",
  "features": [
    "App Router",
    "React Server Components",
    "Streaming",
    "Parallel Routes",
    "Intercepting Routes"
  ],
  "rationale": "Лучшая производительность, отличная Vercel интеграция, современные React patterns"
}
```

### Language & Type Safety

```json
{
  "language": "TypeScript",
  "version": "5.3.x",
  "config": "strict mode",
  "features": [
    "Strict type checking",
    "Path mapping",
    "Decorators",
    "ES2023 target"
  ],
  "rationale": "Type safety, лучшая DX, рефакторинг, IDE поддержка"
}
```

### Styling & UI

```json
{
  "css_framework": "Tailwind CSS",
  "version": "4.0.x",
  "ui_library": "shadcn/ui",
  "icons": "Lucide React",
  "features": [
    "Utility-first CSS",
    "Dark mode support",
    "Responsive design",
    "Custom design tokens"
  ],
  "rationale": "Быстрый development, консистентность, accessibility"
}
```

## 📦 Детальная структура зависимостей

### Core Dependencies

```json
{
  "dependencies": {
    "next": "^15.0.0",
    "react": "^18.3.0",
    "react-dom": "^18.3.0",
    "typescript": "^5.3.0"
  },
  "reasoning": "Основные зависимости для Next.js приложения"
}
```

### AI & Backend Integration

```json
{
  "ai_dependencies": {
    "ai": "^3.4.0",
    "@ai-sdk/anthropic": "^0.0.48",
    "@ai-sdk/openai": "^0.0.65",
    "openai": "^4.63.0",
    "anthropic": "^0.27.0"
  },
  "backend": {
    "next-auth": "^5.0.0-beta.4",
    "@auth/prisma-adapter": "^2.5.0",
    "prisma": "^5.20.0",
    "@prisma/client": "^5.20.0"
  },
  "reasoning": "Vercel AI SDK для streaming, NextAuth v5 для современной аутентификации"
}
```

### State Management & Data Fetching

```json
{
  "state_management": {
    "zustand": "^5.0.0",
    "@tanstack/react-query": "^5.59.0",
    "jotai": "^2.10.0"
  },
  "reasoning": "Zustand для global state, React Query для server state, Jotai для atomic state"
}
```

### UI Components & Styling

```json
{
  "ui_dependencies": {
    "tailwindcss": "^4.0.0-alpha.25",
    "@tailwindcss/typography": "^0.5.15",
    "class-variance-authority": "^0.7.0",
    "clsx": "^2.1.1",
    "tailwind-merge": "^2.5.2"
  },
  "component_library": {
    "@radix-ui/react-accordion": "^1.2.1",
    "@radix-ui/react-alert-dialog": "^1.1.2",
    "@radix-ui/react-avatar": "^1.1.1",
    "@radix-ui/react-collapsible": "^1.1.1",
    "@radix-ui/react-dialog": "^1.1.2",
    "@radix-ui/react-dropdown-menu": "^2.1.2",
    "@radix-ui/react-hover-card": "^1.1.2",
    "@radix-ui/react-label": "^2.1.0",
    "@radix-ui/react-menubar": "^1.1.2",
    "@radix-ui/react-navigation-menu": "^1.2.1",
    "@radix-ui/react-popover": "^1.1.2",
    "@radix-ui/react-progress": "^1.1.0",
    "@radix-ui/react-radio-group": "^1.2.1",
    "@radix-ui/react-scroll-area": "^1.2.0",
    "@radix-ui/react-select": "^2.1.2",
    "@radix-ui/react-separator": "^1.1.0",
    "@radix-ui/react-slider": "^1.2.1",
    "@radix-ui/react-slot": "^1.1.0",
    "@radix-ui/react-switch": "^1.1.1",
    "@radix-ui/react-tabs": "^1.1.1",
    "@radix-ui/react-toast": "^1.2.2",
    "@radix-ui/react-toggle": "^1.1.0",
    "@radix-ui/react-toggle-group": "^1.1.0",
    "@radix-ui/react-tooltip": "^1.1.3"
  },
  "icons": {
    "lucide-react": "^0.447.0",
    "@tabler/icons-react": "^3.19.0"
  },
  "reasoning": "Radix UI для accessibility, headless components, Lucide для современных иконок"
}
```

### Terminal & Code Editing

```json
{
  "terminal_dependencies": {
    "@xterm/xterm": "^5.5.0",
    "@xterm/addon-attach": "^0.11.0",
    "@xterm/addon-fit": "^0.10.0",
    "@xterm/addon-search": "^0.15.0",
    "@xterm/addon-web-links": "^0.11.0",
    "@xterm/addon-webgl": "^0.18.0"
  },
  "code_highlighting": {
    "shiki": "^1.21.0",
    "react-markdown": "^9.0.1",
    "remark-gfm": "^4.0.0",
    "rehype-highlight": "^7.0.0"
  },
  "reasoning": "xterm.js для полнофункционального терминала, Shiki для syntax highlighting"
}
```

### File System & Git Integration

```json
{
  "file_system": {
    "chokidar": "^4.0.1",
    "mime-types": "^2.1.35",
    "file-type": "^19.5.0"
  },
  "git_integration": {
    "isomorphic-git": "^1.27.1",
    "simple-git": "^3.26.0"
  },
  "reasoning": "Chokidar для file watching, isomorphic-git для browser git operations"
}
```

### Form Handling & Validation

```json
{
  "forms": {
    "react-hook-form": "^7.53.0",
    "@hookform/resolvers": "^3.9.0",
    "zod": "^3.23.8"
  },
  "reasoning": "React Hook Form для performance, Zod для runtime type validation"
}
```

### Animation & Interactions

```json
{
  "animations": {
    "framer-motion": "^11.11.1",
    "@react-spring/web": "^9.7.4",
    "react-transition-group": "^4.4.5"
  },
  "interactions": {
    "@dnd-kit/core": "^6.1.0",
    "@dnd-kit/sortable": "^8.0.0",
    "@dnd-kit/utilities": "^3.2.2",
    "react-hotkeys-hook": "^4.5.1"
  },
  "reasoning": "Framer Motion для премиум анимаций, dnd-kit для drag-and-drop"
}
```

### Virtualization & Performance

```json
{
  "virtualization": {
    "@tanstack/react-virtual": "^3.10.8",
    "react-window": "^1.8.8",
    "react-window-infinite-loader": "^1.0.9"
  },
  "performance": {
    "use-debounce": "^10.0.3",
    "react-intersection-observer": "^9.13.1"
  },
  "reasoning": "Tanstack Virtual для больших списков, debounce для performance"
}
```

### Real-time Communication

```json
{
  "realtime": {
    "ws": "^8.18.0",
    "socket.io-client": "^4.8.0",
    "server-sent-events": "^0.9.0"
  },
  "reasoning": "WebSocket и SSE для real-time коммуникации"
}
```

### Utilities

```json
{
  "utilities": {
    "date-fns": "^4.1.0",
    "lodash-es": "^4.17.21",
    "nanoid": "^5.0.7",
    "uuid": "^10.0.0",
    "ms": "^2.1.3",
    "query-string": "^9.1.0"
  },
  "crypto": {
    "crypto-js": "^4.2.0",
    "bcryptjs": "^2.4.3"
  },
  "reasoning": "Минимальный набор utilities, tree-shakeable imports"
}
```

## 🧪 Development & Testing Dependencies

### Testing Framework

```json
{
  "unit_testing": {
    "vitest": "^2.1.1",
    "@vitejs/plugin-react": "^4.3.1",
    "jsdom": "^25.0.1"
  },
  "react_testing": {
    "@testing-library/react": "^16.0.1",
    "@testing-library/jest-dom": "^6.5.0",
    "@testing-library/user-event": "^14.5.2"
  },
  "e2e_testing": {
    "@playwright/test": "^1.48.0",
    "playwright": "^1.48.0"
  },
  "reasoning": "Vitest для быстрых unit тестов, Playwright для e2e тестов"
}
```

### Code Quality

```json
{
  "linting": {
    "eslint": "^9.12.0",
    "@typescript-eslint/eslint-plugin": "^8.8.0",
    "@typescript-eslint/parser": "^8.8.0",
    "eslint-config-next": "^15.0.0",
    "eslint-plugin-react": "^7.37.1",
    "eslint-plugin-react-hooks": "^4.6.2"
  },
  "formatting": {
    "prettier": "^3.3.3",
    "prettier-plugin-tailwindcss": "^0.6.8"
  },
  "reasoning": "ESLint v9 с flat config, Prettier для consistent formatting"
}
```

### Build Tools

```json
{
  "bundling": {
    "@next/bundle-analyzer": "^15.0.0",
    "webpack-bundle-analyzer": "^4.10.2"
  },
  "optimization": {
    "@vercel/speed-insights": "^1.0.12",
    "@vercel/analytics": "^1.3.1"
  },
  "reasoning": "Bundle analysis для optimization, Vercel analytics для мониторинга"
}
```

### Git Hooks & Automation

```json
{
  "git_hooks": {
    "husky": "^9.1.6",
    "lint-staged": "^15.2.10",
    "commitizen": "^4.3.1",
    "@commitlint/cli": "^19.5.0",
    "@commitlint/config-conventional": "^19.5.0"
  },
  "reasoning": "Husky для git hooks, conventional commits для consistency"
}
```

## 🚀 CLI Tools Integration

### Modern CLI Tools (Обязательные)

```bash
# Core CLI tools для development workflow
fd          # v10.2.0+ - Fast file finder
rg          # v14.1.0+ - ripgrep для search
ast-grep    # v0.28.0+ - Structural search and replace
jq          # v1.7.1+ - JSON processor
yq          # v4.44.3+ - YAML processor

# Дополнительные tools
fzf         # v0.55.0+ - Fuzzy finder
bat         # v0.24.0+ - Better cat with syntax highlighting
exa         # v0.10.1+ - Modern ls replacement
```

### Integration в package.json

```json
{
  "scripts": {
    "find:components": "fd 'component' app/ components/ --type f",
    "find:hooks": "rg 'use[A-Z]' --type tsx --only-matching",
    "find:todos": "rg 'TODO|FIXME|HACK' --type ts --type tsx",
    "find:any": "rg 'any' --type ts | wc -l",
    "ast:exports": "ast-grep --pattern 'export default $$$'",
    "ast:classnames": "ast-grep --pattern 'className=\"$$$\"' --replace 'className={cn(\"$$$\")}'",
    "config:deps": "jq '.dependencies | keys[]' package.json",
    "config:scripts": "jq '.scripts' package.json",
    "ci:workflows": "yq '.jobs.*.steps[].name' .github/workflows/*.yml"
  }
}
```

## 🔧 Configuration Files

### TypeScript Configuration

```json
{
  "compilerOptions": {
    "target": "ES2023",
    "lib": ["dom", "dom.iterable", "es6"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"],
      "@/components/*": ["./components/*"],
      "@/lib/*": ["./lib/*"],
      "@/hooks/*": ["./hooks/*"],
      "@/stores/*": ["./stores/*"],
      "@/types/*": ["./types/*"]
    }
  }
}
```

### Tailwind Configuration

```javascript
module.exports = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      colors: {
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        // ... остальные цвета shadcn/ui
      },
      fontFamily: {
        sans: ["var(--font-geist-sans)"],
        mono: ["var(--font-geist-mono)"],
      },
      animation: {
        "fade-in": "fadeIn 0.5s ease-in-out",
        "slide-in": "slideIn 0.3s ease-out",
        "pulse-slow": "pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite",
      },
    },
  },
  plugins: [
    require("tailwindcss-animate"),
    require("@tailwindcss/typography"),
  ],
}
```

### ESLint Configuration (Flat Config)

```javascript
import { FlatCompat } from "@eslint/eslintrc";
import js from "@eslint/js";
import typescriptEslint from "@typescript-eslint/eslint-plugin";
import tsParser from "@typescript-eslint/parser";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const compat = new FlatCompat({
  baseDirectory: __dirname,
  recommendedConfig: js.configs.recommended,
  allConfig: js.configs.all
});

export default [
  {
    ignores: [
      "**/.next/",
      "**/node_modules/",
      "**/dist/",
      "**/.vercel/",
    ],
  },
  ...compat.extends(
    "next/core-web-vitals",
    "@typescript-eslint/recommended",
    "prettier"
  ),
  {
    plugins: {
      "@typescript-eslint": typescriptEslint,
    },
    languageOptions: {
      parser: tsParser,
    },
    rules: {
      "@typescript-eslint/no-unused-vars": "error",
      "@typescript-eslint/no-explicit-any": "warn",
      "prefer-const": "error",
      "no-var": "error",
    },
  },
];
```

## 📊 Performance Budget

### Bundle Size Targets

```yaml
performance_budget:
  initial_bundle: "200KB gzipped"
  total_bundle: "500KB gzipped"
  chunk_size: "100KB max per chunk"

lighthouse_targets:
  performance: ">90"
  accessibility: ">95"
  best_practices: ">90"
  seo: ">90"

core_web_vitals:
  lcp: "<2.5s"
  fid: "<100ms"
  cls: "<0.1"
```

## 🔒 Security Dependencies

```json
{
  "security": {
    "@vercel/csrf": "^0.1.0",
    "helmet": "^7.1.0",
    "rate-limiter-flexible": "^5.0.3"
  },
  "validation": {
    "validator": "^13.12.0",
    "dompurify": "^3.1.7"
  }
}
```

## 📈 Monitoring & Analytics

```json
{
  "monitoring": {
    "@vercel/analytics": "^1.3.1",
    "@vercel/speed-insights": "^1.0.12",
    "sentry": "^8.33.1"
  },
  "performance": {
    "web-vitals": "^4.2.3"
  }
}
```

## 🚀 Deployment & Infrastructure

### Vercel Configuration

```json
{
  "framework": "nextjs",
  "buildCommand": "npm run build",
  "devCommand": "npm run dev",
  "installCommand": "npm ci",
  "outputDirectory": ".next",
  "functions": {
    "app/api/chat/stream.ts": {
      "runtime": "edge"
    },
    "app/api/terminal/execute.ts": {
      "runtime": "nodejs20.x",
      "maxDuration": 30
    }
  },
  "regions": ["iad1", "sfo1", "lhr1"],
  "crons": [
    {
      "path": "/api/cleanup",
      "schedule": "0 2 * * *"
    }
  ]
}
```

## 📚 Documentation

```json
{
  "documentation": {
    "@storybook/react": "^8.3.5",
    "@storybook/nextjs": "^8.3.5",
    "typedoc": "^0.26.8"
  }
}
```

Этот технологический стек обеспечивает современную, масштабируемую и производительную основу для разработки Claude Code UI с интеграцией всех необходимых CLI инструментов и best practices.
