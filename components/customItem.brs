sub init()
    m.icon = m.top.findNode("posterIcon")
    m.name = m.top.findNode("labelName")
    m.cursor = m.top.findNode("rectangleCursor")
    m.image = m.top.findNode("posterImage")
end sub

sub showcontent()
    m.itemcontent = m.top.itemContent
    m.icon.uri = m.itemcontent.url
    m.name.text = m.itemcontent.title
    m.image.uri = m.itemcontent.HDPOSTERURL
    ?"TITULO";m.top.itemcontent
    ?"ICON",m.icon.uri
end sub

sub onItemHasFocus()
    if m.top.focusPercent > 0.5 then
        m.cursor.opacity = "1"
        m.image.opacity = "1"
    else
        m.cursor.opacity = "0.4"
        m.image.opacity = "0.4"
    end if
end sub