Class dc.WebsiteAnalyzer.NLPOperation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method IndexNLP(pRequest As dc.ocr.NLPRequest, Output pResponse As Ens.Response) As %Status
{
  //Return $SYSTEM.iKnow.IndexString("OcrNLP", pRequest.FileName, pRequest.Text, , 0, .src)
  Return "ok"
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="dc.ocr.NLPRequest">
    <Method>IndexNLP</Method>
  </MapItem>
</MapItems>
}

}
