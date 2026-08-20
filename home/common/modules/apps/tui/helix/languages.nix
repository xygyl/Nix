{
  programs.helix.languages = {
    language = [
      {
        name = "typescript";
        auto-format = true;
        formatter = {
          command = "prettierd";
          args = [ "--stdin-filepath" "foo.ts" ];
        };
      }
      {
        name = "tsx";
        auto-format = true;
        formatter = {
          command = "prettierd";
          args = [ "--stdin-filepath" "foo.tsx" ];
        };
      }
      {
        name = "javascript";
        auto-format = true;
        formatter = {
          command = "prettierd";
          args = [ "--stdin-filepath" "foo.js" ];
        };
      }
      {
        name = "jsx";
        auto-format = true;
        formatter = {
          command = "prettierd";
          args = [ "--stdin-filepath" "foo.jsx" ];
        };
      }
    ];
  };
}

