// -----------------------------------------------------------------------------
// File: surge_the_rabbit.ss
// Description: a script specific to the Surge the Rabbit game
// Author: Alexandre Martins <http://opensurge2d.org>
// License: MIT
// -----------------------------------------------------------------------------
using SurgeEngine;
using SurgeEngine.Web;
using SurgeEngine.Lang;
using SurgeEngine.Platform;

@Package
object "SurgeTheRabbit"
{
    public readonly website = "https://opensurge2d.org";

    fun donate()
    {
        if(isGooglePlayBuild()) {
            /* adding an external donation page to an Android app published
               in the Google Play Store is a violation of their policy */
            return;
        }

        url = website + "/contribute?v=" + SurgeEngine.version + "&platform=" + platformName() + "&lang=" + Lang["LANG_ID"];
        Web.launchURL(url);
    }

    fun share()
    {
        if(Platform.isAndroid) {
            text = "Surge the Rabbit " + website;
            Platform.Android.shareText(text);
        }
        else {
            url = website + "/share?v=" + SurgeEngine.version + "&platform=" + platformName() + "&lang=" + Lang["LANG_ID"];
            Web.launchURL(url);
        }
    }

    fun rate()
    {
        url = website + "/rating?v=" + SurgeEngine.version + "&platform=" + platformName() + "&lang=" + Lang["LANG_ID"];
        Web.launchURL(url);
    }

    fun platformName()
    {
        if(Platform.isAndroid)
            return "Android";
        else if(Platform.isWindows)
            return "Windows";
        else if(Platform.isMacOS)
            return "macOS";
        else if(Platform.isUnix)
            return "Unix";
        else
            return "Unknown";
    }

    fun isDevelopmentBuild()
    {
        return SurgeEngine.version.indexOf("-dev") >= 0;
    }

    fun isGooglePlayBuild()
    {
        return SurgeEngine.version.indexOf("googleplay") >= 0;
    }
}