--[Buy cooking pack and drop]
totalBuy = 10





items = {2204}
trashs = {}
function inv(id)
    for _, item in pairs(GetInventory()) do
        if item.id == id then
            return item.amount
        end
    end
    return 0
end
for i = 1, totalBuy do
    SendPacket(2, "action|buy\nitem|buy_geigercounter")
    Sleep(200)
    for _, item in pairs(items) do
        if inv(item) >= 200 then
            SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. item .. "|\nitem_count|" .. inv(item))
            Sleep(150)
        end
    end
end
LogToConsole("DONE")

