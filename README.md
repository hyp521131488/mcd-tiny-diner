<div align="center">

# 🍟 麦麦小人之眼 · Tiny Eye

**麦当劳第一次学会用两岁的方式说话**

[![Contest](https://img.shields.io/badge/M--CODE-1024%20程序员节创意开发大赛-FFC72C)](https://github.com/M-China-Official/mcd-developer-innovation-challenge)
[![MCP](https://img.shields.io/badge/McDonald's-MCP-DA291C)](https://open.mcd.cn/mcp)
[![WorkBuddy](https://img.shields.io/badge/Built%20with-WorkBuddy-2B6CB0)](https://www.workbuddy.cn)

</div>

---

## 这是什么

**Tiny Eye（麦麦小人之眼）** 是一个写给 **2 岁小朋友** 的麦当劳点餐 Skill。

主流的点餐助手都在服务成年人：更快下单、更省钱、更懂优惠。
Tiny Eye 反其道而行 —— **它服务的是那个看不懂一个字、说不清一句完整话、却对薯条有强烈主张的两岁人类。**

它不要求孩子适应系统，而是让系统蹲下来，用孩子的语言重新描述整个麦当劳。

> 别人做的是「AI 帮成人点麦当劳」；
> 我们做的是「**麦当劳学会用两岁的方式说话**」。

---

## 它解决什么真实问题

| 角色 | 痛点 | Tiny Eye 怎么解 |
|---|---|---|
| 2 岁小朋友 | 看不懂菜单、说不清想要什么、被大人替做决定 | 用手指戳、用声音模仿、用表情表达，**孩子第一次成为点餐的主角** |
| 年轻父母 | 哄不住、怕点错、怕噎到、怕太咸 | 份量与嚼咽风险提示、情绪感知、只用两个选项降低决策负担 |
| 门店/品牌 | 亲子场景无数字化抓手 | 天然的短视频传播点，孩子对着麦当劳「嘎嘎」说话 |

---

## 三种孩子视角的触发方式

### 1. 指一下（Point & See）

家长拍一张菜单或餐厅屏幕的照片，孩子用手指戳屏幕上最想要的那个。
Tiny Eye 用视觉识别出指向的餐品，然后用两岁能懂的话讲出来：

> 「黄的、圆圆的、咬下去喳喳响的 —— 是薯条哦。要吗？」

**先描述，再确认，最后才下单。** 不跳步。

### 2. 学声音（Sound Play）

孩子说「嘎嘎」「咕噜咕噜」、模仿咀嚼，Tiny Eye 把声音翻译成口感偏好：
脆的？有嚼劲的？软糯的？再结合 `list-nutrition-foods` 的营养数据，
帮他筛掉不适合 2 岁的选项（过咸、过硬、易噎）。

### 3. 今天心情（Mood First）

家长代选一个表情：**开心 / 累了 / 闹脾气**。

- 闹脾气 → 只给 **两个选项**（幼儿决策极限是 2，不是 10）
- 累了 → 优先「能用手抓着吃、不洒、不脏衣服」
- 开心 → 允许一次「小小的新鲜」

---

## 杀手锏：Why-Why 小人之问

两岁孩子最爱问「为什么」。Tiny Eye **反过来向孩子提问**，
把汉堡的每一层对应到他的今天：

| 汉堡的一层 | 孩子被问到的问题 | 实际在做的搭配决策 |
|---|---|---|
| 面包 | 「今天太阳大不大？」 | 选烤的 / 蒸的 |
| 牛肉饼 | 「你今天跑得快吗？」 | 蛋白质与热量是否够 |
| 生菜 | 「小青菜也想跟你去公园」 | 蔬菜摄入 |

**点完一餐 = 陪孩子玩了一遍，还顺便完成了营养搭配。**

---

## 效果演示

```
家长：（拍照菜单）
小朋友：（手指戳在黄色条状物上）

Tiny Eye：  🟡 黄的、长长的、咬下去「咔嚓」响的。
            这是薯条哦。要吗？
小朋友：（点头）

Tiny Eye：  ⚠️ 小小提示：2 岁建议切成小段，一次给 3～4 根，
            大人看着吃更安心哦。今天是开心还是累啦？

家长：      累了

Tiny Eye：  📋 那我们从这两个里选一个就好 ——
            ① 小份薯条 + 苹果片
            ② 玉米杯 + 牛奶
            你想让小手抓哪一个呀？
```

---

## 安装

### 前置条件

- 已申请麦当劳中国 MCP Token（[申请教程](https://github.com/M-China/mcd-mcp-server#1-%E7%94%B3%E8%AF%B7-mcp-token)）
- 已在 WorkBuddy 中启用 `mcd-mcp` 连接器
- 中国大陆地区使用（麦当劳 MCP 服务范围不含港澳台）

### 在 WorkBuddy 中接入

1. 打开 WorkBuddy → 左侧边栏【专家·技能·连接器】→【连接器】
2. 右上角【自定义连接器】→【配置 MCP】
3. 粘贴 `mcp-config.example.json` 的内容，把 `${MCD_MCP_TOKEN}` 换成你的真实 Token
4. 保存后回到连接器列表，【启用】`mcd-mcp`
5. 在对话框中输入：`用 Tiny Eye 模式帮我家 2 岁小朋友挑一餐`

详见 [`docs/INSTALL.md`](docs/INSTALL.md)。

---

## 目标用户

- **主要**：1.5～4 岁幼儿的年轻父母（中国大陆）
- **次要**：带孙辈的祖辈、亲子餐厅门店经理、幼儿营养内容创作者
- **场景**：周末亲子用餐、节假日出行途中的麦当劳、门店内哄娃

---

## 项目结构

```
mcd-tiny-diner/
├── README.md                  # 本文件
├── CONTEST_DECLARATION.md     # 参赛声明（官方原文，不可修改）
├── MCP_INTEGRATION.md         # MCP 调用说明
├── mcp-config.example.json    # 脱敏 MCP 配置示例
├── workbuddy.md               # WorkBuddy 开发对话上下文
├── LICENSE                    # MIT
├── docs/
│   ├── INSTALL.md             # 安装与配置
│   ├── PERSONAS.md            # 三岁视角设计原则
│   └── DESIGN.md              # 交互与安全设计
├── src/
│   ├── prompts/               # Skill 提示词（核心资产）
│   └── tools/                 # MCP 调用编排
└── assets/
```

---

## 合规与安全声明

- 本项目**不面向幼儿独立使用**，所有下单行为均需成年监护人确认
- 输出内容仅作饮食搭配建议，**不构成医疗或营养处方**；过敏与噎食风险请遵医嘱
- 严格遵守[麦当劳 MCP 服务规则](https://cdn.mcd.cn/cms/pages/MCPServerRules.html)与
  [WorkBuddy 服务协议](https://rule.tencent.com/rule/202603180001)
- 不含任何违法违规、政治敏感、贬损品牌或对比竞品的内容

---

## License

MIT © 2026 Tiny Eye Contributors

<div align="center">
<b>1024 程序员节 · 和 WorkBuddy 一起脑洞全开</b>
</div>
