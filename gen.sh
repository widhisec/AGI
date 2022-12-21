#!/usr/bin/env bash
WAKTU=$(date +%s%N|cut -b1-13)
uuid=$(od -x /dev/urandom | head -1 | awk '{OFS="-"; print $2$3,$4,$5,$6,$7$8$9}')
SPINNER_() {
  local delay="0.1"
  printf "\e[38;5;$((RANDOM%257))m%s\r\e[0m" "[$(date '+%d/%m/%Y %H:%M:%S')][ ✅  ✅  ✅   wait for code!   ✅  ✅  ✅ ]"; sleep "$delay"
  return
}

FINDING_TEMP(){
	_username=$(curl -sk 'https://randomuser.me/api/' |grep -Po '(?<=username":")[^"]*')
       _password=$(curl -sk 'https://randomuser.me/api/' |grep -Po '(?<=salt":")[^"]*')
	#grep -Po '(?<=predmetZkraceny":")[^"]*' |grep "is your Instagram"|tr -d -c 0-9
     local x_reque=$(curl -s -k -X $'POST' \
     -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
     -H $'X-Requested-With: XMLHttpRequest' \
     -H $'Origin: https://www.fakemail.net' \
     -H $'Referer: https://www.fakemail.net/' \
     -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36 Edg/108.0.1462.46' \
    --data-binary $"emailInput=$_username&format=json" $'https://www.fakemail.net/index/new-email/' \
  --compressed -k --cookie-jar "$_username.cookie")                 
}
#brownpanda842@falltrack.net
GENERATE_(){
    FINDING_TEMP
    local GGGEN_=$(
             curl -s -k -X $'POST' \
    -H $'Host: i.instagram.com' \
    -H $'X-Ig-App-Locale: en_US' \
    -H $'X-Ig-Device-Locale: en_US' \
    -H $'X-Ig-Mapped-Locale: en_US' \
    -H $'User-Agent: Instagram 257.1.0.16.110 Android (25/7.1.2; 239dpi; 720x1280; Asus; ASUS_Z01QD; ASUS_Z01QD; intel; en_US)' \
    -H $'Accept-Language: en-US' \
    --data-urlencode "email=${_username}@falltrack.net" \
    --data-urlencode "username=${_username}" \
    --data-urlencode "device_id=android-${uuid}" \
    $'https://i.instagram.com/api/v1/accounts/username_suggestions/')
   local GGEK_=$(curl -s -k -X $'POST' \
    -H $'Host: i.instagram.com' \
    -H $'User-Agent: Instagram 257.1.0.16.110 Android (25/7.1.2; 239dpi; 720x1280; Asus; ASUS_Z01QD; ASUS_Z01QD; intel; en_US)' \
    -H $'Accept-Language: en-US' \
    -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
    --data-urlencode "device_id=android-${uuid}" \
    --data-urlencode "email=${_username}@falltrack.net" \
    $'https://i.instagram.com/api/v1/accounts/send_verify_email/')
    #local CHEK_=$(echo -e "${GGGEN_}"|grep -Po '(?<="available":)[^",]*')
    local GNM_=$(echo -e "${GGGEN_}"|grep -Po '(?<=username":")[^"]*'|head -1)
    while [[ true ]]; do
        #printf "${GNM_}\n" 
         local X_KEY=$(curl -sk -X GET 'https://www.fakemail.net/index/refresh'    \
       -H 'Connection: keep-alive'   \
       -H 'Sec-Fetch-Site: same-origin' \
       -H 'User-Agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36 Edg/108.0.1462.46'   \
       -H 'X-Requested-With: XMLHttpRequest' --compressed -k -b "$_username.cookie"|grep -Po '(?<=redmetZkraceny":")[^"]*')
         if [[ $X_KEY =~ "is your Instagram" ]]; then
             local xKEY_=$(echo -e "${X_KEY}"|grep "is your Instagram"|tr -d -c 0-9)
             local zSenD=$( curl -s -k -X $'POST' \
     -H $'Host: i.instagram.com' \
     -H $'X-Ig-App-Locale: en_US' \
     -H $'X-Ig-Device-Locale: en_US' \
     -H $'User-Agent: Instagram 257.1.0.16.110 Android (25/7.1.2; 239dpi; 720x1280; Asus; ASUS_Z01QD; ASUS_Z01QD; intel; en_US)' \
     -H $'Accept-Language: en-US' \
     -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
     --data-urlencode "code=${xKEY_}" \
     --data-urlencode "email=${_username}@falltrack.net" \
     --data-urlencode "device_id=android-${uuid}" \
     $'https://i.instagram.com/api/v1/accounts/check_confirmation_code/')
             local xSign=$(echo -e "${zSenD}"|grep -Po '(?<=signup_code":")[^"]*')
             local x_GeN=$( curl  -s -k -X $'POST' \
    -H $'Host: i.instagram.com' \
    -H $'X-Ig-App-Locale: en_US' \
    -H $'X-Ig-Mapped-Locale: en_US' \
    -H $'User-Agent: Instagram 257.1.0.16.110 Android (25/7.1.2; 239dpi; 720x1280; Asus; ASUS_Z01QD; ASUS_Z01QD; intel; en_US)' \
    -H $'Accept-Language: en-US' \
    -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
    --data-urlencode "username=${GNM_}" \
    --data-urlencode "first_name=${_username}" \
    --data-urlencode "year=1999" \
    --data-urlencode "day=16" \
    --data-urlencode "month=12" \
    --data-urlencode "email=${_username}@falltrack.net" \
    --data-urlencode "enc_password=#PWD_INSTAGRAM_BROWSER:0:${WAKTU}:${_password}" \
    --data-urlencode "allow_contacts_sync=true" \
    --data-urlencode "device_id=android-${uuid}" \
    --data-urlencode "force_sign_up_code=${xSign}" \
    --data-urlencode "do_not_auto_login_if_credentials_match=true" \
    --data-urlencode "one_tap_opt_in=true" \
    $'https://i.instagram.com/api/v1/accounts/create/')
             echo $x_GeN
             echo "USERNAME : ${GNM_}"
             echo "PASSWORD : ${_password}"
             rm -rf *.cookie
             break
    else 
         SPINNER_
    fi
done

 

}
GENERATE_
