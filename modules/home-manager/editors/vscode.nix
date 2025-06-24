{ lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "vscode" ];

  programs.vscode = {
    enable = true;
    
    profiles.default = {
      userSettings = {
        "breadcrumbs.enabled" = false;
        "editor.cursorBlinking" = "solid";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.fontLigatures" = true;
        "editor.fontSize" = lib.mkForce 13.9;
        "editor.lineHeight" = 1.6;
        "editor.lineNumbers" = "relative";
        "editor.minimap.enabled" = true;
        "explorer.compactFolders" = false;
        "extensions.autoCheckUpdates" = false;
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "terminal.integrated.sendKeybindingsToShell" = true;
        "window.menuBarVisibility" = "compact";
        "window.zoomLevel" = 1;
        # "workbench.colorTheme" = lib.mkForce "One Dark Space Gray";
        "workbench.iconTheme" = "symbols";
        "workbench.layoutControl.enabled" = false;
        "workbench.tree.indent" = 16;
        "zenMode.hideLineNumbers" = false;
        
        "[rust]" = {
          "editor.formatOnSave" = false;
        };
      };

      extensions = with pkgs.vscode-extensions; [
      aaron-bond.better-comments
      streetsidesoftware.code-spell-checker
      streetsidesoftware.code-spell-checker-french
      fill-labs.dependi
      ms-vscode-remote.vscode-remote-extensionpack
      usernamehw.errorlens
      tamasfe.even-better-toml
      wix.vscode-import-cost
      ms-vscode.live-server
      jnoortheen.nix-ide
      alefragnani.project-manager
      rust-lang.rust-analyzer
      asvetliakov.vscode-neovim
      ];
    };
  };
}
