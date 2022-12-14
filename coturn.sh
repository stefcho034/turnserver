#!/bin/sh
echo "Updating packages ..."

sudo apt-get -y update

echo "Installing coturn ..."

sudo apt-get -y install coturn

echo "Stopping coturn ..."

sudo systemctl stop coturn


echo "Delete the unnecessary files"

fullchain="/etc/certs/fulchain.pem"

if [ -f "$fullchain" ] ; then
    sudo rm "$fullchain"
fi

privkey="/etc/certs/privkey.pem"

if [ -f "$privkey" ] ; then
  sudo rm "$privkey"
fi


turnserverconf="/etc/turnserver.conf"

if [ -f "$turnserverconf" ] ; then
   sudo  rm "$turnserverconf"
fi

coturn="/etc/default/coturn"

if [ -f "$coturn" ] ; then
    sudo rm "$coturn"
fi





echo "Enable Coturn"

sudo /bin/sh -c 'echo "TURNSERVER_ENABLED=1" >> /etc/default/coturn'

echo "Making directory for the certs"
sudo mkdir /etc/certs

echo "Add the certificates"

sudo /bin/sh -c 'echo "-----BEGIN CERTIFICATE-----
MIIFKDCCBBCgAwIBAgISA1LorVxPtTqIWxXdrGavY5CPMA0GCSqGSIb3DQEBCwUA
MDIxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MQswCQYDVQQD
EwJSMzAeFw0yMjExMDMxMDM5MzVaFw0yMzAyMDExMDM5MzRaMBwxGjAYBgNVBAMM
ESoua3NpbWNvbm5lY3QuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEA1OggCxwZ85BOlYERF2rVLI0XS8ggvWCRrV0qAv+x+nSORSeYGZ6/NGgKrWOO
A7+xYbBH7QU/GuZxroB9gX1SYX8UK9NkUZZVh0DLKjB/41Om9k4wW2lVyVq3S6k6
Nq2HXu2MVvkB63MmEPWMRhVoSUt+DdnQHCnB2E3z0s6KRpd3AFBp1eDKtPJTuHnW
eie2sFufw6jOhQB/55Y4qjJvRJEhNoZyOuG4aMMEFQxUrvj6MW7Wm9FRD4S5IH0K
K9BZA9R5fYqpz3sbUgpVKNN6nrMhKhkn5LYdxKjnt+Y66bd8U+s7jDOjiGTQdxuV
/NkfEI2X1ztXlPK1FzwhBS/a4QIDAQABo4ICTDCCAkgwDgYDVR0PAQH/BAQDAgWg
MB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0G
A1UdDgQWBBQAymZ7Gxt1F6sawGaNyJ9616mX7DAfBgNVHSMEGDAWgBQULrMXt1hW
y65QCUDmH6+dixTCxjBVBggrBgEFBQcBAQRJMEcwIQYIKwYBBQUHMAGGFWh0dHA6
Ly9yMy5vLmxlbmNyLm9yZzAiBggrBgEFBQcwAoYWaHR0cDovL3IzLmkubGVuY3Iu
b3JnLzAcBgNVHREEFTATghEqLmtzaW1jb25uZWN0LmNvbTBMBgNVHSAERTBDMAgG
BmeBDAECATA3BgsrBgEEAYLfEwEBATAoMCYGCCsGAQUFBwIBFhpodHRwOi8vY3Bz
LmxldHNlbmNyeXB0Lm9yZzCCAQQGCisGAQQB1nkCBAIEgfUEgfIA8AB1AHoyjFTY
ty22IOo44FIe6YQWcDIThU070ivBOlejUutSAAABhD1KE8AAAAQDAEYwRAIgbnDI
BUuYFEmlMgVuaZf7qegeII0XgucPcN4xMbBFP40CICNgpskdEnOScYX9B17wnZec
vqG5/WqCyuOUamkZRl0UAHcA6D7Q2j71BjUy51covIlryQPTy9ERa+zraeF3fW0G
vW4AAAGEPUoTrwAABAMASDBGAiEA7Jp7X8HjR2OcxfSeluQyhPdqY82y7mjW57kB
lRfG+KoCIQDXXImRDJqUESvxnF2KC+G/2QsBEE91AjyW+uEcmhOo/TANBgkqhkiG
9w0BAQsFAAOCAQEAulVx7/c+cjH/batpGZZs2W/FhECVzwQalZEWHgYxGsxdkurC
R5qeIh4XBkWmPOjOOEC6sJfSNRJxI4MwV2EY//KICs8/0qg1GdLfN/sqHoMx+2qN
OUMYucLyRUiY2c84kv5vCjqinKpW/i9TKj1ORUjtTk0KyvMM/EQ2DwEICPI/Agpv
lVuPy4yjwgVY25pmlMdG1FyaX/1HIZAO7B8k17Ai3uXXmVkA/wPUuEox2XEUehuS
f6Q7aY9u8DJaDbjqGBQcqaFdXhaUPh20OtfpvVwmVCtK+zHt0O4xlDeNa1lDfSJF
meSn7E5zz9tmcqUNL38kDK3eFf/5Zx/g52K9XQ==
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIFFjCCAv6gAwIBAgIRAJErCErPDBinU/bWLiWnX1owDQYJKoZIhvcNAQELBQAw
TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh
cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMjAwOTA0MDAwMDAw
WhcNMjUwOTE1MTYwMDAwWjAyMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNTGV0J3Mg
RW5jcnlwdDELMAkGA1UEAxMCUjMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQC7AhUozPaglNMPEuyNVZLD+ILxmaZ6QoinXSaqtSu5xUyxr45r+XXIo9cP
R5QUVTVXjJ6oojkZ9YI8QqlObvU7wy7bjcCwXPNZOOftz2nwWgsbvsCUJCWH+jdx
sxPnHKzhm+/b5DtFUkWWqcFTzjTIUu61ru2P3mBw4qVUq7ZtDpelQDRrK9O8Zutm
NHz6a4uPVymZ+DAXXbpyb/uBxa3Shlg9F8fnCbvxK/eG3MHacV3URuPMrSXBiLxg
Z3Vms/EY96Jc5lP/Ooi2R6X/ExjqmAl3P51T+c8B5fWmcBcUr2Ok/5mzk53cU6cG
/kiFHaFpriV1uxPMUgP17VGhi9sVAgMBAAGjggEIMIIBBDAOBgNVHQ8BAf8EBAMC
AYYwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMBMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0OBBYEFBQusxe3WFbLrlAJQOYfr52LFMLGMB8GA1UdIwQYMBaA
FHm0WeZ7tuXkAXOACIjIGlj26ZtuMDIGCCsGAQUFBwEBBCYwJDAiBggrBgEFBQcw
AoYWaHR0cDovL3gxLmkubGVuY3Iub3JnLzAnBgNVHR8EIDAeMBygGqAYhhZodHRw
Oi8veDEuYy5sZW5jci5vcmcvMCIGA1UdIAQbMBkwCAYGZ4EMAQIBMA0GCysGAQQB
gt8TAQEBMA0GCSqGSIb3DQEBCwUAA4ICAQCFyk5HPqP3hUSFvNVneLKYY611TR6W
PTNlclQtgaDqw+34IL9fzLdwALduO/ZelN7kIJ+m74uyA+eitRY8kc607TkC53wl
ikfmZW4/RvTZ8M6UK+5UzhK8jCdLuMGYL6KvzXGRSgi3yLgjewQtCPkIVz6D2QQz
CkcheAmCJ8MqyJu5zlzyZMjAvnnAT45tRAxekrsu94sQ4egdRCnbWSDtY7kh+BIm
lJNXoB1lBMEKIq4QDUOXoRgffuDghje1WrG9ML+Hbisq/yFOGwXD9RiX8F6sw6W4
avAuvDszue5L3sz85K+EC4Y/wFVDNvZo4TYXao6Z0f+lQKc0t8DQYzk1OXVu8rp2
yJMC6alLbBfODALZvYH7n7do1AZls4I9d1P4jnkDrQoxB3UqQ9hVl3LEKQ73xF1O
yK5GhDDX8oVfGKF5u+decIsH4YaTw7mP3GFxJSqv3+0lUFJoi5Lc5da149p90Ids
hCExroL1+7mryIkXPeFM5TgO9r0rvZaBFOvV2z0gp35Z0+L4WPlbuEjN/lxPFin+
HlUjr8gRsI3qfJOQFy/9rKIJR0Y/8Omwt/8oTWgy1mdeHmmjk7j1nYsvC9JSQ6Zv
MldlTTKB3zhThV1+XWYp6rjd5JW1zbVWEkLNxE7GJThEUG3szgBVGP7pSWTUTsqX
nLRbwHOoq7hHwg==
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIFYDCCBEigAwIBAgIQQAF3ITfU6UK47naqPGQKtzANBgkqhkiG9w0BAQsFADA/
MSQwIgYDVQQKExtEaWdpdGFsIFNpZ25hdHVyZSBUcnVzdCBDby4xFzAVBgNVBAMT
DkRTVCBSb290IENBIFgzMB4XDTIxMDEyMDE5MTQwM1oXDTI0MDkzMDE4MTQwM1ow
TzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh
cmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwggIiMA0GCSqGSIb3DQEB
AQUAA4ICDwAwggIKAoICAQCt6CRz9BQ385ueK1coHIe+3LffOJCMbjzmV6B493XC
ov71am72AE8o295ohmxEk7axY/0UEmu/H9LqMZshftEzPLpI9d1537O4/xLxIZpL
wYqGcWlKZmZsj348cL+tKSIG8+TA5oCu4kuPt5l+lAOf00eXfJlII1PoOK5PCm+D
LtFJV4yAdLbaL9A4jXsDcCEbdfIwPPqPrt3aY6vrFk/CjhFLfs8L6P+1dy70sntK
4EwSJQxwjQMpoOFTJOwT2e4ZvxCzSow/iaNhUd6shweU9GNx7C7ib1uYgeGJXDR5
bHbvO5BieebbpJovJsXQEOEO3tkQjhb7t/eo98flAgeYjzYIlefiN5YNNnWe+w5y
sR2bvAP5SQXYgd0FtCrWQemsAXaVCg/Y39W9Eh81LygXbNKYwagJZHduRze6zqxZ
Xmidf3LWicUGQSk+WT7dJvUkyRGnWqNMQB9GoZm1pzpRboY7nn1ypxIFeFntPlF4
FQsDj43QLwWyPntKHEtzBRL8xurgUBN8Q5N0s8p0544fAQjQMNRbcTa0B7rBMDBc
SLeCO5imfWCKoqMpgsy6vYMEG6KDA0Gh1gXxG8K28Kh8hjtGqEgqiNx2mna/H2ql
PRmP6zjzZN7IKw0KKP/32+IVQtQi0Cdd4Xn+GOdwiK1O5tmLOsbdJ1Fu/7xk9TND
TwIDAQABo4IBRjCCAUIwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAQYw
SwYIKwYBBQUHAQEEPzA9MDsGCCsGAQUFBzAChi9odHRwOi8vYXBwcy5pZGVudHJ1
c3QuY29tL3Jvb3RzL2RzdHJvb3RjYXgzLnA3YzAfBgNVHSMEGDAWgBTEp7Gkeyxx
+tvhS5B1/8QVYIWJEDBUBgNVHSAETTBLMAgGBmeBDAECATA/BgsrBgEEAYLfEwEB
ATAwMC4GCCsGAQUFBwIBFiJodHRwOi8vY3BzLnJvb3QteDEubGV0c2VuY3J5cHQu
b3JnMDwGA1UdHwQ1MDMwMaAvoC2GK2h0dHA6Ly9jcmwuaWRlbnRydXN0LmNvbS9E
U1RST09UQ0FYM0NSTC5jcmwwHQYDVR0OBBYEFHm0WeZ7tuXkAXOACIjIGlj26Ztu
MA0GCSqGSIb3DQEBCwUAA4IBAQAKcwBslm7/DlLQrt2M51oGrS+o44+/yQoDFVDC
5WxCu2+b9LRPwkSICHXM6webFGJueN7sJ7o5XPWioW5WlHAQU7G75K/QosMrAdSW
9MUgNTP52GE24HGNtLi1qoJFlcDyqSMo59ahy2cI2qBDLKobkx/J3vWraV0T9VuG
WCLKTVXkcGdtwlfFRjlBz4pYg1htmf5X6DYO8A4jqv2Il9DjXA6USbW1FzXSLr9O
he8Y4IWS6wY7bCkjCWDcRQJMEhg76fsO3txE+FiYruq9RUWhiF1myv4Q6W+CyBFC
Dfvp7OOGAN6dEOM4+qR9sdjoSYKEBpsr6GtPAQw4dy753ec5
-----END CERTIFICATE-----" >> /etc/certs/fullchain.pem'


sudo /bin/sh -c 'echo "-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDU6CALHBnzkE6V
gREXatUsjRdLyCC9YJGtXSoC/7H6dI5FJ5gZnr80aAqtY44Dv7FhsEftBT8a5nGu
gH2BfVJhfxQr02RRllWHQMsqMH/jU6b2TjBbaVXJWrdLqTo2rYde7YxW+QHrcyYQ
9YxGFWhJS34N2dAcKcHYTfPSzopGl3cAUGnV4Mq08lO4edZ6J7awW5/DqM6FAH/n
ljiqMm9EkSE2hnI64bhowwQVDFSu+Poxbtab0VEPhLkgfQor0FkD1Hl9iqnPextS
ClUo03qesyEqGSfkth3EqOe35jrpt3xT6zuMM6OIZNB3G5X82R8QjZfXO1eU8rUX
PCEFL9rhAgMBAAECggEARBDR7btWMJ/5/6H7rNjivhN9VyTsEp9E83/NZpgIdmG8
+i7mWYp+5mo8v6IMTPaD5w9Mb2I2AouZ3IgHl9ZQ+AqAkGJMuCivv0XfreVDfZHI
1wW4QAE1A+KUpwO7MK/Zj2eybju9eWCe0t0ts1o0tPoFmrf/6IERD+4b/VE6s8Yz
Zmgu+sNwilNJKf0tWBWqhl7zTEwyDBCKSJSj+XaN06AVt2GJrSMrBGa5+n81QTIg
hzUQQdvH24iK/JKJHnQP/jqbXbbeuAc7E0QHKS5iKLbRMGvPTH6To0qevelUJcMa
l3bn9BSIQu/CvasWWX7JY/foBJSp1sCGfRc99TbhYQKBgQDqQbhicNecFURdtlbp
u0lHWYIWW0KYVvkC2dSORRH3LfJyCYlmHqC9u+h6sy20BiDRIfneuDmYW/Y1+cwV
W5+Rm0EOD5xub4kWCsBaXAOVUIkYRrYV7udW77OrCrLpUZjRf+Nvvl+ni+2CwHw7
lHVNE1gq1Q/dB/XlJU/yjTLTfwKBgQDoqxkvVlgfG/eep9aXpCWpKALEBDbsFY+S
pGXsTMHCvZj/oNP7BVJgVmx+OWNGCv16kLVK470jQRb8S5J8xH7M2rZ9zU34VWnr
JkLpiGtF4/+v2Y0a2fnIqo6T3FBTElAfgc6F+dt1MwI7Ezc0CO0FqemGdza9LDBb
2bWA6bUBnwKBgQDNbdTEfzCVMBFEHSMa1aLtbxElieJcteipF13PZcLbgO+cEcDs
TO+pc5/r+jWaKcWdoK3/Io9fjUXdD7JpCHBmwD/MlOQZ9LXDHqqQkyCRUI7pOxlz
Io69LnfhBwDemy/oiL5qwAgiZhNjFmnb1dUIQm6PIUlIDDMXQCFcE3b/AQKBgA3T
9Wg50nzu1ZWpVfinOdHG3fs2YOlBEspdWO1lVnKzf/9ZWJ/nnhC5sjMCSCMmjhAV
v6CWzmvk92/BMhCWQQ79xLDPXd3vfZ8LJBjrEa0SsuSJonhBEjZZ5KVnB6MYSIjG
1zZhNijOAkjuiG5gRW37vjROq4MsuCcNVls2CJrzAoGBALdPCulQHgc6eB3RKnyw
acnaXO6nBa+aTeeesncOXC8RBbjeoMK2rsG2aRry9HSAWLRyXprR7EynJoq+R698
bClfRkoPjy4Y6uTAD4aJIk4KUiUWLZQ0DX/fBMQYPj7TAtdVEoLPdO6/pXOOaWZb
zeaxfdvfPbSIUcij2TLVe6jY
-----END PRIVATE KEY-----" >> /etc/certs/privkey.pem'


echo "Edit turnserver.config file"

sudo /bin/sh -c 'echo "listening-port=3478" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "tls-listening-port=5349" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "fingerprint" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "lt-cred-mech" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "server-name=ksimconnect.com" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "realm=ksimconnect.com" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "user=ksim-turn-dev:P@ssWord12345" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "total-quota=100" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "stale-nonce=600" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "cert=/etc/certs/fullchain.pem" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "pkey=/etc/certs/privkey.pem" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "cipher-list="\"ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-SHA384\" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "proc-user=turnserver" >> /etc/turnserver.conf'
sudo /bin/sh -c 'echo "proc-group=turnserver" >> /etc/turnserver.conf'


echo "Starting COTURN Server"
sudo systemctl start coturn

echo "Checking the status of COTURN Server"
sudo systemctl status coturn
