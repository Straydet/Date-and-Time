// Date & Time textdraw
// Real Time - Date

#define FILTERSCRIPT

#include <a_samp>

#if defined FILTERSCRIPT
new Text:DateText;
new Text:TimeText;

public OnFilterScriptInit() //You can change it to OnGameModeInit and adapt
{
    SetTimer("SetTimeDate",1000,true);
    DateText = TextDrawCreate(545.500000, 16.177732, "20/2/2023");
    TextDrawLetterSize(DateText, 0.298500, 1.058665);
    TextDrawAlignment(DateText, 1);
    TextDrawColor(DateText, -1);
    TextDrawSetShadow(DateText, 0);
    TextDrawSetOutline(DateText, 1);
    TextDrawBackgroundColor(DateText, 51);
    TextDrawFont(DateText, 2);
    TextDrawSetProportional(DateText, 1);

    TimeText = TextDrawCreate(556.000000, 28.622150, "16:50");
    TextDrawLetterSize(TimeText, 0.329499, 0.977777);
    TextDrawAlignment(TimeText, 1);
    TextDrawColor(TimeText, -1);
    TextDrawSetShadow(TimeText, 0);
    TextDrawSetOutline(TimeText, 1);
    TextDrawBackgroundColor(TimeText, 51);
    TextDrawFont(TimeText, 2);
    TextDrawSetProportional(TimeText, 1);

	print("--------------------------------------\n");
    print("Real Date and Time in Textdraw");
    print("--------------------------------------\n");
    return 1;
}

public OnFilterScriptExit()
{
    return 1;
}

#else

#endif
public OnPlayerConnect(playerid)
{
    return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
    TextDrawHideForPlayer(playerid,DateText);
    TextDrawHideForPlayer(playerid,TimeText);
    return 1;
}
forward SetTimeDate();
public SetTimeDate()
{
    // You can change the world time like GMT+2 GMT+3, etc
    new string[128],year,month,day,hours,minutes,seconds;
    getdate(year, month, day), gettime(hours, minutes, seconds);
    SetWorldTime(hours+2); //Sets the world time (for all players) to a specific hour.
    format(string, sizeof string, "%d/%s%d/%s%d", day, ((month < 10) ? ("0") : ("")), month, (year < 10) ? ("0") : (""), year);
    TextDrawSetString(DateText, string);
    format(string, sizeof string, "%s%d:%s%d", (hours < 10) ? ("0") : (""), hours, (minutes < 10) ? ("0") : (""), minutes);
    TextDrawSetString(TimeText, string);
}
public OnPlayerSpawn(playerid)
{
    TextDrawShowForPlayer(playerid,DateText);
    TextDrawShowForPlayer(playerid,TimeText);
    return 1;
}
