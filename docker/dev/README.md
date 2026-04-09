# Dev Container

这套容器专门给本仓库的 WebUI 改造用，目标是：

- 容器里运行 OpenCode headless server
- 容器里运行 `packages/app` 的 Vite dev server
- OpenCode 运行时数据保持在容器内部
- 只暴露开发代码目录和知识数据目录

## 端口

- WebUI: `http://localhost:13000`
- OpenCode server: `http://localhost:14096`

这两个端口刻意避开了本机常见的 `3000/4096/4444` 组合，方便和你现有环境并存。

## 启动

```bash
./script/dev-container.sh up --build
```

后台启动：

```bash
./script/dev-container.sh up --build -d
```

停止：

```bash
./script/dev-container.sh down
```

查看日志：

```bash
./script/dev-container.sh logs -f
```

## 隔离策略

- 代码目录挂载为：
  - `/Users/guochaoyuan/context-infrastructure/formal_projects/opencode`
- 知识数据目录挂载为：
  - `/Users/guochaoyuan/context-infrastructure/formal_projects/knowledge_data`
- 容器内路径会精简为：
  - `/workspace/opencode`
  - `/workspace/knowledge_data`
- OpenCode 运行时数据保留在容器内部默认位置，不落到宿主机
- `node_modules` 仍使用独立 Docker volume，避免污染宿主机 checkout

## 使用建议

第一次进入时，从 `http://localhost:13000` 打开 WebUI。

如果你要继续打开某个具体知识目录，优先把知识内容放到
`/Users/guochaoyuan/context-infrastructure/formal_projects/knowledge_data`
下面，再在这套容器环境里进入对应目录。

注意：
这套隔离环境里的目录路径会是 `/workspace/knowledge_data/...`，所以如果你保存过旧的 URL，里面编码的目录路径也要以容器内路径为准，不能直接复用宿主机路径版本。
