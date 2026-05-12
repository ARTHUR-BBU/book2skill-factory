# Book2Skill Factory

[![Claude Code](https://img.shields.io/badge/Claude-Code-Plugin-blue)](https://code.claude.com/docs/en/plugin-marketplaces)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://img.shields.io/github/stars/ARTHUR-BBU/book2skill-factory-?style=social)](https://github.com/ARTHUR-BBU/book2skill-factory-/stargazers)

[English](#english) | [中文](#中文)

---

## 中文

### 🎯 项目简介

**Book2Skill Factory** 是一个 Claude Code Skill，能把任何书籍转换成 agent 可读、可用的 Skill 或 Plugin Package。

**🧠 核心洞察：大多数 AI 模型已经"读过"你的书了。**

它们在训练时就读过数百万本书籍、论文和文章。问题不在于它们没读过——而在于它们不知道怎么把那些知识变成**结构化的、可执行的 skill** 来帮你解决问题。

Book2Skill Factory 就是那个缺失的 **harness（框架）**：
- ❌ 没有 book2skill：模型"知道"这本书，但没法系统地用它来帮你
- ✅ 有了 book2skill：模型按照结构化流程，把知识变成可部署、可触发的 skill

**你甚至不需要上传整本书。** 只需要说"把《XX》变成skill"，模型就会用已有知识 + book2skill 流程直接生成。

**核心能力：**
- ✅ 智能评估书籍类型 → 自动决定最佳 Skill 形态（方法论/风格模仿/决策框架/习惯系统…）
- ✅ 方法论书籍 → 多 Skill 插件包（含 marketplace.json）
- ✅ 写作/风格书籍 → 风格模仿 Skill
- ✅ 商业传记 → 决策框架 Skill
- ✅ 小说 → 创作风格复刻 Skill
- ✅ Reference 深度文档（渐进式披露，agent 用得上的才是好 reference）
- ✅ 一键部署脚本（Linux/Mac/Windows）
- ✅ Plugin 格式打包（方便安装、管理、分享给团队）

**为什么使用 Book2Skill Factory？**

传统的书籍总结只是"摘要"，而 Book2Skill Factory 创建的是**可执行的技能系统**：

```
❌ 传统方式：读书 → 做笔记 → 忘记
✅ Book2Skill Factory：一本书 → Skill/Plugin → Agent 直接用 → 帮你解决实际问题
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
- ✅ 几分钟内完成完整转换
- ✅ 所有框架立即可用
- ✅ 支持实战场景应用
- ✅ 打包成 Plugin，方便分享给团队

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

**Book2Skill Factory** transforms any book into agent-readable, agent-usable skills or plugin packages for Claude Code.

**🧠 Key Insight: Most AI models have already "read" your book.**

They trained on millions of books, papers, and articles. The problem isn't that they haven't read it — the problem is they don't know how to turn that knowledge into a **structured, executable skill** that helps users solve problems.

Book2Skill Factory is the missing **harness**:
- ❌ Without book2skill: The model "knows" the book but can't systematically use it to help you
- ✅ With book2skill: The model follows a structured workflow to turn knowledge into deployable, triggerable skills

**You don't even need to upload the book.** Just say "Turn [Book Name] into a skill" and the model uses its existing knowledge + book2skill's harness to generate.

**Core Capabilities:**
- ✅ Smart book assessment → determines optimal skill format automatically
- ✅ 7 book types supported: methodology, writing craft, biography, productivity, sales/negotiation, fiction, academic
- ✅ Methodology books → multi-skill plugin packages
- ✅ Style books → pattern emulation skills
- ✅ Fiction → creative writing emulation skills
- ✅ Deep references for progressive disclosure
- ✅ Plugin packaging for easy install, management, and team sharing

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

### 📚 Supported Book Types

**Every book has extractable value:**
- ✅ Methodology / Framework books (Blue Ocean Strategy, Lean Startup…)
- ✅ Writing Craft / Style books (On Writing, Storyworthy…)
- ✅ Business Biography (Shoe Dog, The Everything Store…)
- ✅ Personal Productivity (Atomic Habits, Deep Work…)
- ✅ Sales / Negotiation (Never Split the Difference, SPIN Selling…)
- ✅ Fiction (narrative techniques, voice emulation)
- ✅ Academic / Research (Thinking Fast and Slow…)

---

### 🎁 Core Features

1. **Intelligent Assessment** - Determines skill format based on book type
2. **Value Extraction** - Pulls frameworks, patterns, or style based on what the book offers
3. **Official Format** - Compliant with Anthropic plugin specs
4. **Progressive Disclosure** - SKILL.md for quick use, references for depth

---

### 📖 Success Stories

**Blue Ocean Strategy (Methodology book → Multi-skill plugin):**
- 6 independent workflow skills (ERRC, Six Paths, Strategy Canvas…)
- 46,000 words of deep references
- Packaged as plugin with one-command install

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

**Last Updated:** 2026-05-12  
**Version:** v3.0 (Smart Book Assessment)
