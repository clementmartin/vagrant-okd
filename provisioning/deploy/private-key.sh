#!/bin/bash
mkdir -p $HOME/.ssh
chmod 700 $HOME/.ssh

cat <<EOF > $HOME/.ssh/id_rsa
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAybuJfsr3KNcgMb7kl1fpo7TRqSk5q/y29ioMXVqUWteeu1Rf
jB9YjtUFehe7Drj795b7HprcCTjxRo3iyqPnu18fY2/0SRkMlQzARs48eQKOBRcN
AsYj6sEVEdeXmm9lH1lfUryJb1EwBT+jqaLt5MFrX3VDhuCrxU6Fmqss9K2td79L
J2dU3BufWb/RvgjKI2VKlxU/rkAH0J7aoq38Eg+IQ2vJ4e2UnJqkHrlNoQzzZhpB
N9ReIBSWk/+fdLQgBJMxzjGJEOcdRelbeTHmLo5pYC9mjR41k1sr7imd3sNaEe8M
MVdjOJRG90WGr2YflgEU0DUWx8z3wXD8gkpT/wIDAQABAoIBAHcntIEV9YND/hoj
/PV/0dsGVMisNwplTNR95avGctZtga54ma80XKSRIpkJJ0386adGoLFlGw6/eZQI
/qpeweOkve+IEyySBSKM041/B60aWzSadu7qhhCFV6KgS0XHAl3P9kPyZONBezG+
czchq45wyLErnGUwk4UJalT/QqCKYG6XUwkwCSjjE2fXqJH35vCYy8j5OZXNg6Ka
CpHeLvxlYCV3wyLDRB1cc59OTFuf2Lc49J23EN22HHfxERdrjgb/JqmSkolwgkRU
O/ITUfoNM35sze+nknJCjLwuJ9qqC66Gjc49/fFkuVTEUse+TxEP2VGPas5B7iN3
ZXvpGvECgYEA8dmfeG90YjH0WQTSoTjeN/nEruo8pXXOOiK1a4aU5AkNnAb5wIC/
2f9qnvxlcmxknfCPEEedvSTLvyAy+ckyNSlQRARci/R+YNmpmnHXM9iclcoaoOUb
M2gSeZqcrJrMaqMbyZLjx2hsVOWyZoFg2Cx0iAQJRsim+0nuo+W+SOMCgYEA1YkK
9D6WmQkQzQZhVEYm3+50GSTRSNFFJ4AH9ALDoadXGSXeSsFHtp2N3oOfZTZL2ftw
NcZae3CBSpbTjsxKtqJn6Z4EeKkAIQ7kh1Ua1qWS7dEmItxdn3k/eJnRPoDOsqPP
K8je2SzX5MeCHo1uByYMP/foEEsJmXGPbyQTXzUCgYEAyJXZCJdP7L1HzqkMVMEI
tV5HfVcy03xgfaEZ3MNzK6pCilzSuZFPDWwkrxXgwcUask+5KCRttFkXTz5SaQ8w
wByywKbpZv5x7ru4SisO9KY8QJOuADHknH89i3Pra9C7p9n+CvH0TwfRiZw0mYXG
n6RHRiQq2XVD4PjRn0fFyUcCgYEApqVfASJfUWt7yyXxi118NULZJE5RbmyzdZI7
orkNh/kaxiuBggG5P9FRyJgcK1bmd2X9OlpkfvVcUaPH0yeoH0Q7qFyDzM7HpQUE
YIGQgneRZTvWcVpdTnnHiQ0x+X940H16zwbis8aFbqws5j8l4TpWUQ3d8+k7wp6X
e/tBiwkCgYEA1NAnwCpOMwcBgyY2LWo+koIo6XygTaxzxV92Rm9hvkHa+FjMMPR7
flgMihvoIxeI9zW4IGJ/42J8W1UZ+OHLHLntRHzFsQwEuzH8Jql9goQnLhPm6WVG
25EhqE0Pa8ycNPf4CFlsWqL/QmNg7M/I7YyOOzJ0/RwAIZsJl5TRUWw=
-----END RSA PRIVATE KEY-----
EOF

chmod 600 $HOME/.ssh/id_rsa
