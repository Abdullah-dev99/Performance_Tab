using System.Diagnostics;

var builder = WebApplication.CreateBuilder(args);

var port = Environment.GetEnvironmentVariable("PORT") ?? "3000";
var url = $"http://0.0.0.0:{port}";
var target = Environment.GetEnvironmentVariable("TARGET") ?? "World";

var app = builder.Build();

app.UseStaticFiles();

var cpuCounter = new PerformanceCounter("Processor", "% Processor Time", "_Total");
// First call to get a value establishes a baseline.
cpuCounter.NextValue();

var memoryCounter = new PerformanceCounter("Memory", "Available MBytes");

app.MapGet("/", () => Results.Redirect("/index.html"));

app.MapGet("/cpu", () => 
{
    // Subsequent calls will get the value.
    var cpuUsage = cpuCounter.NextValue();
    return new { cpuUsage = cpuUsage };
});

app.MapGet("/memory", () => 
{
    var memoryUsage = memoryCounter.NextValue();
    return new { memoryUsage = memoryUsage };
});

app.Run(url);
