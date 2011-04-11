title Multi Launcher App.
Writen by Jagodragon
cls
@echo off
:begining
cls
if exist Launcher_data/setupdone goto start
color E2
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                                                                             º
echo º      M       M    W           W            W           W    L               º
echo º      MM     MM     W         W              W         W     L      her      º
echo º      M M   M M      W   W   W       OOO      W   W   W      L    nc         º
echo º      M  M M  M       W W W W       O   O      W W W W       L  au           º
echo º      M   M   M       WW   WW       O   O      WW   WW       L               º
echo º      M       M ULTI  W     W .      OOO .     W     W  .    LLLLLL          º
echo º                                                                             º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º                           Created by: Jago Dragon                           º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
pause
:setpass
cls
Echo This is your first time running this file. We are going to start the setup 
echo proccess now. This will create a new folder in the directory that this batch 
echo file was placed in and use it to store your settings in. 
echo .
echo Do you want to password protect 
set /p passprotect=the list of WoW instances on this pc? [Y]/n :
if %passprotect%. == . set passprotect=Y
if %passprotect% == y set passprotect=Y
if %passprotect% == yes set passprotect=Y
if %passprotect% == YES set passprotect=Y
if %passprotect% == Yes set passprotect=Y
if %passprotect% == yep set passprotect=Y
if %passprotect% == Yep set passprotect=Y
if %passprotect% == YEP set passprotect=Y
if %passprotect% == n set passprotect=N
if %passprotect% == no set passprotect=N
if %passprotect% == No set passprotect=N
if %passprotect% == NO set passprotect=N
if %passprotect% == N ( 
set password=none
cls
goto configstep2
)
:getpass
set /p password=Enter Your password  :
set /p password2=Reenter your password:
if not %password%==%password2% (
  cls
  echo Passwords did not match
  echo Please redo it or  pres cntrl+C to close this window.
  goto getpass
)
if not %password%. == . (
cls
goto configstep2
)
cls
echo You did not enter a password!
goto getpass

:configstep2
set wowtitle=
set wowpassaccess=
set wowpass=
set wowpass2=
echo now we will enter your first instance of wow that you have.
echo (set up will not finish with out setting this up)
echo Please name the first WoW instalation you want to 
set /p wowtitle=appear on the list? [Main]:
if %wowtitle%. == . set wowtitle=Main
set /p wowpassaccess=Do you want to use a password to access %wowtitle%? y/[n]:
if %wowpassaccess%. == . set wowpassaccess=n
if %wowpassaccess% == N set wowpassaccess=n
if %wowpassaccess% == n set wowpass=none
if %wowpassaccess% == n goto afterpass 
if %wowpassaccess% == Y set wowpassaccess=y
if not %wowpassaccess% == y (
echo Sorry, I did not understand your response?
goto configstep2
)
:getwowpass
set /p wowpass=enter your pass  :
set /p wowpass2=reenter your pass:
if %wowpass% == %wowpass2% goto afterpass
cls
echo Sorry, your passwords did not mach!
echo Please try again.
goto getwowpass

:afterpass
cls
echo Please enter the directory path that %wowtitle%s wow.exe file is in?
echo this can be either static path
echo   such as ["C:/User/Public/Games/World of Warcraft"] -- Default
echo or a relative path 
echo   such as ["../World of Warcraft"] 
echo Please remember to use quotes and use Forward slashes "/".
set /p wowdir= :
if %wowdir%. == . set wowdir=C:/User/Public/Games/World of Warcraft
cls

:setrealmlist
set realmchoose=
echo Choose your realm list for %wowtitle%.
echo 1: retail wow -- default
echo 2: custom realm list
set /p realmchoose= :
if %realmchoose%. == . set realmchoose=1
if %realmchoose% == 1 (
set realmlistline1=set realmlist us.logon.worldofwarcraft.com
set realmlistline2=set patchlist us.version.worldofwarcraft.com
set realmlistline3=set realmlistbn ""
set realmlistline4=set portal us
goto nextstep
)
if not %realmchoose% == 2 (
cls
echo Sorry, I did not understand your selection?
goto setrealmlist
)
cls
set wowserve=
Echo please enter the address of your prefered WoW server for %wowtitle%.
echo (default is localhost)
set /p wowserver= :
if %wowserver%. == . set wowserver=localhost
cls
:setpatchlist
set pusher=
set pushpath=
set /p pusher=Do you recieve patches from %wowtitle%? y/[n] :
if %pusher%. == . set pusher=n
if %pusher% == n (
set realmlistline2=..
goto nopush
)
if not %pusher% == n (
echo What is the path that %wowtitle% pushes their patches from?
echo Default is what ever you set as the address of %wowtitle% 
echo "%wowserver%\updates" this is your default
set /p pushpath= :
)
if %pushpath%. == . set pushpath=%wowserver%/updates
set realmlistline2=set patchlist %pushpath%
:nopush
set realmlistline1=set realmlist %wowserver%
set realmlistline3=..
set realmlistline4=..
goto nextstep

:nextstep
cls
echo this is a look at the wowinstallation you defined...
echo.
echo Realm name is : %wowtitle%
echo located in %wowdir%
echo.
echo The realm list is as follows....
echo.
echo %realmlistline1%
echo %realmlistline2%
echo %realmlistline3%
echo %realmlistline4%
echo.
set /p check=is this correct? [y]/n:
if %check%. == . set check=y
if %check% == y goto finish
if %check% == n goto configstep2
if %check% == N goto configstep2
if %check% == NO goto configstep2
if %check% == No goto configstep2
if %check% == no goto configstep2

:finish
mkdir Launcher_data
(
echo %passprotect%
echo %password%
echo E
echo 2
echo 1
)>Launcher_data/trump.info
(
echo %wowtitle%
echo %wowdir%
echo %wowpassaccess%
echo %wowpass%
echo %realmlistline1%
echo %realmlistline2%
echo %realmlistline3%
echo %realmlistline4%
)>Launcher_data/wow1.info
(
date /t
time /t
)>Launcher_data/setupdone
(
echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo º                                                                             º
echo º      M       M    W           W            W           W    L               º
echo º      MM     MM     W         W              W         W     L      her      º
echo º      M M   M M      W   W   W       OOO      W   W   W      L    nc         º
echo º      M  M M  M       W W W W       O   O      W W W W       L  au           º
echo º      M   M   M       WW   WW       O   O      WW   WW       L               º
echo º      M       M ULTI  W     W .      OOO .     W     W  .    LLLLLL          º
echo º                                                                             º
echo ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶
echo º                           Created by: Jago Dragon                           º
echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
)>Launcher_data/logo.data

goto start

:start
cls
setLocal EnableDelayedExpansion
for /f "tokens=* delims= " %%a in (Launcher_data/trump.info) do (
set /a N+=1
set v!N!=%%a
)
set passprotect=!v1!
set password=!v2!
set background=!v3!
set text=!v4!
set numwows=!v5!
set N=0
set wowcount=1
set counted=0
color %background%%text%
cls
setLocal EnableDelayedExpansion
set x=1

Type Launcher_data\logo.data
echo.
:gettinglist
set /a counted+=1
for /f "tokens=* delims= " %%a in ( Launcher_data/wow%counted%.info ) do (
set /a N+=1
set l!N!=%%a
)
set wowtitle%counted%=!l%x%!
set /a x+=1
set wowdir%counted%=!l%x%!
set /a x+=1
set wowpassaccess%counted%=!l%x%!
set /a x+=1
set wowpass%counted%=!l%x%!
set /a x+=1
set realmlinea%counted%=!l%x%!
set /a x+=1
set realmlineb%counted%=!l%x%!
set /a x+=1
set realmlinec%counted%=!l%x%!
set /a x+=1
set realmlined%counted%=!l%x%!
set /a x+=1

:posttolist
echo %counted%: !wowtitle%counted%!
:endposttolist
if %counted% == %numwows% ( 
  set xx=%counted%
  goto displaylist3
) else (
  goto gettinglist
)

:displaylist3
set list=0
if exist Launcher_data\realms.info (
del Launcher_data\realms.info
)
:installedwows
set /a list="list+1"
(
echo %list%: !wowtitle%list%!
)>>Launcher_data\realms.info
if not %list% == %counted% goto installedwows
set /a xx+=1
echo %xx%: Modify list of wows.
set mod=%xx%
set /a xx+=1
echo %xx%: Change color scheme.
set colors=%xx%
set /a xx+=1
echo %xx%: Exit
set leave=%xx%
set /a xx+=1
echo %xx%: Uninstall
set uninstall=%xx%
:selectwow
echo.
set choose=100000
set /p choose=Whats your choose your choose? :
if %choose% == %mod% ( goto mod )
if /i %choose% == %colors% ( goto color )
if /i %choose% == %leave% exit
if /i %choose% == %uninstall% ( goto uninstall )
if /i %choose% gtr %uninstall% ( goto begining )
goto startwow

:startwow
set checkwowpass=
if !wowpassaccess%choose%! == n ( goto startwowtwo )
set /p checkwowpass=Please enter the password :
if !wowpass%choose%! == %checkwowpass% ( goto startwowtwo )
goto begining

:startwowtwo
cd !wowdir%choose%!
if not exist data\enUS\realmlist.wtf goto startwowthree
(
echo !realmlinea%choose%!
echo !realmlineb%choose%!
echo !realmlinec%choose%!
echo !realmlined%choose%!
)>data\enUS\realmlist.wtf
launcher.exe"
exit

:startwowthree
(
echo !realmlinea%choose%!
echo !realmlineb%choose%!
echo !realmlinec%choose%!
echo !realmlined%choose%!
)>realmlist.wtf
launcher.exe"
exit

:mod
cls
type Launcher_data\logo.data
echo.
set modchoose=none
if not %passprotect% == Y goto modstart
set /p modpasscheck=Please verify your pasword:
if not %modpasscheck% == %password% (
echo.
echo Entry was inccorect! Redirecting to start
Pause
goto begining
)
:modstart
cls
type Launcher_data\logo.data
echo.
echo Choose what you want to do...
echo 1: Add a new instance of wow.
echo 2: Remove an instance of wow.
echo 3: Go back, I changed my mind.
echo 4: Exit program so I can restart.
echo.
if %modchoose% == sorry echo Sorry, I did not understand your response! please try again..
set /p modchoose=Enter the number of your choose? [3]:
if %modchoose%. == . set modchoose=3
if %modchoose% == 3 goto begining
if %modchoose% == 1 goto add
if %modchoose% == 2 goto dell
if %modchoose% == 4 exit
set modchoose=sorry
goto modstart
:dell
cls
type Launcher_data\logo.data
echo.
echo This is a list of the current wow instalations.
echo Removing one from here will NOT uninstall it from your PC!
echo.
type Launcher_data\realms.info
echo.
set /p deleteing=Please enter your choose (entering nothing will take yuo back):
if %deleteing% LEQ 0 set sellchoose=10000
if %deleteing%. == . goto modstart
if not %deleteing% LEQ %numwows% (
echo Sorry, I do not understand that... Lets try again..
pause
goto dell
)
if %deleteing% == %numwows% goto deletelast
:deletemid
set /a transf="deleteing+1"
copy /Y "Launcher_data\wow%transf%.info" "Launcher_data\wow%deleteing%.info"
set deleteing=%transf%
if %deleteing% == %numwows% goto deletelast
goto deletemid
:deletelast
del "Launcher_data\wow%deleteing%.info"
set /a numwows-=1
(
echo %passprotect%
echo %password%
echo %background%
echo %text%
echo %numwows%
)>Launcher_data/trump.info

cls
type Launcher_data\logo.data
echo.
echo You will now need to restart the program to make the changes take affect.
pause
goto exit

:add
cls
type Launcher_data\logo.data
set newwow=%numwows%
set /a newwow+=1
set wowtitle=
set wowpassaccess=
set wowpass=
set wowpass2=
echo Please tell me the name for this instalation of WOW?
set /p wowtitle=Default is [WoW%newwow%]:
if %wowtitle%. == . set wowtitle=WoW%newwow%
set /p wowpassaccess=Do you want to use a password to access %wowtitle%? y/[n]:
if %wowpassaccess%. == . set wowpassaccess=n
if %wowpassaccess% == N set wowpassaccess=n
if %wowpassaccess% == n set wowpass=none
if %wowpassaccess% == n goto afterpass1 
if %wowpassaccess% == Y set wowpassaccess=y
if not %wowpassaccess% == y (
echo Sorry, I did not understand your response?
goto add
)
:getwowpass1
set /p wowpass=enter your pass  :
set /p wowpass2=reenter your pass:
if %wowpass% == %wowpass2% goto afterpass1
cls
type Launcher_data\logo.data
echo.
echo Sorry, your passwords did not mach!
echo Please try again.
goto getwowpass1

:afterpass1
cls
type Launcher_data\logo.data
echo.
echo Please enter the directory path that %wowtitle%s wow.exe file is in?
echo this can be either static path
echo   such as ["C:/User/Public/Games/World of Warcraft"] -- Default
echo or a relative path 
echo   such as ["../World of Warcraft"] 
echo Please remember to use quotes and use Forward slashes "/".
set /p wowdir= :
if %wowdir%. == . set wowdir=C:/User/Public/Games/World of Warcraft
cls
type Launcher_data\logo.data
echo.

:setrealmlist1
set realmchoose=
echo Choose your realm list for %wowtitle%.
echo 1: retail wow -- default
echo 2: custom realm list
set /p realmchoose= :
if %realmchoose%. == . set realmchoose=1
if %realmchoose% == 1 (
set realmlistline1=set realmlist us.logon.worldofwarcraft.com
set realmlistline2=set patchlist us.version.worldofwarcraft.com
set realmlistline3=set realmlistbn ""
set realmlistline4=set portal us
goto nextstep1
)
if not %realmchoose% == 2 (
cls
type Launcher_data\logo.data
echo.
echo Sorry, I did not understand your selection?
goto setrealmlist1
)
cls
type Launcher_data\logo.data
echo.
set wowserve=
Echo please enter the address of your prefered WoW server for %wowtitle%.
echo (default is localhost)
set /p wowserver= :
if %wowserver%. == . set wowserver=localhost
cls
type Launcher_data\logo.data
echo.
set pusher=
set pushpath=
set /p pusher=Do you recieve patches from %wowtitle%? y/[n] :
if %pusher%. == . set pusher=n
if %pusher% == n (
set realmlistline2=..
goto nopush1
)
if not %pusher% == n (
echo What is the path that %wowtitle% pushes their patches from?
echo Default is what ever you set as the address of %wowtitle% 
echo "%wowserver%\updates" this is your default
set /p pushpath= :
)
if %pushpath%. == . set pushpath=%wowserver%/updates
set realmlistline2=set patchlist %pushpath%
:nopush1
set realmlistline1=set realmlist %wowserver%
set realmlistline3=..
set realmlistline4=..
goto nextstep1

:nextstep1
cls
type Launcher_data\logo.data
echo This is a look at the wowinstallation you defined...
echo    Realm name is : %wowtitle%
echo    located in %wowdir%
echo.
echo The realm list is as follows....
echo    %realmlistline1%
echo    %realmlistline2%
echo    %realmlistline3%
echo    %realmlistline4%
echo.
set /p check=is this correct? [y]/n:
if %check%. == . set check=y
if %check% == y goto finish1
if %check% == n goto add
if %check% == N goto add
if %check% == NO goto add
if %check% == No goto add
if %check% == no goto add

:finish1
(
echo %passprotect%
echo %password%
echo %background%
echo %text%
echo %newwow%
)>Launcher_data/trump.info
set /a filenum="newwow+1"
(
echo %wowtitle%
echo %wowdir%
echo %wowpassaccess%
echo %wowpass%
echo %realmlistline1%
echo %realmlistline2%
echo %realmlistline3%
echo %realmlistline4%
)>Launcher_data/wow%newwow%.info

cls
type Launcher_data\logo.data
echo.
echo You will now need to restart the program to make the changes take affect.
pause
goto modstart

:color
cls
type Launcher_data\logo.data
set background=
set text=
echo Here you can select what colors you want to see when you use this launcher. You
echo can set the back ground and text colors to be any of the following colors by
echo choosing the color option when prompted (colors reset when restarted)
echo    0 = Black       8 = Gray
echo    1 = Blue        9 = Light Blue
echo    2 = Green       A = Light Green
echo    3 = Aqua        B = Light Aqua
echo    4 = Red         C = Light Red
echo    5 = Purple      D = Light Purple
echo    6 = Yellow      E = Light Yellow
echo    7 = White       F = Bright White
set /p background=What color would you like the background? [E]:
if %background%. == . set background=E
if %background% == 0 goto gettext
if %background% == 1 goto gettext
if %background% == 2 goto gettext
if %background% == 3 goto gettext
if %background% == 4 goto gettext
if %background% == 5 goto gettext
if %background% == 6 goto gettext
if %background% == 7 goto gettext
if %background% == 8 goto gettext
if %background% == 9 goto gettext
if %background% == a set background=A
if %background% == A goto gettext
if %background% == b set background=B
if %background% == B goto gettext
if %background% == c set background=C
if %background% == C goto gettext
if %background% == d set background=D
if %background% == D goto gettext
if %background% == e set background=E
if %background% == E goto gettext
if %background% == f set background=F
if %background% == F goto gettext
cls
echo Sorry, I did not understand your response?
goto color

:gettext
set /p text=What color would you like the text to be? [2]:
if %text%. == . set text=2
if %text% == 0 goto setthecolor
if %text% == 1 goto setthecolor
if %text% == 2 goto setthecolor
if %text% == 3 goto setthecolor
if %text% == 4 goto setthecolor
if %text% == 5 goto setthecolor
if %text% == 6 goto setthecolor
if %text% == 7 goto setthecolor
if %text% == 8 goto setthecolor
if %text% == 9 goto setthecolor
if %text% == a SET text=A
if %text% == b SET text=B
if %text% == c SET text=C
if %text% == d SET text=D
if %text% == e SET text=E
if %text% == f SET text=F
if %text% == A goto setthecolor
if %text% == B goto setthecolor
if %text% == C goto setthecolor
if %text% == D goto setthecolor
if %text% == E goto setthecolor
if %text% == F goto setthecolor
cls
echo Sorry, I did not understand your response?
Goto color
:setthecolor
(
echo %passprotect%
echo %password%
echo %background%
echo %text%
echo %numwows%
)>Launcher_data/trump.info
Echo The color will be reset when you restart the launcher.
cls
goto begining


:uninstall
cls
type Launcher_data\logo.data
echo.
set /p uninstallquestion=Do you really want to uninstall? [n]:
if %uninstallquestion%. == . set uninstallquestion=n
if %uninstallquestion% == N set uninstallquestion=n
if %uninstallquestion% == NO set uninstallquestion=n
if %uninstallquestion% == no set uninstallquestion=n
if %uninstallquestion% == n goto begining
if not %password% == none (
echo.
echo you need to enter your password to continue the uninstall proccess.
set /p uninstallpass=Please enter the password you choose during the setup :
) else (
goto uninstall2
)
if %uninstallpass% == %password% (
goto uninstall2
) else (
echo Your password was incorect!
pause
goto begining
)
:uninstall2
echo.
set /p uninstallquestion=Do you really want me to go away? [y]/n:
if %uninstallquestion% == N set uninstallquestion=n
if %uninstallquestion% == NO set uninstallquestion=n
if %uninstallquestion% == no set uninstallquestion=n
if %uninstallquestion% == n (
cls
goto begining
)
cls
type Launcher_data\logo.data
echo.
echo I am sorry that you did not like this launcher. I hope you can find 
echo one that works better for you and meets all your needs. 
echo you can still press [cntrl]+[c] to stop the install...
echo.
echo Good bye... :,(
pause
cls
rmdir /s /q Launcher_data
echo Uninstall complete
pause