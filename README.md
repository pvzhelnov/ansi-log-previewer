# ANSI Log Preview Wrapper

This extension registers a real **custom editor** for `.log` files.
When such a file is opened, it immediately calls the
`iliazeus.vscode-ansi.showPretty` command, re-using that preview webview.

### Usage
1. Install [iliazeus.vscode-ansi](https://marketplace.visualstudio.com/items?itemName=iliazeus.vscode-ansi).
2. Install this extension (optionally, `bash build.sh` it first).
3. Open any `.log` file → it opens directly in the ANSI preview tab.
