class ZMK_GL_CLASS definition
  public
  create public .

public section.

  data NUMBER type INT4 value 100 ##NO_TEXT.

  methods GET_NUMBER
    importing
      !IV_NUMBER type INT4
    exporting
      !EV_NUMBER type INT4 .
  methods WRITE_NUMBER
    importing
      !IV_NUMBER type INT4 .
  methods WRITE_ATTRIBUTE .
  methods CONSTRUCTOR .
protected section.
private section.
ENDCLASS.



CLASS ZMK_GL_CLASS IMPLEMENTATION.


  method CONSTRUCTOR.

    me->number = 300.
  endmethod.


  method GET_NUMBER.
    ev_number = iv_number * 2.
  endmethod.


  method WRITE_ATTRIBUTE.
    DATA: number TYPE i VALUE 200.
    WRITE: me->number.
    WRITE: / number.
  endmethod.


  method WRITE_NUMBER.

    WRITE: iv_number.
  endmethod.
ENDCLASS.
