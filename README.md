# Private-Locker Encryption Locker

## WARNING! YOU CAN LOSE YOUR DATA IF YOU DO NOT TAKE CARE OF YOUR LOCKERKEYS OR LOCKER! YOU HAVE BEEN WARNED!

Target OS: Windows 7/8/10

## DISCLAIMER: Private-Locker does NOT take any responsibility for the mis-use of this Software. This software is OPEN-SOURCED, Please Credit "Private-Locker" or "REDD" for the talented work on this Project.

   "How this was made? I saw how WannaCry and other Ransomware would "Hold You Hostage". So I decided to sit down, make a PoC (Proof of Concept) that quickly turned into a Security Tool that could be used to lock and unlock your own files. So I held onto the files, even released them for Hak5 as a Demo on the BashBunny, but quickly realized it had "Ransomware" qualities. I quickly removed it. But as times come to pass; Security is getting better. There's other Programmers besides myself that could benefit from this project. Prevent the next wave of "Ransomware".
     -REDD "


Encryption Process Details:
 - Run the "RUN.CMD", The script will create a "Locker" folder on the Desktop.
 - Script Generates a Uniquely Generated AES Key to a Key file with the PC Name in the "lockerkeys" folder where RUN.CMD is.
 - Store any file in the "Locker" Folder you want Encrypted.
 - Run "RUN.CMD", The Encryption will take place.
 - ## DO NOT EXIT/CLOSE THE PROGRAM OR REMOVE THE USB! YOU HAVE BEEN WARNED!
 - Your Files have been Encrypted!

Decryption Process Details:
 - Run "RUN.CMD", If the correct lockerkey for that machine is present in the "lockerkeys" folder. Decryption will start.
 - IF there isn't the correct "Key", it will deny you.
 - ## IF THE KEY IS TAMPERED, ALTERED, CHANGED IN ANY WAY, ALL DATA COULD BE CORRUPTED!
 - Once Decrypting is finished, PrivLocker will wait for any key to close.
 - All the files you Encrypted are now back to normal.
 
 
## New 1.8 Features -
 - Can now Edit Encrypted Extension via "Settings.db" File.
 - Adds Private-Locker Terms Agreement.
 
## Enjoy!


Credit: -REDD