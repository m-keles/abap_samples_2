*&---------------------------------------------------------------------*
*& Report ZMK_LOCAL_CLASS_INHERIT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_local_class_inherit.

CLASS lcl_shape DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor,
             show_shape.
ENDCLASS.

CLASS lcl_shape IMPLEMENTATION.
  METHOD constructor.
    WRITE: 'Super Class Shape Constructor'.
  ENDMETHOD.

  METHOD show_shape.
    WRITE: / 'Show Shape lcl_shape'.
  ENDMETHOD.
ENDCLASS.

CLASS lcl_circle DEFINITION INHERITING FROM lcl_shape.
  PUBLIC SECTION.
    METHODS: constructor,
             show_shape REDEFINITION.
ENDCLASS.

CLASS lcl_circle IMPLEMENTATION.
  METHOD constructor.
    super->constructor( ).
    WRITE: / 'Subclass Circle Constructor'.
  ENDMETHOD.

  METHOD show_shape.
    super->show_shape( ).

    WRITE: / 'Show Shape Redefinition lcl_circle'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

DATA: go_class TYPE REF TO lcl_circle.

CREATE OBJECT go_class.

go_class->show_shape( ).
