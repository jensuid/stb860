#!/system/bin/sh

#updatable
VERSION="20191001"
#------------- DEFINE --------------------------
# direktori internal 
DIR_APP9191="/system/9191/app/"
DIR_APP="/sdcard/bak/app/"
DIR_SYSAPP="/sdcard/bak/sys/"
DIR_FIRST="/sdcard/bak/first/"
DIR_BAK="/sdcard/bak/"
DIR_BAK_TEMP="/sdcard/bak/temp/"
LOGGER="/sdcard/bak/stage"
DEBUG="/sdcard/bak/debug"

# direktori app system
DIR_PRIV="/system/priv-app/"

#------------ DIR SDCARD / FLASHDISK  -------------
DIR_APPSD="/storage/9D81-6E2F/b860h/apkset/staging/"
DIR_DATASETTINGSD="/storage/9D81-6E2F/b860h/apkset/settingB860/prepare/bak"

#-----IDENTIFIER-----
FILE_USERNAME="/data/data/pulpstone.pw/username.txt"
FILE_KODEAKTIVASI="/data/data/pulpstone.pw/kode_aktivasi.txt"
AKTVASI=""
USERNAME=""
KODE_AKTIVASI=""

# daftar apk yg didelete di 9191
# next pake keyword biar genera
#apkpure ilang
#tvku ilang
DEL_APK9191="
 PerfectPlayer_v1.4.8b3.apk
 SpeedtestbyOokla_v4.4.11.apk
 RadioIndonesia_v4.9.13.apk
 SmartYouTubeTV_v6.17.419.apk
 VLC_v3.1.7.apk
 LeanbackBackgroundChanger_v1.0.apk
 iFlix_v3.46.apk
 AptoideTV_v5.0.3.apk
 VidioTV_v1.22.1.apk
 LiveNetTV_v4.7.apk
";


# copy apk pengganti di 9191
# mnc ganti nama vision
# next keyword
NEW_APK9191="
 Perfect_Player_1.5.8.apk
 Speedtest_4.5.6.apk
 APKPure_3.17.9.apk
 iflix_3.43.1.apk
 VLC_3.2.11.apk
 smartyt_6.17.692.apk
";

#apk yang diinstall awal
appFirst="
ZalTV.apk
v5live.apk
";

#aptoid sudah masuk
# duta film out
copyApk="
AptoideTV_5.1.1.apk
chrome.work.apk
cloudTV.apk
cyberflix_3.2.2.apk
KidsYT_6.17.344.apk
Kodi_18.6.apk
Link2SD.apk
Netflix_latest.apk
Octopus_5.3.5.apk
TVBrowser.apk
Popcorn_3.6.4.apk
Titanium_2016.apk
UseeTV_GO_590.apk
Viki_2.3.6.apk
Viu_1.0.92.apk
Radio_Indonesia_4.11.0.apk
VidioTV_1.19.0.work.apk
LiveNetTV_4.7.4.apk
v5live.apk
vola_spo_6.5.apk
tvtap_2.5.apk
freeMovies_3.1.apk
nordVPN_4.5.3.apk
NF21_3.3.apk
ZalTV_1.2.5.apk
mkctv.apk
";

# data apk system
SYS_APP="
 SquareHome.apk=com.ss.squarehome2
 SkyRocketFly.apk=com.charon.rocketfly
 QuickSupport_15.4.61.apk=com.teamviewer.quicksupport.market
 minixpower.apk=com.minix.power_selector
 tinylauncher.apk=com.atomicadd.tinylauncher
";

# --- package bawaan yang mau dihapus
DEL_PKG="
  NO=com.android.launcher  
  /system/app/PulpstoneTvLauncher.apk=com.gigi.pulpstonetvlauncher
  /system/app/IPTV.apk=com.itv.android.iptv
  /system/priv-app/LiveTv/LiveTv.apk=com.android.tv
  /system/app/PulpstoneMerahPutih.apk=com.gigi.pulpstonemerahputih
 ";
 
DISABLE_PKG="
  YouTubeTV
  com.android.launcher
 ";

APP_INIT="
ZalTV=com.player.zaltv/.presentation.view.activity.StartupActivity
V5live=com.eletech.fastv/com.cloudtv.anyview.LoadingActivity
MXPlayer=com.mxtech.videoplayer.ad/.ActivityWelcomeMX
RedboxTV=com.redbox.tv/.MainActivity
";

APP_PERMISSIONS="
SquareHome=com.ss.squarehome2/STORAGE
SquareHome=com.ss.squarehome2/CALENDAR
YouTubeKids=com.liskovsoft.videomanager.kids/STORAGE
SmartYouTube=com.liskovsoft.videomanager/STORAGE
MXPlayer=com.mxtech.videoplayer.ad/STORAGE
PerfectPlayer=com.niklabs.pp/STORAGE
cyberflix=com.cybermedia.cyberflx/STORAGE
titanium=com.noname.titanium/STORAGE
NewCloudTV=com.cloudtv/STORAGE
NewCloudTV=com.cloudtv/PHONE
popcorn=dp.ws.popcorntime/STORAGE
liveNetTV=com.lnt.androidnettv/LOCATION
apkpure=com.apkpure.aegon/STORAGE
apkpure=com.apkpure.aegon/PHONE
MNCNow=com.zte.iptvclient.android.idmnc/PHONE
MNCNow=com.zte.iptvclient.android.idmnc/LOCATION
MNCNow=com.zte.iptvclient.android.idmnc/STORAGE
AptoideTV=cm.aptoidetv.pt/STORAGE
NF21=id.nf21.rbn1/STORAGE
NF21=id.nf21.rbn1/LOCATION
NF21=id.nf21.rbn1/CAMERA
";

#tambahkan youtbe dan yt kids
# mnc tidak perlu patching lagi
#MNCNow=com.zte.iptvclient.android.idmnc/.mvp.main.MainActivity
PKG_PATCHING="
SquareHome=com.ss.squarehome2/None
PerfectPlayer=com.niklabs.pp/com.niklabs.perfectplayer.MainActivity
ZalTV=com.player.zaltv/.presentation.view.activity.StartupActivity
V5live=com.eletech.fastv/com.cloudtv.anyview.LoadingActivity
RedboxTV=com.redstream.app/.activities.SplashActivity
cyberflix=com.cybermedia.cyberflx/com.cybermedia.cyberflix.ui.activity.HomeActivity
titanium=com.noname.titanium/.ui.activity.HomeActivity
LiveNetTV=com.core.lntmobile/.activities.SplashActivity
SmartYouTube=com.liskovsoft.videomanager/com.liskovsoft.smartyoutubetv.flavors.xwalk.SmartYouTubeTV1080AltActivity
YouTubeKids=com.liskovsoft.videomanager.kids/com.liskovsoft.smartyoutubetv.flavors.xwalk.SmartYouTubeTV1080AltActivity
MNCNow=com.zte.iptvclient.android.idmnc/.mvp.splashscreenv2.SplashScreenActivity
NF21=id.nf21.rbn1/.activities.Splash
ESFile=com.estrongs.android.pop.pro/com.estrongs.android.pop.view.FileExplorerActivity
mkctv=com.fikrul.mkctv/.presentation.view.activity.StartupActivity
";

PKG_TEST="
SmartYouTube=com.liskovsoft.videomanager/com.liskovsoft.smartyoutubetv.flavors.xwalk.SmartYouTubeTV1080AltActivity
nobi21=com.nobi21/.MainActivity
PerfectPlayer=com.niklabs.pp/com.niklabs.perfectplayer.MainActivity
netflix=com.netflix.mediaclient/.ui.launch.LaunchActivity
popcorn=dp.ws.popcorntime/se.popcorn_time.mobile.ui.MainActivity
viki=com.viki.android/.MainActivity
xx1lite=com.xx1.lite/.MainActivity 
mobdro=com.mobdro.android/com.mobdro.tv.TVActivity
YouTubeKids=com.liskovsoft.videomanager.kids/com.liskovsoft.smartyoutubetv.flavors.xwalk.SmartYouTubeTV1080AltActivity
cyberflix=com.cybermedia.cyberflx/com.cybermedia.cyberflix.ui.activity.HomeActivity
titanium=com.noname.titanium/.ui.activity.HomeActivity
iflix= iflix.play/my.com.iflix.mobile.ui.SplashActivity
hooq=tv.hooq.android/tv.hooq.androidbeta.features.launcher.SplashActivity
dutafilm=com.dutafilm.pulpstone/.MainActivity
ZalTV=com.player.zaltv/.presentation.view.activity.StartupActivity
V5live=com.eletech.fastv/com.cloudtv.anyview.LoadingActivity
RedboxTV=com.redbox.tv/.MainActivity
liveNetTV=com.lnt.androidnettv/.MainActivity 
NewCloudTV=com.cloudtv/.ui.splash.SplashActivity
MNCNow=com.zte.iptvclient.android.idmnc/.mvp.main.MainActivity
useetvgo=com.nbs.useetv/.ui.SplashscreenActivity
vidio=com.vidio.android.tv/.home.MainActivity
onnetv=com.onecode.tvindonesiatanpabuffer/.MainActivity
radio=com.worldradios.indonesie/.MainActivity
adaway=org.adaway/.ui.MainActivity
apkpure=com.apkpure.aegon/.main.activity.SplashActivity
";

PKG_LONGTEST="
SmartYouTube=com.liskovsoft.videomanager/com.liskovsoft.smartyoutubetv.flavors.xwalk.SmartYouTubeTV1080AltActivity
YouTubeKids=com.liskovsoft.videomanager.kids/com.liskovsoft.smartyoutubetv.flavors.xwalk.SmartYouTubeTV1080AltActivity
";


#---------- FUNCTION ------------------------

# --------- INIT ----------------------------
# delete apk di 9191 yg tidak di pakai
# next pake keyword

doDelApk9191(){
  for iapk in $DEL_APK9191; do
      echo "deleting .... $DIR_APP9191$iapk"
	  rm $DIR_APP9191$iapk
  done
  echo
}

#delete file patching 9191
doDelPatching9191(){
  mv /system/9191/upgrade/data_05.bin /system/9191/upgrade/data_0x5x.binx
  mv /system/9191/upgrade/data_06.bin /system/9191/upgrade/data_0x6.binx
  mv /system/9191/upgrade/data_07.bin /system/9191/upgrade/data_0x7.binx
}

# copy file apk dari sdcard /usb ke 9191
doCopyNewApk9191(){
  for iapk in $NEW_APK9191; do
      echo " copy $DIR_APPSD$iapk $DirApp"
	  cp $DIR_APPSD$iapk $DIR_APP9191
	  #set permissiob 644
	  str=$DIR_APP9191$iapk
	  chmod 644 $str
	  echo " permission $str has changed"
	  echo 
  done
  echo "....."
}

# copy file apk sys dari sdcard ke internal 
# /sdcard/bak/sys/

doCopySysApk(){
  mkdir $DIR_SYSAPP
  for str in $SYS_APP; do
      fileApp=${str%=*}
      #namaPkg=${str#*=}
      echo "     copy $DIR_APPSD$fileApp $DIR_SYSAPP"
	  cp $DIR_APPSD$fileApp $DIR_SYSAPP
  done
  echo ..
}

# copy file apk dari sdcard ke internal /sdcard/bak/app
doCopyUserApk(){
  mkdir $DIR_APP
  for iapk in $copyApk; do
      echo "do --> cp $DIR_APPSD$iapk $DIR_APP"
	  cp $DIR_APPSD$iapk $DIR_APP
  done
  # set permision 644
  #bisa langsung install via pm
  
}

doCopyDataSetting(){
  # copy data setting , preference dan private data apk
  # copy bak dari fd/sd ke internal
  # 100 mb
  cp -r $DIR_DATASETTINGSD /sdcard/
  
  #extract data
  echo "Extract backup app data "
  unzip -q /sdcard/bak/bak.zip -d /sdcard/bak/temp/ 
  
  rm -rf /sdcard/bak/bak.zip
  
  #copy data v5 buat cadangan
  cp -r /sdcard/bak/temp/com.eletech.fastv/ /sdcard/bak/setdata/patch/
  #rm /sdcard/bak/bak.zip
  
  # copy kode aktivasi ke internal
  mv /sdcard/Download/Kode_Aktivasi.txt $DIR_BAK"stbid/" 
  echo "Kode Aktivasi disimpan"
  
  #copy data network wifi
  cp /sdcard/bak/temp/wpa_supplicant.conf /etc/wifi/
}

doInjectScript(){
  #push script to bin
  #cp $DIR_BAK"setdata/sh/860SetupV3.sh" /system/bin/860
  # temporary
  cp /sdcard/860SetupV3.4.sh /system/bin/860
  #set permission
  chmod 755 /system/bin/860
}


# install app ke system
doI2Sys(){
 #param $1 file apk $2 nama package
 #mkdir nama package di priv/app/
 #check source file nya ready gak
  mkdir $DIR_PRIV$2"/"
  
 #copy apk to dir priv-app/
  echo "cp $DIR_SYSAPP$1.apk $DIR_PRIV$2/base.apk"
  cp $DIR_SYSAPP$1 $DIR_PRIV$2"/base.apk"
  
 # set permission
  chmod -R 755 $DIR_PRIV$2"/"
  chmod 644 $DIR_PRIV$2"/base.apk"
}

# install aplikasi user
doInstallUserApp(){
   #change permission
   #chmod  777 /system/9191/first/*
   #install
   busybox find $DIR_APP -name "*\.apk" -exec sh /system/bin/pm install -r {} \;
   #remove 
   #rm -rf $DIR_APP
}

# install User App dan simultan dengan 9191
doInstallUserAppPlus9191(){
   # Step
   # list apk di direktori /sdcard/bak/app/
   # tambahkan counter , utk start 9191 bila sudah install apk ke 18
   # check 9191 running by adakah package apk pertama sudah ada counter +3
   # kalo gak ada rerun mungkin 9191 butuh update
   # cmd echo "1" | 9191 &  ( jalan di backgorund)
   
   counter=0
   #variabel numeric ?
   # problem read ls
    export IFS=" "
	   for apk in /sdcard/bak/app/*.apk ; do
	       #source=$DIR_APP$apk
		   echo " Installing... $apk"
	       pm install -r $apk
		   if [ $? -eq 0 ]; then
		       echo " Delete source Apk"
			   rm $apk
		   fi
		   
		   counter=`expr $counter + 1`
		   echo "Counter : $counter"
		   
		   # bila counter cukup  jalankan install dr 9191
		   if [ $counter -eq 10 ]; then
		      echo "Start install by 9191"
			  echo "1" | 9191 &
		   fi
		   
		   # bila counter cukup  jalankan install dr copy logo
		   # set safe logo avoid blank 
		   if [ $counter -eq 16 ]; then
		      echo " Set Safe Logo fix blank stb"
              dd if=/sdcard/bak/setdata/logo.asli of=/dev/block/logo
		   fi
		   
	   done
 
 
 
 setStagePosition 3
   #remove 
   # sebelum remove check apakah sudah terinstall
   # delete apk if success
   #rm -rf $DIR_APP
}


# utk delete dan disable package
doActionPackage(){
   line=$(pm list package -f | grep -i $1)
     # check only when ready
    if [  -z $line ] 
       then
          echo "No Package $1"
	   else
	      result=${line:8}
          fileApk=${result%=*}
          namaPkg=${result#*=}
   
		  echo "do -> pm disable $namaPkg"
		  pm disable $namaPkg
		  if [ $2 == "delete" ];then
		      echo "do--> rm -rf $fileApk"
			  rm -rf $fileApk
		  fi
    fi
 }
 
 # disable package dan delete app bawaan
 # tambahakan kondisi stb harus sudah ada launcher squarehome
 doDisablePkgPulpstone(){
 
   for str in $DEL_PKG; do
   fileApp=${str%=*}
   namaPkg=${str#*=}
   
   # disable package
   echo "pm disable $namaPkg"
   pm disable $namaPkg
   
   # delete apps
   if [  $fileApp = "NO" ] 
       then
          echo "No file $namaPkg"
	   else
	      rm -rf $fileApp
          rm -rf /data/user/0/$namaPkg
   fi
  
 done
 }
 
 # setting preference tampilan dan lain2
 doSettingDisplay(){
	#  bootanimation
    echo ---- change bootanimation --------
    mv /system/media/bootanimation.zip /system/media/bootanimation.bak
    cp  /sdcard/bak/setdata/bootanimation.zip /system/media/
    chmod 755 /system/media/bootanimation.zip
	echo
	
	#remove bootvideo
	echo ---- change boovideo --------
    mv /system/media/bootvideo /system/media/bootvideo.bak
	
	#wallpaper
	echo ---- change wallpaper --------
	cp /sdcard/bak/setdata/wallpaper.jpeg /data/system/users/0/wallpaper
    chmod 770 /data/system/users/0/wallpaper
    chown system:system /data/system/users/0/wallpaper
	echo
	

	#logo
 }
 
 doOpenCloseApp(){
  if [ -z $1]; then 
      echo "No App"
  else
      am start -n $1"/"$2
	  if [ $? = 0 ]; then
         sleep 3
         am force-stop $1
	  fi
  fi
 }
 
 doInitApp(){
   for line in $APP_INIT ; do
       app=${4%=*}
	   descApp=${line#*=}
	   # pkg dan activity
	   pkg=${descApp%/*}
	   activity=${descApp#*/}
	   
	   # init
	   echo "   starting $app"
	   doOpenCloseApp $pkg $activity
   
   done
   
 }
 
 doCopyAppData(){
   # pass parameter ar1 package arg2 dirdata
   # get user owner /data/data/package
   if [ -d /data/data/$1 ]; then
     uid=${ stat -c %U /data/data/$1 }  
   
   # copy app data ke privat data
     if [ -e $DIR_BAK"temp/"$1 ]; then
        cp -r $DIR_BAK"temp/"$1 /data/data/
       
    	# ubah ownership
        appdata="/data/data/"$1
        chown $uid -R $appdata
		
		# delete source
		rm -r $DIR_BAK"temp/"$1
	 fi
  else
	  echo "Package $1 Tidak Ada - No Patching"
  fi
 }
 

 doPatchingApp(){
    for line in $PKG_PATCHING; do
       app=${line%=*}
	   descApp=${line#*=}
	   # pkg dan activity
	   pkg=${descApp%/*}
	   activity=${descApp#*/}
	   
	   # unit
	   echo "   starting $app : $pkg - $activity"
	   doOpenCloseApp $pkg $activity
	   
	   
	   # inject private data
	   echo "   patching ...$app"
       doCopyAppData $pkg $DIR_BAK
	   #delete backup data app
	   #rm -r $DIR_BAK"temp/"$pkg
    done
 }
 
  doGrantPermission(){
    #paramater type permission $1 package $2 permission
	if [ -n $1 ]; then
	    case $2 in
	   "STORAGE") echo " Grant $2 to $1"
	              pm grant $1 android.permission.READ_EXTERNAL_STORAGE
				  pm grant $1 android.permission.WRITE_EXTERNAL_STORAGE
	        ;;
	  "LOCATION") echo " Grant $2 to $1"
	              pm grant $1 android.permission.ACCESS_FINE_LOCATION
				  pm grant $1 android.permission.ACCESS_COARSE_LOCATION
		    ;;
	  "CALENDAR") echo " Grant $2 to $1"
	              pm grant $1 android.permission.READ_CALENDAR
				  #pm grant $1 android.permission.WRITE_CALENDAR
		    ;;	
	     "PHONE") echo " Grant $2 to $1"
	              #pm grant $1 android.permission.READ_CALL_LOG
				  pm grant $1 android.permission.READ_PHONE_STATE
				  #pm grant $1 android.permission.CALL_PHONE
				  #pm grant $1 android.permission.WRITE_CALL_LOG
				  #pm grant $1 android.permission.USE_SIP
				  #pm grant $1 android.permission.PROCESS_OUTGOING_CALLS
				  #pm grant $1 com.android.voicemail.permission.ADD_VOICEMAIL
		    ;;
	   "CAMERA") echo " Grant $2 to $1"
	              pm grant $1 android.permission.CAMERA
				  #pm grant $1 android.permission.WRITE_CALENDAR
		    ;;		
	   "CONTACT") echo " Grant $2 to $1"
	              pm grant $1 android.permission.GET_ACCOUNTS
				  
				  	
	    esac
	fi
  }
  
 # grant app permisison 
 doGrantAllApp(){
    for str in $APP_PERMISSIONS; do
       app=${str%=*}
	   descApp=${str#*=}
	   # pkg dan activity
	   pkg=${descApp%/*}
	   perm=${descApp#*/}
	   
	   # init
	   # check packagenya 
	   exist=$(pm list package | grep -i $pkg)
	   if [ ${#exist} -gt 1 ]; then
		  doGrantPermission $pkg $perm
	   fi
   done 
 }
 
 
doTestingAllApp(){
    for str in $PKG_TEST; do
       app=${str%=*}
	   actApp=${str#*=}
	   pkg=${actApp%/*}
	  
	  # open dan close app
	   am start -n $actApp
       sleep 20
      am force-stop $pkg
   done 
 } 
 doTestingLongApp(){
    for str in $PKG_LONGTEST; do
       app=${str%=*}
	   actApp=${str#*=}
	   pkg=${actApp%/*}
	  
	  # open dan close app
	   am start -n $actApp
       sleep 30
      am force-stop $pkg
   done 
 }
 
doInstallApp2System(){
 for str in $SYS_APP; do
   fileApp=${str%=*}
   namaPkg=${str#*=}
   echo "Installing app: $fileApp | package: $namaPkg"
   doI2Sys $fileApp $namaPkg
   echo
 done
 # delete sys apk 
 # check apakah sudah terinstall
 rm -rf $DIR_SYSAPP
}
 
 doInit(){
   # perhatikan permission file appnya
   # create dir bak di internal
   # check ada sd atau usb storage ready
   mkdir $DIR_BAK
   doDelApk9191 
   doCopyNewApk9191
   doCopySysApk
   doCopyUserApk
   doCopyDataSetting
   doInjectScript
   
   # temp
   doDelPatching9191
}

#simpan conf awal
doSaveConf(){
 dd if=/dev/block/conf of=/sdcard/bak/setdata/conf.ori
}

doPreparationData(){
   # perhatikan permission file appnya
   # create dir bak di internal
   # check ada sd atau usb storage ready
   mkdir $DIR_BAK
   doDelApk9191 
   
   # delete patching file 9191
   # off dulu utk test
   # doDelPatching9191
   # uninstall smart youtube lama --- malah ilang ver barunya
   # pm uninstall --user 0 com.liskovsoft.videomanager

   doCopyNewApk9191
   doCopySysApk
   doCopyUserApk
   doCopyDataSetting
   doInjectScript
   # add 18 jan 2020 simpan conf file
   doSaveConf
   doGrantPermissionGMS
   doGrantPermissionDejavu
}

# tulis posisi stage /step 
# argumen stage /step next yang akan dikerjakan   
  setStagePosition(){
     if [ -e $LOGGER ]; then
	    rm $LOGGER
		echo $1 >> $LOGGER
	 else
	    echo $1 >> $LOGGER
	 fi
   # print
   echo " --------------------"
   echo " Step : " $1
   echo " --------------------"
  }
# step by step setup stb
# ------STEP 1 --------------------------------------
# step 1 preparation data file from usb /sdcard
PreparationData(){
   # check if sdcard / atau flash disk ready
   testSD=$(ls /storage | sed -n "/emulated/,/self/!p")
   if [ ${#testSD} -gt 1 ]; then
      #abaikan bila ada lebih dari 1 storage
	  doPreparationData
	  
	  #lanjutkan install app ke system
	  doInstallApp2System
	  
	  #tulis ke log stage proses
	  setStagePosition 2
	  echo " -------------------------------------------------"
	  echo " Proses Preparasi Data sudah selesai "
	  echo " USB flashdisk / sdcard bisa dilepas "
	  echo
	  sleep 2
	  echo " Rebooting ......"
	  reboot
	  
   else
      echo "Tidak ada storage eksternal USB flashdisk atau sdcard"
	  echo "--------------------------------------------------"
	  echo " Pasang USB flashdisk atau sdcard sekarang ..."
	  sleep 5
   fi
}

# ------ STEP 2 --------------------------------------
# step 2 install user aplikasi dan runinng 9191 install
doAktivasiCheck(){
   if [ -e $FILE_USERNAME -a -e $FILE_KODEAKTIVASI ] ; then
      AKTIVASI=1
	  else
	  AKTIVASI=0
   fi
}

InstallUserApp(){
    # check apakah sudah aktivasi
	doAktivasiCheck
	if [ $AKTIVASI = 1 ]; then
       doInstallUserAppPlus9191
	   #doPatchingApp
	   setStagePosition 3
	else
	   echo " STB Belum Aktivasi "
	fi
}
# ------ STEP 3 --------------------------------------
# step 3 setup finishin  permission , display , launcher
CleaningData(){
   # delete app , first , temp , bak
   # copy data ke /system bak
  stage=${ cat $LOGGER }
  if [ $stage -gt 3 ]; then
    echo  "cleaning starting ....."
	echo "Hapus Live Channel ...."
	  pm uninstall --user 0 com.google.android.tv
	  pm uninstall --user 0 by.stari4ek.tvirl
	  
    if [ -d /sdcard/bak/app/ ]; then
	    rm -r /sdcard/bak/app/
	fi
	
	if [ -d /sdcard/bak/first/ ]; then
	    rm -r /sdcard/bak/first/
	fi
	
	if [ -d /sdcard/bak/temp/ ]; then
	    rm -r /sdcard/bak/temp/
	fi
	
	if [ -e /sdcard/bak/bak.zip ]; then
	    rm  /sdcard/bak/bak.zip
	fi
 
    cp -r /sdcard/bak /system/
	echo  "--- cleaning done ---- "
  fi
}

doTimeStamp(){
   date "+%d.%B.%Y" >> /sdcard/bak/timestamp
}

# uninstall system apps
doUninstallSys(){
 #param $1 nama package
 # get dataPath 
   codePath=$(dumpsys package $1 | grep -i codepath)
   dataDir=$(dumpsys package $1 | grep -i dataDir)
 # get datadir
   codePath=${codePath#*=};
   dataDir=${dataDir#*=};
 # delete apk
    echo "Delete >> " $codePath
    rm -rf $codePath"/"
 # delete data
    echo "Delete >> " $dataDir
    rm -rf $dataDir"/"
}

# uninstall apps useless 
doDeleteApps(){
  
   # hapus youtube 
   if [ -e /system/app/SmartYouTubeTV.apk ]; then 
       rm /system/app/SmartYouTubeTV.apk
   fi   
   # hapus app helper xx1 dan useetv/
     pm uninstall pulpstone.atv.useetv
	 pm uninstall pulpstone.atv.xx1lite
	 pm uninstall pulpstone.atv.dutafilm
   # hapus app drawer
     doUninstallSys "com.atvxperience.appdrawer"
   # hapus tv boot
     doUninstallSys "com.danielgauci.tvboot"
	 
	 #hapus android tv / live channnel
	 echo "Hapus Live Channel ...."
	  pm uninstall --user 0 com.google.android.tv
	  pm uninstall --user 0 by.stari4ek.tvirl

}

Finishing(){
    # check applikasi terinstall
	# check stage 
	stage=${ cat $LOGGER }
	if [ $stage = 3 ]; then
	   doGrantAllApp
	   doPatchingApp
     # buat time stamp
       doTimeStamp
	   doSettingDisplay
	   echo "set logo"
	   dd if=/sdcard/bak/setdata/logo.asli of=/dev/block/logo
	   doDisablePkgPulpstone
	   doDeleteApps
	   setStagePosition 4
	   echo " rebooting ...."
	   sleep 4
	   reboot
	 else
	   echo "Jalankan Step $stage dulu "
	fi
}
 
 Testing(){
   doTestingAllApp
   #doTestingLongApp
   setStagePosition 5
 }
 
 doGrantPermissionGMS(){
   pm grant com.google.android.gms android.permission.READ_PHONE_STATE
   pm grant com.google.android.gms android.permission.WRITE_EXTERNAL_STORAGE
   pm grant com.google.android.gms android.permission.READ_EXTERNAL_STORAGE
   pm grant com.google.android.gms android.permission.ACCESS_FINE_LOCATION
   pm grant com.google.android.gms android.permission.ACCESS_COARSE_LOCATION
   pm grant com.google.android.gms android.permission.GET_ACCOUNTS
 }
 
 doGrantPermissionDejavu(){
   pm grant org.fitchfamily.android.dejavu android.permission.ACCESS_FINE_LOCATION
   pm grant org.fitchfamily.android.dejavu android.permission.ACCESS_COARSE_LOCATION
 }
 
 doCheckGMS(){
   # buka GMS
     am start -n com.google.android.gms/org.microg.gms.ui.SettingsActivity
   # lakukan enable 
 }
 
 doCheckPS(){
   # buka playstore
     am start -n com.android.vending/.AssetBrowserActivity
   # lakukan sign
 }
 
 
 showMenu(){
  clear
  echo "----------- Setup STB ZTE B860H ------------"
  echo
  echo "     Action :"
  echo 
  echo "     [10] Setup 1 - Preparation Data"
  echo "     [20] Setup 2 - Install User App"
  echo "     [30] Setup 3 - Finishing "
  echo "     [40] Setup 4 - Testing"
  echo "     [50] Setup 5 - Cleaning Data"
  echo "--------------------------------------------"
  echo "     [99] exit"
  echo "     [90] reboot"
  echo " -------------------------------------------"
  echo " Tools :"
  echo "     [71] Install System App"
  echo "     [72] Install User App"
  echo "     [73] Patching"
  echo "     [74] Grant App Permission"
  echo "     [75] Hapus App Pulpstone"
  echo "     [76] Setting Display"
  echo " -------------------------------------------"
  echo "     [111] Install dan 9191"
  echo 
  echo
  #read -p " Pilihan anda : " menu
  
  #return $menu
 }

#------------- MAIN    -------------------------
echo -------- Modding B860H --------------
#only user root 
if [ $USER = "root" ]; then

echo
#-----------------------------------------------

mount -o rw,remount /system


#   STEP
   # -- install apps system
   #  ( need reboot )
   # -- install apps other
   # -- pacthing app ..buka dan copy file nya (belum)
   # -- hapus app bawaan
   # -- finishing dan testing
   # test menu
  inputMenu="00"
  while [ [$inputMenu != "99"] ]
  do
     showMenu
	 echo "       Pilihan anda :"
	 read  inputMenu
	 
     # pilihan action
	 case $inputMenu  in
	   "10") clear
	         echo "   Setup 1 - Preparation Data"
			      PreparationData
	         ;;
	   "20") clear
	         echo "   Setup 2 - Install User App"
			      echo "Set Enable GMS"
			      InstallUserApp
				  exit
			 ;;
	   "30") clear
	         echo "   Setup 3 - Finishing "
			      echo " Pastikan GMS enable "
				  echo " Sign in Playstore"
				  doCheckPS
				  read p
			      Finishing
	         ;;
	   "40") clear
	         echo "   Setup 4 - Testing"
			      Testing
	         ;;
	   "50") clear
	         echo "   Setup 5 - Cleaning Data	"
			      CleaningData
		     ;;
	   "71") clear
	         echo "---- Install apk system-----"
			      doInstallApp2System
	         ;;
	   "72") clear
	         echo "---- Install User App-----"
			      doInstallUserAppPlus9191
	         ;;	 
	   "73") clear
	         echo "---- Patching-----"
			      doPatchingApp
	         ;;
	   "74") clear
	          echo "----Grant App Permission-----" 
			       doGrantAllApp
	         ;;	 
	   "75") clear
	         echo "---- Hapus App Pulpstone-----"
			      doDisablePkgPulpstone
	         ;;	 
	   "76") clear
	         echo "---- Setting Display-----"
			      doSettingDisplay
	         ;;	 	 	 
	    "99") echo " Exiting ......"
	          exit 
	         ;;
		"90") echo " Rebooting......"
	          reboot
	         ;;
	   "111") echo " Test "
	               doDeleteApps
	          exit 
	         ;;	 
	   esac ;
done
else
    echo " ------------- Jalankan Dengan ID ROOT  ---------------"
	echo " ---- Command SU dan Beri Akses / Grant di Layar ------"
fi

 


