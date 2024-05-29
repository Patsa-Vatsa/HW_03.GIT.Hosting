#!/bin/bash

# Получаем список удаленных репозиториев
remote_repos=($(git remote))

# Проверяем, есть ли несохраненные изменения
if [[ $(git status -s) ]]; then
    echo "Сохраните ваши изменения перед отправкой"
    exit 1
fi

# Пушим изменения во все удаленные репозитории
for repo in "${remote_repos[@]}"; do
    echo "Отправка изменений в $repo..."
    git push -u "$repo" --all
    echo "Изменения отправлены в $repo."
done

echo "Готово!"

