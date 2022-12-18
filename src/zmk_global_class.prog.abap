*&---------------------------------------------------------------------*
*& Report ZMK_GLOBAL_CLASS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZMK_GLOBAL_CLASS.

DATA: go_class TYPE REF TO zmk_gl_class,
      gv_number TYPE i.

CREATE OBJECT go_class.

go_class->get_number( EXPORTING iv_number = 10
                      IMPORTING ev_number = gv_number ).

go_class->write_number( EXPORTING iv_number = gv_number ).

go_class->write_attribute( ).
