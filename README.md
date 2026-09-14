# GstarCAD UCS Tools

Reset the UCS to world, align it to a picked object, and save or restore named UCS settings.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

The UCS is the working plane for every command, and getting lost in it wastes time. These helpers return to world in one command, align the UCS to any picked object, and save or restore named UCS settings so you can jump between views of a drawing.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/ucs-world.lsp` | ;; ucs-world.lsp - Reset the UCS to world and restore plan view
;; Command: UCSW
(defun c:UCSW ( )
  (command "_.UCS" "_W")
  (command "_.PLAN" "_C")
  (princ "\nUCS reset to world.")
  (princ)
)
 |
| `scripts/ucs-object.lsp` | ;; ucs-object.lsp - Align the UCS to a picked object
;; Command: UCSOBJ
;; Usage: pick a face or object that should define the working plane
(defun c:UCSOBJ ( / en )
  (setq en (car (entsel "\nPick an object to align the UCS to: ")))
  (if en
    (progn
      (command "_.UCS" "_OB" en)
      (princ "\nUCS aligned to object.")
    )
  )
  (princ)
)
 |
| `scripts/ucs-named.lsp` | ;; ucs-named.lsp - Save, restore and list named UCS settings
;; Commands: UCSSAVE / UCSGO / UCSLIST
(defun c:UCSSAVE ( / name )
  (setq name (getstring T "\nUCS name to save: "))
  (if (/= name "")
    (progn
      (command "_.UCS" "_S" name)
      (princ (strcat "\nSaved UCS: " name))
    )
  )
  (princ)
)
(defun c:UCSGO ( / name )
  (setq name (getstring T "\nUCS name to restore: "))
  (if (/= name "")
    (command "_.UCS" "_R" name)
  )
  (princ)
)
(defun c:UCSLIST ( )
  (command "_.UCS" "_?" "" "")
  (princ)
)
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
