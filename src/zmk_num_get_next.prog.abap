*&---------------------------------------------------------------------*
*& Report ZMK_NUM_GET_NEXT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMK_NUM_GET_NEXT.

DATA: gv_number TYPE i.

CALL FUNCTION 'NUMBER_GET_NEXT'
  EXPORTING
    nr_range_nr    = '01'
    object         = 'ZMK_RNG_OB'
 IMPORTING
   NUMBER          = gv_number.

WRITE: gv_number.
