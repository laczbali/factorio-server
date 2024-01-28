su factoriouser;

# create the savegame if it doesn't exist
if [ ! -f ${DATA_LOCATION}/${SAVEGAME_NAME}.zip ]
then
    /opt/factorio/bin/x64/factorio --create ${DATA_LOCATION}/${SAVEGAME_NAME}
fi

# create the config if it doesn't exist
if [ ! -f ${DATA_LOCATION}/${CONFIG_NAME} ]
then
    cp /app/server-settings.example.json ${DATA_LOCATION}/${CONFIG_NAME}
    sed -i -e "s/PLACEHOLDER_NAME/${SERVER_DEF_NAME}/g" ${DATA_LOCATION}/${CONFIG_NAME}
    sed -i -e "s/PLACEHOLDER_PASSWORD/${SERVER_DEF_PASSWORD}/g" ${DATA_LOCATION}/${CONFIG_NAME}
fi

# set up the mod folder, if needed
if [ ! -d ${DATA_LOCATION}/mods ]
then
    mkdir ${DATA_LOCATION}/mods

    if [ -d /opt/factorio/mods ]
    then
        cp -r /opt/factorio/mods/* ${DATA_LOCATION}/mods
        rm -rf /opt/factorio/mods
    fi

    ln -s ${DATA_LOCATION}/mods /opt/factorio/mods
fi

# start
/opt/factorio/bin/x64/factorio --start-server ${DATA_LOCATION}/${SAVEGAME_NAME} --server-settings ${DATA_LOCATION}/${CONFIG_NAME}
