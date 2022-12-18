*&---------------------------------------------------------------------*
*& Report ZMK_DYNAMIC_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_dynamic_alv_inline_decl.

TYPES: BEGIN OF gty_table,
         tcno       TYPE n LENGTH 11,
         ad(30), "Type c length 30
         soyad(30),
         sirket(30),
         banka(30),
         secim, "type c length 1
       END OF gty_table.

TYPES: BEGIN OF gty_tc,
         tc_no TYPE n LENGTH 11,
       END OF gty_tc.

DATA: gt_tc TYPE TABLE OF gty_tc.

TYPES: BEGIN OF gty_sirket,
         sirket(30),
       END OF gty_sirket.

DATA: gt_sirket TYPE TABLE OF gty_sirket.

TYPES: BEGIN OF gty_banka,
         banka(30),
       END OF gty_banka.

DATA: gt_banka TYPE TABLE OF gty_banka.

DATA: lv_number TYPE i.

TYPES: gtt_table TYPE TABLE OF gty_table WITH EMPTY KEY.

*DATA: gt_table TYPE gtt_table.
*
*gt_table = VALUE #( ( tcno = 98463728192 ad = 'AHMET' soyad = 'AK' sirket = 'APPLE' banka = 'GARANTI'  )
*                    ( tcno = 98463728192 ad = 'AHMET' soyad = 'AK' sirket = 'APPLE' banka = 'ZIRAAT'  )
*                    ( tcno = 63829310876 ad = 'OSMAN' soyad = 'GUMUS' sirket = 'MICROSOFT' banka = 'HALKBANK'  )
*                    ( tcno = 36785673421 ad = 'MUSTAFA' soyad = 'GEMICI' sirket = 'TESLA' banka = 'MNG'  )
*                    ( tcno = 36785673421 ad = 'MUSTAFA' soyad = 'GEMICI' sirket = 'TESLA' banka = 'DEUTSCHEBANK'  )
*                    ( tcno = 63425789301 ad = 'MEHMET' soyad = 'GULMEZ' sirket = 'AUDI' banka = 'YAPIKREDI'  )
*                    ( tcno = 98767876543 ad = 'MEHMET' soyad = 'ONAY' sirket = 'BMW' banka = 'AKBANK'  )
*                    ( tcno = 64537455645 ad = 'AYSE' soyad = 'ASLAN' sirket = 'KOC' banka = 'KUVEYTBANK'  )
*                    ( tcno = 64537455645 ad = 'AYSE' soyad = 'ASLAN' sirket = 'TENCENT' banka = 'ALBARAKA'  )
*                    ( tcno = 63410876543 ad = 'AYSE' soyad = 'KOCAK' sirket = 'KOC' banka = 'AKBANK'  ) ).



DATA(gt_table) = VALUE gtt_table( ( tcno = 98463728192 ad = 'AHMET' soyad = 'AK' sirket = 'APPLE' banka = 'GARANTI'  )
                                  ( tcno = 98463728192 ad = 'AHMET' soyad = 'AK' sirket = 'APPLE' banka = 'ZIRAAT'  )
                                  ( tcno = 63829310876 ad = 'OSMAN' soyad = 'GUMUS' sirket = 'MICROSOFT' banka = 'HALKBANK'  )
                                  ( tcno = 36785673421 ad = 'MUSTAFA' soyad = 'GEMICI' sirket = 'TESLA' banka = 'MNG'  )
                                  ( tcno = 36785673421 ad = 'MUSTAFA' soyad = 'GEMICI' sirket = 'TESLA' banka = 'DEUTSCHEBANK'  )
                                  ( tcno = 63425789301 ad = 'MEHMET' soyad = 'GULMEZ' sirket = 'AUDI' banka = 'YAPIKREDI'  )
                                  ( tcno = 98767876543 ad = 'MEHMET' soyad = 'ONAY' sirket = 'BMW' banka = 'AKBANK'  )
                                  ( tcno = 64537455645 ad = 'AYSE' soyad = 'ASLAN' sirket = 'KOC' banka = 'KUVEYTBANK'  )
                                  ( tcno = 64537455645 ad = 'AYSE' soyad = 'ASLAN' sirket = 'TENCENT' banka = 'ALBARAKA'  )
                                  ( tcno = 63410876543 ad = 'AYSE' soyad = 'KOCAK' sirket = 'KOC' banka = 'AKBANK'  )
                                  ( tcno = 63410876543 ad = 'AYSE' soyad = 'KOCAK' sirket = 'KOC' banka = 'CREDITSUISSE'  ) ).


LOOP AT gt_table ASSIGNING FIELD-SYMBOL(<gs_table>).

  APPEND INITIAL LINE TO gt_tc ASSIGNING FIELD-SYMBOL(<gs_tc>).
  <gs_tc>-tc_no = <gs_table>-tcno.

  APPEND INITIAL LINE TO gt_sirket ASSIGNING FIELD-SYMBOL(<gs_sirket>).
  <gs_sirket>-sirket = <gs_table>-sirket.

  APPEND INITIAL LINE TO gt_banka ASSIGNING FIELD-SYMBOL(<gs_banka>).
  <gs_banka>-banka = <gs_table>-banka.


ENDLOOP.

SORT gt_tc ASCENDING BY tc_no.
DELETE ADJACENT DUPLICATES FROM gt_tc.

SORT gt_sirket ASCENDING BY sirket.
DELETE ADJACENT DUPLICATES FROM gt_sirket.

SORT gt_banka ASCENDING BY banka.
DELETE ADJACENT DUPLICATES FROM gt_banka.


DATA(gt_fcat) = VALUE lvc_t_fcat( ( fieldname = 'SECIM' scrtext_s = 'Secim'     coltext = 'Secim'     outputlen = 2 )
                                  ( fieldname = 'TC_NO' scrtext_s = 'TC Kimlik' coltext = 'TC Kimlik' outputlen = 12 )
                                  ( fieldname = 'AD'    scrtext_s = 'Ad'        coltext = 'Ad'        outputlen = 30 )
                                  ( fieldname = 'SOYAD' scrtext_s = 'Soyad'     coltext = 'Soyad'     outputlen = 30 ) ).

gt_fcat = VALUE #( BASE gt_fcat FOR gs_sirket IN gt_sirket ( fieldname = gs_sirket-sirket scrtext_s = gs_sirket-sirket coltext = gs_sirket-sirket outputlen = 30 ) ).

gt_fcat = VALUE #( BASE gt_fcat FOR gs_banka  IN gt_banka  ( fieldname = gs_banka-banka scrtext_s = gs_banka-banka coltext = gs_banka-banka outputlen = 30 ) ).


FIELD-SYMBOLS: <t_tab>  TYPE STANDARD TABLE,
               <st_tab>,
               <fs_val> TYPE any.

DATA: dt_1 TYPE REF TO data,
      ds_1 TYPE REF TO data.

CALL METHOD cl_alv_table_create=>create_dynamic_table
  EXPORTING
    it_fieldcatalog = gt_fcat
  IMPORTING
    ep_table        = dt_1.


ASSIGN dt_1->* TO <t_tab>.

CREATE DATA ds_1 LIKE LINE OF <t_tab>.

ASSIGN ds_1->* TO <st_tab>.

LOOP AT gt_tc ASSIGNING <gs_tc>.
  ASSIGN COMPONENT 'TC_NO' OF STRUCTURE <st_tab> TO <fs_val>.
  <fs_val> = <gs_tc>-tc_no.

  LOOP AT gt_table INTO DATA(gs_table) WHERE tcno = <gs_tc>-tc_no.
    ASSIGN COMPONENT 'AD' OF STRUCTURE <st_tab> TO <fs_val>.
    <fs_val> = gs_table-ad.

    ASSIGN COMPONENT 'SOYAD' OF STRUCTURE <st_tab> TO <fs_val>.
    <fs_val> = gs_table-soyad.

    ASSIGN COMPONENT gs_table-sirket OF STRUCTURE <st_tab> TO <fs_val>.
    <fs_val> = 'Bu sirkette calisiyor'.

    ASSIGN COMPONENT gs_table-banka OF STRUCTURE <st_tab> TO <fs_val>.
    <fs_val> = 'Bu bankada hesabi var'.
  ENDLOOP.

  ASSIGN COMPONENT 'SECIM' OF STRUCTURE <st_tab> TO <fs_val>.
  <fs_val> = lv_number + 1.
  lv_number = lv_number + 1.
  APPEND <st_tab> TO <t_tab>.
  CLEAR: <st_tab>.
ENDLOOP.


DATA(gt_fcat_new) = VALUE slis_t_fieldcat_alv( FOR gs_fcat IN gt_fcat ( fieldname = gs_fcat-fieldname seltext_l = gs_fcat-coltext  ) ).


CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
    it_fieldcat = gt_fcat_new
  TABLES
    t_outtab    = <t_tab>.
