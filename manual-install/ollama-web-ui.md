## web-ui
https://github.com/open-webui/open-webui

```bash
docker run -d -p 3080:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```

Now open http://localhost:3080/