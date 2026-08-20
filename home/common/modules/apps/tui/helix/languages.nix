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
      {
        name = "c-sharp";
        auto-format = true;
        formatter = {
          command = "csharpier";
          args = [ "format" "--write-stdout" "--stdin-path" "/tmp/foo.cs" ];
        };
        language-servers = [ "omnisharp" ];
      }
    ];

    language-server = {
      omnisharp = {
        command = "OmniSharp";
        args = [ "--languageserver" ];
      };
    };
  };
}

