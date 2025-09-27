# Component Structure Plan

## 📁 Практическая структура файлов

```text
claude-code-ui/
├── app/                          # Next.js App Router
│   ├── (auth)/
│   │   ├── login/page.tsx
│   │   └── register/page.tsx
│   ├── api/
│   │   ├── auth/[...nextauth]/route.ts
│   │   ├── chat/
│   │   │   ├── route.ts
│   │   │   └── stream/route.ts
│   │   ├── files/
│   │   │   ├── tree/route.ts
│   │   │   ├── content/route.ts
│   │   │   └── search/route.ts
│   │   └── terminal/
│   │       ├── execute/route.ts
│   │       └── session/route.ts
│   ├── globals.css
│   ├── layout.tsx
│   └── page.tsx
├── components/
│   ├── ui/                       # shadcn/ui базовые компоненты
│   │   ├── button.tsx
│   │   ├── input.tsx
│   │   ├── dialog.tsx
│   │   ├── toast.tsx
│   │   └── ...
│   ├── chat/                     # Чат функциональность
│   │   ├── chat-interface.tsx
│   │   ├── message-list.tsx
│   │   ├── message-bubble.tsx
│   │   ├── chat-input.tsx
│   │   ├── code-block.tsx
│   │   └── typing-indicator.tsx
│   ├── file-system/              # Файловая система
│   │   ├── file-tree.tsx
│   │   ├── file-explorer.tsx
│   │   ├── file-preview.tsx
│   │   └── context-menu.tsx
│   ├── terminal/                 # Терминал
│   │   ├── terminal.tsx
│   │   ├── terminal-session.tsx
│   │   └── command-history.tsx
│   ├── layout/                   # Layout компоненты
│   │   ├── header.tsx
│   │   ├── sidebar.tsx
│   │   ├── main-layout.tsx
│   │   └── resizable-panels.tsx
│   └── common/                   # Общие компоненты
│       ├── command-palette.tsx
│       ├── theme-provider.tsx
│       ├── error-boundary.tsx
│       └── loading-spinner.tsx
├── lib/                          # Утилиты и конфигурация
│   ├── ai/
│   │   ├── anthropic.ts
│   │   ├── openai.ts
│   │   └── streaming.ts
│   ├── auth/
│   │   ├── config.ts
│   │   └── providers.ts
│   ├── db/
│   │   ├── schema.ts
│   │   └── queries.ts
│   ├── utils/
│   │   ├── cn.ts
│   │   ├── format.ts
│   │   └── validation.ts
│   └── validations/
│       ├── auth.ts
│       ├── chat.ts
│       └── files.ts
├── hooks/                        # Custom React hooks
│   ├── use-chat.ts
│   ├── use-file-system.ts
│   ├── use-terminal.ts
│   └── use-websocket.ts
├── stores/                       # Zustand stores
│   ├── chat-store.ts
│   ├── file-store.ts
│   ├── ui-store.ts
│   └── workspace-store.ts
├── types/                        # TypeScript типы
│   ├── api.ts
│   ├── chat.ts
│   ├── files.ts
│   └── terminal.ts
└── tests/                        # Тесты
    ├── __mocks__/
    ├── components/
    ├── hooks/
    └── e2e/
```

## 🧩 Core Components Implementation

### 1. Chat Interface Components

#### ChatInterface (главный компонент чата)

```typescript
// components/chat/chat-interface.tsx
interface ChatInterfaceProps {
  conversationId?: string;
  className?: string;
}

export function ChatInterface({ conversationId, className }: ChatInterfaceProps) {
  // Использует:
  // - MessageList для отображения сообщений
  // - ChatInput для ввода
  // - useChat hook для state management
  // - WebSocket для real-time updates
}
```

#### MessageList (виртуализированный список сообщений)

```typescript
// components/chat/message-list.tsx
interface MessageListProps {
  messages: Message[];
  isLoading: boolean;
  onMessageAction: (action: string, messageId: string) => void;
}

export function MessageList({ messages, isLoading, onMessageAction }: MessageListProps) {
  // Использует:
  // - @tanstack/react-virtual для производительности
  // - MessageBubble для каждого сообщения
  // - IntersectionObserver для lazy loading
}
```

#### CodeBlock (подсветка синтаксиса)

```typescript
// components/chat/code-block.tsx
interface CodeBlockProps {
  code: string;
  language: string;
  showLineNumbers?: boolean;
  copyable?: boolean;
}

export function CodeBlock({ code, language, showLineNumbers, copyable }: CodeBlockProps) {
  // Использует:
  // - Shiki для syntax highlighting
  // - Copy to clipboard функциональность
  // - Line numbers опционально
}
```

### 2. File System Components

#### FileTree (дерево файлов с виртуализацией)

```typescript
// components/file-system/file-tree.tsx
interface FileTreeProps {
  rootPath: string;
  onFileSelect: (path: string) => void;
  expandedPaths: Set<string>;
  onToggleExpand: (path: string) => void;
}

export function FileTree({ rootPath, onFileSelect, expandedPaths, onToggleExpand }: FileTreeProps) {
  // Использует:
  // - Виртуализацию для больших деревьев
  // - Lazy loading дочерних элементов
  // - Context menu интеграцию
  // - Drag & drop поддержку
}
```

#### FileExplorer (файловый менеджер)

```typescript
// components/file-system/file-explorer.tsx
interface FileExplorerProps {
  currentPath: string;
  onPathChange: (path: string) => void;
  showHidden?: boolean;
}

export function FileExplorer({ currentPath, onPathChange, showHidden }: FileExplorerProps) {
  // Использует:
  // - FileTree для навигации
  // - FilePreview для просмотра
  // - Search функциональность с fd/rg
}
```

### 3. Terminal Components

#### Terminal (основной терминал)

```typescript
// components/terminal/terminal.tsx
interface TerminalProps {
  sessionId: string;
  className?: string;
  onCommandExecute?: (command: string) => void;
}

export function Terminal({ sessionId, className, onCommandExecute }: TerminalProps) {
  // Использует:
  // - xterm.js для терминала
  // - WebSocket для команд
  // - Command history
  // - Auto-completion
}
```

### 4. Layout Components

#### MainLayout (основной layout)

```typescript
// components/layout/main-layout.tsx
interface MainLayoutProps {
  children: React.ReactNode;
  showSidebar?: boolean;
  showTerminal?: boolean;
}

export function MainLayout({ children, showSidebar, showTerminal }: MainLayoutProps) {
  // Использует:
  // - Resizable panels
  // - Responsive design
  // - Keyboard shortcuts
  // - State persistence
}
```

#### ResizablePanels (изменяемые панели)

```typescript
// components/layout/resizable-panels.tsx
interface ResizablePanelsProps {
  defaultSizes: number[];
  minSizes: number[];
  direction: 'horizontal' | 'vertical';
  children: React.ReactNode[];
}

export function ResizablePanels({ defaultSizes, minSizes, direction, children }: ResizablePanelsProps) {
  // Использует:
  // - Mouse drag для resize
  // - Keyboard shortcuts
  // - Size persistence в localStorage
  // - Responsive constraints
}
```

## 🎣 Custom Hooks

### Chat Management

```typescript
// hooks/use-chat.ts
export function useChat(conversationId?: string) {
  // Возвращает:
  // - messages: Message[]
  // - sendMessage: (content: string) => Promise<void>
  // - isLoading: boolean
  // - error: Error | null
  // - regenerateMessage: (messageId: string) => Promise<void>
}
```

### File System Operations

```typescript
// hooks/use-file-system.ts
export function useFileSystem(rootPath: string) {
  // Возвращает:
  // - fileTree: FileNode[]
  // - selectedFile: string | null
  // - readFile: (path: string) => Promise<string>
  // - writeFile: (path: string, content: string) => Promise<void>
  // - searchFiles: (query: string) => Promise<SearchResult[]>
}
```

### Terminal Management

```typescript
// hooks/use-terminal.ts
export function useTerminal(sessionId: string) {
  // Возвращает:
  // - terminalRef: RefObject<Terminal>
  // - executeCommand: (command: string) => void
  // - commandHistory: string[]
  // - isConnected: boolean
}
```

### WebSocket Connection

```typescript
// hooks/use-websocket.ts
export function useWebSocket(url: string) {
  // Возвращает:
  // - socket: WebSocket | null
  // - isConnected: boolean
  // - sendMessage: (data: any) => void
  // - lastMessage: MessageEvent | null
}
```

## 🗄️ State Management (Zustand)

### Chat Store

```typescript
// stores/chat-store.ts
interface ChatState {
  conversations: Conversation[];
  activeConversationId: string | null;
  messages: Message[];
  isStreaming: boolean;

  // Actions
  addMessage: (message: Message) => void;
  updateMessage: (messageId: string, updates: Partial<Message>) => void;
  setActiveConversation: (id: string) => void;
  startStreaming: () => void;
  stopStreaming: () => void;
}
```

### File System Store

```typescript
// stores/file-store.ts
interface FileSystemState {
  rootPath: string;
  fileTree: FileNode[];
  expandedPaths: Set<string>;
  selectedFile: string | null;
  searchResults: SearchResult[];

  // Actions
  setRootPath: (path: string) => void;
  toggleExpanded: (path: string) => void;
  selectFile: (path: string) => void;
  updateFileTree: (tree: FileNode[]) => void;
}
```

### UI Store

```typescript
// stores/ui-store.ts
interface UIState {
  sidebarCollapsed: boolean;
  terminalVisible: boolean;
  commandPaletteOpen: boolean;
  theme: 'light' | 'dark' | 'auto';

  // Actions
  toggleSidebar: () => void;
  toggleTerminal: () => void;
  setTheme: (theme: 'light' | 'dark' | 'auto') => void;
  openCommandPalette: () => void;
  closeCommandPalette: () => void;
}
```

## 🚀 CLI Tools Integration в компонентах

### File Search с fd и rg

```typescript
// lib/cli-tools/search.ts
export async function searchFiles(query: string, type: 'files' | 'content') {
  if (type === 'files') {
    // Использует fd для поиска файлов
    return execCommand(`fd "${query}" --type f --hidden --follow`);
  } else {
    // Использует rg для поиска в содержимом
    return execCommand(`rg "${query}" --type tsx --type ts --json`);
  }
}
```

### AST-based code analysis

```typescript
// lib/cli-tools/ast-analysis.ts
export async function findCodePatterns(pattern: string) {
  // Использует ast-grep для структурного поиска
  return execCommand(`ast-grep --pattern '${pattern}' --json`);
}

export async function refactorCode(pattern: string, replacement: string) {
  // Использует ast-grep для рефакторинга
  return execCommand(`ast-grep --pattern '${pattern}' --replace '${replacement}'`);
}
```

### Config management с jq и yq

```typescript
// lib/cli-tools/config.ts
export async function updatePackageJson(updates: object) {
  // Использует jq для обновления package.json
  const command = `jq '. + ${JSON.stringify(updates)}' package.json`;
  return execCommand(command);
}

export async function analyzeWorkflows() {
  // Использует yq для анализа GitHub Actions
  return execCommand(`yq '.jobs.*.steps[].name' .github/workflows/*.yml`);
}
```

## 📱 Responsive Design Strategy

### Breakpoints

```typescript
// lib/constants/breakpoints.ts
export const breakpoints = {
  mobile: '320px',
  tablet: '768px',
  desktop: '1024px',
  wide: '1440px',
} as const;
```

### Component adaptations

```typescript
// components/layout/adaptive-layout.tsx
export function AdaptiveLayout() {
  const isMobile = useMediaQuery('(max-width: 768px)');

  if (isMobile) {
    return (
      <MobileLayout>
        <CommandPalette /> {/* Всегда доступен через Cmd+K */}
        <TabSwitcher /> {/* Chat/Files/Terminal как табы */}
      </MobileLayout>
    );
  }

  return (
    <DesktopLayout>
      <Sidebar />
      <MainPanel />
      <Terminal />
    </DesktopLayout>
  );
}
```

## 🔧 Performance Optimizations

### Virtualization

```typescript
// Везде где списки >100 элементов
import { useVirtualizer } from '@tanstack/react-virtual';

// components/chat/message-list.tsx
export function MessageList({ messages }: { messages: Message[] }) {
  const virtualizer = useVirtualizer({
    count: messages.length,
    getScrollElement: () => parentRef.current,
    estimateSize: () => 100, // Примерная высота сообщения
  });

  // Рендерим только видимые элементы
}
```

### Code splitting

```typescript
// Lazy loading компонентов
const Terminal = lazy(() => import('@/components/terminal/terminal'));
const FileExplorer = lazy(() => import('@/components/file-system/file-explorer'));
const ChatInterface = lazy(() => import('@/components/chat/chat-interface'));
```

### Memoization

```typescript
// Мемоизация дорогих вычислений
const MemoizedFileTree = memo(FileTree, (prev, next) => {
  return prev.fileTree === next.fileTree && prev.expandedPaths === next.expandedPaths;
});
```

Эта структура компонентов обеспечивает модульность, переиспользование и масштабируемость для современного Claude Code UI.
