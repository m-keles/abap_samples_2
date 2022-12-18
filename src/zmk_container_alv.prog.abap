*&---------------------------------------------------------------------*
*& Report ZMK_CONTAINER_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_container_alv.



INCLUDE zmk_container_alv_top.

INCLUDE zmk_container_alv_cls.

INCLUDE zmk_container_alv_f01.

INCLUDE zmk_container_alv_pbo.

INCLUDE zmk_container_alv_pai.




START-OF-SELECTION.

  PERFORM get_data.

  CALL SCREEN 0200.
