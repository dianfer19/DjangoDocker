#::::::::::::::::::::::::::WEBAPP::::::::::::::::::::::::::::::
info_container:
	@echo Informacion de los contenedores del sistema DjangoDocker
	@echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	@echo Informacion de los contenedores en ejecucion
	docker ps
	@echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#	@echo Informacion de los contenedores en inactivos
#	docker ps -a
#	@echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::

up_twitch:
	@echo levantando servicios de webApp DjangoDocker
	docker compose up -d

down_twitch:
	@echo parando servicios de webApp DjangoDocker
	docker compose down

logs_services:
	@echo mostrando logs $(services)
	docker compose logs -f $(services)

#::::::::::::::::::::::::::MONITOREO::::::::::::::::::::::::::::::
up_monitor_by_app:
	cd ./monitoreo/$(service)/
	@echo levantando servicios de $(service)
	docker compose -f ./monitoreo/$(service)/docker compose.yaml up -d

down_monitor_by_app:
	cd ./monitoreo/$(service)
	@echo parando servicios de $(service)
	docker compose -f ./monitoreo/$(service)/docker compose.yaml down

up_monitor_all:
	@echo ::::::::::::::::::::::::::prometheus::::::::::::::::::::::::::::::
	$(MAKE) up_monitor_by_app service=prometheus
	@echo ::::::::::::::::::::::::::cadvisor::::::::::::::::::::::::::::::
	$(MAKE) up_monitor_by_app service=cadvisor
	@echo ::::::::::::::::::::::::::postgres-exporter::::::::::::::::::::::::::::::
	$(MAKE) up_monitor_by_app service=postgres-exporter
	@echo ::::::::::::::::::::::::::grafana::::::::::::::::::::::::::::::
	$(MAKE) up_monitor_by_app service=grafana

down_monitor_all:
	@echo ::::::::::::::::::::::::::cadvisor::::::::::::::::::::::::::::::
	$(MAKE) down_monitor_by_app service=cadvisor
	@echo ::::::::::::::::::::::::::postgres-exporter::::::::::::::::::::::::::::::
	$(MAKE) down_monitor_by_app service=postgres-exporter
	@echo ::::::::::::::::::::::::::grafana::::::::::::::::::::::::::::::
	$(MAKE) down_monitor_by_app service=grafana
	@echo ::::::::::::::::::::::::::prometheus::::::::::::::::::::::::::::::
	$(MAKE) down_monitor_by_app service=prometheus