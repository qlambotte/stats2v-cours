-- theorie.lua — boîtes de cours numérotées (Définition / Propriété / Exemple /
-- Remarque / À retenir), à partir de divs fenced :
--   ::: {.definition title="suite géométrique"}  … :::
--   ::: {.propriete title="génération"}           … :::
--   ::: {.exemple}                                … :::
--   ::: {.remarque}                               … :::
--   ::: {.aretenir}                               … :::
-- Rendu HTML : carte colorée « Label N — titre ». Compteur par type, remis à
-- zéro à chaque document. (Autres formats : la div est laissée telle quelle.)

local LABELS = {
  definition = "Définition", propriete = "Propriété",
  exemple = "Exemple", remarque = "Remarque",
}
local counters = {}

local function has(el, name)
  for _, c in ipairs(el.classes) do if c == name then return true end end
  return false
end

function Div(el)
  if not quarto.doc.is_format("html") then return nil end

  -- « À retenir » : encadré sans numéro
  if has(el, "aretenir") then
    local out = { pandoc.RawBlock("html", '<div class="theo theo-aretenir"><div class="theo-body"><strong>À retenir. </strong>') }
    for _, b in ipairs(el.content) do out[#out + 1] = b end
    out[#out + 1] = pandoc.RawBlock("html", '</div></div>')
    return out
  end

  for key, label in pairs(LABELS) do
    if has(el, key) then
      counters[key] = (counters[key] or 0) + 1
      local titre = el.attributes.title
      local head = '<span class="theo-label">' .. label .. " " .. counters[key] .. '</span>'
      if titre and titre ~= "" then
        head = head .. ' <span class="theo-em">— ' .. titre .. '</span>'
      end
      local out = { pandoc.RawBlock("html",
        '<div class="theo theo-' .. key .. '"><div class="theo-head">' .. head .. '</div><div class="theo-body">') }
      for _, b in ipairs(el.content) do out[#out + 1] = b end
      out[#out + 1] = pandoc.RawBlock("html", '</div></div>')
      return out
    end
  end
  return nil
end
