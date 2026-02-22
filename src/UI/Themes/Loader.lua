local loader = {}

function loader.ReconstructRules(tbl)
	local rule = Instance.new("StyleRule")
	rule.Name = tbl.Name
	rule.Priority = tbl.Priority
	rule.Selector = tbl.Selector
	rule:SetProperties(tbl.Props)
	
	for _, child in ipairs(tbl.Children) do
		local childRule = loader.ReconstructRules(child)
		childRule.Parent = rule
	end

	return rule
end

function loader.ReconstructSheet(tbl)
	local sheet = Instance.new("StyleSheet")
	
	sheet.Name = tbl.Name
	for attrName, attrVal in pairs(tbl.Attributes) do
		sheet:SetAttribute(attrName, attrVal)
	end
	
	for _, rule in ipairs(tbl.Rules) do
		local inst = loader.ReconstructRules(rule)
		inst.Parent = sheet
	end
	
	return sheet
end

return loader