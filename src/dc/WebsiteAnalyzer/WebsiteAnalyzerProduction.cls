Class dc.WebsiteAnalyzer.WebsiteAnalyzerProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.WebsiteAnalyzer.WebsiteAnalyzerProduction" LogGeneralTraceEvents="false">
  <Description>Production to do website analysis</Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="WebsiteAnalyzerService" Category="" ClassName="dc.WebsiteAnalyzer.WebsiteAnalyzerService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="JavaGateway" Category="" ClassName="EnsLib.JavaGateway.Service" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
