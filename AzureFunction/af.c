#r "Newtonsoft.Json"

using System.Net;
using System.Text;
using Microsoft.AspNetCore.Mvc;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using Newtonsoft.Json;


public static async Task<IActionResult> Run(HttpRequest req, ILogger log)
{
    string value = req.Query["value"];
	
    var client = new HttpClient();
    
	client.DefaultRequestHeaders.Add("Authorization", "Basic WEBACCESSKEY");
	Dictionary<string, string> dictionary = new Dictionary<string, string>();
	dictionary.Add("mqValue", value);

	string json = JsonConvert.SerializeObject(dictionary);
	var requestData = new StringContent(json, Encoding.UTF8, "application/json");

	var url = "https://api.businesscentral.dynamics.com/v2.0/<USER DOMAIN>/<SANDBOX NAME>/api/baludin/mqValues/v1.0/companies(COMPANY ID)/mqValues";
	var response = await client.PostAsync(url, requestData);
	var result = await response.Content.ReadAsStringAsync();

	return value != null
	? (ActionResult)new OkObjectResult($"Written value: {value}")
	: new BadRequestObjectResult("Please pass a value on the query string");		        
}