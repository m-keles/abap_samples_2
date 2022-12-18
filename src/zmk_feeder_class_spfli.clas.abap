class ZMK_FEEDER_CLASS_SPFLI definition
  public
  final
  create public .

public section.

  interfaces IF_POWL_FEEDER .

  data GT_SPFLI type ZMK_TABLETYPE .
protected section.
private section.
ENDCLASS.



CLASS ZMK_FEEDER_CLASS_SPFLI IMPLEMENTATION.


  method IF_POWL_FEEDER~GET_ACTIONS.

    DATA: ls_action TYPE POWL_ACTDESCR_STY.

    ls_action-actionid = 'TEST_01'.
    ls_action-cardinality = 'I'.
    ls_action-placement = 'B'.
    ls_action-enabled = abap_true.
    ls_action-placementindx = 1.
    ls_action-text = 'Test Button 1'.
    ls_action-add_separator = abap_true.
    INSERT ls_action INTO TABLE C_ACTION_DEFS.
    CLEAR: ls_action.

    ls_action-actionid = 'TEST_02'.
    ls_action-cardinality = 'I'.
    ls_action-placement = 'B'.
    ls_action-enabled = abap_true.
    ls_action-placementindx = 1.
    ls_action-text = 'Test Button 2'.
    ls_action-add_separator = abap_true.
    INSERT ls_action INTO TABLE C_ACTION_DEFS.
    CLEAR: ls_action.



  endmethod.


  method IF_POWL_FEEDER~GET_ACTION_CONF.
  endmethod.


  method IF_POWL_FEEDER~GET_DETAIL_COMP.
  endmethod.


  METHOD IF_POWL_FEEDER~GET_FIELD_CATALOG.

    DATA: lo_type     TYPE REF TO cl_abap_typedescr,
          lo_struct   TYPE REF TO cl_abap_structdescr,
          ls_output   TYPE ZMK_STRUCTURE,
          lt_comp     TYPE abap_component_view_tab,
          ls_fieldcat TYPE powl_fieldcat_sty,
          lv_colpos   TYPE i.

    lo_type = cl_abap_structdescr=>describe_by_data( p_data = ls_output ).
    lo_struct ?= lo_type.
    lt_comp = lo_struct->get_included_view( ).

    LOOP AT lt_comp ASSIGNING FIELD-SYMBOL(<ls_comp>).

      ls_fieldcat-colid          = <ls_comp>-name.
      ls_fieldcat-col_visible    = abap_true.
      ls_fieldcat-header_by_ddic = abap_true.
      ls_fieldcat-enabled        = abap_true.
      ls_fieldcat-display_type   = 'TV'.

      CASE <ls_comp>-name.
        WHEN 'CARRID'.
          ls_fieldcat-colpos = 1.
          ls_fieldcat-display_type   = 'LU'.
          ls_fieldcat-text_ref = 'LINK'.
        WHEN 'CONNID'.
          ls_fieldcat-colpos = 2.
        WHEN 'COUNTRYFR'.
          ls_fieldcat-colpos = 3.
        WHEN 'CITYFROM'.
          ls_fieldcat-colpos = 4.
        WHEN 'AIRPFROM'.
          ls_fieldcat-colpos = 5.
        WHEN 'COUNTRYTO'.
          ls_fieldcat-colpos = 6.
        WHEN 'CITYTO'.
          ls_fieldcat-colpos = 7.
        WHEN 'AIRPTO'.
          ls_fieldcat-colpos = 8.
        WHEN 'FLTIME'.
          ls_fieldcat-colpos = 9.
        WHEN 'DEPTIME'.
          ls_fieldcat-colpos = 10.
        WHEN 'ARRTIME'.
          ls_fieldcat-colpos = 11.
        WHEN 'DISTANCE'.
          ls_fieldcat-colpos = 12.
        WHEN 'DISTID'.
          ls_fieldcat-colpos = 13.
        WHEN 'FLTYPE'.
          ls_fieldcat-colpos = 14.
        WHEN 'PERIOD'.
          ls_fieldcat-colpos = 15.
        WHEN 'LINK'.
          ls_fieldcat-colpos = 16.
          ls_fieldcat-col_visible = abap_false.
          ls_fieldcat-enabled = abap_false.
        WHEN OTHERS.
      ENDCASE.

      INSERT ls_fieldcat INTO TABLE c_fieldcat.
      CLEAR: ls_fieldcat.

    ENDLOOP.

    e_fieldcat_changed = abap_true.


  ENDMETHOD.


  METHOD IF_POWL_FEEDER~GET_OBJECTS.

    DATA: lt_carrid_range TYPE RANGE OF spfli-carrid,
          ls_carrid_range LIKE LINE OF lt_carrid_range,
          lt_connid_range TYPE RANGE OF spfli-connid,
          ls_connid_range LIKE LINE OF lt_connid_range.

    LOOP AT i_selcrit_values INTO DATA(ls_selcrit_values).

      CASE ls_selcrit_values-selname.
        WHEN 'CARRID'.
          ls_carrid_range-low     = ls_selcrit_values-low.
          ls_carrid_range-high    = ls_selcrit_values-high.
          ls_carrid_range-sign    = ls_selcrit_values-sign.
          ls_carrid_range-option  = ls_selcrit_values-option.
          APPEND ls_carrid_range TO lt_carrid_range.
          CLEAR: ls_carrid_range.

        WHEN 'CONNID'.
          ls_connid_range-low     = ls_selcrit_values-low.
          ls_connid_range-high    = ls_selcrit_values-high.
          ls_connid_range-sign    = ls_selcrit_values-sign.
          ls_connid_range-option  = ls_selcrit_values-option.
          APPEND ls_connid_range TO lt_connid_range.
          CLEAR: ls_connid_range.
        WHEN OTHERS.
      ENDCASE.

    ENDLOOP.

    SELECT * FROM spfli INTO CORRESPONDING FIELDS OF TABLE gt_spfli WHERE carrid IN lt_carrid_range AND
                                                                          connid IN lt_connid_range.

    LOOP AT gt_spfli ASSIGNING FIELD-SYMBOL(<ls_spfli>).
      <ls_spfli>-link = 'https://www.google.com/'.
    ENDLOOP.

    e_results = gt_spfli.



  ENDMETHOD.


  method IF_POWL_FEEDER~GET_OBJECT_DEFINITION.
    e_object_def ?= cl_abap_tabledescr=>describe_by_name( 'ZMK_TABLETYPE' ).
  endmethod.


  method IF_POWL_FEEDER~GET_SEL_CRITERIA.

    APPEND INITIAL LINE TO c_selcrit_defs ASSIGNING FIELD-SYMBOL(<ls_selcrit_defs>).
    <ls_selcrit_defs>-selname     = 'CARRID'.
    <ls_selcrit_defs>-kind        = 'S'.
    <ls_selcrit_defs>-param_type  = 'I'.
    <ls_selcrit_defs>-selopt_type = 'A'.
    <ls_selcrit_defs>-datatype    = 'S_CARR_ID'.

    DATA: ls_selcrit_defs2 TYPE POWL_SELCRIT_STY.
    ls_selcrit_defs2-selname     = 'CONNID'.
    ls_selcrit_defs2-kind        = 'S'.
    ls_selcrit_defs2-param_type  = 'I'.
    ls_selcrit_defs2-selopt_type = 'A'.
    ls_selcrit_defs2-datatype    = 'S_CONN_ID'.


  endmethod.


  METHOD IF_POWL_FEEDER~HANDLE_ACTION.

    DATA: ls_msg TYPE powl_msg_sty,
          lv_no  TYPE n LENGTH 3.

    CASE i_actionid.
      WHEN 'TEST_01'.
        DESCRIBE TABLE c_result_tab LINES DATA(lv_no_lines).
        lv_no = lv_no_lines.
        CONCATENATE 'Toplam Satir sayisi:' lv_no INTO DATA(lv_text_msg) SEPARATED BY space.

        ls_msg-msgtype = 'I'.
        ls_msg-message = lv_text_msg.
        APPEND ls_msg TO E_MESSAGES.

*    	WHEN .
      WHEN OTHERS.
    ENDCASE.

  ENDMETHOD.
ENDCLASS.
