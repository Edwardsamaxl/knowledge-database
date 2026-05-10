---
name: Learner 知识库规范
description: learner 知识库的完整规范、信息源管理、笔记格式与同步机制
type: project
---

# Learner 知识库规范

## 知识库结构

```
learner/knowledge-base/
├── sources/                    # 信息源档案（绝对不能丢）
│   ├── index.md                # 所有信息源总索引
│   ├── by-type/                # 按类型分类
│   │   ├── documentation.md    # 官方文档、教程
│   │   ├── video-podcast.md    # 视频、播客
│   │   ├── papers.md           # 论文、研究报告
│   │   ├── code-projects.md    # GitHub 项目、代码片段
│   │   ├── books.md            # 书籍、电子书
│   │   ├── newsletters.md      # Newsletter、博客
│   │   └── communities.md      # 社区讨论、论坛
│   └── by-status/              # 按处理状态分类
│       ├── untriaged.md        # 刚收集，未处理
│       ├── processing.md       # 正在学习/处理中
│       ├── extracted.md        # 已提取核心笔记
│       └── archived.md         # 已归档
├── inbox/                      # 待处理的原始素材（按月分文件夹）
├── notes/                      # 结构化永久笔记
│   ├── concepts/               # 核心概念卡（Zettelkasten）
│   ├── tutorials/              # 教程笔记
│   ├── snippets/               # 代码片段
│   └── reflections/            # 个人思考
├── outputs/                    # 输出产物
│   ├── x-angles/               # X 推文角度
│   ├── douyin-outlines/        # 抖音脚本大纲
│   └── projects/               # 项目笔记
├── progress/                   # 学习进度
│   ├── active-topics.md        # 当前在学主题
│   ├── completed.md            # 已完成主题
│   └── reviews/                # 周期性复盘
└── meta/                       # 元数据
    ├── voice-dna.md            # 语言风格
    └── changelog.md            # 知识库变更日志
```

## 信息源管理（核心）

### 信息源分级（按类型）

与 media-bot 的 S/A/B 分级不同，learner 按**内容类型**组织，因为学习场景的信息源远比策展场景丰富：

| 类型 | 说明 | 示例 |
|------|------|------|
| 官方文档/教程 | 一手信息，最可靠 | Claude Docs, Next.js 官方教程 |
| 视频/播客 | 直观但信息密度低 | YouTube 教程, 小宇宙播客 |
| 论文/研究 | 深度但门槛高 | arXiv, 技术博客长文 |
| 代码/项目 | 可运行、可验证 | GitHub 仓库, Gist |
| 书籍/专栏 | 系统性强，耗时长 | 微信读书, 小册 |
| Newsletter | 周期性，需筛选 | 邮件订阅, RSS |
| 社区讨论 | 真实痛点，一手反馈 | 即刻, V2EX, HN |

### 信息源状态流转

```
untriaged（刚收集）
    ↓ 评估：有价值？
    ├─→ processing（正在学）
    │       ↓ 学习完毕
    │       ├─→ extracted（笔记已提取）→ 进入 notes/
    │       └─→ archived（无需深入）
    └─→ 直接丢弃（无价值）
```

### 信息源记录原则

1. **原始链接绝不删除**：即使内容失效，保留 URL 和获取时间
2. **关键内容本地备份**：重要文章保存核心段落到 inbox/
3. **每条必须有类型和状态**：不分类就等于丢失
4. **untriaged 不超过 20 条**：超过说明摄入速度 > 处理速度

## 笔记格式规范

### 概念卡（Zettelkasten）

- 一个概念一个文件
- 用自己的话写，不允许复制粘贴
- 必须链接到至少一个已有概念
- 必须包含"我还不知道什么"追问

### 教程笔记

- 第一人称记录："我跟着做..."
- 记录实际运行的命令和输出
- 专门有一个"踩坑汇总"区域
- 最后必须回答"如果重来一遍，我会跳过什么"

### 代码片段

- 必须可直接复制运行
- 标注语言和用途
- 标注来源（防止版权或后续更新问题）

## 同步机制

### 云端自动同步

- 脚本：`learner/sync.sh`
- 运行环境：hermes-agent（43.173.247.213）
- 频率：每两天（cron）
- 逻辑：检测变更 → 自动 commit → push 到 GitHub

### 本地获取

```bash
git pull origin main
```

### 冲突处理

云端脚本使用 `git pull --no-rebase`，如产生冲突会暂停同步并记录到 `sync.log`，需要手动解决。

## 标签体系

### 领域标签

`#ai-tools` `#coding` `#business-model` `#content-creation` `#learning-methods`

### 进度标签

`#untriaged` `#processing` `#extracted` `#archived`

### 输出标签

`#x-angle` `#douyin-outline` `#project-note` `#tutorial`
