_saveInterval = autosaveFrequency;

while {true} do {
sleep _saveInterval;
triggerServerSave = 1;
};