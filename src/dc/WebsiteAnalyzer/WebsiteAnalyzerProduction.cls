Class dc.WebsiteAnalyzer.WebsiteAnalyzerProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.WebsiteAnalyzer.WebsiteAnalyzerProduction" LogGeneralTraceEvents="false">
  <Description>Production to do website analysis</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="WebsiteAnalyzerService" Category="" ClassName="dc.WebsiteAnalyzer.WebsiteAnalyzerService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Depth">0</Setting>
    <Setting Target="Host" Name="TotalPages">5</Setting>
  </Item>
  <Item Name="JavaGateway" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="JavaHome">/usr/lib/jvm/java-8-openjdk-amd64</Setting>
    <Setting Target="Host" Name="ClassPath">.:/usr/irissys/dev/java/lib/JDK18/*:/opt/irisapp/*:/usr/irissys/dev/java/lib/gson/*:/usr/irissys/dev/java/lib/jackson/*:/jgw/website-analyzer-1.0.0.jar</Setting>
  </Item>
  <Item Name="WebsiteAnalyzerOperation" Category="" ClassName="EnsLib.PEX.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="%gatewayPort">55555</Setting>
    <Setting Target="Host" Name="%gatewayExtraClasspaths">.:/usr/irissys/dev/java/lib/JDK18/*:/opt/irisapp/*:/usr/irissys/dev/java/lib/gson/*:/usr/irissys/dev/java/lib/jackson/*:/jgw/website-analyzer-1.0.0.jar</Setting>
    <Setting Target="Host" Name="%remoteClassname">community.intersystems.websiteanalyzer.WebsiteAnalyzerOperation</Setting>
  </Item>
</Production>
}

}
