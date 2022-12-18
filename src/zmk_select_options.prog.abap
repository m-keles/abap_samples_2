*&---------------------------------------------------------------------*
*& Report ZMK_SELECT_OPTIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_select_options.
TABLES: sflight.

*SELECT-OPTIONS: s_carrid FOR sflight-carrid,
*                s_connid FOR sflight-connid.

*SELECT * FROM sflight INTO TABLE @DATA(gt_table)." WHERE carrid IN @s_carrid AND
"connid in @s_connid.

TYPES: BEGIN OF gty_range,
         sign,
         option(2),
         low(3),
         high(3),
       END OF gty_range.

DATA: lt_carrid_range TYPE RANGE OF sflight-carrid,
      lt_connid_range TYPE RANGE OF sflight-connid,
      ls_range        TYPE gty_range.

ls_range-sign = 'I'.
ls_range-option = 'BT'.
ls_range-low = 'AA'.
ls_range-high = 'DL'.
APPEND ls_range TO lt_carrid_range.
CLEAR: ls_range.

APPEND INITIAL LINE TO lt_carrid_range ASSIGNING FIELD-SYMBOL(<ls_range_02>).
<ls_range_02>-sign = 'I'.
<ls_range_02>-option = 'EQ'.
<ls_range_02>-low = 'UA'.


APPEND INITIAL LINE TO lt_carrid_range ASSIGNING <ls_range_02>.
<ls_range_02>-sign = 'E'.
<ls_range_02>-option = 'EQ'.
<ls_range_02>-low = 'AZ'.

SELECT * FROM sflight INTO TABLE @DATA(gt_table) WHERE carrid IN @lt_carrid_range.


BREAK-POINT.
