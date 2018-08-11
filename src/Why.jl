using Random

module Why


query_count = 0

function why()
    return make_ans()
end

const begins = ("Because ", "")
const fins = ("wanted it", "decided so", "made it happen")
const mess_persistent = ("Why do you keep asking these questions?", "Please Stop.")
const single = ("I do not know", "42")
function make_and()
    if (query_count+=1) > 5 + rand(1:15)
        query_count -= min(query_count,rand(1:10))
        return message = mess_persistent[rand(length(mess_persistent))]
    elseif rand() < 0.20
        return message = single[rand(1:length(single))]
    end
    return rand_element(begins) * noun(1.0) * rand_element(fins)
end



#Adverbs
const advs = ("vaguely", "extraordinarily", "properly", "very", "not at all")
function adv(p)
    (rand()>p) && return ""
    return rand_element(advs)*" "
end

#Ajectives
const adjs = ("fast", "type-safe", "harmless", "deceitful", "cool", "self aware")
function adj(p)
    (rand()>p) && return ""
    return adv(0.66)*rand_element(adjs)*" "*and(adj(p-0.2))
end

#Nouns
const preps = ("the", "a", "some")
const nouns = ("compiler", "research software engineer", "type pirate", "cockatoo", "manager", "programmer", "software")
function noun(p)
    (rand()>p) && return ""
    return rand_element(preps)*" "*adj(0.80)*rand_element(nouns)*" "*and(noun(p-0.3))
end

function and(s::String)
    (s=="") && return s
    return "and " * s
end

rand_element(tup::Tuple) = tup[rand(length(tup))]

export why

end # module
