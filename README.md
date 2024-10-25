# factorio-server
Docker container for a Factorio server

Latest stable server download is [here](https://factorio.com/get-download/stable/headless/linux64)
Server setup gude is [here](https://wiki.factorio.com/Multiplayer#Setting_up_a_Linux_Factorio_server)
Mod setup guide is [here](https://forums.factorio.com/viewtopic.php?t=38510)

# How to use this repo
1. Download the `dc-factorio.yml` Compose file
2. Open it with a text editor
   1. Change `SERVER_DEF_NAME` and `SERVER_DEF_PASSWORD` as desired
   2. Change `/home/USER/factoriodata` as desired
   3. (optional) Set `SAVEGAME_NAME` as desired
3. Run it with `sudo docker compose -f dc-factorio.yml up --detach`
4. If needed, you can stop it with `docker container stop factorio-factorio-1` and restart it with `docker container start factorio-factorio-1`, but it shouldn't be needed.

If you need to update the server version:
1. Remove the composition by running `sudo docker compose -f dc-factorio.yml down --rmi all`
2. Create the composition again with `docker compose -f dc-factorio.yml up --detach`

# Notes
The save data will be stored at the place you set in step 2.2.
If the save does not exist already, the startup script will create it.

The same location needs to have the server config file (with a name of `server-settings.json`, but that can be overriden with `CONFIG_NAME`).
If a config file is not provided by the user, the startup script will create one with default settings.

If it doesn't already exist, the startup script will create a `mods` folder at the same location, which will be used by the server.

Factorio uses UDP port 34197.
