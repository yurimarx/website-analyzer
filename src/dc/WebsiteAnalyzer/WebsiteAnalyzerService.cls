Class dc.WebsiteAnalyzer.WebsiteAnalyzerService Extends Ens.BusinessService
{

// extends Ens.BusinessService to create a custom Business service using Object Script

// This class receive a website from a multipart http request to analyze 

// HTTP.InboundAdapter allows you get data from an http request

Parameter ADAPTER = "EnsLib.HTTP.InboundAdapter";

// custom parameter to allows production user set destination folder to multipart file uploaded 

Property Depth As %Integer;

// custom parameter to limit website pages analyzed 

Property TotalPages As %Integer;

Parameter SETTINGS = "Depth,TotalPages";

Method OnInit() As %Status
{
    Set ..Adapter.ParseBodyFormVars=1
    Quit 1
}

// This method is mandatory to have a business service. It receives the website url into pInput 

// and returns a result to the caller using pOutput

Method OnProcessInput(pInput As %GlobalCharacterStream, pOutput As %RegisteredObject) As %Status
{
    set tsc=$$$OK

    Set website=pInput.Read(,.tsc)
   
    //create request object to send
    Set tRequest=##class(dc.WebsiteAnalyzer.WebsiteAnalyzerRequest).%New()
    Set tRequest.Website = website
    Set tRequest.Depth = ..Depth
    Set tRequest.Pages = ..TotalPages

    //send to lookup process
    Set tSC=..SendRequestSync("WebsiteAnalyzerOperation",tRequest,.tResponse, 1200000)

    //define output for OnProcessInput
    Set pOutput=tResponse

    Quit tsc
}

}
