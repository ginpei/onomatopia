# Onomatopia

Watch and share illustrations with onomatope!

## Models

* Onomatope
    * title:string
    * has_many illustrations
* User
    * name:string
    * has_many illustrations
    * has_many authorizations
* Authorization
    * provider:string
    * uid:string
    * belongs_to user
* Illustrations
    * belongs_to onomatope, user
