*&---------------------------------------------------------------------*
*&  Include           ZMK_CONTAINER_ALV_TOP
*&---------------------------------------------------------------------*

DATA: gc_cont_01    TYPE REF TO cl_gui_custom_container,
      gc_cont_02    TYPE REF TO cl_gui_custom_container,
      gc_grid_01    TYPE REF TO cl_gui_alv_grid,
      gc_grid_02    TYPE REF TO cl_gui_alv_grid,
      gt_fcat       TYPE lvc_t_fcat,
      gs_layout     TYPE lvc_s_layo,
      gt_index_rows TYPE lvc_t_row,
      gt_row_no     TYPE lvc_t_roid,
      gs_row_no     TYPE lvc_s_roid,
      gv_color      TYPE spop-varvalue1,
      gv_answer.


TYPES: BEGIN OF gty_sflight.
    INCLUDE STRUCTURE sflight.
TYPES: line_color(4),
       cell_color    TYPE lvc_t_scol,
       END OF gty_sflight.

DATA: gt_sflight_01 TYPE TABLE OF gty_sflight,
      gt_sflight_02 TYPE TABLE OF gty_sflight,
      gt_sflight_03 TYPE TABLE OF gty_sflight,
      gs_sflight_01 TYPE gty_sflight,
      gs_sflight_02 TYPE gty_sflight,
      gs_sflight_03 TYPE gty_sflight,
      ls_s_colo     TYPE lvc_s_colo,
      ls_s_scol     TYPE lvc_s_scol.
