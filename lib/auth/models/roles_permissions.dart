// enum UserRole: Defines the different roles a user can have in the application.
//  @admin: Application administrator, normally has all permissions.
//  @user: Regular user, has limited permissions.
//  @teacher: User with teaching permissions, shall manage activities and users.
enum UserRole {
  admin,
  user,
  teacher,
}

// enum Permission: Defines the different permissions that can be assigned to users.
//  The permissions of a specific user should be retrived from the backend.
enum Permission {
  activityCreate,
  activityView,
  activityUpdate,
  activityDelete,
  activityBook,
  activityUnbook,
  userCreate,
  userView,
  userUpdate,
  userDelete,
}