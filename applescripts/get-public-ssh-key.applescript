-- author: David Dyer
-- authorURL: https://www.daviddyer.me
-- description: Copy SSH public key to clipboard.

do shell script "pbcopy < ~/.ssh/id_rsa.pub"