# Elasticsearch Setup with Docker

This repository contains the setup for Elasticsearch using Docker. It includes the steps to build the Elasticsearch image and run it as a container.

## Prerequisites

Before you begin, ensure that you have the following installed on your machine:
- Docker
- Docker Compose 

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/NaitikSinghal/Elasticsearchondocker.git
```

### 2. Run the following commands

```bash
docker-compose build
```
```bash
docker-compose up -d
```
```bash
curl -X GET "localhost:9200"
```

