*&---------------------------------------------------------------------*
*& Report ZMK_INLINE_DECL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_inline_decl.

*DATA: gv_text TYPE string.
DATA(gv_text) = 'Hallo'.  "Inline Declaration
WRITE: / gv_text.

gv_text = 'Merhabalar'.  "Ilk tanimlamada 5 karakter Hallodan aldigi icin yeniden deger degisimi ile sadece sinirli karakter alir.
WRITE: / gv_text.

DATA(gv_number) = 50 / 3.
WRITE: / gv_number.

*DATA: gt_spfli TYPE TABLE OF spfli.
SELECT * FROM spfli INTO TABLE @DATA(gt_spfli). "Select icinde inline declaration kullanirken @DATA kullanilir.

SELECT SINGLE * FROM spfli INTO @DATA(gs_spfli) WHERE carrid = 'DL' AND connid = '0106'.

SELECT SINGLE deptime, arrtime FROM spfli INTO (@DATA(gv_deptime), @DATA(gv_arrtime)) WHERE carrid = 'DL' AND connid = '0106'.

LOOP AT gt_spfli INTO DATA(gs_spfli2).
  gs_spfli2-distance = gs_spfli2-distance + 100.

  MODIFY gt_spfli FROM gs_spfli2 INDEX sy-tabix.
  CLEAR: gs_spfli2.
ENDLOOP.

LOOP AT gt_spfli ASSIGNING FIELD-SYMBOL(<fs_spfli>).
  <fs_spfli>-distance = <fs_spfli>-distance + 100.
ENDLOOP.

DATA: gv_test_no TYPE i.

ASSIGN gv_test_no TO FIELD-SYMBOL(<fs_test_no>).

<fs_test_no> = 100.

WRITE: / gv_test_no.

<fs_test_no> = 300.

WRITE: / gv_test_no.
