# Book2Skill Factory

[English](#english) | [中文](#中文)

---

## 中文

### 🎯 项目简介

**Book2Skill Factory** 是一个强大的 Claude Code Skill，能够将方法论书籍转换为符合官方规范的 Claude Code Plugin Package。

**核心能力：**
- ✅ 将书籍转换为官方 Plugin 格式（包含 marketplace.json）
- ✅ 自动生成多个 Skills（每个框架/工具一个 Skill）
- ✅ 创建详细的 Reference 文档（每个 5,000-8,000 字）
- ✅ 生成可用的 Templates（工作表和模板）
- ✅ 提供一键部署脚本（Linux/Mac/Windows）

**为什么使用 Book2Skill Factory？**

传统的书籍总结只是"摘要"，而 Book2Skill Factory 创建的是**可执行的技能系统**：

```
❌ 传统方式：读书 → 做笔记 → 忘记
✅ Book2Skill Factory：读书 → 生成 Plugin → 立即可用 → 持续迭代
```

---

### 🚀 快速开始

#### 1. 安装 Book2Skill Factory

```bash
# 复制到你的 Claude Code skills 目录
cp -r book2skill-factory ~/.claude/skills/

# 重启 Claude Code
```

#### 2. 使用 Book2Skill Factory

在 Claude Code 中：

```
"使用 book2skill-factory 将《蓝海战略》转换为 Plugin"
```

#### 3. 部署生成的 Plugin

```bash
cd blue-ocean-strategy-pro/deploy

# Linux/Mac
./install-independent.sh

# Windows (双击运行)
install-independent.bat
```

#### 4. 重启 Claude Code

你的新 Plugin 就可以使用了！

---

### 📚 适用书籍类型

**最佳匹配：**
- ✅ 创业方法论（如《蓝海战略》《精益创业》）
- ✅ 产品设计（如《设计心理学》《启示录》）
- ✅ 战略管理（如《竞争战略》《好战略，坏战略》）
- ✅ 销售谈判（如《谈判力》《影响力》）
- ✅ 个人成长（如《原子习惯》《深度工作》）

**不适合：**
- ❌ 纯小说（文学性太强）
- ❌ 纯哲学（缺少可执行框架）
- ❌ 叙事性非虚构（缺少方法论）

---

### 🎁 核心功能

#### 1. 智能书籍适配性评估

自动判断书籍是否适合转换为 Plugin：
- 框架密度评估
- 工具可执行性评估
- 目标用户匹配度评估

#### 2. 任务单元提取

从书中识别和提取：
- 核心框架和模型
- 可执行的工具和方法
- 实际应用场景
- 常见误区和陷阱

#### 3. 官方 Plugin 格式输出

生成符合 Anthropic 官方规范的 Plugin Package

#### 4. 渐进式信息披露

- **SKILL.md** (1,000-2,000 字)：快速开始
- **references/** (5,000-8,000 字/篇)：深度学习

---

### 📖 成功案例

#### 案例：蓝海战略

**输入：**《蓝海战略》一书

**输出：** `blue-ocean-strategy-pro` Plugin Package

**包含内容：**
- 6 个独立 Skills（ERRC、非客户分析、战略布局图等）
- 7 个详细 Reference 文档（46,000 字）
- 3 个可用的 Templates（ERRC 矩阵、非客户分析表等）
- 一键部署脚本

**效果：**
- ✅ 5-8 小时完成完整转换
- ✅ 所有框架立即可用
- ✅ 支持实战场景应用

---

### 🛠️ 部署选项

Book2Skill Factory 提供两种部署方式：

#### 方式 1: Official Marketplace（单插件推荐）

```bash
./install-official.sh  # Linux/Mac
install-official.bat   # Windows
```

#### 方式 2: Independent Marketplace（多插件推荐）⭐

```bash
./install-independent.sh  # Linux/Mac
install-independent.bat   # Windows
```

**特点：**
- 每个插件独立的 marketplace
- 零冲突，完全隔离
- **推荐用于多个书籍 Plugin**

---

### 📊 项目结构

```
book2skill-factory/
├── SKILL.md                      # 主 Skill 文件
├── README.md                     # 本文件
├── changelog.md                  # 版本历史
├── package-map.md                # 包映射关系
├── deploy/                       # 部署脚本
├── references/                   # 参考文档
├── examples/                     # 示例
└── tests/                        # 测试
```

---

### 🤝 贡献指南

欢迎贡献！以下是贡献方式：

1. **报告 Bug**：提交 Issue
2. **建议功能**：提交 Feature Request
3. **提交代码**：Pull Request
4. **分享案例**：提交成功案例到 `references/success-stories/`

---

### 📝 许可证

MIT License

---

### 🔗 相关资源

- **官方文档**：https://code.claude.com/docs/en/plugin-marketplaces
- **成功案例**：`references/success-stories/blue-ocean-strategy.md`

---

## English

### 🎯 Project Overview

**Book2Skill Factory** converts methodology books into official Claude Code Plugin Packages.

**Core Capabilities:**
- ✅ Convert books to official Plugin format
- ✅ Auto-generate multiple Skills
- ✅ Create detailed Reference docs
- ✅ Generate usable Templates
- ✅ Provide deployment scripts

---

### 🚀 Quick Start

#### 1. Install

```bash
cp -r book2skill-factory ~/.claude/skills/
```

#### 2. Use

In Claude Code:

```
"Use book2skill-factory to convert 'Blue Ocean Strategy' to a Plugin"
```

#### 3. Deploy

```bash
cd blue-ocean-strategy-pro/deploy
./install-independent.sh  # Linux/Mac
install-independent.bat   # Windows
```

---

### 📚 Suitable Book Types

**Best Fit:**
- ✅ Entrepreneurship
- ✅ Product Design
- ✅ Strategy & Management
- ✅ Sales & Negotiation
- ✅ Personal Growth

---

### 🎁 Core Features

1. **Intelligent Assessment** - Auto-evaluates book suitability
2. **Task Extraction** - Identifies frameworks and tools
3. **Official Format** - Compliant with Anthropic specs
4. **Progressive Disclosure** - Quick start + deep dive

---

### 📖 Success Stories

**Blue Ocean Strategy:**
- 6 independent Skills
- 46,000 words of documentation
- Complete in 5-8 hours

---

### 🛠️ Deployment Options

**Independent Marketplace** (Recommended):
```bash
./install-independent.sh
```

**Official Marketplace:**
```bash
./install-official.sh
```

---

### 🤝 Contributing

1. Report Bugs
2. Suggest Features
3. Submit Code
4. Share Cases

---

### 📝 License

MIT License

---

## 🎊 Star History

如果这个项目对你有帮助，请给一个 ⭐️ Star！

If this project helps you, please give it a ⭐️ Star!

---

**Made with ❤️ by the Vibe Coding Community**

**Last Updated:** 2026-03-26  
**Version:** v2.1 (Official Plugin Format)
