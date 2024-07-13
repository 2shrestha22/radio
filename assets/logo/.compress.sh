for i in *; do
    output="${i}.jpg"
    # Check if the output filename starts with a hyphen
    if [[ $output == -* ]]; then
        magick "$i" "./$output"
    else
        magick "$i" "$output"
    fi
done
