Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGr/L4yv8WmwjgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 09:13:16 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B8149047F
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Apr 2026 09:13:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E99CC87EDB;
	Wed, 29 Apr 2026 07:07:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013026.outbound.protection.outlook.com
 [40.107.162.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61076C87EC6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2026 07:07:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bp3EZUjXj21kjs+OZu0OcUbhF/MQnXCEGa10YEWbx0Q4ZxuOhXPnK5+sHJmaTIHAc9B9cbioM0n3yE+wEj9v8j4uLSLE4ffVdtuOxjJlymrA6TPDzU/kwBl8AI/jm8HRg4I2drj2Y8UcCAOBC+TNPbO8HQ0+OFY5OoMQ98r6GDQGqZTzLpbTuqjFQWkkS2P1J3y/5+tW9Y0DM3FIVrbKkh4ikmGZiEB1rXQNXsVOU5C/X1+BtnaSEzjWqV5dqim/F71VwwFfPQ5wIQjzWOAsDqp79v8PyVPa7Y0DDVE3n2y14ERrvbouODF1fZHBYtVbHuChBjlNaFZuzweg9RhGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAxaLwSexzQ1LdHqVVoOspcoU+P4I7sDvWsTPcU1qwM=;
 b=MSZhvIytKLPBh3/x2xa+v8T1MeT7qlKau64ahpAooPFzHlNqTYOI7/utp4Ng/RcUxE2Hosa67slVSF4/7FGjCK43wWYw2FjFXuKE9NUidmQwGNa3eKCQvXF7lZ7/cMUF3XVKFSrPQ0Og0Bt0z9994DKRItIiCuBxD7kiPhOmAuqkNyPf9LaX7uRwACZ6oIb0E4iZFvnkYnBAxj1EkGAsrGfcQieDjXCIG+oeSDXrV7fWO3GryBlAk9zq8F8D5r7NS6i4O6yYDVIezqdwN63lRSDozKiIF6o7yqd8IxNZJoxmWk0eyz0C19zTT6HFrxBBsSO1vNOuyCap+hUF+/f7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAxaLwSexzQ1LdHqVVoOspcoU+P4I7sDvWsTPcU1qwM=;
 b=VDa/EhSgt8sDBRxPQSiX2XP6h5qg11Eu6gUu44HdEX5VgjWzPUS7fywFZZ747t6mzwb88e3KhiFggnUgGkqC7V1ftmQrqWDUHzNax+56R6hKgOl5HZb7NgQlxmQ+yx9FFHD9fRY3GP0pbp7seobZK80/w5CleJRAYzUEMkOisl42UxLeKYeS9varGCV8jabpltfC2tGy5mcgwhc8vwiLjns9DhDQ9V8TGNn8op1Uwlj0+c5zMpQO39XHxcySXZn8kS/xfFBncHGb4fMc841uJODqta4ToV7T4aZuCCf+9A0fyR/7ULa/hs5SX9/uRPHWH+OD8nM4EwwAalIf84XnQw==
Received: from CW1P302CA0025.GBRP302.PROD.OUTLOOK.COM (2603:10a6:400:297::6)
 by GVXPR10MB9474.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:2ad::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 07:07:02 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:400:297:cafe::c4) by CW1P302CA0025.outlook.office365.com
 (2603:10a6:400:297::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 07:07:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 07:07:02 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 29 Apr
 2026 09:10:14 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 29 Apr
 2026 09:07:01 +0200
Message-ID: <848b503c-a908-4ad2-8d4b-560f3e0ceeaf@foss.st.com>
Date: Wed, 29 Apr 2026 09:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <rgallaispou@gmail.com>, Patrick Delaunay
 <patrick.delaunay@foss.st.com>, <uboot-stm32@st-md-mailman.stormreply.com>,
 <u-boot@lists.denx.de>
References: <20260412-master-v1-1-d7a8e742233c@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260412-master-v1-1-d7a8e742233c@gmail.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|GVXPR10MB9474:EE_
X-MS-Office365-Filtering-Correlation-Id: e95989b0-eb3c-4599-1eba-08dea5bde9e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: QFhX/+HAVqn+eLunloKMVvazXbFtdAzM2e/wn/xpMP3ePqMy8K9dygSHwPRnnyPorIi4ttCkLRG/9JFqUdwNCBriSReam/sj/dGy5ndGllEvFt4H7KRNwOiZUfr/0auGHYjWFDU21f7nUs3eTsM0pduI9peJx9aOLGzPOfAsac/t3xtuNPO7ZDrcjdopGypfGgCG5L32S3B5IFkjsPUmkGMROdojMpZaBlksQre21jjbBcM735KOIVsn753Qg9ylSPdOQ+CZbyAEYe+n9ZoI+XRB4tCOPRuQVlIS8TLQcJQBVCOWvrEoQAHrbMquVbQx+FZ7gfhUq+E/MR27PXjV8VW9SldZhpfKXuJB6jWsIODUpt6RrQjneAOc8ceTaAgdZnc1pwL6pb6dxYEC9Docpa2d5rBl4oRTytOXx7wMJb/4lo54E+yAvZ1d6vdT850+n7O6QjTt42xgWIr7NAgSAiA+BSqeZ+JWNetvezLfpnCP2S31rbCMvTJL47uKytBy1ONV1zGhKCqM8qod+yuwIoZDQoVG8paD2grrn8/vXXmkvPn8YFkX+Ckm4WG1Kx3YqGF5dMvVRzvfrI+EPhttJwmA7XZzzbArf2aUKCNdWx/uUMRtrX1jM/CgiJiWg6tZy65fLKmteRTvcMsm3HsiPyIONOgjvgmNvPraUrBPAYYLoq8kI8UFwq641rdyWssxfJPKP0otn8eTiOIFKtddXXfg4iFD+TzEeh5klbiDumxdKGMzXQ3fD4Od5WpUwOW3Bq3VdMhqDwS+QdrkRAXdHg==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RxSrmX9alW5T+7qDL2Qwz98kqlfvglrZeRu1B3l8U8xMXGPsSzaCYDHjp9qT6i/ish72WPrbEne51Bdk+ZQFjBT+31wdGUq+HWUZ/zlJlBNpScV/lx/otH2FngkuXEO3ioyUcBX1nYgUlI9rDyCf2ykrOPKgMi4OGMSmI+oyLWI1qUi928SK834uSKYMEVKnn30LN3RtWzjvksOa0cORniesyvIXMTM1iQ5a4mEqZrmMxKuaUTnQlcmXWjAr6SuAfc3+J3pGh1gSvjTCTRYNDZxMdVPwWMgh25X9WwjRM6Qw8GceG7EYr+g7DQSNQHA7lzmLFtN0s+/BL6zRKlb2UDr2ZPgZK3QNdkdptpBES5hOlI+G7P+eGWXJnTSzAFI3cgqxxFaGLFX5HzbhqX83w27DPaZHsy+IRIBZgynSe7Iqa8G4JyM/9UvBqoGrw49t
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 07:07:02.3607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e95989b0-eb3c-4599-1eba-08dea5bde9e6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9474
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: dsi: fix unchecked return
	values
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: 57B8149047F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rgallaispou@gmail.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:ag.dev.uboot@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,st-md-mailman.stormreply.com,lists.denx.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.990];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/12/26 21:07, Raphael Gallais-Pou wrote:
> Fix the following errors yielded by Coverity Scan:
> 
> CID 644836:         Error handling issues  (CHECKED_RETURN)
> Calling device_chld_unbind without checking return value (as is done elsewhere 6 out of 7 times)
> CID 644834:         Error handling issues  (CHECKED_RETURN)
> Calling device_chld_remove without checking return value (as is done elsewhere 4 out of 5 times).
> 
> Link: https://lore.kernel.org/r/20260309212331.GF1388590@bill-the-cat/
> Fixes: a6d047c0a86b ("video: stm32: remove all child of DSI bridge when its probe failed")
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  drivers/video/stm32/stm32_dsi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/stm32/stm32_dsi.c b/drivers/video/stm32/stm32_dsi.c
> index 65a91f5cff7a..5c4d8d2aab51 100644
> --- a/drivers/video/stm32/stm32_dsi.c
> +++ b/drivers/video/stm32/stm32_dsi.c
> @@ -493,8 +493,11 @@ static int stm32_dsi_probe(struct udevice *dev)
>  	    priv->hw_version != HWVER_131) {
>  		dev_err(dev, "DSI version 0x%x not supported\n", priv->hw_version);
>  		dev_dbg(dev, "remove and unbind all DSI child\n");
> -		device_chld_remove(dev, NULL, DM_REMOVE_NORMAL);
> -		device_chld_unbind(dev, NULL);
> +		ret = device_chld_remove(dev, NULL, DM_REMOVE_NORMAL);
> +		if (!ret)
> +			ret = device_chld_unbind(dev, NULL);
> +		if (ret)
> +			dev_err(dev, "Unbinding from %s failed %d\n", dev->name, ret);
>  		ret = -ENODEV;
>  		goto err_clk;
>  	}
> 
> ---
> base-commit: e2fa3e570f83ab0f9ce667ddaec9dc738bcf05b9
> change-id: 20260412-master-8be67866e096
> 
> Best regards,
> --  
> Raphael Gallais-Pou <rgallaispou@gmail.com>
> 

Hi Raphael

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
