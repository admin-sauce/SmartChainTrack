import random
import time

# Function to generate mock sensor data
def generate_sensor_data():
    # Simulate temperature between 20.0 and 30.0 degrees Celsius
    temperature = random.uniform(20.0, 30.0)
    # Simulate humidity between 30.0% and 70.0%
    humidity = random.uniform(30.0, 70.0)
    # Simulate GPS coordinates (latitude and longitude)
    gps_lat = random.uniform(37.0, 38.0)
    gps_lon = random.uniform(-122.0, -121.0)
    return {
        "temperature": temperature,
        "humidity": humidity,
        "gps": {"lat": gps_lat, "lon": gps_lon}
    }

if __name__ == "__main__":
    print("Starting IoT sensor simulation...")
    while True:
        data = generate_sensor_data()
        # Print the data (replace with actual data sending logic, e.g., to Pub/Sub)
        print(data)
        # Wait for 5 seconds before generating the next data point
        time.sleep(5)
