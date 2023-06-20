# GitLab Group, User & Projhect Adminstration 

## Create the organization parent group and subgroups

You first create a group, Development, to serve as the parent group for the whole software development organization.

### 1. Open your self-managed GitLab instance.
### 2. On the left sidebar, at the top, select Create new () and New group.
### 3. Select Create group.
### 4. In Group name, enter Development.
### 5. Enter development-group for the group in Group URL. You see a message saying “Group path is available”. The group URL is used for the namespace.
### 6. For visibility level, make the group Private. This means any subgroups of this group must be private as well.
### 7. Personalize your GitLab experience by answering the following questions:
- For Role, select Development Team Lead. This role is different to the roles that affect member permissions.
- For Who will be using this group?, select My company or team.
- For What will you use this group for?, select I want to store my code.
### 8. Do not invite any GitLab members or other users to join the group yet.
### 9. Select Create group.


## Create the organization subgroups

For this tutorial, we assume that Development is organized into the following working areas:

- Product Management.
- Engineering.
- Data Platfrom.

## Now create subgroups to reflect this organization structure.

### 1. On the left sidebar, expand the top-most chevron ().
### 2. Select View all your groups.
### 3. Select Development. You should see an Owner label next to the group name as you have the Owner role.
### 4. On the parent group’s overview page, in the upper-right corner, select New subgroup.
### 5. In Subgroup name, enter Product Management.
### 6. The Subgroup slug is automatically completed with product-management. Do not change this field.
### 7. For Visibility level, you can only select Private because the parent group, Development, is also private.
### 8. Select Create subgroup.
### 9. Repeat for the following subgroups:
- Engineering.
- Data Platfrom.


## Create the users for your organization

You will now manually create the users for your organization. These are test users. To create the first test user, Test1:

1. On the left sidebar, expand the top-most chevron ().
2. Select Admin Area.
3. On the left sidebar, select Overview > Users.
4. Select New user.
5. Complete the required fields:
    - Name: Test1
    - Username: test1
    - Email: test1@localhost.com
    - Leave all other fields as is.
6. Select Create user.

## Set the test user’s password

1. Select the user.
2. Select Edit.
3. Complete the password and password confirmation fields.
4. Select Save changes.

You have created the first test user. Now repeat this for the other users: ( test2, test3 & test 4)

## Add users to the group and subgroups

1. On the left sidebar, at the top, select Search GitLab () to find the Development group.
2. Select Manage > Members.
3. Select Invite members.
4. Complete the fields for the product manager, Test1 .

    - Give Test1 the Owner role. The role applies to all subgroups projects in the group.
    - Leave Access expiration date blank.

5. Select Invite.

6. Repeat this process for the following users: ( test2, test3 & test 4)


## Create a project

Now, let’s assume that you have a piece of work that certain members of your organization need to work on, and that piece of work is for the whole organization. To organize that work, you are going to create a project in the Development parent group, and add different users to that project.


1. On the left sidebar, at the top, select Search GitLab () to find the Development group.
2. Select Create new () and New project/repository.
3. Select Create blank project.
4. Enter the project details:
    - In the Project name field, enter Release 2.0 as the name of your project.
    - Leave the Project slug field as is, which is based on the project name.
    - To modify the project’s viewing and access rights for users, you can change the Visibility Level. Given that the parent group is private, the project can only be Private as well.
    - To create a README file so that the Git repository is initialized, has a default branch, and can be cloned, select the Initialize repository with a README checkbox.
    - To analyze the source code in the project for known security vulnerabilities, select the Enable Static Application Security Testing (SAST) checkbox
5. Select Create project.

You have now created a project in the parent group.

In this project, go to Project information > Members.

The existing members of the parent group (you and test1) are already members of this project because when your project belongs to a group, project members inherit their role from the group.

There are other users that need to be part of this project. You will now add users directly to the project.