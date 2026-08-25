#!/bin/bash

URL="http://localhost:8000/articles/6/comments"
NUM_REQUESTS=100
CSRF_TOKEN="OywaIbKRxB316RU1qX0mNu5ydZe9hF1AtFPVZQk5"
SESSION_COOKIE="laravel_session=eyJpdiI6IkJmRlVsa0YvcGl2M1RTZnVmU0hEMWc9PSIsInZhbHVlIjoiL2lCQVc1ZDZXcmlJQWFJMmhkeTV6MXhibld5NjBubU9YWHJKdVRVQmJnOURVSTFLMk1EK2xiWFNodElSQ3FvM3pRQmJTdGt1Zm5RSFVPeGVwOVMvR0JaL1hnOWJPSFdVdUdwVzhSVStEZWJFMk45dEZuVzJxcFlyYURCQllZQ3AiLCJtYWMiOiI1OGE5ZTlkNjE2MTExN2IzYmIxNjEzMTQwMTUyNjRkODc2MjA4OGM2MGVhYTI5NmE5MjIyODNmZmJlOWFlMzMxIiwidGFnIjoiIn0%3D"
send_comment(){
    local comment_number=$1
    curl -s -H "Cookie: $SESSION_COOKIE" -X POST -d "content= commento casuale $1&_token=$CSRF_TOKEN" "$URL"
}

for ((i=1; i<=NUM_REQUESTS; i++))
do
    send_comment $i
    if [$((i % 5))-eq 0]; then
        "sleep 60"
    fi
    echo "Comment $i sent"
done
