#Creating a s3 new
resource "aws_s3_bucket" "examples3bucketnew" {
  bucket = "s3bucketnaveensample123new"

  tags = {
    Name        = "My s3 bucket new"
    Environment = "test"
  }
}
