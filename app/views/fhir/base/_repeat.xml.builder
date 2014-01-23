xml.frequency({value: repeat.frequency}) unless repeat.frequency.nil?
xml.when({value: repeat.when}) unless repeat.when.nil?
xml.duration({value: repeat.duration}) unless repeat.duration.nil?
xml.units({value: repeat.units}) unless repeat.units.nil?
xml.count({value: repeat.count}) unless repeat.count.nil?
xml.end({value: repeat.end}) unless repeat.end.nil?