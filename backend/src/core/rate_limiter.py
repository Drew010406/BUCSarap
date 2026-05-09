import time
from fastapi import Request, HTTPException

ip_request_timestamps: dict[str, list[float]] = {}

MAX_REQUESTS_PER_WINDOW = 5
RATE_LIMIT_WINDOW_SECONDS = 60 

def rate_limit(request: Request):
    requester_ip = request.client.host if request.client else "127.0.0.1"
    current_timestamp = time.time()
    
    if requester_ip not in ip_request_timestamps:
        ip_request_timestamps[requester_ip] = []
        
    # this shit removes the old timestamps and only keeps the request under the active window
    ip_request_timestamps[requester_ip] = [
        past_request_time 
        for past_request_time in ip_request_timestamps[requester_ip] 
        if current_timestamp - past_request_time < RATE_LIMIT_WINDOW_SECONDS
    ]
    
    if len(ip_request_timestamps[requester_ip]) >= MAX_REQUESTS_PER_WINDOW:
        raise HTTPException(
            status_code=429, 
            detail="Too Many Requests. Please wait a minute."
        )
        
    ip_request_timestamps[requester_ip].append(current_timestamp)