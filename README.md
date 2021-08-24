# Twitter.Project

Entrega Hito 1 de prueba final modulo Desarrollo de aplicaciones web con Rails(G46) Desafío Latam.

## Contenido
1. **Acerca de Twitter.Project**
1. **Estructura**  
    1. *Modelo conceptual*
    1. *Modelo Físico*
1. **Cómo funciona**
    1. *Modelo User*
    1. *Modelo Tweet*
    1. *Modelo Like*
1. **Herramientas**
1. **Demo**

### *Twitter.Project*
Este proyecto intenta replicar algunas de las funcionalidades más conocidas de la plataforma Twitter, principalmente el uso de *Tweets*, dar *like/dislike* y la acción *Retweet*. Lo anterior se combina con una previa autenticación del usuario, el cuál tendrá diferentes visualizaciones dependiendo si se encuentra autenticado (o no), y con la opción de poder crear una cuenta con su email y contraseña.

### *Estructura*
#### Modelo conceptual

Este proyecto consta de 3 modelos principales: **User, Tweet y Like**
    - **User model**: administra a todos los usuarios de la aplicación. Es el modelo principal al cual los demás modelos referencian.
    - **Tweet model**: maneja la creación y destrucción de los tweet. También administra los retweets en una asociación recursiva.
    - **Like model**: se encarga de la creación y destrucción de los *likes/dislikes* asociados a los tweet y usuarios.

- Algunos de los atributos como **n_likes o n_retweets** por normalización desaparecen como atributos propios del modelo Tweet, ya que se obtiene de la relación entre entidades.
- Todos los modelos mantienen relación 1 a N.


![Modelo conceptual](https://github.com/r-osoriobarra/ViajesChile/blob/main/assets/img/twitter_project.png)
#### Modelo Físico

El modelo físico entonces quedaría de la siguiente manera.

![Modelo conceptual](https://github.com/r-osoriobarra/ViajesChile/blob/main/assets/img/twitter_project2.png)

- Todos las entidades responden a arquitectura REST.

### *Cómo funciona*
##### Modelo User
- Para todo lo de autenticación del usuario se utilizó la gema Devise con este modelo
- Las relaciones es 1 a N con el resto de modelos (Tweet y Like)
```
    has_many :tweets, dependent: :destroy
    has_many :likes, dependent: :destroy
```
##### Modelo Tweet (y Retweet)
- Junto con su controlador, manejan la mayoría de las acciones de la aplicación fuera de la autenticación.
- Relación con entidades user, like y tweet (recursiva):
```
  #user and likes associations
  belongs_to :user
  has_many :likes, dependent: :destroy

  #recursive retweet association
  belongs_to :tweet, optional: true
  has_many :tweets, dependent: :destroy
```
- En el controlador de tweet tambien se adiciona el método `retweet`, que se encarga de copiar el comentario retweeteado, idenficando el `params[:id]` de la ruta creada ` post /tweets/:id, to: 'tweets#retweet'`.
  ```
  def retweet
    original_tweet = Tweet.find(params[:id])
    @tweet = Tweet.create(
      content: original_tweet.content,
      user_id: original_tweet.user_id,
      tweet_id: original_tweet.id
    )
    redirect_to root_path, notice: "Retweet was successfully created."
  end
  ```
- En el modelo se crean metodos de instancia y clase para obtener el número de likes y retweets para cada tweet,respectivamente, en base a la relación con cada entidad, dado que no son atributos propios de la entidad Tweet:

```
 def count_likes
    self.likes.empty? ? 0 : self.likes.count
  end

  def self.count_retweets(tweet)
    Tweet.all.count {|t| t.tweet_id == tweet.id}
  end
```
##### Modelo Like
- Relación con entidades user y tweet
```
    belongs_to :user
    belongs_to :tweet
```
- Se crea un controlador para la entidad Like, con metodos `create` y `destroy` dependiendo si un usuario hace click en el botón like. Si el mismo usuario presiona 2 veces el botón like, el objeto creado se destruye.
- Para activar el método `destroy` para acciones un 'dislike', se agrega un método en el modelo `Tweet`, que identifica si el usuario ya clickeó previamente:
    ```
    def liked?(user)
        self.likes.find_by(user_id: user.id).present?
    end
    ```
### *Herramientas
    *ruby '2.7.3'
    *gem 'devise'
    *gem 'bootstrap', '~> 4.6.0'
    *gem 'jquery-rails'
    *gem 'faker'
    *gem 'kaminari'
    *gem 'rails', '~> 5.2.6'

### *Demo
Proyecto subido a Heroku: 

