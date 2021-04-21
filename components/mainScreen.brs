sub init()

    m.markupList = m.top.findNode("markupList")
    m.markupList.setFocus(true)

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
   
end sub
