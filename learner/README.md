# Learner 知识库

> 部署于云端 hermes-agent（43.173.247.213），定时同步至 GitHub。
> 本地通过 `git pull` 获取最新笔记。

## 目录结构

```
learner/
├── README.md                   # 本文件
├── sync.sh                     # 云端自动同步脚本
├── 01-user-persona.md          # 学习者画像
├── 02-bot-soul.md              # Agent 灵魂
├── 03-user-notes.md            # 运行时追踪
└── knowledge-base/             # 核心知识库
    ├── sources/                # 信息源档案（绝对不能丢）
    │   ├── index.md            # 所有信息源总索引
    │   ├── by-type/            # 按类型分类
    │   │   ├── documentation.md
    │   │   ├── video-podcast.md
    │   │   ├── papers.md
    │   │   ├── code-projects.md
    │   │   ├── books.md
    │   │   ├── newsletters.md
    │   │   └── communities.md
    │   └── by-status/          # 按处理状态分类
    │       ├── untriaged.md
    │       ├── processing.md
    │       ├── extracted.md
    │       └── archived.md
    ├── inbox/                  # 待处理原始素材（按月分文件夹）
    ├── notes/                  # 结构化永久笔记
    │   ├── concepts/           # 核心概念卡（Zettelkasten）
    │   ├── tutorials/          # 教程笔记
    │   ├── snippets/           # 代码片段
    │   └── reflections/        # 个人思考
    ├── outputs/                # 输出产物
    │   ├── x-angles/           # X 推文角度
    │   ├── douyin-outlines/    # 抖音脚本大纲
    │   └── projects/           # 项目笔记
    ├── progress/               # 学习进度
    │   ├── active-topics.md
    │   ├── completed.md
    │   └── reviews/            # 周期性复盘
    └── meta/                   # 元数据
        ├── voice-dna.md
        └── changelog.md
```

## 同步机制

### 云端（自动）

```bash
# 1. 将 sync.sh 放到云端服务器
scp learner/sync.sh ubuntu@43.173.247.213:~/knowledge-database/learner/

# 2. 添加 cron 定时任务（每两天同步一次，凌晨 3 点执行）
ssh ubuntu@43.173.247.213 "crontab -l | { cat; echo '0 3 */2 * * cd ~/knowledge-database && bash learner/sync.sh >> learner/sync.log 2>&1'; } | crontab -"
```

### 本地（手动）

```bash
git pull origin main
```

## 信息源管理原则

1. **所有信息源必须有出处**：链接、作者、获取时间
2. **原始链接绝不删除**：即使内容失效，保留 URL 和快照时间
3. **按状态流转**：untriaged → processing → extracted → archived
4. **定期清理 inbox**：inbox 只存 30 天内素材，超期必须分类或丢弃
