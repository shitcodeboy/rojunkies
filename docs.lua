local uilib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shitcodeboy/rojunkies/public/ui.lua",true))()

local window = uilib:init({
    name = "rojunkies", -- display project name
    ver = "debug", -- version of project
    user = "shitcodeboy", -- username 
    --gamename = "counter blox" <-- if no gamename, then game.Name
    watermark = true
})

wait(5)window:Destory()