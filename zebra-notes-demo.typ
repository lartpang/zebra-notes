#import "zebra-notes.typ": *

// ── 页面与元数据设置 / Page & Metadata ──
#set document(
  title: "Zebra Notes 参考手册",
)

#set page(
  paper: "a4",
  margin: (x: 2cm, y: 3cm),
  numbering: "1",
  header: context {
    if counter(page).get().first() > 1 {
      set text(size: 9pt, style: "italic", fill: luma(100))
      grid(
        columns: (1fr, 1fr),
        [Zebra Notes Documentation], align(right)[#counter(page).display()],
      )
      v(0.5em)
      line(length: 100%, stroke: 0.5pt + luma(200))
    }
  },
)

// ── 字体与正文样式 / Typography & Body Style ──
#set text(
  font: ("New Computer Modern", "SimSun"),
  size: 9.5pt, // 适应双栏排版，略微缩小字号
)

#set par(justify: true, leading: 0.6em)

// ── 标题样式优化 / Heading Style ──
#set heading(numbering: "1.1")

#show heading: it => {
  set text(weight: "bold")
  let level-size = (1.2em, 1.1em, 1.05em).at(it.level - 1, default: 1em)
  let top-space = (1.8em, 1.2em, 0.8em).at(it.level - 1, default: 1em)

  v(top-space, weak: true)
  if it.level == 1 {
    block(width: 100%, stroke: (bottom: 0.5pt + black), inset: (bottom: 0.2em))[
      #text(size: level-size)[#counter(heading).display() #h(0.3em) #it.body]
    ]
  } else {
    text(size: level-size)[#it]
  }
  v(0.6em, weak: true)
}

// ── 双栏对照助手 / Bilingual Helper ──
#let bilingual(zh, en) = grid(
  columns: (1fr, 1fr),
  column-gutter: 2em,
  zh, en,
)

// ── 命令说明辅助组件 / Command Syntax Helpers ──
#let cmd(name, params) = block(
  inset: (left: 0.5em),
  stroke: (left: 2pt + zebra-colors.zebrablue),
  fill: luma(250),
  width: 100%,
  [
    #set text(font: "DejaVu Sans Mono", size: 8.5pt)
    #set par(first-line-indent: 0pt)
    *#name* #params
  ],
)

// ─────────────────────────────────────────────────────────────────────────────

#align(center)[
  #v(1em)
  #text(size: 20pt, weight: "bold")[Zebra Notes 模块详细参考文档] \
  #text(size: 16pt, weight: "bold", fill: luma(80))[Module Reference & Documentation]
  #v(0.5em)
  #text(size: 10pt, style: "italic")[协作写作中的笔记与待办标记工具 \ Collaborative Note-taking and Task Management Toolkit]
  #v(1.5em)
]

#outline(indent: 2em, depth: 2)

#v(2em)

= 简介 / Introduction

#bilingual(
  [ `zebra-notes` 是一款功能丰富且排版精美的学术文档协作工具。它能够帮助作者在不破坏正文结构的前提下，插入极具表现力的待办标注、审核意见与各类笔记，并支持自动化的统计汇总。 ],
  [ `zebra-notes` is a full-featured and elegantly typed collaborative tool for academic documents. It allows authors to insert expressive task marks, reviews, and notes without disrupting the main text flow, while also supporting automated summary generation. ],
)

= 指令参考 / Command Reference

== 基础笔记指令 / Basic Commands

#bilingual(
  [ #cmd("#todo", [ ( content, assignee: none ) ])
    最常用的指令，用于标记待办事项。颜色为紫色。 ],
  [ #cmd("#todo", [ ( content, assignee: none ) ])
    The most common command for marking to-do items. Color: Purple. ],
)

#v(1em)

#bilingual(
  [ #cmd("#note", [ ( content, assignee: none ) ])
    用于插入一般性的备注信息。 ],
  [ #cmd("#note", [ ( content, assignee: none ) ])
    Used for inserting general-purpose notes and remarks. ],
)

#v(1em)

#bilingual(
  [ #cmd("#zebracomment", [ ( content, assignee: none ) ])
    用于审稿意见或详细的评论。 ],
  [ #cmd("#zebracomment", [ ( content, assignee: none ) ])
    Used for reviewer feedback or detailed discussions. ],
)

#v(1em)

#bilingual(
  [ #cmd("#fixed", [ ( content, assignee: none ) ])
    标记已经完成或解决的项目。 ],
  [ #cmd("#fixed", [ ( content, assignee: none ) ])
    Marks items that have been completed or resolved. ],
)

== 配置与管理 / Configuration

#bilingual(
  [ #cmd("#zebranewnote", [ ( type-name, color ) ])
    创建一个全新的笔记指令。支持所有 Typst 标准颜色定义（如内置名称、RGB、Luma 等）。 ],
  [ #cmd("#zebranewnote", [ ( type-name, color ) ])
    Creates a new note command. Supports all Typst color definitions (Names, RGB, Luma, etc.). ],
)

#v(1em)

#bilingual(
  [ #cmd("#zebra-final", [ () ])
    全局切换到最终模式，隐藏文档中所有的笔记和摘要表。 ],
  [ #cmd("#zebra-final", [ () ])
    Switches to final mode globally, hiding all notes and the summary table in the document. ],
)

= 综合演示 / Comprehensive Demo

== 渲染效果 / Rendered View

#bilingual(
  [ 在显著性目标检测（SOD）模型设计中 #note("此处需补充边界感知网络的概念")，边缘的一致性描述一直是一个难点。如公式 (3) 所示，我们引入了一个全局注意力机制。#todo("验证消融实验在新数据集上的改进", assignee: "Li") 该机制能够捕捉目标的细节特征。#zebracomment("建议对比 ResNet 与 Swin-T 的基础效果", assignee: "Wang") 标记已解决的修正：#fixed("公式 3 的下标已修正", assignee: "John")。 ],
  [ In SOD model design #note("Add border-aware network concept here"), edge consistency remains a challenge. As shown in Eq. (3), we introduce a global attention mechanism. #todo("Verify ablation on new datasets", assignee: "Li") This mechanism captures granular features. #zebracomment("Compare ResNet and Swin-T baselines", assignee: "Wang") Fixed correction: #fixed("Eq. 3 subscript corrected", assignee: "John"). ],
)

== 源码对照 / Source Code

#bilingual(
  [
    ```typst
    在显著性目标检测（SOD）模型设计中 #note("此处需补充边界感知网络的概念")，边缘的一致性描述一直是一个难点。如公式 (3) 所示，我们引入了一个全局注意力机制。#todo("验证消融实验在新数据集上的改进", assignee: "Li") 该机制能够捕捉目标的细节特征。#zebracomment("建议对比 ResNet 与 Swin-T 的基础效果", assignee: "Wang") 标记已解决的修正：#fixed("公式 3 的下标已修正", assignee: "John")。
    ```
  ],
  [
    ```typst
    In SOD model design #note("Add border-aware network concept here"), edge consistency remains a challenge. As shown in Eq. (3), we introduce a global attention mechanism. #todo("Verify ablation on new datasets", assignee: "Li") This mechanism captures granular features. #zebracomment("Compare ResNet and Swin-T baselines", assignee: "Wang") Fixed correction: #fixed("Eq. 3 subscript corrected", assignee: "John").
    ```
  ],
)

#v(2em)

/* 笔记摘要统计表会自动汇总上述所有笔记 */
#zebra-summary()
