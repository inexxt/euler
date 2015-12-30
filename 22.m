wyn = 0
names = textread("22_names.txt", "%s")
names = sort(names)
for i=1:length(names)
    wyn = wyn + i*sum(names(i){1} - 64)
end
