*&---------------------------------------------------------------------*
*& Report ZMK_EVENT_HANDLER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_event_handler.

DATA: go_raise  TYPE REF TO zmk_raise_event,
      go_handle TYPE REF TO zmk_raise_event_handle.

PARAMETERS: p_speed TYPE i.

START-OF-SELECTION.

  CREATE OBJECT go_raise.
  CREATE OBJECT go_handle.

  SET HANDLER go_handle->handle_top_speed FOR go_raise.

  CALL METHOD go_raise->get_speed
    EXPORTING
      i_speed = p_speed.
