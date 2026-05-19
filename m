Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HqpCeZqDGo8hQUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 15:51:34 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD43D58006A
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 15:51:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 860B0C8F294;
	Tue, 19 May 2026 13:51:33 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FD2BC349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 13:51:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUN07oggOQGNMEUEPWxQhaxY4jI/m4khVy5gDtZxl2drXs9zvV6nmNvYvR88X+khp6q1F/KqGQ1XXoq3PxuTcrrvI4M1yzoFmD6tIELNwwpDBxDyOqFYQEh5W0A5vAd51msbNC3BeLCDwHUd6Ts5BywX8IxIUzBGcTKed6YzS984KYbXU0YdsrFEqjz9gYItoHph1vC/JuDrzPCaiNs4BzeUD3KNCR3ZIPDzjNYwsiBHfgM2mE7YKxEXKdFzNxr+f7ye/MYM8JGnD6U5m0V1MNQWiIXq9BvN70pQHLd7eaZ20T+g99sg68R1S4qRIisDMFJqhBABMmToeHF53MXctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUEgyOwKLzfUuWaCWNMNELBgYko6/Gj4Rd9e88wfSI4=;
 b=tLij7+eJd0ZDTDbDEnocW3MzRVQhM7RZeL21AGQTeh/Iy62TnPtkbYMjYDhoD1iF0AZDSJoYcDRlqW7vlA0n9QyxbuB5Z3xbrmOJMcKL5Kio4X57o8+WnNP23PFGiphbNtZpAGXxY09VerX9+/DEKvOITic2W7Lkp2z1zrEQGgTdt+9FKQPeZ0fz0zUyS3mrUTUI41aTp8cCxTxa8vTeuDHexC+qsj9X2Sx3FODvdr5r+I6+bZn5f50lZCDTMFWle1Ri7GHDMG6cEBRVmicO/N3UU7eqqWQHJT7EwgLj/rmtX8Gi9/gcc0jaOEBq7RwcEn35OAY1A9oaaAhnQbhSBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUEgyOwKLzfUuWaCWNMNELBgYko6/Gj4Rd9e88wfSI4=;
 b=TpFEMcZGF5F0QNfeO1uVsOj+YvkLpJKiLxpyGCuF+UY8mq1zX842lts8dY1llAy1cEWc9+7dP+HIsJeA11ZRdqyKdBTArsaX0e4Fyed66edzBc9yqAIp7WLP/eK9Iyoh4y0dyB1zwgi5QBaoo99GQveRXnIzYx+zs0EWCuLCAZwWVGLtQDO2g/If30nNAY4VroGU/M5hWpfQ03943uyoassR8cJpFYQb0exAJHZuKA7rYIdCBPYUQBlGPMyY7AwRREP+BVBQeBEQ3VMfCOEln1N4OXxuWeR263vP06GdvyJ7czn32fWifhqEFGQkDGY5u8JUMNP2QwP69+drLDd+tA==
Received: from DB7PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:10:36::36)
 by GVXPR10MB5837.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:6d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Tue, 19 May
 2026 13:51:20 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::a1) by DB7PR05CA0023.outlook.office365.com
 (2603:10a6:10:36::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 13:51:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 13:51:20 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 15:54:48 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 15:51:19 +0200
Message-ID: <30aaa3ef-fd77-4300-af99-dcd777ee700c@foss.st.com>
Date: Tue, 19 May 2026 15:51:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yann Gautier <yann.gautier@foss.st.com>, <u-boot@lists.denx.de>
References: <20260519080737.47928-1-yann.gautier@foss.st.com>
 <20260519080737.47928-2-yann.gautier@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260519080737.47928-2-yann.gautier@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|GVXPR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b94d44-b9ee-42eb-0d31-08deb5adb51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|4143699003|11063799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: mUaaI7aKjct0N6UKj/swSUrd6+PVXyUhqSBCY3UySMwImI+Rv1pZ252UdYRKchwQQzodSRGj0v9VNWaWkYa/BvuxB0jgU3vzkl3PY893wnQ70JBriNNxgqOzwW0t5fxa2WcPX6J9GnVcqEbX6qyT0TTLCY9D6bCKD+lo3423Rv31zgiIesMkn20lMPJBdujQ31vC6dD0iuiqUAprcbBzQ2GoywknJRlJsc4hrlZCwDKNKSO42fKQ1vp8YU6IxZaaAQx8rIejRQx0btGxD9FeD+u9hkjQY/b7LUEB0OjfyTv/c4WyLRvextKTyMMHCvrVQINjk1HWeQ3PrFdIIy8F+HcZBOmXIxhy2+s3rwusl3fqqC3CtTNGyWzUUe97uyWyWxu+B2O+zf9KflEuDk+WW4r4BNgQZOMeSbBuvNctq0mL1LfQIfV7o/p77QF6IIjyV40M42UnT1LqMpntTKNj4KkyXY7BkVcaanPFa4B7UyRUFY/ldfIaPr22uONqPw4NjoTJjZuQ7lr81n9Si+M9ciBKnr3aFVPthvvGFIkfnFtkjzuG1RKzwtU8pYTDoj+pdwSpgXzxXczLGmy+nIfA+AAeH/ncJHhGJI+RMvNF8se+utjXPUp8oXU822qoPxg6hNqJJVwYrOByPpM0gk3LHf0c0eRC1ilx0TvCozr5mJK4sHEwYAF12G+QXbQv7GDw5jVa/nHlWGuuyHNdTbN5j8peTNjqE1Wzx1auDzPe00c=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(4143699003)(11063799006)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eiH4FCU+gd0n8UZzGpy7rXieKyO2MXrDaP32GCMcsW0GxxY+DUeUW2i8t5+itzHn6ox9VKjicfvvDSXgsNfrFIqoIlpPtbjOEfODQpniCXziEgj2MD7ID3DAG0R2dhXpC7C8zrslC4G9It6DPLjF0vT9I7UXOuppejN+8XIY6An9y6/dCP9+1C+yC/lliBadCY6uAVwJv51jnwjUzBJ6jUW6th8qqrHBw8AFWvqV6ftpyoXy91jGOU35tgt3cbb/Sz19o5vkuhAB8gT9PcwyC/oIQ+vUEQ4F1E6FxxpjDwGBi5Z0ehWVjaU/EHwCmS347dNKp80OsK8FVJrjc7pPLmb/4mTcx8Zjqj2sjiRoFARR1vFz/vAO6OM1J47jj80aK0+H0uKZED8+lJeJ3fMsqVESnfTy2pdPq+EtRZF9d3mtG06p8meum2F+mQ4RDYZr
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:51:20.4548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b94d44-b9ee-42eb-0d31-08deb5adb51d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5837
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] configs: stm32: enable WDT_ARM_SMC
	driver
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:peng.fan@nxp.com,m:christophe.kerello@foss.st.com,m:quentin.schulz@cherry.de,m:marek.vasut+renesas@mailbox.org,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid,st.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD43D58006A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 10:07, Yann Gautier wrote:
> From: Lionel Debieve <lionel.debieve@foss.st.com>
> 
> Enable the arm watchdog over SMC driver.
> 
> Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> 
> ---
> 
>  configs/stm32mp15_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index b9e44254087a..2ee08dc15551 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -169,5 +169,6 @@ CONFIG_BMP_24BPP=y
>  CONFIG_BMP_32BPP=y
>  CONFIG_WDT=y
>  CONFIG_WDT_STM32MP=y
> +CONFIG_WDT_ARM_SMC=y
>  # CONFIG_BINMAN_FDT is not set
>  CONFIG_ERRNO_STR=y

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
