*&---------------------------------------------------------------------*
*& Report ZMK_FIELD_SYMBOLS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_field_symbols.

DATA: gv_number TYPE i.
DATA: gv_text(40).

*FIELD-SYMBOLS: <fs_number> TYPE i.
FIELD-SYMBOLS: <fs_number>.

ASSIGN gv_number TO <fs_number>.

<fs_number> = 50.
<fs_number> = 60.
<fs_number> = 70.

WRITE: / gv_number.
WRITE: / <fs_number>.

UNASSIGN <fs_number>.

ASSIGN gv_text TO <fs_number>.

<fs_number> = 'Hallo'.

WRITE: / gv_text.
WRITE: / <fs_number>.
