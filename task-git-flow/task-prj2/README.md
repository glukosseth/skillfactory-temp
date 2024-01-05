## Структура репозитория

### Правила наименования веток

- **main** - ветка с рабочим кодом
- **develop** - основная ветка разработки
- **features/%features_name%** - ветки разработки нового функционала


### Порядок внесения изменений в кодовую базу

- Основная ветка разработки **develop**
- Новые фичи разрабатываются в ветке **features/%feature_name%** и по готовности заливаются в **develop**
- При количестве фич достаточных для релиза ветка **develop** заливается в ветку **main**
- В **main** попадают только **pull request**


## Инструкция по началу работы с git

#### Установить git выполнив команды:
```Bash
# обновить систему
sudo apt update && sudo apt upgrade -y

# установить git
sudo apt install git

# проверить, что установка прошла успешно
git version
```

#### Сгенерировать ssh ключ  для доступа к репозиторию
```Bash
ssh-keygen -t rsa -b 4096 -C "your_email"

# вывести паблик ключ
cat $HOME/.ssh/id_rsa.pub

# добавить ключ в GitHub по адресу `https://github.com/settings/ssh/new`
```

#### Клонировать репозиторий
```Bash
git clone git@github.com:glukosseth/skillf.git
```

#### Настроить git
```Bash
cd skillf

# изменить name и email
nano ./.gitconfig

# `ctrl+O` и `ctrl+X` для выхода из редактора

# переместить файл конфигурации в домашний каталог
mv ./.gitconfig $HOME
```

#### Открыть клонированный репозиторий в редакторе кода.


## Список основных команд:

```Bash
# создать новую ветку
git checkout -b features/%feature_name%

# добавить изменение
git add %file%

# добавить коммит
git commit -m “add message”

# обновить удаленный репозиторий
git push origin features/%feature_name%
```
