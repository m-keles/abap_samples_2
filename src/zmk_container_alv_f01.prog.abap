*&---------------------------------------------------------------------*
*&  Include           ZMK_CONTAINER_ALV_F01
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Form  GET_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*

FORM get_data .
  SELECT * FROM sflight INTO CORRESPONDING FIELDS OF TABLE gt_sflight_01.
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

  IF gc_cont_01 IS INITIAL AND gc_cont_02 IS INITIAL.
    CREATE OBJECT gc_cont_01
      EXPORTING
        container_name = 'CONT_01'.

    CREATE OBJECT gc_grid_01
      EXPORTING
        i_parent = gc_cont_01.

    CREATE OBJECT gc_cont_02
      EXPORTING
        container_name = 'CONT_02'.

    CREATE OBJECT gc_grid_02
      EXPORTING
        i_parent = gc_cont_02.

    CREATE OBJECT gc_event_handler.

    SET HANDLER gc_event_handler->dbl_clck FOR gc_grid_01.


    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
*       I_BUFFER_ACTIVE        =
        i_structure_name       = 'SFLIGHT'
*       I_CLIENT_NEVER_DISPLAY = 'X'
*       I_BYPASSING_BUFFER     =
*       I_INTERNAL_TABNAME     =
      CHANGING
        ct_fieldcat            = gt_fcat
      EXCEPTIONS
        inconsistent_interface = 1
        program_error          = 2
        OTHERS                 = 3.


    gs_layout-zebra       = 'X'.
    gs_layout-cwidth_opt  = 'X'.  "Kolon genisliklerinin optimize edilmesi.
    gs_layout-sel_mode    = 'A'.    "Satir secim kutucugu.
    gs_layout-info_fname  = 'LINE_COLOR'.   "Satir renklednrimek icin kullanilan kayout.
    gs_layout-ctab_fname  = 'CELL_COLOR'.




    CALL METHOD gc_grid_01->set_table_for_first_display
      EXPORTING
        is_layout                     = gs_layout
      CHANGING
        it_outtab                     = gt_sflight_01
        it_fieldcatalog               = gt_fcat
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4.


    CALL METHOD gc_grid_02->set_table_for_first_display
      EXPORTING
        is_layout                     = gs_layout
      CHANGING
        it_outtab                     = gt_sflight_02
        it_fieldcatalog               = gt_fcat
      EXCEPTIONS
        invalid_parameter_combination = 1
        program_error                 = 2
        too_many_lines                = 3
        OTHERS                        = 4.

  ELSE.

    CALL METHOD gc_grid_01->refresh_table_display.
    CALL METHOD gc_grid_02->refresh_table_display.

  ENDIF.

ENDFORM.
