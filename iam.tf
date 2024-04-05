
# created iam_role_policy

resource "aws_iam_role_policy" "ec2_policy" {
  name = "ec2_policy"
  role = aws_iam_role.javahome_ec2_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

# cretae aws_iam_role 
resource "aws_iam_role" "javahome_ec2_role" {
  name = "javahome_ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

#aws iam instaance profiles
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "javahome_ec2_profile"
  role = aws_iam_role.javahome_ec2_role.name
}
