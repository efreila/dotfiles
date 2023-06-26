{{ $extensions := list
     "redhat.vscode-yaml"
     "vscode-icons-team.vscode-icons"
     "withfig.fig"
     "Prisma.prisma"
     "GitHub.copilot"
     "esbenp.prettier-vscode"
     "dbaeumer.vscode-eslint"
     "bradlc.vscode-tailwindcss"
     "unifiedjs.vscode-mdx"
     "mikestead.dotenv"
     "naumovs.color-highlight"
     "eamodio.gitlens"
     "stkb.rewrap"
     "streetsidesoftware.code-spell-checker"
     "yzhang.markdown-all-in-one" -}}

#!/bin/bash

set -eufo pipefail

{{ range $extensions -}}
code --install-extension {{ . }}
{{ end -}}