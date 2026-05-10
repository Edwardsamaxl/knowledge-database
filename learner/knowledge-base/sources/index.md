---
name: Learner 信息源总索引
description: 所有信息源的集中目录，确保没有任何源丢失
type: reference
---

# 信息源总索引

> **核心原则**：每一个进入 learner 的信息源，无论最终是否有用，都必须在这里留下记录。
> 原始链接绝不删除。

## 按类型索引

| 类型 | 文件 | 数量 | 最后更新 |
|------|------|------|----------|
| 官方文档 / 教程 | [by-type/documentation.md](by-type/documentation.md) | - | - |
| 视频 / 播客 | [by-type/video-podcast.md](by-type/video-podcast.md) | - | - |
| 论文 / 研究报告 | [by-type/papers.md](by-type/papers.md) | - | - |
| 代码 / 开源项目 | [by-type/code-projects.md](by-type/code-projects.md) | - | - |
| 书籍 / 电子书 | [by-type/books.md](by-type/books.md) | - | - |
| Newsletter / 博客 | [by-type/newsletters.md](by-type/newsletters.md) | - | - |
| 社区讨论 / 论坛 | [by-type/communities.md](by-type/communities.md) | - | - |

## 按状态索引

| 状态 | 文件 | 说明 |
|------|------|------|
| 未分类 | [by-status/untriaged.md](by-status/untriaged.md) | 刚收集，尚未评估 |
| 处理中 | [by-status/processing.md](by-status/processing.md) | 正在学习/阅读中 |
| 已提取 | [by-status/extracted.md](by-status/extracted.md) | 核心笔记已提取 |
| 已归档 | [by-status/archived.md](by-status/archived.md) | 学习完毕，已存档 |

## 信息源记录格式

每个信息源必须包含以下字段：

```markdown
### [信息源名称]

- **URL**: [原始链接]
- **类型**: 文档 / 视频 / 论文 / 代码 / 书籍 / Newsletter / 社区
- **获取时间**: YYYY-MM-DD
- **状态**: untriaged / processing / extracted / archived
- **关联主题**: [链接到 notes/concepts/ 下的概念卡]
- **一句话摘要**: [这玩意儿是什么]
- **原始快照**: [如有，保存关键段落或截图路径]
```

## 变更日志

| 日期 | 操作 | 详情 |
|------|------|------|
| 2025-05-10 | 创建 | 初始化信息源管理体系 |
