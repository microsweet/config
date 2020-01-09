# Defined in - @ line 1
function rsync --description 'alias rsync=rsync -P --rsh=ssh'
	command rsync -P --rsh=ssh $argv;
end
