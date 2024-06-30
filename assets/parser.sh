jq '[.[] |
 {
 id: "placeholder",
 name: .radio_name,
 url: .radio_url,
 freq: (if (.radio_frq | tonumber? // false) then .radio_frq else null end),
 logo: null,
 addr: .radio_adr,
 province: (if .category_name | contains("Pradesh") then (.category_name | split(" ") | last | tonumber) else null end // null)
 }
]' input.json |
jq -c '.[]' | while read -r item; do
    uuid=$(nanoid | tr -d '-')
    echo "$item" | jq --arg uuid "$uuid" '.id = $uuid'
done | jq -s '
sort_by((.province == null), .province, (.freq == null), .freq)
' > output.json