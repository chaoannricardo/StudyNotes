# msvcr100 Missing Fix on Windows

Reference:

 https://forum.gamer.com.tw/Co.php?bsn=08610&sn=643429

https://i1254789.pixnet.net/blog/post/97888511

* Download and install Microsoft Visual C++ redistributable 2010

* 到 C:\Windows.old\System32 (64位元的要去 

  C:\Windows.old\SysWOW64)(注意:不是 C:\Windows) 把 msvcp100.dll 和 msvcr100.dll 兩個檔案複製到 

  C:\Windows\System32 (64位元的到 C:\Windows\SysWOW64)





# The following error message appears during installation: 

# Reference: https://lingvo-support.abbyy.com/hc/en-us/articles/115005570829-Error-message-during-installation-Access-to-file-C-Users-USERNAME-AppData-Local-Temp-rollback-is-denied-



**Access to file C:\Users\%USERNAME%\AppData\Local\Temp\rollback is denied**

If **antivirus software** is running on your computer, disable it and try to install ABBYY Lingvo again.

If the problem persists, change the values of the TMP and TEMP environment variables before making another attempt to install the program.

To change environment variables, complete the steps below.

1. Go to **[Control Panel](https://support.microsoft.com/en-us/help/13764/windows-where-is-control-panel) >** **(System and security >) System**.
2. On the left select **Advanced system settings**.
3. Click the **Environment Variables** button.
4. Select the **TMP** variable in the **User variables** section.
5. Click the **Edit** button.
6. Specify a new value for the variable, for example **C:\Temp**.
7. Select the **TEMP** variable in the **User variables** section and repeat steps 7 and 8.
8. Launch installation again.