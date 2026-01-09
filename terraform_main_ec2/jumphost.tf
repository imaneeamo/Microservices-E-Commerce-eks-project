resource "aws_instance" "ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # استخدمي اسم المفتاح الذي أنشأتِه في AWS Console (مثلاً riheb-key)
  key_name = "imane-key"

  subnet_id              = aws_subnet.public-subnet1.id
  vpc_security_group_ids = [aws_security_group.security-group.id]

  # في Learner Lab لا يمكنك إنشاء IAM Instance Profile جديد
  # لذلك إمّا تحذفي هذا السطر أو تضعي اسم Instance Profile موجود مسبقًا
  # إذا كان عندك LabRole مرتبط بـ Instance Profile، اكتبيه هنا
  # iam_instance_profile = "LabInstanceProfile"

  root_block_device {
    volume_size = 30
  }

  user_data = templatefile("./install-tools.sh", {})

  tags = {
    Name = var.instance_name
  }
}
