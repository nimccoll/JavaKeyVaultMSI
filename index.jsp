<%@ page import="com.azure.security.keyvault.secrets.SecretClient" %>
<%@ page import="com.azure.security.keyvault.secrets.SecretClientBuilder" %>
<%@ page import="com.azure.security.keyvault.secrets.models.KeyVaultSecret" %>
<%@ page import="com.azure.identity.ChainedTokenCredential" %>
<%@ page import="com.azure.identity.ChainedTokenCredentialBuilder" %>
<%@ page import="com.azure.identity.ClientSecretCredential" %>
<%@ page import="com.azure.identity.ClientSecretCredentialBuilder" %>
<%@ page import="com.azure.identity.DefaultAzureCredential" %>
<%@ page import="com.azure.identity.DefaultAzureCredentialBuilder" %>
<%@ page import="com.azure.identity.DeviceCodeCredential" %>
<%@ page import="com.azure.identity.DeviceCodeCredentialBuilder" %>
<%@ page import="com.azure.identity.ManagedIdentityCredential" %>
<%@ page import="com.azure.identity.ManagedIdentityCredentialBuilder" %>
<%@ page import="com.azure.identity.UsernamePasswordCredential" %>
<%@ page import="com.azure.identity.UsernamePasswordCredentialBuilder" %>
<html>
<body>
<h2>Hello World!</h2>
<%
        
        ManagedIdentityCredential credential = new ManagedIdentityCredentialBuilder().clientId("{your Managed Identity Client ID here}").build();
        SecretClient client = new SecretClientBuilder()
            .vaultUrl("https://nimccollfta-kv1.vault.azure.net")
            .credential(credential)
            .buildClient();

        KeyVaultSecret secret = client.getSecret("MySecret");
        out.println("Your secret value is " + secret.getValue());
%>
</body>
</html>
