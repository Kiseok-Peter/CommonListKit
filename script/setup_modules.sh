####################
# -c / --clean : tuist cache clean
#
####################

# 위에 정의된 arguments 파싱
while [ "$#" -gt 0 ]; do
  case "$1" in
    -c|--clean) TUIST_CACHE_CLEAN=1; shift 1;;
    
    -*) echo "unknown option: $1" >&2; exit 1;;
    *) handle_argument "$1"; shift 1;;
  esac
done

cp Tuist/Package.swift ./

# 적용된 arguments 확인용 print
echo TUIST_CACHE_CLEAN = ${TUIST_CACHE_CLEAN}

if [ ${TUIST_CACHE_CLEAN} ]
then
    mise x -- tuist clean
    mise x -- tuist install
    mise x -- tuist generate --no-open
else
    mise x -- tuist install
    mise x -- tuist generate --no-open
fi
