class ZMK_RAISE_EVENT_HANDLE definition
  public
  create public .

public section.

  methods HANDLE_TOP_SPEED
    for event TOP_SPEED of ZMK_RAISE_EVENT
    importing
      !E_SPEED .
protected section.
private section.
ENDCLASS.



CLASS ZMK_RAISE_EVENT_HANDLE IMPLEMENTATION.


  method HANDLE_TOP_SPEED.

    WRITE: / 'Event Handler Methode funktioniert.'.

    WRITE: / 'You are very fast. Your speed is', e_speed.

  endmethod.
ENDCLASS.
