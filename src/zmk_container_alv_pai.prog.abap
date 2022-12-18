*&---------------------------------------------------------------------*
*&  Include           ZMK_CONTAINER_ALV_PAI
*&---------------------------------------------------------------------*


*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.

  CASE sy-ucomm.
    WHEN 'BACK'.
      LEAVE TO SCREEN 0.
    WHEN 'RGHT'.
      CALL METHOD gc_grid_01->get_selected_rows
        IMPORTING
          et_index_rows = gt_index_rows
          et_row_no     = gt_row_no.


      LOOP AT gt_row_no INTO gs_row_no .
        READ TABLE gt_sflight_01 INTO gs_sflight_01 INDEX gs_row_no-row_id.
        IF sy-subrc IS INITIAL.
          APPEND gs_sflight_01 TO gt_sflight_02.
        ENDIF.
      ENDLOOP.
      CLEAR: gs_row_no, gs_sflight_01.

      LOOP AT gt_sflight_01 INTO gs_sflight_01.
        READ TABLE gt_row_no INTO gs_row_no WITH KEY row_id = sy-tabix.
        IF sy-subrc IS NOT INITIAL.
          APPEND gs_sflight_01 TO gt_sflight_03.
        ENDIF.
      ENDLOOP.
      CLEAR: gs_sflight_01, gs_row_no.

      CLEAR: gt_sflight_01.
      gt_sflight_01 = gt_sflight_03.
      SORT: gt_sflight_01, gt_sflight_02.
      CLEAR: gt_sflight_03.

    WHEN 'LEFT'.
      CALL METHOD gc_grid_02->get_selected_rows
        IMPORTING
          et_index_rows = gt_index_rows
          et_row_no     = gt_row_no.

      LOOP AT gt_row_no INTO gs_row_no .
        READ TABLE gt_sflight_02 INTO gs_sflight_02 INDEX gs_row_no-row_id.
        IF sy-subrc IS INITIAL.
          APPEND gs_sflight_02 TO gt_sflight_01.
        ENDIF.
      ENDLOOP.
      CLEAR: gs_row_no, gs_sflight_02.

      LOOP AT gt_sflight_02 INTO gs_sflight_02.
        READ TABLE gt_row_no INTO gs_row_no WITH KEY row_id = sy-tabix.
        IF sy-subrc IS NOT INITIAL.
          APPEND gs_sflight_02 TO gt_sflight_03.
        ENDIF.
      ENDLOOP.
      CLEAR: gs_sflight_02, gs_row_no.

      CLEAR: gt_sflight_02.
      gt_sflight_02 = gt_sflight_03.
      SORT: gt_sflight_01, gt_sflight_02.
      CLEAR: gt_sflight_03.

    WHEN 'DLT_01'.
      CALL METHOD gc_grid_01->get_selected_rows
        IMPORTING
          et_index_rows = gt_index_rows
          et_row_no     = gt_row_no.

      LOOP AT gt_sflight_01 INTO gs_sflight_01.
        READ TABLE gt_row_no INTO gs_row_no WITH KEY row_id = sy-tabix.
        IF sy-subrc IS NOT INITIAL.
          APPEND gs_sflight_01 TO gt_sflight_03.
        ENDIF.
      ENDLOOP.
      CLEAR: gs_sflight_01, gs_row_no.
      CLEAR: gt_sflight_01.
      gt_sflight_01 = gt_sflight_03.
      CLEAR: gt_sflight_03.

    WHEN 'DLT_02'.
      CALL METHOD gc_grid_02->get_selected_rows
        IMPORTING
          et_index_rows = gt_index_rows
          et_row_no     = gt_row_no.

      LOOP AT gt_sflight_02 INTO gs_sflight_02.
        READ TABLE gt_row_no INTO gs_row_no WITH KEY row_id = sy-tabix.
        IF sy-subrc IS NOT INITIAL.
          APPEND gs_sflight_02 TO gt_sflight_03.
        ENDIF.
      ENDLOOP.
      CLEAR: gs_sflight_02, gs_row_no.
      CLEAR: gt_sflight_02.
      gt_sflight_02 = gt_sflight_03.
      CLEAR: gt_sflight_03.

    WHEN 'CLR'.
      CALL FUNCTION 'POPUP_TO_GET_ONE_VALUE'
        EXPORTING
          textline1      = 'What color do you want? Green, Orange or Red.'
*         TEXTLINE2      = ' '
*         TEXTLINE3      = ' '
          titel          = 'Color'
          valuelength    = 30
        IMPORTING
          answer         = gv_answer
          value1         = gv_color
        EXCEPTIONS
          titel_too_long = 1
          OTHERS         = 2.

      IF gv_answer = 'J'.

        CALL METHOD gc_grid_01->get_selected_rows
          IMPORTING
            et_index_rows = gt_index_rows
            et_row_no     = gt_row_no.

        IF gt_row_no IS INITIAL.
          MESSAGE 'Please choose a line!' TYPE 'I'.
          RETURN.
        ENDIF.

        CASE gv_color.
          WHEN 'GREEN'.
            LOOP AT gt_row_no INTO gs_row_no.
              READ TABLE gt_sflight_01 ASSIGNING FIELD-SYMBOL(<gs_sflight_01>) INDEX gs_row_no-row_id.
              IF sy-subrc IS INITIAL.
                <gs_sflight_01>-line_color = 'C511'.
              ENDIF.
            ENDLOOP.
          WHEN 'ORANGE'.
            LOOP AT gt_row_no INTO gs_row_no.
              READ TABLE gt_sflight_01 ASSIGNING <gs_sflight_01> INDEX gs_row_no-row_id.
              IF sy-subrc IS INITIAL.
                <gs_sflight_01>-line_color = 'C711'.
              ENDIF.
            ENDLOOP.
          WHEN 'RED'.
            LOOP AT gt_row_no INTO gs_row_no.
              READ TABLE gt_sflight_01 ASSIGNING <gs_sflight_01> INDEX gs_row_no-row_id.
              IF sy-subrc IS INITIAL.
                <gs_sflight_01>-line_color = 'C611'.
              ENDIF.
            ENDLOOP.
          WHEN OTHERS.
        ENDCASE.

      ENDIF.


    WHEN OTHERS.
  ENDCASE.

ENDMODULE.
