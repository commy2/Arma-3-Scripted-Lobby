# Arma-3-Scripted-Lobby

### Screenshot
![https://i.imgur.com/BhJyZrQ.png](https://i.imgur.com/BhJyZrQ.png)

### Usage
Read the `init.sqf`. It should be self explanatory.

### Remotely Executed Functions
These functions have to be whitelisted in `CfgRemoteExec`:
```sqf
Lobby_fnc_setIdentity
Lobby_fnc_slotOut
Lobby_fnc_slotIn
```

If you don't use `CfgRemoteExec`, you don't need to whitelist them.

### Setup Dev Environment
Open `cmd.exe` in the same folder as this `README.md` and execute:
```bat
mklink /d "%UserProfile%\Documents\Arma 3 - Other Profiles\<ARMA-PROFILE-NAME>\missions\LOBBY.VR" "%cd%\missions\LOBBY.VR"
```
where `<ARMA-PROFILE-NAME>` is your active user profile name. E.g. `commy2`. This mission can then be played from the Eden-Editor.
