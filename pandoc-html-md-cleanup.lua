PANDOC_VERSION:must_be_at_least '2.17.1.1'

local utils = require 'pandoc.utils'

local function removeAttr(el)
  -- strip all attributes
  if el.attr then
    el.attr = pandoc.Attr()
  end
  return el
end

local function titleCase(first, rest)
   return first:upper()..rest:lower()
end

local function header(el)
  -- stringify to get only text
  upper_text = utils.stringify(el.content)
  -- convert from upper case to title case
  title_text = string.gsub(upper_text, "(%a)([%w_']*)", titleCase)
  -- trim whitespace (front and back)
  trimmed_text = string.match(title_text, "^%s*(.-)%s*$")
  el.content = trimmed_text
  return el
end

local function fixImageLinks(source)
  -- munge for image links. note that the image include macro automatically
  -- prepends "images/" to the source. before running the script, feel free to
  -- customize the sub-directory further, e.g. "<topic>".
  image_sub_directory = ""
  if string.find(source, "article_attachments") then
    source = string.gsub(source, "/hc/article_attachments/(%d*)/", image_sub_directory)
    source = string.gsub(source, "_", "-")
    source = source:lower()
  end
  return source
end

local function image(el)
  -- most captions are just the filename..., so we ignore them
  src = fixImageLinks(el.src)
  -- replace image elements with the image macro
  return pandoc.Str([[{% include image.html alt="" file="]] .. src .. [[" %}]])
end

local function removeBreaks(el)
  --- remove or replace breaks
  for i, item in ipairs(el.content) do
    if item.t == "SoftBreak" or item.t == "LineBreak" then
      local is_first = el.content[i - 1] == nil
      local is_last = el.content[i + 1] == nil
      if is_first or is_last then
        -- completely remove the break
        el.content[i] = pandoc.Str("")
      else
        -- replace with a space
        el.content[i] = pandoc.Str(" ")
      end
    end
  end
  return el
end

local function removePlainBreaks(el)
  --- remove or replace all soft breaks, and some line breaks
  for i, item in ipairs(el.content) do
    if item.t == "SoftBreak" or item.t == "LineBreak" then
      local is_first = el.content[i - 1] == nil
      local is_last = el.content[i + 1] == nil
      if is_first or is_last then
        -- completely remove the break
        el.content[i] = pandoc.Str("")
      elseif item.t == "SoftBreak" then
        -- replace with a space
        el.content[i] = pandoc.Str(" ")
      elseif item.t == "LineBreak" and el.content[i + 1].t == "Image" then
        -- replace with a space
        el.content[i] = pandoc.Str(" ")
      end
    end
  end
  return el
end

return {
  { Inline = removeAttr, Block = removeAttr },
  { Header = header },
  { Image = image },
  { Span = removeBreaks, Para = removeBreaks },
  { Plain = removePlainBreaks },
}
