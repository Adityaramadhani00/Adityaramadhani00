-- [Buy cooking pack and drop]
totalBuy = 10

SendVariantList({[0] = "OnDialogRequest", [1] = [[
set_default_color|`w
add_label_with_icon|small|`8Rinuc Community|left|2918|
add_spacer|small|
add_label_with_icon|small|`5VIP `b- `5Free Scripts CPS|left|11550|
add_label_with_icon|small|`eGL `b- `2BotHax `b- `8GPai|left|11550|
add_label_with_icon|small|`6Report Bug Script|left|11550|
add_label_with_icon|small|`3Request Script|left|11550|
add_label_with_icon|small|`8Learn Script|left|1550|
add_spacer|small|
add_url_button||`qDiscord``|NOFLAGS|https://discord.gg/pgTRCQ43|`$Rinuc Community.|0|0|
add_smalltext|`9Need more scripts?!Join now!|
add_quick_exit|]]})












items = {962, 4602, 4588, 4568, 4570}
trashs = {4562, 4564, 4572, 4676, 4578, 4582, 4618, 4666, 4672, 4766, 822, 868, 874, 956}

function inv(id)
    for _, item in pairs(GetInventory()) do
        if item.id == id then
            return item.amount
        end
    end
    return 0
end

for i = 1, totalBuy do
    SendPacket(2, "action|buy\nitem|buy_cookingpack")
    Sleep(200)
    for _, item in pairs(items) do
        if inv(item) >= 200 then
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. item .. "|\nitem_count|" .. inv(item))
            Sleep(150)
        end
    end
    for _, trash in pairs(trashs) do
        if inv(trash) >= 200 then
            SendPacket(2, "action|dialog_return\ndialog_name|trash\nitem_trash|" .. trash .. "|\nitem_count|" .. inv(trash))
            Sleep(150)
        end
    end
end

LogToConsole("`8Rowr")

