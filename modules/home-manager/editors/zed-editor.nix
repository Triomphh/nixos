{ lib, ... }:

{
  programs.zed-editor = {
    enable = true;

    # This populates the userSettings "auto_install_extensions"
    extensions = [ "nix" "toml" "rust" ];

    # Everything inside of these brackets are Zed options
    userSettings = {
      hour_format = "hour24";
      vim_mode = true;

      # Tell Zed to use direnv and direnv can use a flake.nix environment
      load_direnv = "shell_hook";
      base_keymap = "VSCode";

      theme = lib.mkForce {
        mode = "system";
        light = "Catppuccin Latte (Blur) [Light]";
        dark = "Catppuccin Macchiato (Blur) [Light]";
      };

      centered_layout = {
        left_padding = 0.27;
        right_padding = 0.27;
      };

      profiles = {
        Zen = {
          tab_bar = {
            show = false;
            show_nav_history_buttons = false;
          };
          toolbar = {
            breadcrumbs = false;
            quick_actions = false;
          };
          gutter = {
            # folds = false;
          };
          indent_guides = {
            enabled = false;
          };
          scrollbar = {
            show = "never";
            cursors = false;
            git_diff = false;
            search_results = false;
            selected_symbol = false;
          };
          status_bar = {
            "experimental.show" = false;
          };
        };
      };

      autosave = {
        after_delay = {
          milliseconds = 300;
        };
      };

      diff_view_style = "unified";

      language_models = {
        lmstudio = {
          api_url = "http://localhost:1234/api/v0";
        };
      };

      icon_theme = {
        mode = "dark";
        light = "Colored Zed Icons Theme Dark";
        dark = "Colored Zed Icons Theme Dark";
      };
    };

    userKeymaps = [
      {
        bindings = {
          "ctrl-alt-super-c" = "workspace::ToggleCenteredLayout";
          "ctrl-shift-e" = "project_panel::Toggle";
          "ctrl-shift-g" = "git_panel::Toggle";
          "ctrl-?" = "agent::Toggle";
        };
      }
      {
        context = "(VimControl && !menu) || (!Editor && !Terminal)";
        bindings = {
          "shift-left" = "workspace::ActivatePaneLeft";
          "shift-right" = "workspace::ActivatePaneRight";
          "shift-up" = "workspace::ActivatePaneUp";
          "shift-down" = "workspace::ActivatePaneDown";
        };
        unbind = {
          "ctrl-w h" = "workspace::ActivatePaneLeft";
          "ctrl-w l" = "workspace::ActivatePaneRight";
          "ctrl-w k" = "workspace::ActivatePaneUp";
          "ctrl-w j" = "workspace::ActivatePaneDown";
        };
      }
      {
        context = "Editor && vim_mode == insert";
        bindings = {};
      }
      {
        context = "VimControl && !menu";
        unbind = {
          "shift-h" = "vim::WindowTop";
          "shift-l" = "vim::WindowBottom";
          "ctrl-j" = "vim::Down";
        };
      }
      {
        context = "Workspace";
        bindings = {
          "ctrl-alt-super-z" = [
            "action::Sequence"
            [
              # "workspace::ToggleCenteredLayout"
              "settings_profile_selector::Toggle"
              ["workspace::SendKeystrokes" "Z e n enter"]
            ]
          ];
          "ctrl-alt-super-shift-z" = [
            "action::Sequence"
            [
              # "workspace::ToggleCenteredLayout"
              "settings_profile_selector::Toggle"
              ["workspace::SendKeystrokes" "D i s a b l e d enter"]
            ]
          ];
        };
      }
    ];
  };
}
