# DevOps Demo Project (Azure + Jenkins + Docker + Nexus + SonarQube)

## Architecture

### Azure VM 1 (CI/CD Server)
Install:
- Java 17
- Jenkins
- Maven
- Docker
- SonarQube
- Nexus Repository OSS
- Git

Responsibilities:
GitHub → Jenkins → Maven Build → Tests → SonarQube → Nexus → Docker Build → DockerHub Push

### Azure VM 2 (Runtime Server)
Install:
- Docker

Responsibilities:
Pull Docker image → Run container → Host website

---

## Pipeline Flow
1. Developer pushes code to GitHub.
2. Jenkins triggers automatically.
3. Maven builds project and runs tests.
4. SonarQube performs code analysis.
5. Artifact uploaded to Nexus.
6. Docker image built and pushed to DockerHub.
7. Runtime VM pulls and deploys container.

---

## Run Application
After deployment:
http://<AZURE_VM_IP>:8080

---

## Jenkins Setup
Add:
- JDK17
- Maven
- DockerHub credentials (ID: dockerhub-creds)
- SSH key for runtime VM

---

Replace placeholders:
- YOUR_GITHUB_REPO
- YOUR_DOCKERHUB_USERNAME
- YOUR_NEXUS_IP
- RUNTIME_VM_IP
