import random
from mcp.server.fastmcp import FastMCP
from starlette.applications import Starlette
from starlette.routing import Mount
import uvicorn

mcp = FastMCP("Weather")

@mcp.tool()
async def get_cities(country: str) -> str:
    """Get list of cities for a given country.

    Returns:
        List of cities
    """
    cities_by_country = {
        "usa": ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"],
        "canada": ["Toronto", "Vancouver", "Montreal", "Calgary", "Ottawa"],
        "uk": ["London", "Manchester", "Birmingham", "Leeds", "Glasgow"],
        "australia": ["Sydney", "Melbourne", "Brisbane", "Perth", "Adelaide"],
        "india": ["Mumbai", "Delhi", "Bangalore", "Hyderabad", "Chennai"],
        "portugal": ["Lisbon", "Porto", "Braga", "Faro", "Coimbra"]
    }

    cities = cities_by_country.get(country.lower(), [])

    return str(cities)

@mcp.tool()
async def get_weather(city: str) -> str:
    """Get weather information for a given city.

    Returns:
        Weather information
    """

    weather_conditions = ["Sunny", "Cloudy", "Rainy", "Snowy", "Windy"]
    temperature = random.uniform(-10, 35)  # Random temperature between -10 and 35 degrees Celsius
    humidity = random.uniform(20, 100)  # Random humidity between 20% and 100%

    weather_info = {
        "city": city,
        "condition": random.choice(weather_conditions),
        "temperature": round(temperature, 2),
        "humidity": round(humidity, 2),
    }
    return str(weather_info)

# Bind SSE request handling to MCP server
app = Starlette(
    debug=True,
    routes=[
        Mount('/', app=mcp.sse_app()),
    ]
)

if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description='Run MCP SSE-based server')
    parser.add_argument('--host', default='0.0.0.0', help='Host to bind to')
    parser.add_argument('--port', type=int, default=8080, help='Port to listen on')
    args = parser.parse_args()

    uvicorn.run(app, host=args.host, port=args.port)