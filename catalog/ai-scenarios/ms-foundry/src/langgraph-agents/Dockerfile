FROM astral/uv:python3.13-bookworm-slim AS builder
WORKDIR /app
COPY . user_agent/
WORKDIR /app/user_agent
# Export the exact versions pinned in uv.lock (do not re-resolve). This keeps the
# container in sync with local and avoids pulling incompatible newer transitive
RUN uv export --frozen --no-dev --no-emit-project -o requirements.txt

FROM python:3.13-slim AS runtime
WORKDIR /app
COPY --from=builder /app/user_agent /app/user_agent
WORKDIR /app/user_agent
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt
EXPOSE 8088
CMD ["python", "main.py"]