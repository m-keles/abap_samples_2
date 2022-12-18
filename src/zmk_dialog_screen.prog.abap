*&---------------------------------------------------------------------*
*& Report ZMK_MC2_DIALOG_SCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_dialog_screen.

DATA: gr_alvgrid             TYPE REF TO cl_gui_alv_grid,
      gc_custom_control_name TYPE scrfname VALUE 'CC_ALV',
      gr_container           TYPE REF TO cl_gui_custom_container,
      gt_fieldcat            TYPE lvc_t_fcat,
      gs_fieldcat            TYPE lvc_s_fcat,
      gs_layout              TYPE lvc_s_layo.

DATA: ok_code TYPE sy-ucomm.

TYPES: BEGIN OF gty_table.
    INCLUDE STRUCTURE sflight.
TYPES: END OF gty_table.

DATA: gt_table TYPE TABLE OF gty_table.

CALL SCREEN 0200.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0200  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
  SET PF-STATUS 'STATUS_0200'.
  SET TITLEBAR 'TITLE_0200' WITH sy-datum sy-uzeit.

  PERFORM get_data.
  PERFORM display_data.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.

  CASE ok_code.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'TEST_MSG'.
      MESSAGE 'Test Message' TYPE 'I'.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Form  GET_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_data .
  SELECT * FROM sflight INTO TABLE gt_table.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  DISPLAY_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM display_data .
  CREATE OBJECT gr_container
    EXPORTING
      container_name = gc_custom_control_name.

  CREATE OBJECT gr_alvgrid
    EXPORTING
      i_parent = gr_container.

*  gs_fieldcat-fieldname = 'CARRID'.
*  gs_fieldcat-coltext   = 'Carrier ID'.
*  APPEND gs_fieldcat TO gt_fieldcat.
*  CLEAR: gs_fieldcat.
*
*  gs_fieldcat-fieldname = 'CONNID'.
*  gs_fieldcat-coltext   = 'Connection ID'.
*  APPEND gs_fieldcat TO gt_fieldcat.
*  CLEAR: gs_fieldcat.

  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
    EXPORTING
      i_structure_name = 'SFLIGHT'
    CHANGING
      ct_fieldcat      = gt_fieldcat.

  gs_layout-zebra = 'X'.
  gs_layout-grid_title = 'GRID_TITLE'.
  gs_layout-smalltitle = 'X'.

  gr_alvgrid->set_table_for_first_display(
    EXPORTING
      is_layout = gs_layout
    CHANGING
      it_outtab = gt_table
      it_fieldcatalog = gt_fieldcat ).

ENDFORM.
