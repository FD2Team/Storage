-- learnnnnnnnn nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn

local module = {}

local HttpService = game:GetService("HttpService")

local fontTable = {
    WhitneyBold = "https://github.com/MoeriiLua/fontNIGTHING/raw/main/Minecraft%20Regular.otf",
}

if not isfolder("Fonts") then makefolder("Fonts") end

for i, v in next, fontTable do
    if isfile("Fonts/" .. i .. ".otf") then
    end
    writefile("Fonts/" .. i .. ".otf", request{Url = v, Method = "GET"}.Body)
end

module.setFont = function(font, textlabel)
    if fontTable[font] == nil then
        error("Font not found: " .. font)
    end
    if not isfile("Fonts/" .. font .. "Face.json") then
        writefile(
            "Fonts/" .. font .. "Face.json",
            HttpService:JSONEncode(
                {
                    name = font,
                    faces = {
                        {
                            name = "Regular",
                            weight = 300,
                            style = "normal",
                            assetId = getcustomasset("Fonts/" .. font .. ".otf")
                        }
                    }
                }
            )
        )
    end
    local decode = HttpService:JSONDecode(readfile"Fonts/" .. font .. "Face.json")
    if decodeLol.faces[1].assetId ~= getcustomasset("Fonts/" .. font .. ".otf") then
        writefile(
            "Fonts/" .. font .. "Face.json",
            HttpService:JSONEncode(
                {
                    name = font,
                    faces = {
                        {
                            name = "Regular",
                            weight = 300,
                            style = "normal",
                            assetId = getcustomasset("Fonts/" .. font .. ".otf")
                        }
                    }
                }
            )
        )
    end
    textlabel.FontFace = Font.new(getcustomasset"Fonts/" .. font .. "Face.json")
end

return module;
