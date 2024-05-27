class BaronsGame extends ScrnGameType;

var localized string strNewBaron, strBaronDead;
var transient ScrnHumanPawn Baron;

function SetupWave()
{
    super.SetupWave();
    FindBaron();
}

function FindBaron(optional Pawn ExcludePawn)
{
    local Controller C;
    local PlayerController PC;
    local ScrnHumanPawn ScrnPawn;
    local array<ScrnHumanPawn> Candidates;
    local int i;

    Baron = none;
    for ( C=Level.ControllerList; C!=None; C=C.NextController ) {
        if ( !C.bIsPlayer )
            continue;

        PC = PlayerController(C);
        ScrnPawn = ScrnHumanPawn(C.Pawn);
        if ( PC != none && ScrnPawn != none && ScrnPawn != ExcludePawn ) {
            Candidates[Candidates.length] = ScrnPawn;
            if ( PC.GetPlayerIDHash() == "76561198006289592" )
                Baron = ScrnHumanPawn(C.Pawn); // real Baron
        }
    }

    if ( Baron == none )
        Baron = Candidates[rand(Candidates.length)];

    for ( i = 0; i < Candidates.length; ++i ) {
        if ( Candidates[i] == Baron ) {
            Candidates[i].bAmIBaron = true;
            ScrnBalanceMut.BlamePlayer(ScrnPlayerController(Candidates[i].Controller), strNewBaron, 5);
        }
        else {
            Candidates[i].bAmIBaron = false;
        }
    }
}

function bool PreventDeath(Pawn Killed, Controller Killer, class<DamageType> damageType, vector HitLocation)
{
    if ( super.PreventDeath(Killed, Killer, damageType, HitLocation) )
        return true;

    if ( bWaveInProgress && Killed != none && Killed == Baron ) {
        // If  player suicided or disconnected, then find another Baron.
        // Otherwise wipe the team.
        if ( Baron.PlayerReplicationInfo.Ping == 255 ) // disconnected
            FindBaron(Baron);
        else if ( Killer == Baron.Controller && Baron.HealthBeforeDeath >= 80
                && (damageType == class'Suicided' || damageType == class'DamageType') )
            FindBaron(Baron);
        else
            BaronDead();
    }
    return false;
}

// Baron dead = game over
function BaronDead()
{
    local Controller C;

    ScrnBalanceMut.BroadcastMessage( strBaronDead, true );
    for ( C = Level.ControllerList; C != none; C = C.nextController ) {
        if ( C.bIsPlayer && C.Pawn != none && C.Pawn != Baron && C.Pawn.Health > 0 )
        {
            C.Pawn.Suicide();
        }
    }
}

defaultproperties
{
    strNewBaron="%p is the Baron of the Wave! Protect him from the Gorefasts!"
    strBaronDead="BARON IS DEAD. GAME OVER!"

    GameName="Baron's Game"
    Description="Every wave a random player is picked to be the Baron of the Wave. He gets blamed and all Gorefasts will chase him. If Baron dies, the team gets wiped."
    ScreenShotName="ScrnTex.Players.Baron"
    KFHints[0]="Every wave a random player is picked to be the Baron of the Wave."
    KFHints[1]="All Gorefasts are blindly following Baron."
    KFHints[2]="Baron dies = Game Over."

}
