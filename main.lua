--// โหลด Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

--// สร้าง Window หลัก
local Window = Rayfield:CreateWindow({
   Name = "SpaceXenosHUB",
   LoadingTitle = "Welcome to SpaceXenosHUB",
   LoadingSubtitle = "Use at your own risk",
   ConfigurationSaving = {
      Enabled = false,         -- ตั้งเป็น true หากต้องการบันทึกคอนฟิก
      FolderName = nil,        -- ใส่ชื่อโฟลเดอร์หากต้องการเก็บไฟล์
      FileName = "SpaceXenosConfig"
   },
   Discord = {
      Enabled = false,         
      Invite = "NoInviteLink", -- ใส่เป็นโค้ดเชิญของดิสคอร์ด เช่น "ABC123"
      RememberJoins = true     
   },
   KeySystem = false,          -- เปิดใช้งานระบบ Key
   KeySettings = {
      Title = "SpaceXenosHUB | Key System",
      Subtitle = "Please enter your key",
      Note = "Get key from our Discord",
      FileName = "SpaceXenosKey",  -- เก็บไฟล์คีย์ (จะเก็บลงใน workspace บนเครื่องผู้ใช้ หาก Enabled = true)
      SaveKey = false,            -- ถ้าเป็น true ผู้ใช้จะไม่ต้องใส่คีย์ซ้ำ (จนกว่าคีย์จะเปลี่ยน)
      GrabKeyFromSite = true,     -- ใส่ true เพื่อให้ Rayfield ดึงคีย์จากลิงก์ RAW
      Key = {                     -- หาก GrabKeyFromSite = true ให้ใส่ลิงก์ RAW หรือถ้า false ก็ใส่เป็น String ได้
         "https://pastebin.com/raฟw/AtgzSPWK"
      }
   }
})

--// Tab แรก (Home)
local MainTab = Window:CreateTab("🏠 Home", 13041518252) 
local MainSection = MainTab:CreateSection("Main Features")

Rayfield:Notify({
   Title = "Script Executed",
   Content = "Welcome to SpaceXenosHUB!",
   Duration = 5,
   Image = 13047715178,
   Actions = {
      OK = {
         Name = "Alright!",
         Callback = function()
            print("User clicked notification")
         end
      },
   },
})

--// ปุ่ม Infinite Jump
local infiniteJumpButton = MainTab:CreateButton({
   Name = "Infinite Jump Toggle",
   Callback = function()
       _G.infinjump = not _G.infinjump
       if _G.infinJumpStarted == nil then
           _G.infinJumpStarted = true
           game.StarterGui:SetCore("SendNotification", {Title="SpaceXenosHUB"; Text="Infinite Jump Ready!"; Duration=5;})
           local plr = game:GetService('Players').LocalPlayer
           local m = plr:GetMouse()
           m.KeyDown:Connect(function(k)
               if _G.infinjump then
                   if k:byte() == 32 then
                       local humanoid = plr.Character and plr.Character:FindFirstChildOfClass('Humanoid')
                       if humanoid then
                           humanoid:ChangeState('Jumping')
                           wait()
                           humanoid:ChangeState('Seated')
                       end
                   end
               end
           end)
       end
   end,
})

--// Slider สำหรับ WalkSpeed
local walkSpeedSlider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "WalkSpeedFlag",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

--// Slider สำหรับ JumpPower
local jumpPowerSlider = MainTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Flag = "JumpPowerFlag",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

--// Input สำหรับ WalkSpeed แบบกำหนดเอง
local walkSpeedInput = MainTab:CreateInput({
   Name = "Custom WalkSpeed",
   PlaceholderText = "1 - 500",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
      local num = tonumber(Text)
      if num then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
      end
   end,
})

--// Section อื่น ๆ
local otherSection = MainTab:CreateSection("Other")

--// Toggle Auto Farm (ตัวอย่าง)
local autoFarmToggle = MainTab:CreateToggle({
   Name = "Auto Farm",
   CurrentValue = false,
   Flag = "AutoFarmToggle",
   Callback = function(Value)
      if Value then
         print("Auto Farm Activated!")
         -- เขียนโค้ดออโต้ฟาร์มเองตามต้องการ
      else
         print("Auto Farm Deactivated!")
      end
   end,
})

--------------------------------------------------------------------------------
--// ตัวอย่าง Tab เกมต่าง ๆ เพื่อรวมสคริปต์จากเจ้าต่าง ๆ 
--------------------------------------------------------------------------------

local GameTab = Window:CreateTab("🎮 Game Scripts", 13041518252)
local Game1Section = GameTab:CreateSection("Petsgo Scripts")

--// ปุ่มกดสำหรับโหลดสคริปต์จากเจ้าอื่น (ตัวอย่าง)
local gameA_Script1 = GameTab:CreateButton({
   Name = "Petsgo | speedhub #1",
   Callback = function()
      --// สมมติไปดึงจาก Pastebin
      loadstring(game:HttpGet("https://raw.githubusercontent.com/mzkv/petsGO/refs/heads/main/xhub"))()
   end,
})

local Game2Section = GameTab:CreateSection("Game B Scripts")

local gameB_Script1 = GameTab:CreateButton({
   Name = "Game B | Script #1",
   Callback = function()
      --// สมมติไปดึงจาก Pastbin อีกอัน
      loadstring(game:HttpGet("https://pastebin.com/raw/YYYYYYYY"))()
   end,
})

--------------------------------------------------------------------------------
--// Tab Misc หรือฟีเจอร์อื่น ๆ 
--------------------------------------------------------------------------------
local MiscTab = Window:CreateTab("🎲 Misc", 13041516477)
local miscSection = MiscTab:CreateSection("Coming Soon")

local infoLabel = MiscTab:CreateLabel("ยังไม่มีฟีเจอร์เพิ่มเติมในตอนนี้ :D")


--------------------------------------------------------------------------------
-- ตัวอย่างโค้ดทั้งหมดนี้เป็นเพียงพื้นฐาน
-- ผู้ใช้สามารถปรับแก้ เพิ่มเติม หรือแก้โครงสร้างได้เต็มที่
-- ขอให้สนุกกับการใช้งาน SpaceXenosHUB!
--------------------------------------------------------------------------------
