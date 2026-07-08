FROM python:3.12-slim
WORKDIR /app
COPY . user_agent/
WORKDIR /app/user_agent
run uv pip compile pyproject.toml -o requirements.txt --prerelease=allow
EXPOSE 8088
CMD ["python", "main.py"]