<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=flase displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "description">
        <p class="pf-c-login__main-header-desc">${msg("emailForgotPasswordDesc")}</p>
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}">
                        <span class="pf-c-form__label-text">
                            <#if !realm.loginWithEmailAllowed>
                                ${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>
                                ${msg("usernameOrEmail")}
                            <#else>
                                ${msg("email")}
                            </#if>
                        </span>
                    </label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                <div id="kc-reset-password-form-buttons" class="${properties.kcXLgMarginTop!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcMediumMarginRight!}" type="submit" value="${msg("doSubmit")}"/>
                    <a href="${url.loginUrl}" class="${properties.kcButtonClass!} ${properties.kcButtonLinkClass!}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
