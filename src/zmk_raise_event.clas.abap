class ZMK_RAISE_EVENT definition
  public
  create public .

public section.

  events TOP_SPEED
    exporting
      value(E_SPEED) type INT4 .

  methods GET_SPEED
    importing
      !I_SPEED type INT4 .
protected section.
private section.
ENDCLASS.



CLASS ZMK_RAISE_EVENT IMPLEMENTATION.


  method GET_SPEED.

    IF i_speed <= 100.
      WRITE: 'The Speed is normal', i_speed.
    ELSE.
      RAISE EVENT top_speed EXPORTING e_speed = i_speed.
    ENDIF.
  endmethod.
ENDCLASS.
