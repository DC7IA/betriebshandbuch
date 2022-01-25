# Branching-Konzept

Innerhalb des Projektes werden Branches wie folgt genutzt:

| Branch   | Nutzung                        |
|----------|--------------------------------|
| `main`   | Stand für das Produktiv-System |
| `dev`    | Stand für das Staging-System   |

Wenn der Stand in `dev` ausreichend getestet wurde wird ein Merge nach `main` durchgeführt und auf dem Produktivsystem ausgerollt. Dabei ist `dev` der einzige Branch bei welchem ein Merge nach `main` stattfinden darf.

Zusätzlich können Branches mit folgenden Präfixes genutzt werden:

| Präfix     | Nutzung                                                                           |
|------------|-----------------------------------------------------------------------------------|
| `feature/` | Neue Features                                                                     |
| `fix/`     | Korrekturen von Fehlern                                                           |
| `hotfix/`  | Kleine Korrekturen welche schnell umgesetzt werden müssen um ein Problem zu lösen |

Diese Branches werden erstellt um Änderungen vorzunehmen und anschließend nach einem Merge nach `dev` gelöscht. Ein Merge nach `main ist nicht vorgesehen. 
