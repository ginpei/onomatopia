# Onomatopia

Watch and share illustrations with onomatope!

## Models

* Stereotypes
    * has_many onomatopes
    * has_a onomatope
* Onomatope
    * title:string
    * has_many illustrations
    * belongs_to sterotype
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
