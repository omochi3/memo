#!/bin/bash -eu

function usage() {
  cat <<_EOT_
Usage:
  $0 [-d delay [-c count]]

Description:
  温度(現在、平均、最小、最大)を報告する。

Options:
  -d    更新の間隔。単位は秒。 delay が指定されなければ、1回だけ報告される。
  -c    更新の回数。 count が指定されず、 delay が指定されている場合は、 count のデフォルトは無限回になる。

_EOT_
  exit 1
}

# 変数
OPT_D=
DELAY=
MAX_COUNT=-1
CUR_TEMP=0
MIN_TEMP=999999
MAX_TEMP=0
SUM_TEMP=0
CNT=0


# 処理
if [ ${OPTIND} = 1 ]; then
  while getopts d:c:h OPT
  do
    case ${OPT} in
      d)
        DELAY=${OPTARG}
        OPT_D=ON
        ;;
      c)
        ! test -z ${OPT_D} || usage
        MAX_COUNT=${OPTARG}
        ;;
      h)
        usage
        ;;
      \?)
        usage
        ;;
    esac
  done
else
  exit
fi

shift $(( OPTIND -1 ))

while :
  do
    [ ! $(( ${CNT} % 20 )) -eq 0 ] || echo --------date------- -CUR- -MIN- -MAX- -AVG-
    CUR_TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
    CNT=$(( ${CNT} + 1 ))
    [ ! ${CUR_TEMP} -lt ${MIN_TEMP} ] || MIN_TEMP=${CUR_TEMP}
    [ ! ${MAX_TEMP} -lt ${CUR_TEMP} ] || MAX_TEMP=${CUR_TEMP}
    SUM_TEMP=$(( ${SUM_TEMP} + ${CUR_TEMP} ))
    echo $(date +"%Y/%m/%d %H:%M:%S") ${CUR_TEMP} ${MIN_TEMP} ${MAX_TEMP} $(( ${SUM_TEMP} / ${CNT} ))
    ! test -z ${DELAY} || break
    [ ! ${MAX_COUNT} -eq ${CNT} ] || break
    sleep ${DELAY}
done
