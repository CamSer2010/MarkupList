sub init()
    m.markupList = m.top.findNode("markupList")
    m.markupList.setFocus(true)
    m.top.observeField("visible", "OnVisibleChange")
    m.top.observeField("focusedChild", "OnFocusedChild")
    m.markupList.observeField("rowItemFocused", "onRowItemFocused")
    loadMenuItemsTask()
end sub

sub loadMenuItemsTask()
    m.contentTask = CreateObject("roSGNode", "contentTask")
    m.contentTask.observeField("output", "onContentReady")
    m.contentTask.control = "RUN"
end sub

sub onContentReady()

    m.markupList.content = m.contentTask.output
    m.contentTask.control = "STOP"
    m.contentTask.unobserveField ("output")
    m.contentTask = invalid
   
    ?"HIJO",
end sub

sub onRowItemFocused(event as Object)
    rowItemFocused = event.getData()
    m.itemFocused = m.markupList.content.getChild(rowItemFocused[0]).getChild(rowItemFocused[1])
    m.itemFocused.description = "rowlist"
    ?"ITEM_SELECTED",m.itemFocused.description
end sub