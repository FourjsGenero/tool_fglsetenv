MAIN
  DEFINE comp,usr,te STRING
  OPEN FORM f FROM "setenvGDC"
  DISPLAY FORM f
  LET te=sfmt("FGLSERVER=%1;export FGLSERVER;_FGLFEID=%2;export _FGLFEID;",
    fgl_getenv("FGLSERVER"),fgl_getenv("_FGLFEID"))
  LET usr=fgl_getenv("FGLUSER")
  IF usr IS NOT NULL THEN
     LET te=te,sfmt("FGLUSER=%1;export FGLUSER;",usr)
  END IF
  LET comp=fgl_getenv("FGLCOMPUTER")
  IF comp IS NOT NULL THEN
     LET te=te,sfmt("FGLCOMPUTER=%1;export FGLCOMPUTER;",comp)
  END IF
  IF usr IS NOT NULL AND comp IS NOT NULL THEN
    CALL fgl_settitle(sfmt("fglsetenvGDC %1@%2",usr,comp))
  ELSE
    CALL fgl_settitle("fglsetenvGDC")
  END IF
  CALL ui.Interface.frontCall("standard","cbset",[te],[])
  INPUT BY NAME te WITHOUT DEFAULTS
END MAIN
