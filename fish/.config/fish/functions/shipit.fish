# Defined in /var/folders/ht/__4c7y1d58l5c8hsq2fpk2b00000gn/T//fish.NbfvCL/shipit.fish @ line 2
function shipit
	set currDir (basename (pwd))
    # rsync -rlptzv --no-t --exclude=.git --exclude=.vscode "$argv" -- . r10a-docker-bespey:~/workspace/"$currDir"/ 
    rsync -rlptzv --exclude=node_modules --exclude=.git --exclude=.vscode . r10a-docker-bespey:~/workspace/"$currDir"/
end
