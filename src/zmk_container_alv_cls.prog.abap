*&---------------------------------------------------------------------*
*&  Include           ZMK_CONTAINER_ALV_CLS
*&---------------------------------------------------------------------*

CLASS lcl_event_handler DEFINITION.
  PUBLIC SECTION.
    METHODS: dbl_clck FOR EVENT double_click OF cl_gui_alv_grid
      IMPORTING e_column e_row es_row_no.

ENDCLASS.

CLASS lcl_event_handler IMPLEMENTATION.
  METHOD dbl_clck.
    CALL FUNCTION 'POPUP_TO_GET_ONE_VALUE'
      EXPORTING
        textline1      = 'Which color do you want? Green, Orange or Red.'
        titel          = 'Color'
        valuelength    = 30
      IMPORTING
        answer         = gv_answer
        value1         = gv_color
      EXCEPTIONS
        titel_too_long = 1
        OTHERS         = 2.


    IF gv_answer = 'J'.
      CASE gv_color.
        WHEN 'GREEN'.
          READ TABLE gt_sflight_01 ASSIGNING FIELD-SYMBOL(<gs_sflight_01>) INDEX e_row.
          IF sy-subrc IS INITIAL.
            ls_s_colo-col = '5'.
            ls_s_colo-int = '1'.
            ls_s_colo-inv = '1'.

            ls_s_scol-color = ls_s_colo.
            ls_s_scol-fname = e_column.

            APPEND ls_s_scol TO <gs_sflight_01>-cell_color.
          ENDIF.
        WHEN 'ORANGE'.
          READ TABLE gt_sflight_01 ASSIGNING <gs_sflight_01> INDEX e_row.
          IF sy-subrc IS INITIAL.
            ls_s_colo-col = '7'.
            ls_s_colo-int = '1'.
            ls_s_colo-inv = '1'.

            ls_s_scol-color = ls_s_colo.
            ls_s_scol-fname = e_column.

            APPEND ls_s_scol TO <gs_sflight_01>-cell_color.
          ENDIF.
        WHEN 'RED'.
          READ TABLE gt_sflight_01 ASSIGNING <gs_sflight_01> INDEX e_row.
          IF sy-subrc IS INITIAL.
            ls_s_colo-col = '6'.
            ls_s_colo-int = '1'.
            ls_s_colo-inv = '1'.

            ls_s_scol-color = ls_s_colo.
            ls_s_scol-fname = e_column.

            APPEND ls_s_scol TO <gs_sflight_01>-cell_color.
          ENDIF.
*      	WHEN .
*      	WHEN OTHERS.
      ENDCASE.
    ENDIF.

    PERFORM display_data.


  ENDMETHOD.
ENDCLASS.

DATA: gc_event_handler TYPE REF TO lcl_event_handler.
