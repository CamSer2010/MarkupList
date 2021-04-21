sub init()

    m.top.functionName = "getContent"
    ?"MARKUPLIST TASK (TopUser) RUNNING"

end sub

sub getContent()

    urlTransfer = CreateObject("roUrlTransfer")
    urlTransfer.setUrl("https://raw.githubusercontent.com/jack1590/Roku/master/Netflix/mock/profile.json")
    urlTransfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    urlTransfer.InitClientCertificates()
    stringBody = urlTransfer.getToString()
    data = parseJson(stringBody)    

    content = createObject("roSGNode", "ContentNode")

    for i = 0 to  19 'data.profile.items.count() - 1

      if i < 5 then
        profile = data.profile.items[i]
        ?"i<5?-YES",i
      elseif i < 10 then
        profile = data.profile.items[i-5]
        ?"i<10?-YES",i
      elseif i < 15 then
        profile = data.profile.items[i-10]
        ?"i<15?-YES",i
      elseif i < 20 then
        profile = data.profile.items[i-15]
        ?"i<20?-YES",i
      end if
        
      itemContentNode = content.createChild("ContentNode")
      itemContentNode.URL = profile.poster
      itemContentNode.HDPOSTERURL = profile.poster
      itemContentNode.TITLE = profile.name

      '?"SIZE_CONTENT",itemContentNode.count()
      '?"CONTENT_NODE",itemContentNode
    end for

    m.top.output = content
  
  end sub
