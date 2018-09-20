{-
   OpenAPI Petstore

   This spec is mainly for testing Petstore server and contains fake endpoints, models. Please do not use this for any other purpose. Special characters: \" \\

   OpenAPI Version: 3.0.1
   OpenAPI Petstore API version: 1.0.0
   Generated by OpenAPI Generator (https://openapi-generator.tech)
-}

{-|
Module : OpenAPIPetstore.API.Pet
-}

{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MonoLocalBinds        #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing -fno-warn-unused-binds -fno-warn-unused-imports #-}

module OpenAPIPetstore.API.Pet where

import           OpenAPIPetstore.Core
import           OpenAPIPetstore.MimeTypes
import           OpenAPIPetstore.Model                 as M

import qualified Data.Aeson                            as A
import qualified Data.ByteString                       as B
import qualified Data.ByteString.Lazy                  as BL
import qualified Data.Data                             as P (TypeRep, Typeable,
                                                             typeOf, typeRep)
import qualified Data.Foldable                         as P
import qualified Data.Map                              as Map
import qualified Data.Maybe                            as P
import qualified Data.Proxy                            as P (Proxy (..))
import qualified Data.Set                              as Set
import qualified Data.String                           as P
import qualified Data.Text                             as T
import qualified Data.Text.Encoding                    as T
import qualified Data.Text.Lazy                        as TL
import qualified Data.Text.Lazy.Encoding               as TL
import qualified Data.Time                             as TI
import qualified Network.HTTP.Client.MultipartFormData as NH
import qualified Network.HTTP.Media                    as ME
import qualified Network.HTTP.Types                    as NH
import qualified Web.FormUrlEncoded                    as WH
import qualified Web.HttpApiData                       as WH

import           Data.Text                             (Text)
import           GHC.Base                              ((<|>))

import           Prelude                               (Applicative, Bool (..),
                                                        Char, Double, FilePath,
                                                        Float, Functor, Int,
                                                        Integer, Maybe (..),
                                                        Monad, String, fmap,
                                                        maybe, mempty, pure,
                                                        undefined, ($), (.),
                                                        (/=), (<$>), (<*>),
                                                        (==), (>>=))
import qualified Prelude                               as P

-- * Operations


-- ** Pet

-- *** addPet

-- | @POST \/pet@
--
-- Add a new pet to the store
--
-- AuthMethod: 'AuthOAuthPetstoreAuth'
--
addPet
  :: (Consumes AddPet contentType, MimeRender contentType Pet)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Pet -- ^ "pet" -  Pet object that needs to be added to the store
  -> OpenAPIPetstoreRequest AddPet contentType NoContent MimeNoContent
addPet _ pet =
  _mkRequest "POST" ["/pet"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthOAuthPetstoreAuth)
    `setBodyParam` pet

data AddPet

-- | /Body Param/ "Pet" - Pet object that needs to be added to the store
instance HasBodyParam AddPet Pet

-- | @application/xml@
instance Consumes AddPet MimeXML
-- | @application/json@
instance Consumes AddPet MimeJSON

instance Produces AddPet MimeNoContent


-- *** deletePet

-- | @DELETE \/pet\/{petId}@
--
-- Deletes a pet
--
-- AuthMethod: 'AuthOAuthPetstoreAuth'
--
deletePet
  :: PetId -- ^ "petId" -  Pet id to delete
  -> OpenAPIPetstoreRequest DeletePet MimeNoContent NoContent MimeNoContent
deletePet (PetId petId) =
  _mkRequest "DELETE" ["/pet/",toPath petId]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthOAuthPetstoreAuth)

data DeletePet
instance HasOptionalParam DeletePet ApiKey where
  applyOptionalParam req (ApiKey xs) =
    req `setHeader` toHeader ("api_key", xs)

instance Produces DeletePet MimeNoContent


-- *** findPetsByStatus

-- | @GET \/pet\/findByStatus@
--
-- Finds Pets by status
--
-- Multiple status values can be provided with comma separated strings
--
-- AuthMethod: 'AuthOAuthPetstoreAuth'
--
findPetsByStatus
  :: Accept accept -- ^ request accept ('MimeType')
  -> Status -- ^ "status" -  Status values that need to be considered for filter
  -> OpenAPIPetstoreRequest FindPetsByStatus MimeNoContent [Pet] accept
findPetsByStatus  _ (Status status) =
  _mkRequest "GET" ["/pet/findByStatus"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthOAuthPetstoreAuth)
    `setQuery` toQueryColl CommaSeparated ("status", Just status)

data FindPetsByStatus

-- | @application/xml@
instance Produces FindPetsByStatus MimeXML
-- | @application/json@
instance Produces FindPetsByStatus MimeJSON


-- *** findPetsByTags

-- | @GET \/pet\/findByTags@
--
-- Finds Pets by tags
--
-- Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
--
-- AuthMethod: 'AuthOAuthPetstoreAuth'
--
findPetsByTags
  :: Accept accept -- ^ request accept ('MimeType')
  -> Tags -- ^ "tags" -  Tags to filter by
  -> OpenAPIPetstoreRequest FindPetsByTags MimeNoContent [Pet] accept
findPetsByTags  _ (Tags tags) =
  _mkRequest "GET" ["/pet/findByTags"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthOAuthPetstoreAuth)
    `setQuery` toQueryColl CommaSeparated ("tags", Just tags)

{-# DEPRECATED findPetsByTags "" #-}

data FindPetsByTags

-- | @application/xml@
instance Produces FindPetsByTags MimeXML
-- | @application/json@
instance Produces FindPetsByTags MimeJSON


-- *** getPetById

-- | @GET \/pet\/{petId}@
--
-- Find pet by ID
--
-- Returns a single pet
--
-- AuthMethod: 'AuthApiKeyApiKey'
--
getPetById
  :: Accept accept -- ^ request accept ('MimeType')
  -> PetId -- ^ "petId" -  ID of pet to return
  -> OpenAPIPetstoreRequest GetPetById MimeNoContent Pet accept
getPetById  _ (PetId petId) =
  _mkRequest "GET" ["/pet/",toPath petId]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthApiKeyApiKey)

data GetPetById

-- | @application/xml@
instance Produces GetPetById MimeXML
-- | @application/json@
instance Produces GetPetById MimeJSON


-- *** updatePet

-- | @PUT \/pet@
--
-- Update an existing pet
--
-- AuthMethod: 'AuthOAuthPetstoreAuth'
--
updatePet
  :: (Consumes UpdatePet contentType, MimeRender contentType Pet)
  => ContentType contentType -- ^ request content-type ('MimeType')
  -> Pet -- ^ "pet" -  Pet object that needs to be added to the store
  -> OpenAPIPetstoreRequest UpdatePet contentType NoContent MimeNoContent
updatePet _ pet =
  _mkRequest "PUT" ["/pet"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthOAuthPetstoreAuth)
    `setBodyParam` pet

data UpdatePet

-- | /Body Param/ "Pet" - Pet object that needs to be added to the store
instance HasBodyParam UpdatePet Pet

-- | @application/xml@
instance Consumes UpdatePet MimeXML
-- | @application/json@
instance Consumes UpdatePet MimeJSON

instance Produces UpdatePet MimeNoContent


-- *** updatePetWithForm

-- | @POST \/pet\/{petId}@
--
-- Updates a pet in the store with form data
--
-- AuthMethod: 'AuthOAuthPetstoreAuth'
--
updatePetWithForm
  :: (Consumes UpdatePetWithForm MimeFormUrlEncoded)
  => PetId -- ^ "petId" -  ID of pet that needs to be updated
  -> OpenAPIPetstoreRequest UpdatePetWithForm MimeFormUrlEncoded NoContent MimeNoContent
updatePetWithForm (PetId petId) =
  _mkRequest "POST" ["/pet/",toPath petId]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthOAuthPetstoreAuth)

data UpdatePetWithForm

-- | /Optional Param/ "name" - Updated name of the pet
instance HasOptionalParam UpdatePetWithForm Name2 where
  applyOptionalParam req (Name2 xs) =
    req `addForm` toForm ("name", xs)

-- | /Optional Param/ "status" - Updated status of the pet
instance HasOptionalParam UpdatePetWithForm StatusText where
  applyOptionalParam req (StatusText xs) =
    req `addForm` toForm ("status", xs)

-- | @application/x-www-form-urlencoded@
instance Consumes UpdatePetWithForm MimeFormUrlEncoded

instance Produces UpdatePetWithForm MimeNoContent


-- *** uploadFile

-- | @POST \/pet\/{petId}\/uploadImage@
--
-- uploads an image
--
-- AuthMethod: 'AuthOAuthPetstoreAuth'
--
uploadFile
  :: (Consumes UploadFile MimeMultipartFormData)
  => PetId -- ^ "petId" -  ID of pet to update
  -> OpenAPIPetstoreRequest UploadFile MimeMultipartFormData ApiResponse MimeJSON
uploadFile (PetId petId) =
  _mkRequest "POST" ["/pet/",toPath petId,"/uploadImage"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthOAuthPetstoreAuth)

data UploadFile

-- | /Optional Param/ "additionalMetadata" - Additional data to pass to server
instance HasOptionalParam UploadFile AdditionalMetadata where
  applyOptionalParam req (AdditionalMetadata xs) =
    req `_addMultiFormPart` NH.partLBS "additionalMetadata" (mimeRender' MimeMultipartFormData xs)

-- | /Optional Param/ "file" - file to upload
instance HasOptionalParam UploadFile File2 where
  applyOptionalParam req (File2 xs) =
    req `_addMultiFormPart` NH.partFileSource "file" xs

-- | @multipart/form-data@
instance Consumes UploadFile MimeMultipartFormData

-- | @application/json@
instance Produces UploadFile MimeJSON


-- *** uploadFileWithRequiredFile

-- | @POST \/fake\/{petId}\/uploadImageWithRequiredFile@
--
-- uploads an image (required)
--
-- AuthMethod: 'AuthOAuthPetstoreAuth'
--
uploadFileWithRequiredFile
  :: (Consumes UploadFileWithRequiredFile MimeMultipartFormData)
  => RequiredFile -- ^ "requiredFile" -  file to upload
  -> PetId -- ^ "petId" -  ID of pet to update
  -> OpenAPIPetstoreRequest UploadFileWithRequiredFile MimeMultipartFormData ApiResponse MimeJSON
uploadFileWithRequiredFile (RequiredFile requiredFile) (PetId petId) =
  _mkRequest "POST" ["/fake/",toPath petId,"/uploadImageWithRequiredFile"]
    `_hasAuthType` (P.Proxy :: P.Proxy AuthOAuthPetstoreAuth)
    `_addMultiFormPart` NH.partFileSource "requiredFile" requiredFile

data UploadFileWithRequiredFile

-- | /Optional Param/ "additionalMetadata" - Additional data to pass to server
instance HasOptionalParam UploadFileWithRequiredFile AdditionalMetadata where
  applyOptionalParam req (AdditionalMetadata xs) =
    req `_addMultiFormPart` NH.partLBS "additionalMetadata" (mimeRender' MimeMultipartFormData xs)

-- | @multipart/form-data@
instance Consumes UploadFileWithRequiredFile MimeMultipartFormData

-- | @application/json@
instance Produces UploadFileWithRequiredFile MimeJSON

