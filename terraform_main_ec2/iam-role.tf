# بدلاً من إنشاء IAM Role جديد (غير مسموح في Learner Lab)
# نستدعي الدور الموجود مسبقًا باسم LabRole

data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

# إذا كان هناك موارد أخرى تحتاج الـ ARN أو الـ Name للدور
# يمكنك استخدام:
# data.aws_iam_role.lab_role.arn
# data.aws_iam_role.lab_role.name
