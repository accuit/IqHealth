﻿using HealthIQ.CommonLayer.Aspects;
using HealthIQ.CommonLayer.Aspects.DTO;
using HealthIQ.CommonLayer.Aspects.Utilities;
using HealthIQ.CommonLayer.Log;
using HealthIQ.CommonLayer.Resources;
using HealthIQ.PresentationLayer.AdminApp.CustomFilters;
using HealthIQ.PresentationLayer.AdminApp.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace HealthIQ.PresentationLayer.AdminApp.Controllers
{
    [RoutePrefix("api/account")]
    public class AccountsController : BaseAPIController
    {

        [HttpGet]
        [Route("get-by-status")]
        public JsonResponse<IList<UserMasterDTO>> GetUsersByStatus()
        {
            int type = 1;
            JsonResponse<IList<UserMasterDTO>> response = new JsonResponse<IList<UserMasterDTO>>();
            var UserMasterDTO = new List<UserMasterDTO>();
            try
            {
                response.SingleResult = UserBusinessInstance.GetUsersByStatus(type);
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            return response;
        }

        [HttpGet]
        [BaseAuthentication]
        [Route("get-user-profile/{id}")]
        public JsonResponse<UserMasterDTO> GetUsersByID(int id)
        {
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();
            var UserMasterDTO = new List<UserMasterDTO>();
            try
            {
                response.SingleResult = UserBusinessInstance.GetUserByID(id);
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            return response;
        }

        [HttpPost]
        [Route("user-login")]
        public JsonResponse<UserMasterDTO> UserMasterLogin(UserLoginDTO u)
        {
            ActivityLog.SetLog("[Started] UserMasterLogin.", LogLoc.INFO);
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();
            UserMasterDTO UserMasterDTO = new UserMasterDTO();
            if (!String.IsNullOrEmpty(u.email))
            {
                UserMasterDTO = UserBusinessInstance.UserLogin(u.email, u.password);

                response.SingleResult = UserMasterDTO != null ? UserMasterDTO : null;
                response.StatusCode = UserMasterDTO != null ? "200" : "500";
                response.IsSuccess = UserMasterDTO != null ? true : false;
                response.Message = UserMasterDTO != null ? "Successfully loggedin" : Messages.LoginWrongPassword + " : Incorrect Password!"; ; ;
            }
            else
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = "Username or Email can not be empty.";
            }
            ActivityLog.SetLog("[Finished] UserMasterLogin.", LogLoc.INFO);
            return response;
        }

        [HttpPost]
        [Route("register-user")]
        [BaseAuthentication]
        [AuthorizePage(Roles = "Admin")]
        public JsonResponse<int> RegisterUserMasterDTO(UserMasterDTO user)
        {
            JsonResponse<int> response = new JsonResponse<int>();

            var User = UserBusinessInstance.GetUserByEmail(user.Email);
            if (User == null)
            {
                try
                {
                    user.UserStatus = (int)AspectEnums.AccountStatus.Pending;
                    response.SingleResult = UserBusinessInstance.RegisterUser(user);
                    response.StatusCode = response.SingleResult > 0 ? "200" : "500";
                    response.IsSuccess = response.SingleResult > 0 ? true : false;
                    response.Message = "User successfully submitted.";
                }
                catch (FormattedDbEntityValidationException ex)
                {
                    response.IsSuccess = false;
                    response.StatusCode = "500";
                    response.Message = string.Format(Messages.Exception, ex.Message, ex.InnerException, ex.StackTrace);
                }
                catch (Exception ex)
                {
                    response.IsSuccess = false;
                    response.StatusCode = "500";
                    response.Message = string.Format(Messages.Exception, ex.Message, ex.InnerException, ex.StackTrace);
                }

            }
            else
            {
                response.SingleResult = 0;
                response.IsSuccess = false;
                response.StatusCode = "200";
                response.Message = string.Format("User with email address {0} already exists. Try again.", user.Email);

            }
            return response;
        }

        [HttpPost]
        [Route("update-user")]
        public JsonResponse<UserMasterDTO> UpdateUserMasterDTO(UserMasterDTO user)
        {
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();

            try
            {
                var User = UserBusinessInstance.GetUserByEmail(user.Email);
                if (User == null)
                {
                    response.SingleResult = user;
                    response.StatusCode = "200";
                    response.Message = "User does not exist in our system.";
                    return response;
                }
                User.FirstName = user.FirstName;
                User.LastName = user.LastName;
                User.ImagePath = user.ImagePath;
                User.Email = user.Email;
                User.Mobile = user.Mobile;
                User.Password = user.Password;
                User.Address = user.Address;
                User.City = user.City;
                User.State = user.State;
                User.UserCode = user.Email;
                User.IsDeleted = user.IsDeleted;
                user.UpdatedDate = DateTime.Now;

                response.IsSuccess = UserBusinessInstance.RegisterUser(user) > 0 ? true : false;
                response.SingleResult = user;
                response.StatusCode = "200";

            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = ex.Message;
            }

            return response;
        }

        [HttpPost]
        [Route("reset-password")]
        public JsonResponse<UserMasterDTO> ChangeUserPassword(UserMasterDTO user)
        {
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();
            if (user.Password != user.ConfirmPassword)
            {
                response.SingleResult = user;
                response.IsSuccess = false;
                response.StatusCode = "200";
                response.Message = "Password and Confirm password does not match. Try again please.";
                return response;
            }

            try
            {
                var User = UserBusinessInstance.GetUserByEmail(user.Email);
                if (User == null)
                {
                    response.SingleResult = user;
                    response.StatusCode = "200";
                    response.Message = "User does not exist in our system.";
                    return response;
                }

                if (User.Password != user.ConfirmPassword)
                {
                    User.Password = user.Password;
                    User.UpdatedDate = DateTime.Now;

                    response.IsSuccess = UserBusinessInstance.UpdateUser(User) > 0 ? true : false;
                    response.SingleResult = user;
                    response.StatusCode = "200";
                    response.Message = "Your password has been successfully updated.";
                }
                else
                {
                    response.SingleResult = user;
                    response.StatusCode = "200";
                    response.Message = "You can not use same password. it must be different than previous.";
                    return response;
                }


            }
            catch (Exception ex)
            {
                response.IsSuccess = false;
                response.StatusCode = "500";
                response.Message = ex.Message;
            }

            return response;
        }

        [HttpPost]
        [Route("forget-password")]
        public JsonResponse<UserMasterDTO> ForgetPasswordNotification(UserLoginDTO email)
        {
            ActivityLog.SetLog("[Started] ForgetPasswordNotification.", LogLoc.INFO);
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();
            UserMasterDTO User = new UserMasterDTO();
            if (!String.IsNullOrEmpty(email.email))
            {
                User = UserBusinessInstance.GetUserByEmail(email.email);

                if (User != null)
                {
                    string UniqueString = "";
                    if (SaveOTP(User.UserID, out UniqueString))
                    {
                        response.IsSuccess = EmailHelper.ForgetPasswordEmail(email.email, User.FirstName, UniqueString) > 0 ? true : false;
                        response.SingleResult = User;
                        response.StatusCode = "200";
                        response.Message = Messages.AccountReset;
                    }
                }
            }
            else
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = "Username or Email can not be empty.";
            }
            ActivityLog.SetLog("[Finished] ForgetPasswordNotification.", LogLoc.INFO);
            return response;
        }

        [HttpGet]
        [Route("validate-reset-url/{id}")]
        public JsonResponse<UserMasterDTO> ValidatePasswordResetUrl(string id)
        {
            JsonResponse<UserMasterDTO> response = new JsonResponse<UserMasterDTO>();
            var UserMasterDTO = new UserMasterDTO();
            try
            {
                response.SingleResult = UserBusinessInstance.GetUserByGUID(id);
                response.StatusCode = "200";
                response.IsSuccess = true;
            }
            catch (Exception ex)
            {
                response.SingleResult = null;
                response.StatusCode = "500";
                response.IsSuccess = false;
                response.Message = ex.Message;
            }
            return response;
        }

        private bool SaveOTP(int UserID, out string UniqueString)
        {
            #region Prepare OTP Data

            UniqueString = AppUtil.GetUniqueGuidString();
            string OTPString = AppUtil.GetUniqueRandomNumber(100000, 999999); // Generate a Six Digit OTP
            OTPDTO objOTP = new OTPDTO() { GUID = UniqueString, OTP = OTPString, CreatedDate = DateTime.Now, UserID = UserID, Attempts = 0 };

            return SecurityBusinessInstance.SaveOTP(objOTP);
            #endregion
        }
    }

    public class UserLoginDTO
    {
        public string email { get; set; }
        public string password { get; set; }
    }
}