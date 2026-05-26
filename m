Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGsiK5ZqFWrgUwcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 May 2026 11:40:38 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F114C5D381B
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 May 2026 11:40:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 183B3C8F290;
	Tue, 26 May 2026 09:33:26 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B15CC36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 09:33:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESCvTj0sXZMWmZnMBqIDwBp4KDwvn4QGb41UjyRa5/Whkb0wziuG64cfBgEZMNKbtdpcNaRBMNNgj9+p4+CGPi2ZFH4OpNGKGSwsY9JZ9HWeNdIHDmZWKXQBaa1X0np+4O25KaMOt/fsswoQK6JF+jxUseWFcOkPPcEbhtL38OYfkXYrS96Bw5ZhHCEEAOeNKz4VAn+yYRdqqTNt1GjGLSTP7nB30j4mvV06sQaYeHdAtR7OfF6ub1F1KQxgPwt0WYQK0eTbajXtnjoUotHpowuB6rgZ+LENFIHx7epoOgcuPKYaXr+MHKuAIg4Kcn1P4nowgLc/cKzR66YoMBq1jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuZ7FOQ629cyTkg3QXpHvTJbTin9DHjW7cPRUblPyj0=;
 b=lctbGTBWlefLQIwUaeuikODIHAhUcPBw2VK8Jcnq78XLhuzT0r+oP33eAOWuoB0J+XBSihepmwqXESDxicSlcuCdS3Fe/oIQIMRrDA6sQAa1D8IgCr4y3DGVcJ/x0b5CPGNrdnPwtK6FV3J3Qav5qcgikD3+0+XRfIlkM1ON6FPjxqL0TiEglY+2O9TBElg1XPNsF+SaqFATDInBJp1HR/yUgtG14oH0iI9oV8Q2QH8rhI4TT2flAMabYWgGZF/xzKh35JP5W5f9ygp7Qu4uTa2y13ltImVfGd1znQqc/g78OoELvxgDofJ9j8jnrMkZYSJei0+C8XBQde8Uqn9V/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuZ7FOQ629cyTkg3QXpHvTJbTin9DHjW7cPRUblPyj0=;
 b=VLE1MAkBn2RLOe4e5gDEKF8P0ZN9IuJv/RKTfqSYE9U1NpwDtFP6hKSCY38LNtIIsszIZX/mlBaakTleS3wikJay2uP9FTlDAFBi7KkuVadb2VgYP7/DHHE86AVt2SUiZQ6uZTGWLmj9Z0J8KU8MvGxxE8J4Fbr7ecDzdRd8xDLTnR1o8qOsJn8vX3909dFIHLSeCQ0jUY2EPn2UBal8qc4SgPjbh9pTWdmNenbChIAMx9Y8Dc5w/+wq+xNHLiBb1Ifgh6YRWb4ewt9RHR85kUl+8F6yTrfeA6frKOyNyg7bjgAEMh9Xre2TDOSbfEv3c1hnxM8yABk60x/jOj63mQ==
Received: from AS4P189CA0049.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::27)
 by AM9PR10MB4038.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 09:33:22 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:659:cafe::37) by AS4P189CA0049.outlook.office365.com
 (2603:10a6:20b:659::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Tue, 26
 May 2026 09:33:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 09:33:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:37:02 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 26 May
 2026 11:33:20 +0200
Message-ID: <a6f761e3-3c59-460c-aa9a-870c569e0ed5@foss.st.com>
Date: Tue, 26 May 2026 11:33:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yann Gautier <yann.gautier@foss.st.com>, <u-boot@lists.denx.de>
References: <20260520160715.175032-1-yann.gautier@foss.st.com>
 <20260520160715.175032-3-yann.gautier@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260520160715.175032-3-yann.gautier@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A2:EE_|AM9PR10MB4038:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b68781f-fcaf-49a2-01e7-08debb09d444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 0nRoyzljO6XYIxTEBAYfYy+AqeCrfdIFz+xcTXUy5lpkn2c7G0+ErBlqkSqMay98UQEV4+qKP3QQSPeBoDFaYddh1GExAwDF6zGNG5/2DxBwbk9wJ9gysN9jlIQ7Nj6GtMihiS/3EX8pIHaZ+ar1vS4WtyIVdeVwAwfxoN853TT+ONTPbXTpsZsEa7hFslxBumukpP/1aW7yF9UbWXX9ceAKWWXhnOT46DZj44vBV9svUCOMOXLUDuku6bItDyHeYHf6RPcpt0FkqyHTQ2uoD+lo/ga1vhn/xTkFpHvqzlEPhkuv3IdeJXwG9GHw2JCm0vP1lFqMVfWbnZXdS8ZzldClX5UzkiURh4TKsBk/RVK9cS4efeDT7AYkVzM4hrPI7UxO9FtK5/E+FYgRyJX37RKpxdCVqOrAHHLkxwsKOvYbxB26X57drcn2OSdUQP++rDvDcFgkQLfbBUiLnnpS9ftNopBWEKuXqOk8RWty6a8Ibh2Ieglk2sZbBwaBZvlrkLNd1/eTVhaC/58NrokLMUGRBNzzF5itfyrovLb3WyGu7CeldntxaVmvzj9mhbrGfwx6nj2QZAMRi3fcP+Ut0sViB5Xv/zVcOUOZOfo9dWDIbfRi/vldJ/Fs1liiL9NQdw/tS0ZHfEG87AVMAomzxOdFQsChwxgdPiplSUz5K5FB9JyDhkO9pNEyAa1uF4BcDQDyn210ZD7BdgFrWjc8J6kozL0s1WHL4nCn+6KE+dE=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: j0iAUuycjI+FFMud/f4xn4g5VSDm1yK3HtDwRI35KySFAcfmeufNao0GtkBdKzD1i+LLiarzVh+cScpYu5x66naMBTYYF3rfzRLHxvTjmZH/0wypKFPkJwrjI20um3LCT151hvjiqlIXt/zYJt/OMqAkGHreVF61rT8thBBXvmqiqBUCDbSZHAe5jUCvsGTxBQZ77CasvleO+xHo1i3tmqFKkscFp80BGzJokvzsvWeUFB50NkEa/htGW4UcGPo29bzUZ62GnevQy2tvVMREz3vrDXJczhf/hPECQQhPc4FYnCBXABnt7PtnbSxWtBSJIEaDxXqYYMzljvCMloZc/javU7OpeDmz/QxUUx7CwbMwfRBhBSsfhem4JHlxfAFrXw/u2Fm1mY4TZ4CN2LOywRejtiSGfRvJoWj6OxMusgmtXk/kUIKpGsyde6iIgwiL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 09:33:22.2652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b68781f-fcaf-49a2-01e7-08debb09d444
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4038
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Anshul Dalal <anshuld@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 2/3] configs: stm32mp13: activate
	watchdog
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,st.com:email,st-md-mailman.stormreply.com:rdns];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F114C5D381B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 18:07, Yann Gautier wrote:
> No watchdog was enabled for STM32MP13 platform. Add the required flags to
> support it. As done for STM32MP15 (in SCMI config) and STM32MP2x, we use
> the Arm SMC watchdog. The required nodes were already present in Linux
> imported DT files (stm32mp13.dtsi & stm32mp135f-dk.dts).
> To enable this SMC watchdog on other platforms based on STM32MP13, check
> that both the following flags are enabled in the dedicated config file:
> CONFIG_WDT=y
> CONFIG_WDT_ARM_SMC=y
> And that there is a node in Linux board DT that enables the feature, as
> it is done in stm32mp135f-dk.dts:
> &arm_wdt {
> 	timeout-sec = <32>;
> 	status = "okay";
> };
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> 
> ---
> 
> Changes in v3:
> - remove CONFIG_WDT_STM32MP
> - update commit message
> 
> Changes in v2:
> - update commit message
> 
>  configs/stm32mp13_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index 620a6da2efe3..2ad57e23e445 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -113,4 +113,6 @@ CONFIG_USB_GADGET_MANUFACTURER="STMicroelectronics"
>  CONFIG_USB_GADGET_VENDOR_NUM=0x0483
>  CONFIG_USB_GADGET_PRODUCT_NUM=0x5720
>  CONFIG_USB_GADGET_DWC2_OTG=y
> +CONFIG_WDT=y
> +CONFIG_WDT_ARM_SMC=y
>  CONFIG_ERRNO_STR=y

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
