<#-- Description: Displays social links -->
<#macro socialLinks>
    <#if !socialAuthDisabled!false && realm.password && social.providers??>
        <style>
            .show {
                visibility: visible !important;
                display: block !important;
            }
        </style>
        <ul id="social-links" class="${properties.kcFormSocialProviderIconLinksGrid!} ${properties.kcXLgPaddingTop!} ${properties.kcMedPaddingBottom!}">
            <#list social.providers![] as p>
                <#assign providerCode = p.providerId/>
                <#if p.providerId = 'bitbucket'><#assign providerCode = 'bitbucket' providerDisplay = 'Bitbucket'/></#if>
                <#if p.providerId = 'facebook'><#assign providerCode = 'facebook' providerDisplay = 'Facebook'/></#if>
                <#if p.providerId = 'github'><#assign providerCode = 'github' providerDisplay = 'GitHub'/></#if>
                <#if p.providerId = 'gitlab'><#assign providerCode = 'gitlab' providerDisplay = 'GitLab'/></#if>
                <#if p.providerId = 'google'><#assign providerCode = 'google-plus' providerDisplay = 'Google Plus'/></#if>
                <#if p.providerId = 'instagram'><#assign providerCode = 'instagram' providerDisplay = 'Instagram'/></#if>
                <#if p.providerId = 'linkedin'><#assign providerCode = 'linkedin' providerDisplay = 'LinkedIn'/></#if>
                <#if p.providerId = 'microsoft'><#assign providerCode = 'windows' providerDisplay = 'Windows'/></#if>
                <#if p.providerId = 'openshift-v4' || p.providerId = 'openshift-v3'><#assign providerCode = 'openshift' providerDisplay = 'OpenShift'/></#if>
                <#if p.providerId = 'paypal'><#assign providerCode = 'paypal' providerDisplay = 'PayPal'/></#if>
                <#if p.providerId = 'saml'><#assign providerCode = p.alias providerDisplay = 'Saml'/></#if>
                <#if p.providerId = 'stackoverflow'><#assign providerCode = 'stack-overflow' providerDisplay = 'Stack Overflow'/></#if>
                <#if p.providerId = 'twitter'><#assign providerCode = 'twitter' providerDisplay = 'Twitter'/></#if>
                <#if p.providerId != 'keycloak-oidc-improved'>
                    <li class="${properties.kcFormSocialProviderListItem!} ${properties.kcFormSocialLoginProvider!} ${providerCode}">
                        <div class="${properties.kcFormSocialProviderTopTooltip!}" role="tooltip" style="visibility: hidden; display: none;">
                            <div class="${properties.kcFormSocialProviderTooltipArrow!}"></div>
                            <div id="tooltip-top-content" class="${properties.kcFormSocialProviderTooltipContent!}">${msg("socialProviderTooltip", (providerDisplay))}</div>
                        </div>
                        <a href="${p.loginUrl}" id="social-provider-link-${p.alias}" class="${properties.kcFormSocialProviderIconLink!} ${properties.kcFormSocialProvider!} ${providerCode}" title="${providerCode}"></a>
                    </li>
                </#if>
            </#list>
        </ul>
        <script type="text/javascript">
            function toggleTooltip() {
                var socialProviderEl = document.getElementById("social-links");
                if (socialProviderEl) {
                    var socialListItems = socialProviderEl.querySelectorAll(".pf-c-login__main-footer-links-item.social-login-provider");
                    socialListItems.forEach(socialProvider => {
                        var tooltip = socialProvider.querySelector(".pf-c-tooltip.pf-m-top");
                        socialProvider.addEventListener('mouseover', () => tooltip.classList.add('show'));
                        socialProvider.addEventListener('mouseout', () => tooltip.classList.remove('show'));
                    });
                }
            }
            toggleTooltip();
        </script>
    </#if>
</#macro>
