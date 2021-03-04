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
    section = content.createChild("ContentNode")
    ?">>API ";data.profile.items[0].poster
    ?">>API ";data.profile.items[1].poster
    ?">>API ";data.profile.items[2].name
    ?">>API ";data.profile.items[3].name
    ?">>API ";data.profile.items[4].name

    for i = 0 to data.profile.items.count() - 1
      
      profile = data.profile.items[i]
        
      itemContentNode = section.createChild("ContentNode")
      itemContentNode.url = profile.poster
      itemContentNode.HDPOSTERURL = profile.poster
      itemContentNode.title = profile.name
      ?"NAME=",itemContentNode.url

    end for

    m.top.output = content
  
  end sub

