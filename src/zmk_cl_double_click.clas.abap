class ZMK_CL_DOUBLE_CLICK definition
  public
  final
  create public .

public section.

  methods DOUBLE_CLCK
    for event DOUBLE_CLICK of CL_GUI_ALV_GRID
    importing
      !E_ROW
      !E_COLUMN
      !ES_ROW_NO .
protected section.
private section.
ENDCLASS.



CLASS ZMK_CL_DOUBLE_CLICK IMPLEMENTATION.


  method DOUBLE_CLCK.
  endmethod.
ENDCLASS.
