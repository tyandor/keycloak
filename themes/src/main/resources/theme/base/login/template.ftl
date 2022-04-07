<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="${properties.kcHtmlClass!}">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
            </#list>
        </#if>
        <title>${msg("loginTitle",(realm.displayName!''))}</title>
        <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
        <#if properties.stylesCommon?has_content>
            <#list properties.stylesCommon?split(' ') as style>
                <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>
    </head>

    <body class="${properties.kcBodyClass!}">
        <div class="${properties.kcLoginClass!}">
            <div class="pf-c-login__container">
                <header id="kc-header" class="${properties.kcHeaderClass!} ${properties.kcAlignTextCenter!} ${properties.kc3xlBottomPadding!}">
                    <h1>
                        ${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}
                    </h1>
                </header>
                <main class="pf-c-login__main">
                    <header class="${properties.kcLoginMainHeaderClass!}">
                        <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                            <script type="text/javascript">
                                function toggleIntlMenu() {
                                    var dropdownButton = document.getElementById('kc-current-locale-link');
                                    if (dropdownButton && dropdownButton.hasAttribute('aria-expanded')) {
                                        if (dropdownButton.ariaExpanded === 'false') {
                                            dropdownButton.ariaExpanded = 'true';
                                        } else {
                                            dropdownButton.ariaExpanded = 'false';
                                        }
                                        var localeList = document.querySelector('.pf-c-dropdown__menu');
                                        if (localeList) {
                                            if(localeList.hasAttribute('hidden')) {
                                                localeList.removeAttribute('hidden');
                                            } else {
                                                localeList.setAttribute('hidden', '');
                                            }
                                        }
                                    }
                                }
                            </script>
                            <div class="${properties.kcLocaleMainClass!}">
                                <button
                                    class="pf-c-dropdown__toggle"
                                    id="kc-current-locale-link"
                                    aria-expanded="false"
                                    type="button"
                                    onclick="toggleIntlMenu()"
                                >
                                    <span class="pf-c-dropdown__toggle-text">${locale.current}</span>
                                    <span class="pf-c-dropdown__toggle-icon">
                                        <i class="fas fa-caret-down" aria-hidden="true"></i>
                                    </span>
                                </button>
                                <ul class="${properties.kcLocaleListClass!}" hidden>
                                    <#list locale.supported as l>
                                        <li class="${properties.kcLocaleListItemClass!}">
                                            <a class="${properties.kcLocaleItemClass!}" href="${l.url}">${l.label}</a>
                                        </li>
                                    </#list>
                                </ul>
                            </div>
                            
                        </#if>
                        <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                            <#if displayRequiredFields>
                                <div class="${properties.kcContentWrapperClass!}">
                                    <#nested "header">
                                </div>
                            <#else>
                                <h1 id="kc-page-title" class="pf-c-title pf-m-3xl"><#nested "header"></h1>
                                <#nested "description">
                            </#if>
                        <#else>
                            <#if displayRequiredFields>
                                <div class="${properties.kcContentWrapperClass!}">
                                    <div class="${properties.kcLabelWrapperClass!} subtitle">
                                        <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                                    </div>
                                    <div class="col-md-10">
                                        <#nested "show-username">
                                        <div id="kc-username" class="${properties.kcFormGroupClass!}">
                                            <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                            <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                                <div class="kc-login-tooltip">
                                                    <i class="${properties.kcResetFlowIcon!}"></i>
                                                    <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            <#else>
                                <#nested "show-username">
                                <div id="kc-username" class="${properties.kcFormGroupClass!}">
                                    <#nested "loginTotpCodeInputTitle">
                                    <label id="kc-attempted-username">${msg("x509ModalHeader")}</label>
                                </div>
                            </#if>
                        </#if>
                    </header>
                    <div class="${properties.kcLoginMainBodyClass!}">
                        <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                        <#-- during login.                                                                               -->
                        <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                            <div class="alert-${message.type} ${properties.kcAlertClass!} ${properties.kcLargeMarginBottom!} pf-m-<#if message.type = 'error'>danger<#else>${message.type} ${properties.kcLargeMarginBottom!}</#if>">
                                <div class="pf-c-alert__icon">
                                    <#if message.type = 'success'><i class="${properties.kcFeedbackSuccessIcon!}" aria-hidden="true"></i></#if>
                                    <#if message.type = 'warning'><i class="${properties.kcFeedbackWarningIcon!}" aria-hidden="true"></i></#if>
                                    <#if message.type = 'error'><i class="${properties.kcFeedbackErrorIcon!}" aria-hidden="true"></i></#if>
                                    <#if message.type = 'info'><i class="${properties.kcFeedbackInfoIcon!}" aria-hidden="true"></i></#if>
                                </div>
                                <p class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</p>
                            </div>
                        </#if>

                        <#nested "form">

                    </div>
                    <footer class="${properties.kcLoginMainFooterClass!}">
                        <#if auth?has_content && auth.showUsername() && !auth.showResetCredentials()>
                            <#if !displayRequiredFields>
                                <div class="${properties.kcLoginMainFooterBandClass!}">
                                    <#if auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                                        <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                                            <p class="${properties.kcLoginMainFooterBandItemClass!}">
                                                <input type="hidden" name="tryAnotherWay" value="on"/>
                                                <a href="#" id="try-another-way"
                                                    onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                                            </p>
                                        </form>
                                        <#nested "forgotPassword">
                                        <#if displayInfo>
                                            <#nested "info">
                                        </#if>
                                    <#else>
                                        <p class="${properties.kcLoginMainFooterBandItemClass!}">
                                            <a id="reset-login" href="${url.loginRestartFlowUrl}">${msg("doBackToSignIn")}</a>
                                        </p>
                                    </#if>
                                </div>
                            </#if>
                        <#else>
                            <#if displayInfo>
                                <div class="${properties.kcLoginMainFooterBandClass!}">
                                    <#nested "info">
                                </div>
                            </#if>
                        </#if>
                    </footer>
                </main>
            </div>
        </div>
    </body>
</html>
</#macro>
