// SPDX-License-Identifier: MIT
pragma solidity < 0.9.0;

contract Proof {
    struct FileDetail
    {
        uint256 timestamp;
        string owner;
    }

    mapping (string => FileDetail) files;

    event logFileAddedStatus(bool status, uint256 timestamp, string owner,
    string fileHash);

    //функция для сохранения владельца файла и метки времени блока
    function set(string memory owner, string memory fileHash) public
    {
        //не существует корректного способа проверить,
        //есть ли уже такой ключ,
        //поэтому мы проверяем значение по умолчанию (все биты нулевые)
        if(files[fileHash].timestamp == 0)
        {
            files[fileHash] = FileDetail(block.timestamp, owner);
            //мы создаем событие, благодаря которому программа-оболочка
            //узнает от контракта, что наличие файла
            //и принадлежности сохранено
            emit logFileAddedStatus(true, block.timestamp, owner, fileHash);
        }
        else
        {
            //здесь мы сообщаем программе-оболочке, что 
            //подтверждение существования и принодлежности
            //не могут быть сохранены, потому что данные файла
            //уже были сохранены раньше
            emit logFileAddedStatus(false, block.timestamp, owner, fileHash);

        }
    }

    //функция для получения сведений о файле
    function get(string memory fileHash) public view returns (uint256 timestamp, string memory owner) 
    {
        return (files[fileHash].timestamp, files[fileHash].owner);
    }
}