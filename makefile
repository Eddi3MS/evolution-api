PROJECT_NAME=evolution-api-stack
COMPOSE=docker compose

up:
	@echo "🔼 Subindo os containers..."
	$(COMPOSE) up -d

down:
	@echo "🧹 Parando os containers..."
	$(COMPOSE) down

restart: down up

logs:
	@echo "📜 Logs dos containers..."
	$(COMPOSE) logs -f

ps:
	@echo "📦 Status dos containers..."
	$(COMPOSE) ps

evolution-shell:
	@echo "🛠️ Acessando o shell do container Evolution API..."
	$(COMPOSE) exec evolution-api sh

postgres-shell:
	@echo "🐘 Acessando o PostgreSQL..."
	$(COMPOSE) exec postgres psql -U evolution -d evolution

rebuild:
	@echo "🔄 Rebuildando os containers..."
	$(COMPOSE) up -d --build

clean:
	@echo "🗑️ Limpando volumes e containers..."
	$(COMPOSE) down -v

help:
	@echo "Comandos disponíveis:"
	@echo "  make up               # Sobe a stack"
	@echo "  make down             # Para a stack"
	@echo "  make restart          # Reinicia a stack"
	@echo "  make logs
