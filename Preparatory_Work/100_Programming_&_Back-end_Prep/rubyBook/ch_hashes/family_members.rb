# famil_members.rb

family = { uncles: ["bob", "joe", "steve"],
           sisters: ["jane", "jill", "beth"],
           brothers: ["frank","rob","david"],
           aunts: ["mary","sally","susan"]
          }

immediate = family.select {|relation| relation == :sisters || relation == :brothers}

arr = immediate.values.flatten

p arr
