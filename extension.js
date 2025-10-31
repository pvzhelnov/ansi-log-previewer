const vscode = require('vscode');

exports.activate = (context) => {
  const provider = {
    async resolveCustomTextEditor(document, webviewPanel) {
      try {
        // Focus the document so the ANSI command knows what to act on
        await vscode.window.showTextDocument(document, { preview: true });

        // Trigger the real ANSI preview command
        await vscode.commands.executeCommand('iliazeus.vscode-ansi.showPretty');

        // Keep our custom editor container alive;
        // don't dispose it — ANSI's webview will replace the visible content.
      } catch (err) {
        vscode.window.showErrorMessage(
          `Failed to open ANSI preview: ${err.message || err}`
        );
      }
    },
  };

  context.subscriptions.push(
    vscode.window.registerCustomEditorProvider('ansiLog.preview', provider)
  );
};

exports.deactivate = () => {};
