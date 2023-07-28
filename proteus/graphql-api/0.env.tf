variable "CLIENT_ORIGIN" {
  description = "Front-end client origin"
  type        = string
}

variable "DATABASE_URL" {
  description = "MongoDB Atlas database URL"
  type        = string
  sensitive   = true
}

variable "NEXTAUTH_SECRET" {
  description = "Auth secret key for NextAuth.js and JWT"
  type        = string
}

variable "NEXTAUTH_URL" {
  description = "Front-end client origin"
  type        = string
}

variable "PINECONE_API_KEY" {
  description = "Pinecone API key"
  type        = string
  sensitive   = true
}

variable "PINECONE_ENVIRONMENT" {
  description = "Pinecone environment"
  type        = string
  sensitive   = true
}

variable "PINECONE_INDEX" {
  description = "Pinecone index"
  type        = string
  sensitive   = true
}

variable "PORT" {
  description = "The port on which the container listens"
  type        = string
}

variable "STRIPE_PUBLISHABLE_KEY" {
  description = "Stripe publishable key"
  type        = string
  sensitive   = true
}

variable "STRIPE_SECRET_KEY" {
  description = "Stripe secret key"
  type        = string
  sensitive   = true
}
