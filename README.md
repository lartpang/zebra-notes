# Zebra Notes (斑马笔记)

[![Typst Package](https://img.shields.io/badge/Typst-Package-blue)](https://typst.app/universe/package/zebra-notes)

A Typst port of the popular LaTeX package [zebra-goodies](https://github.com/xueruini/zebra-goodies). `zebra-notes` provides a set of tools for elegant, non-intrusive collaborative note-taking and task management in academic and technical documents.

`zebra-notes` 是流行的 LaTeX 宏包 [zebra-goodies](https://github.com/xueruini/zebra-goodies) 的 Typst 移植版本。它为学术和技术文档提供了一套优雅、非侵入性的协作笔记及任务管理工具。

## Features / 特性

- **Standardized Note Types / 标准化笔记类型**: Pre-defined `todo`, `note`, `zebracomment`, `fixed`, and `placeholder`. / 预定义多种笔记类型。
- **Automatic Numbering / 自动编号**: Each note type maintains its own counter. / 每种笔记类型维护独立的计数器。
- **Side-by-Side Reference / 侧边批注**: Notes are visually distinct for collaborative editing. / 视觉上区分不同的批注，方便协作。
- **Bilingual Support / 双语支持**: Perfectly handles mixed Chinese/English environments with serif/serif-less font fallbacks. / 完美处理中英文混合环境。
- **Summary Table / 总结表**: Automatically generates a list of all notes at the end of the document. / 自动在文档末尾生成所有笔记列表。
- **Final Mode / 最终模式**: One-line toggle to hide all annotations for final publication. / 一键隐藏所有批注以供最终发布。

## Demo / 演示

- [Demo Document / 演示文档 (Typst Source)](./zebra-notes-demo.typ)
- [Demo PDF / 演示 PDF](./zebra-notes-demo.pdf)

## Usage / 使用方法

Import the package in your Typst file: / 在您的 Typst 文件中导入：

```typst
#import "@preview/zebra-notes:0.1.0": *

= Section with a note #todo("Check the math", assignee: "Author")

Here is a comment #zebracomment("Is this reference correct?", assignee: "Reviewer").

#zebra-summary()
```

## Acknowledgments / 致谢

This package is a reimplementation of the LaTeX [`zebra-goodies`](https://github.com/xueruini/zebra-goodies) package by Ruini Xue. We chose the name `zebra-notes` for the Typst ecosystem to clearly describe its functionality while honoring its heritage.

该宏包是 Ruini Xue 开发的 LaTeX [`zebra-goodies`](https://github.com/xueruini/zebra-goodies) 宏包的重新实现。我们为 Typst 生态系统选择了 `zebra-notes` 这个名称，以清楚地描述其功能，同时向其渊源致敬。

## License / 许可证

MIT License.
