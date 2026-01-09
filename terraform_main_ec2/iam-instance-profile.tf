resource "aws_iam_instance_profile" "instance-profile" {
  name = "yaswanth-profile"
  role = "LabRole"   # استخدام الدور الافتراضي الموجود مسبقًا في Learner Lab
}
