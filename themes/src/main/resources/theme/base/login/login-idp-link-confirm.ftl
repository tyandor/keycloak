<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("confirmLinkIdpTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!} ${properties.kcXLgMarginTop!}">
                <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonSecondaryClass!}" name="submitAction" id="updateProfile" value="updateProfile">${msg("confirmLinkIdpReviewProfile")}</button>
                <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonSecondaryClass!} ${properties.kcMediumMarginLeft!}" name="submitAction" id="linkAccount" value="linkAccount">${msg("confirmLinkIdpContinue", idpDisplayName)}</button>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
