sub init()
    m.posterIcon = m.top.findNode("posterIcon")
    m.labelName = m.top.findNode("labelName")
    m.rectangleCursor = m.top.findNode("rectangleCursor")
    m.posterImage = m.top.findNode("posterImage")
end sub

sub showcontent()
    item = m.top.itemContent
    m.posterIcon.uri = item.URL
    m.labelName.text = item.TITLE
    m.posterImage.uri = item.HDPOSTERURL
    item.description = "down"
    '?"TITULO";m.labelName.text
end sub

sub showfocus()
    if m.top.focusPercent > 0.5 then
        m.rectangleCursor.opacity = "1"
        m.posterImage.opacity = "1"
    else
        m.rectangleCursor.opacity = "0.0"
        m.posterImage.opacity = "0.0"
    end if
end sub