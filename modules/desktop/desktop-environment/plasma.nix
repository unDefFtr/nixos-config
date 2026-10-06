{ config, pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  nixpkgs.overlays = [
    (final: prev: {
      kdePackages = prev.kdePackages.overrideScope (
        kdeFinal: kdePrev: {
          plasma-workspace = kdePrev.plasma-workspace.overrideAttrs (old: {
            postFixup = (old.postFixup or "") + ''
              # Drop only XDG_DATA_DIRS prefixes; retain Qt/QML and all other
              # environment settings collected by wrapQtAppsHook.
              plasmashellWrapperArgs=()
              for ((i = 0; i < ''${#qtWrapperArgs[@]}; i++)); do
                if [[ ''${qtWrapperArgs[i]} == --prefix &&
                      ''${qtWrapperArgs[i + 1]-} == XDG_DATA_DIRS ]]; then
                  ((i += 3))
                else
                  plasmashellWrapperArgs+=("''${qtWrapperArgs[i]}")
                fi
              done
              makeWrapper "$out/bin/.plasmashell-wrapped" \
                "$out/bin/.plasmashell-qt-wrapper" \
                "''${plasmashellWrapperArgs[@]}"

              rm "$out/bin/plasmashell"
              cat > $out/bin/plasmashell <<'EOF'
              #!/bin/sh

              export XDG_DATA_DIRS="$HOME/.nix-profile/share:/nix/profile/share:$HOME/.local/state/nix/profile/share:/etc/profiles/per-user/$USER/share:/nix/var/nix/profiles/default/share:/run/current-system/sw/share"

              exec "$(dirname "$0")/.plasmashell-qt-wrapper" "$@"
              EOF

              chmod +x $out/bin/plasmashell
            '';
          });
        }
      );
    })
  ];
}

