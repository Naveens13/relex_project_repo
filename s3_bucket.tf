#Creating a s3 
resource "aws_s3_bucket" "examples3bucket" {
  bucket = "s3bucketnaveensample123"

  tags = {
    Name        = "My s3 bucket"
    Environment = "test"
  }
}
