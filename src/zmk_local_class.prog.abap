*&---------------------------------------------------------------------*
*& Report ZMK_LOCAL_CLASS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMK_LOCAL_CLASS.

CLASS lcl_service DEFINITION.
  PUBLIC SECTION.  "Herkes tarafindan kullanilabilir ve inherit edilebilir.

  DATA: number_global TYPE i VALUE 100.

  METHODS: get_number IMPORTING iv_number TYPE i
                      EXPORTING ev_number TYPE i.

  METHODS: write_number IMPORTING iv_number TYPE i.

  METHODS: write_attribute.





  PROTECTED SECTION.  "Sadece tanimlandigi class icinde kullanilabilir ve baska classlar tarafindan inherit edilebilir.
  PRIVATE SECTION.  "Sadece tanimlandigi class icerisinde kullanilabilir ancak inherit edilemez.

ENDCLASS.

CLASS lcl_service IMPLEMENTATION.
  METHOD get_number.
    ev_number = iv_number * 2.
  ENDMETHOD.

  METHOD write_number.
    WRITE: iv_number.
  ENDMETHOD.

  METHOD write_attribute.
    DATA: number_global TYPE i VALUE 200.

    WRITE: / me->number_global.
    WRITE: / number_global.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.  "Kullanici F8 tusuna basti.

DATA: go_class TYPE REF TO lcl_service,
      gv_number TYPE i.

CREATE OBJECT go_class.

go_class->get_number( EXPORTING iv_number = 2
                      IMPORTING ev_number = gv_number ).

go_class->write_number(  EXPORTING iv_number = gv_number ).

go_class->write_attribute( ).
