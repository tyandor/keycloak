<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if messageHeader??>
        ${messageHeader}
        <#else>
        ${message.summary}
        </#if>
    <#elseif section = "subHeader">
        <p class="instruction">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b></#list><#else></#if></p>
    <#elseif section = "form">
    <div id="kc-info-message">
        <#if skipLink??>
        <#else>
            <#if pageRedirectUri?has_content>
                <p><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            <#elseif actionUri?has_content>
                <div class="${properties.kcXlTopMargin} ${properties.kcMdBottomMargin}">
                    <input type="button" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!}" onclick="location.href='${actionUri}'" value="${kcSanitize(msg("proceedWithAction"))}">
                    <!-- link button -->
                    <button class="${properties.kcLinkButton} ${properties.kcSmLeftMargin}" type="button" onclick="location.href='#'">
                      ${kcSanitize(msg("learnMoreDeviceAuth"))?no_esc}
                      <span class="${properties.kcButtonIcon}">
                        <i class="fas fa-external-link-alt" aria-hidden="true"></i>
                      </span>
                    </button>
                </div>
            <#elseif (client.baseUrl)?has_content>
                <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
            </#if>
        </#if>
    </div>
    </#if>
</@layout.registrationLayout>
