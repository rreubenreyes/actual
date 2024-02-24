terraform {
  backend "s3" {
    bucket = "com.reubenreyes.tfstate"
    key    = "actual"
    region = "us-west-2"
  }
}
