# London to Shanghai
DIR=result
CITY=shanghai
OUTPUT_DIR=$DIR/$CITY
mkdir -p $OUTPUT_DIR

DATE=`date '+%Y%m%d%H%M%S'`
curl -s 'https://gw.flight.qunar.com/api/f/priceCalendar?dep=%E4%BC%A6%E6%95%A6&arr=%E4%B8%8A%E6%B5%B7&days=&priceType=2' \
  -H 'authority: gw.flight.qunar.com' \
  -H 'accept: */*' \
  -H 'accept-language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7' \
  -H 'referer: https://flight.qunar.com/' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="100", "Google Chrome";v="100"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: script' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-gpc: 1' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36' \
  --compressed > $OUTPUT_DIR/$DATE.json

CITY=beijing
OUTPUT_DIR=$DIR/$CITY
mkdir -p $OUTPUT_DIR

DATE=`date '+%Y%m%d%H%M%S'`
curl -s 'https://gw.flight.qunar.com/api/f/priceCalendar?dep=%E4%BC%A6%E6%95%A6&arr=%E5%8C%97%E4%BA%AC(BJS)&days=&priceType=2' \
  -H 'authority: gw.flight.qunar.com' \
  -H 'accept: */*' \
  -H 'accept-language: en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7' \
  -H 'referer: https://flight.qunar.com/' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="100", "Google Chrome";v="100"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: script' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-site: same-site' \
  -H 'sec-gpc: 1' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36' \
  --compressed > $OUTPUT_DIR/$DATE.json
