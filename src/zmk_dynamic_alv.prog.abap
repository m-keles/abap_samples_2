*&---------------------------------------------------------------------*
*& Report ZMK_DYNAMIC_ALV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zmk_dynamic_alv.

TYPES: BEGIN OF gty_table,
         tcno       TYPE n LENGTH 11,
         ad(30), "Type c length 30
         soyad(30),
         sirket(30),
         banka(30),
         secim, "type c length 1
       END OF gty_table.

DATA: gs_table TYPE gty_table,  "Structure
      gt_table TYPE TABLE OF gty_table. "Internal Table

TYPES: BEGIN OF gty_tc,
         tc_no TYPE n LENGTH 11,
       END OF gty_tc.

DATA: gs_tc TYPE gty_tc,
      gt_tc TYPE TABLE OF gty_tc.

DATA: gs_fcat TYPE lvc_s_fcat,
      gt_fcat TYPE lvc_t_fcat.

TYPES: BEGIN OF gty_sirket,
         sirket(30),
       END OF gty_sirket.

DATA: gs_sirket TYPE gty_sirket,
      gt_sirket TYPE TABLE OF gty_sirket.

TYPES: BEGIN OF gty_banka,
         banka(30),
       END OF gty_banka.

DATA: gs_banka TYPE gty_banka,
      gt_banka TYPE TABLE OF gty_banka.

DATA: lv_number TYPE i.

gs_table-tcno = 98463728192.
gs_table-ad   ='AHMET'.
gs_table-soyad = 'AK'.
gs_table-sirket = 'APPLE'.
gs_table-banka = 'GARANTI'.
APPEND gs_table TO gt_table.
CLEAR: gs_table.
gs_table-tcno = 98463728192.
gs_table-ad   ='AHMET'.
gs_table-soyad = 'AK'.
gs_table-sirket = 'APPLE'.
gs_table-banka = 'ZIRAAT'.
APPEND gs_table TO gt_table.
CLEAR: gs_table.
gs_table-tcno = 63829310876.
gs_table-ad   ='OSMAN'.
gs_table-soyad = 'GUMUS'.
gs_table-sirket = 'MICROSOFT'.
gs_table-banka = 'HALKBANK'.
APPEND gs_table TO gt_table.
CLEAR: gs_table.
gs_table-tcno = 36785673421.
gs_table-ad   ='MUSTAFA'.
gs_table-soyad = 'GEMICI'.
gs_table-sirket = 'TESLA'.
gs_table-banka = 'MNG'.
APPEND gs_table TO gt_table.
CLEAR: gs_table.
gs_table-tcno = 36785673421.
gs_table-ad   ='MUSTAFA'.
gs_table-soyad = 'GEMICI'.
gs_table-sirket = 'TESLA'.
gs_table-banka = 'DEUTSCHEBANK'.
APPEND gs_table TO gt_table.
CLEAR: gs_table.
gs_table-tcno = 63425789301.
gs_table-ad   ='MEHMET'.
gs_table-soyad = 'GULMEZ'.
gs_table-sirket = 'AUDI'.
gs_table-banka = 'YAPIKREDI'.
APPEND gs_table TO gt_table.
CLEAR: gs_table.
gs_table-tcno = 98767876543.
gs_table-ad   ='MEHMET'.
gs_table-soyad = 'ONAY'.
gs_table-sirket = 'BMW'.
gs_table-banka = 'AKBANK'.
APPEND gs_table TO gt_table.
CLEAR: gs_table.
gs_table-tcno = 64537455645.
gs_table-ad   ='AYSE'.
gs_table-soyad = 'ASLAN'.
gs_table-sirket = 'KOC'.
gs_table-banka = 'KUVEYTBANK'.
APPEND gs_table TO gt_table.
CLEAR: gs_table.
gs_table-tcno = 64537455645.
gs_table-ad   ='AYSE'.
gs_table-soyad = 'ASLAN'.
gs_table-sirket = 'TENCENT'.
gs_table-banka = 'ALBARAKA'.
APPEND gs_table TO gt_table.
CLEAR: gs_table.
gs_table-tcno = 63410876543.
gs_table-ad   ='AYSE'.
gs_table-soyad = 'KOCAK'.
gs_table-sirket = 'KOC'.
gs_table-banka = 'AKBANK'.
APPEND gs_table TO gt_table.
CLEAR: gs_table.

LOOP AT gt_table INTO gs_table.
  gs_tc-tc_no = gs_table-tcno.
  APPEND gs_tc TO gt_tc.
  CLEAR: gs_tc.

  gs_sirket-sirket = gs_table-sirket.
  APPEND gs_sirket TO gt_sirket.
  CLEAR: gs_sirket.

  gs_banka-banka = gs_table-banka.
  APPEND gs_banka TO gt_banka.
  CLEAR: gs_banka.
ENDLOOP.

SORT gt_tc ASCENDING BY tc_no.
DELETE ADJACENT DUPLICATES FROM gt_tc.

SORT gt_sirket ASCENDING BY sirket.
DELETE ADJACENT DUPLICATES FROM gt_sirket.

SORT gt_banka ASCENDING BY banka.
DELETE ADJACENT DUPLICATES FROM gt_banka.

gs_fcat-fieldname = 'SECIM'.
gs_fcat-scrtext_s = 'Secim'.
gs_fcat-coltext = 'Secim'.
gs_fcat-outputlen = 2.
APPEND gs_fcat TO gt_fcat.
CLEAR: gs_fcat.

gs_fcat-fieldname = 'TC_NO'.
gs_fcat-scrtext_s = 'TC Kimlik'.
gs_fcat-coltext = 'TC Kimlik'.
gs_fcat-outputlen = 12.
APPEND gs_fcat TO gt_fcat.
CLEAR: gs_fcat.

gs_fcat-fieldname = 'AD'.
gs_fcat-scrtext_s = 'Ad'.
gs_fcat-coltext   = 'Ad'.
gs_fcat-outputlen = 30.
APPEND gs_fcat TO gt_fcat.
CLEAR: gs_fcat.

gs_fcat-fieldname = 'SOYAD'.
gs_fcat-scrtext_s = 'Soyad'.
gs_fcat-coltext   = 'Soyad'.
gs_fcat-outputlen = 30.
APPEND gs_fcat TO gt_fcat.
CLEAR: gs_fcat.

LOOP AT gt_sirket INTO gs_sirket.
  gs_fcat-fieldname = gs_sirket-sirket.
  gs_fcat-scrtext_s = gs_sirket-sirket.
  gs_fcat-coltext   = gs_sirket-sirket.
  gs_fcat-outputlen = 30.
  APPEND gs_fcat TO gt_fcat.
  CLEAR: gs_fcat.
ENDLOOP.

LOOP AT gt_banka INTO gs_banka.
  gs_fcat-fieldname = gs_banka-banka.
  gs_fcat-scrtext_s = gs_banka-banka.
  gs_fcat-coltext   = gs_banka-banka.
  gs_fcat-outputlen = 30.
  APPEND gs_fcat TO gt_fcat.
  CLEAR: gs_fcat.
ENDLOOP.


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

LOOP AT gt_tc INTO gs_tc.
  ASSIGN COMPONENT 'TC_NO' OF STRUCTURE <st_tab> TO <fs_val>.
  <fs_val> = gs_tc-tc_no.

  LOOP AT gt_table INTO gs_table WHERE tcno = gs_tc-tc_no.
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

DATA: gt_fcat_new TYPE slis_t_fieldcat_alv,
      gs_fcat_new LIKE LINE OF gt_fcat_new.

LOOP AT gt_fcat INTO gs_fcat.
  gs_fcat_new-fieldname = gs_fcat-fieldname.
  gs_fcat_new-seltext_l = gs_fcat-coltext.
  APPEND gs_fcat_new TO gt_fcat_new.
  CLEAR: gs_fcat_new.

ENDLOOP.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
  EXPORTING
*   I_INTERFACE_CHECK                 = ' '
*   I_BYPASSING_BUFFER                = ' '
*   I_BUFFER_ACTIVE                   = ' '
*   I_CALLBACK_PROGRAM                = ' '
*   I_CALLBACK_PF_STATUS_SET          = ' '
*   I_CALLBACK_USER_COMMAND           = ' '
*   I_CALLBACK_TOP_OF_PAGE            = ' '
*   I_CALLBACK_HTML_TOP_OF_PAGE       = ' '
*   I_CALLBACK_HTML_END_OF_LIST       = ' '
*   I_STRUCTURE_NAME                  =
*   I_BACKGROUND_ID                   = ' '
*   I_GRID_TITLE                      =
*   I_GRID_SETTINGS                   =
*   IS_LAYOUT   =
    it_fieldcat = gt_fcat_new
*   IT_EXCLUDING                      =
*   IT_SPECIAL_GROUPS                 =
*   IT_SORT     =
*   IT_FILTER   =
*   IS_SEL_HIDE =
*   I_DEFAULT   = 'X'
*   I_SAVE      = ' '
*   IS_VARIANT  =
*   IT_EVENTS   =
*   IT_EVENT_EXIT                     =
*   IS_PRINT    =
*   IS_REPREP_ID                      =
*   I_SCREEN_START_COLUMN             = 0
*   I_SCREEN_START_LINE               = 0
*   I_SCREEN_END_COLUMN               = 0
*   I_SCREEN_END_LINE                 = 0
*   I_HTML_HEIGHT_TOP                 = 0
*   I_HTML_HEIGHT_END                 = 0
*   IT_ALV_GRAPHICS                   =
*   IT_HYPERLINK                      =
*   IT_ADD_FIELDCAT                   =
*   IT_EXCEPT_QINFO                   =
*   IR_SALV_FULLSCREEN_ADAPTER        =
* IMPORTING
*   E_EXIT_CAUSED_BY_CALLER           =
*   ES_EXIT_CAUSED_BY_USER            =
  TABLES
    t_outtab    = <t_tab>.
