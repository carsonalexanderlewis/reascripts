-- @description carsonalewis_Evenly space items between first and last selected
-- @author Carson Alexander Lewis
-- @version 1.0
-- @about
--   Evenly spaces items between first and last selected

function Main()

    --Get number of sekected items and check that there are at least 3 selected
    numSelItems = reaper.CountSelectedMediaItems(0)
    if numSelItems < 3 then
        reaper.ShowMessageBox("Please select at least 3 items", "Error", 0)
    else
    end

    --Set up variables
    firstItem = reaper.GetSelectedMediaItem(0, 0)
    firstItemPos = reaper.GetMediaItemInfo_Value(firstItem, "D_POSITION")
    lastItem = reaper.GetSelectedMediaItem(0, numSelItems - 1)
    lastItemPos = reaper.GetMediaItemInfo_Value(lastItem, "D_POSITION")
    selLength = lastItemPos - firstItemPos
    itemDistance = selLength/(numSelItems - 1)

    --Iterate through items and set positions
    for i = 1, numSelItems - 2 do
        local item = reaper.GetSelectedMediaItem(0, i)
        local pos = firstItemPos + (itemDistance * i)
        reaper.SetMediaItemPosition(item, pos, 1)
    end

end

reaper.Undo_BeginBlock2(0)
Main()
reaper.Undo_EndBlock2(0, "Evenly space items between first and last selected", -1)
