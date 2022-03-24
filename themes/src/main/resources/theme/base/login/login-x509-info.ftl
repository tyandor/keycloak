<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">

        <form id="kc-x509-login-info" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <#if x509.formData.subjectDN??>
                    <div>
                         <label id="certificate_subjectDN" class="${properties.kcFormLabelClass!}">${(x509.formData.subjectDN!"")}</label>
                    </div>
                <#else>
                    <div>
                        <label id="certificate_subjectDN" class="${properties.kcFormLabelClass!}">${msg("noCertificate")}</label>
                    </div>
                </#if>
           </div>

            <div class="${properties.kcFormGroupClass!}">

                    <#if x509.formData.isUserEnabled??>
                          <div>
                             <label for="username" class="${properties.kcFormLabelClass!}">${msg("doX509Login")}</label>
                          </div>
                          <div class="${properties.kcLabelWrapperClass!}">
                             <label id="username" class="${properties.kcFormLabelClass!}">${(x509.formData.username!'')}</label>
                         </div>
                    </#if>

            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div class="${properties.kcFormButtonsClass!}">
                    <div class="${properties.kcFormButtonsWrapperClass!} ${properties.kcActionListClass!}">
                        <div class="${properties.kcActionListItemClass!}">
                            <button  id="kc-login" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" name="login">${msg("doContinue")}</button>
                        </div>
                        <#if x509.formData.isUserEnabled??>
                            <div class="${properties.kcActionListItemClass!}">
                                <button  id="kc-cancel" class="${properties.kcButtonClass!} ${properties.kcButtonLinkClass!}" type="submit" name="cancel">${msg("doBackToSignIn")}</button>
                            </div>
                        </#if>
                    </div>
                </div>
            </div>
        </form>
    </#if>

</@layout.registrationLayout>
