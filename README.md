# Statistique à deux variables — cours & exercices (site)

Site **Quarto** (théorie + exercices en ligne) avec **correctifs à indices progressifs**
et **figures interactives**, sur le modèle du dispositif `imsv-exos-2026` / `suites-cours`.
Quatre chapitres : **1 (nuage)**, **2 (ajustement)**, **3 (corrélation)**, **4 (critique)**.

## Rendre / prévisualiser

```bash
quarto preview      # aperçu live dans le navigateur
quarto render       # construit le site dans _book/
```

## Publier sur GitHub Pages

1. Créer un dépôt `stats-cours` (URL dans `_quarto.yml` → `site-url`, et dans
   `_includes/tools.html` → `GITHUB_URL`).
2. `quarto publish gh-pages`

## Structure

| Fichier / dossier | Rôle |
|---|---|
| `_quarto.yml` | configuration (chapitres, thème, filtres, includes) |
| `theme.scss` | thème clair/sombre + boîtes de cours + figures interactives |
| `theorie.lua` | numérote **Définition / Propriété / Exemple / Remarque** |
| `exercice.lua` | numérote les exercices par catégorie (S.1, T.1…) |
| `methode.lua` | cartes « méthode » (repris, si besoin) |
| `_includes/aides.html` | replie les indices sous « Coups de pouce » |
| `_includes/stats-plot.html` | figures interactives (nuage, régression, moindres carrés, corrélation) |
| `_includes/tools.html` | boutons GitHub / téléchargement / thème |
| `chap1-nuage/` … `chap4-critique/` | les quatre chapitres (index, cours, exercices) |

## Écrire une boîte de cours

```markdown
::: {.definition title="covariance"}  … :::
::: {.propriete title="…"}            … :::
::: {.exemple title="…"}              … :::
::: {.remarque}                        … :::
::: {.aretenir}   texte court à retenir :::
```

## Écrire un exercice + correctif à 3 indices

```markdown
::: {.callout-caution .exo title="Exercice|Socle|2|A3"}
Énoncé…
:::

::: {.aides}
::: {.panel-tabset}
## Indice 1
*Renvoi à la théorie.*
## Indice 2
*Une question à se poser.*
## Indice 3
*Une étape pour démarrer.*
## Solution
*La solution rédigée.*
## Pièges
*Les erreurs classiques.*
:::
:::
```

Titre : `Exercice|Catégorie|niveau|Objectif` (catégories : `Socle`, `Transfert`,
`Renforcement`, `Dépassement` ; niveau 1/2/3 → ★). `exercice.lua` numérote seul.

## Figure interactive

```markdown
```{=html}
<div class="stat-plot" data-mode="moindres"
     data-points="[[0,9.5],[4,10.2],[9,6.4],[11,5.8],[14,3.2],[16,0.7]]"
     data-xmin="0" data-xmax="18" data-ymin="0" data-ymax="12"
     data-xlabel="t" data-ylabel="écart %"></div>
```
```

`data-mode` : `nuage` (points + point moyen), `regression` (droite + r),
`moindres` (curseur de pente, résidus et somme des carrés en direct, bouton « meilleure
droite »), `correlation` (curseur de dispersion, r recalculé).

## Ajouter un chapitre

Créer `chap-XXX/{index,cours,exercices}.qmd` et l'ajouter sous `chapters:` de
`_quarto.yml`, comme les quatre chapitres existants.
