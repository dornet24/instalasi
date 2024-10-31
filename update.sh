#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY��4-  ���Tp}���~�ގ����  D   � P P-��qt�4B������=!����P44b4d�M $�i4�����=M3P=@  4   � �&�	��z�I�j4 4h �� �4ha!��44ɣ@2@ h$��ɦ�6��zd�S���h��z�G��ePz��_g�^D�>�0̓��J�E�+��(ҝi�a�ToVID�t*/t��T�	�/ K�*g�2�%H�caz/�c!�� �d��4	��Sm��M�z�0�wLa��Xc�v�NB�nA�D�b�-����:udX�1��@BX��Cdw+���mj3��#&P`��[
R�9����Zj��
�X"\n���}D�vA�^<�Si�xw��1�T�i���!*�dJ���yU��8|S�JB"Ժ��!���;��n��9.cu��DID����)V�|���H��3��拚Xd�2���: ���f�a��p���`>��~V�C~6e3ԉt��72�$��R���27[�2(�����x:�9� �-Z�ÂA���*.��&�Z��\��+�A:����?.��R����J�<5\ٷT�������oX��)�I+ȶ��(���|5Jk1*V�"�D�y
����QJ�NB?b�h`:��c�G�YqD�섦��"�c�b���Jev�i�.3�)�
���"4�@%/@a�J�n0�47U5E��S��X��L�݋:Ch�eV�x����B�`2�N���_C*�1�Y ]��.����XP^�|��*��JX�f\`�Bq8,1	�E�Ԕ'Xl,)8������QC4$�/]�Q�R�j�R��+C�%¥Q�@[��%���!��HU�M��Ff����L;�C�2�h9�b@���$	���c��ZIΘA�rE8P���4-