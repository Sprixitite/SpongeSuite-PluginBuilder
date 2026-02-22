-- This file is used to convert the "SpongeSuite" stylesheet into a module for upload to github as code
-- It is not used in the actual plugin

local tableWriter = require("./TableWriter")

local function write_enum(enum: EnumItem)
	local enumName
	for _, e in ipairs(Enum:GetEnums()) do
		if e == enum.EnumType then
			enumName = e
			break
		end
	end

	return `Enum.{enumName}.{enum.Name}`
end

local function write_font(font: Font)
	return `Font.new("{font.Family}", {write_enum(font.Weight)}, {write_enum(font.Style)})`
end

local function write_color3(color: Color3)
	return `Color3.new({color.R}, {color.G}, {color.B})`
end

local function write_udim(udim: UDim)
	return `UDim.new({udim.Scale}, {udim.Offset})`
end

local function write_udim2(udim2: UDim2)
	return `UDim2.new({udim2.X}, {udim2.Y})`
end

local function write_vec2(vec2: Vector2)
	return `Vector2.new({vec2.X}, {Vector2.Y})`
end

local function write_vec3(vec3: Vector3)
	return `Vector3.new({vec3.X}, {vec3.Y}, {vec3.Z})`
end

local function get_style_rules(root)
	local childData = {}
	for _, rule in ipairs(root:GetChildren()) do
		if not rule:IsA("StyleRule") then continue end
		childData[#childData + 1] = {
			Props = rule:GetProperties(),
			Priority = rule.Priority,
			Name = rule.Name,
			Selector = rule.Selector,
			Children = get_style_rules(rule)
		}
	end
	return childData
end

tableWriter.configure{
	warn = warn,
	type = typeof,
	userdata_value_writers = {
		UDim = write_udim,
		UDim2 = write_udim2,
		Color3 = write_color3,
		Font = write_font,
		Vector2 = write_vec2,
		Vector3 = write_vec3,
		EnumItem = write_enum,
	}
}

local styleWriter = {}

function styleWriter.WriteStyle(style)
	return tableWriter.write_tbl{
		Name = style.Name,
		Rules = get_style_rules(style),
		Attributes = style:GetAttributes()
	}
end

return styleWriter