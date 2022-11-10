touch tempI18N.swift
echo "struct I18N {" >> tempI18N.swift
file="./ko.lproj/Localizable.strings"
##file="./Localizable.strings"
while IFS= read -r line
do
variableName=$(echo ${line%%=*})
if [ "$variableName" != "" ] && [ "$variableName" != "//" ]
then
echo "    static let $variableName = \"$variableName\".localized" >> tempI18N.swift
fi
done <"$file"

echo "}" >> tempI18N.swift

cat "tempI18N.swift" > ./I18N.swift
rm tempI18N.swift

