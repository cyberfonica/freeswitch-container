# Entrypoint for Freeswitch Container. Handles env variables

# Variables and their defaults
# DEFAULT_FREESWITCH_SIP_DOMAIN="localhost"
# DEFAULT_FREESWITCH_DIRECTORY_GATEWAY_URL="http://nimbustelweb/api/v2/dids/plivo/directory/"

function replace_var() {
    nvar=$1
    val=$2
    file=$3
    sed -i -r "s/($nvar)/$val/g" $file
    echo "Updating Freeswitch config VAR: $nvap -> $val"
}

if [ "$FREESWITCH_SIP_DOMAIN" ]; then
    replace_var "FREESWITCH_SIP_DOMAIN" $FREESWITCH_SIP_DOMAIN /usr/local/freeswitch/conf/vars.xml
else
    echo "Must set FREESWITCH_SIP_DOMAIN and FREESWITCH_DIRECTORY_GATEWAY_URL environment variables"
    exit
fi

if [ "$AUTH_ID" ]; then
    replace_var "FREESWITCH_DIRECTORY_GATEWAY_URL" $FREESWITCH_DIRECTORY_GATEWAY_URL /usr/local/freeswitch/conf/vars.xml
else
    echo "Must set FREESWITCH_SIP_DOMAIN and FREESWITCH_DIRECTORY_GATEWAY_URL environment variables"
    exit
fi

service freeswitch start && tail -f /usr/local/freeswitch/log/freeswitch.log
