# Onomatopia

Watch and share illustrations with onomatopoeia!

## Models

* Stereotypes
    * has_many onomatopoeias
    * has_a onomatopoeia
* Onomatopoeia
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
    * belongs_to onomatopoeia, user
