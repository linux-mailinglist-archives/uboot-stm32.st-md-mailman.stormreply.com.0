Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ueoYGU7LPGrnsAgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 08:31:42 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DBB6C30A5
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 08:31:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=m5u+Vplo;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9116BC5C842;
	Thu, 25 Jun 2026 06:31:41 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20EBBC5A4C5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 06:31:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaaHMA8/Qv3TjjuDCLTR3DtxxgLBH5RS3pr5u/FNRP0qNT1ilx+Lm7UblbOHSWyBw36DLvFjNhQIBv7IJqoAEUx++F6fSGLX6FuFf9NkXmBXuLECYk6RBRXLQdXsOsjfqSMAbtcv0D5dupoNaN7jewnS7Qf+Uu5i9jeIOCgYxKfDGn2K4DK2WkTKYCyDtJJ30suwufvR6y+582HVP5ACkj5D7sIeBZAsuQaDUb0lDfqsHu76zmr9eGejxff4o4Snexe+cX+ubXc4BX6gfI4+ZA7J0E6pYULub4XJ7E8x/6xZXttXf0Cp/A1vsQWIwwJrDd2AhsglMTreMNQ5UHMQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMBMRAaotOSsvIHEuV0qQvJRHz6KWxjif23TyZUSG7c=;
 b=YD7qTp9J8xr5j1S0a+1ia0iE5YbTdOuw3sa8w5Od/x102p/8WWXx6Xx1eGI68+JPAOwpfz+Ddv0nABihnn5jDK2sWY6oH5jkxZakF0QT1W3RZLgtMt+nup/fdQf0m4u5GOaRf5FVTFbpEHBEeoaWJud99AaUu2PHhwTYnVT6tYfervMzXAu/jBkhi/nFDKMlspcYhID6yNFfNMRa9OGPgEwGm898guHS6AV0NA6LYO2lrLHyZleMPmtGtmo3oQi10kQF3OoEPtMFDDvyxODjjjDINaTBf+tpRWqdUzQp+dYWsNhxCUgusUyEB7PZulpMg7K3RJmzymB7SkLCa7UorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=geanix.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMBMRAaotOSsvIHEuV0qQvJRHz6KWxjif23TyZUSG7c=;
 b=m5u+VplovY7sGxXcevw2hNMnKPAOsDsU1KBqOQw+SFxiL1mTZlsof2Uvo/FMX9JIpjA72o2bB09VylLbh/zddbbEndMtpceBeCc5hArt2BboBeEYRG/O1r6TaS+Pr4hvX8NE50QmCxsmGuerNJqoq/IqbI+yXVFBAwPMIgWpbGfwoQIhaebCVl1Tplz6nTOHFHxBZhRCsDRAPXHdOQ5l9yC1+JT+ZhD9K+w6lqxNelSvo0jyqnZRuaqLPyUHO/llysqDwxV9qGjean9jnIDK1HYIwHo4jWPS42dG9StX4RwJOC+EASXJnPmzY7K38UDfprYIGi6gR68vGC46+3ubiA==
Received: from DUZP191CA0063.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::7) by
 AM0PR10MB3490.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 06:31:39 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::51) by DUZP191CA0063.outlook.office365.com
 (2603:10a6:10:4fa::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.16 via Frontend Transport; Thu,
 25 Jun 2026 06:31:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 06:31:38 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 08:35:51 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 08:31:38 +0200
Message-ID: <4e7b14fd-da00-42d5-9221-719313eecfab@foss.st.com>
Date: Thu, 25 Jun 2026 08:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Nyekjaer <sean@geanix.com>, Tom Rini <trini@konsulko.com>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>, Marek Vasut <marex@denx.de>
References: <20260618092921.3702970-1-sean@geanix.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260618092921.3702970-1-sean@geanix.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|AM0PR10MB3490:EE_
X-MS-Office365-Filtering-Correlation-Id: a2846146-b844-4df7-5f7e-08ded28369ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: K0vy6ii2H1oaQzzWOrIvwP5VIPl4xc6AmPcO7hSBUeqpnX1RaPq15/znCtlubGaue+yvuqKnE4RHjMEpp8DsMtGDicy/5U5rxKBXfSLNAUDUuV64SUymqcTt4aXbYApcuywrI34BzPvRD/fowIAWNy4n52oC52m5N2qWWGmU2mnCsau5uuu3/3js7wLaU0UeUHIffK6y53vWPWBPVN6up0JrdX0r90vtm3uakZjuQaIEzg7r4l7LggKCpe5DXTW5JrFboK/lLQsZI5PyFXZf8ySqn+rP2oKOBfzP8DuIizLoRp4Vp6bIp57Q1MN2pgb6juCy2Wo2Oq2FqO+m2EonzW/PhzObQvBewYZfDnqjUNmGxvuljiFsqDFEeuIWADjOzL8/NQ48341wtvJSLskW029pAShP9lfjUb8WfYuu9KDxM+ubLPcsvNcDIK1DXcVaTrKsdOUnoEkokpc0/1xEN8klZqoIp8d26fij2EcSPThUCJzff7b4KsbULuD/xkr30owbUDp+bRb34ppx9u6zmRthgrdowWMg65TKxEuKsJM1ZKEdwKnqMCmFQ70+ql9V+JeY/ZVpaq2b6XmwdFTwdaDeQzbMhEqAHEfZNE1cUit6Ckl6pc1qucZumLHsaWWuKnyHtBm9ztWn0R9zD/s5VStmwlmFsXGMJVkbUf0cUaIHJzBZp1KrR43WSH2yBOtgNG1Z9OFkJ/C/Rnixear2Ag==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: co6fgrVE0i/+C7xkq/lT8Kyj9sfGT+9BL+4LujPJ3qyoY62v8+Sc27KfEM7vw7VXdFGRW6dUvqZQHW0EnYwwd7V4Q96qfNuyu81cbhMmurzcD82oS6nhslu9575RHR9VGcXyQlHw2O7s0TKTiBhRNwTpFG0LjFk29vPCjAPs+v8RN+J8WVNL26Plh5K2N5BXBYLVnM2217B4eR0x3+ehBNs9rdFfJ3IoJgWcYcAwpNpok9nNY5EKMiXXUs08WEJmLsGbXwxwmMOHFzvHC0hdomdwSMX5anG9IbXa3bIGiCiGRwVxn981cgnLBFwMn3tMaGGOxkW0VFv+Km5FqRepVQ+4jbVig9IUoEoMfl5Y3TOOtoJNJu+siaHkwHdGUEw6vhgsTzXfI7G+s5f492G6wHbTnroNynOcikmAuJJp2XErX77OhgdhY7ZbUBxmJZ7a
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 06:31:38.9693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2846146-b844-4df7-5f7e-08ded28369ce
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3490
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: use debug() for image entry
	point message
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean@geanix.com,m:trini@konsulko.com,m:patrick.delaunay@foss.st.com,m:marex@denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[geanix.com:email];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4DBB6C30A5



On 6/18/26 11:29, Sean Nyekjaer wrote:
> The stm32mp1 specific code prints the image entry point unconditionally
> before jumping to the next-stage image, unlike the generic SPL
> implementation in common/spl/spl.c.
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  arch/arm/mach-stm32mp/stm32mp1/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> index 252aef1852e..ea5d8a648df 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> @@ -361,7 +361,7 @@ void __noreturn jump_to_image(struct spl_image_info *spl_image)
>  	image_entry_stm32_t image_entry =
>  		(image_entry_stm32_t)spl_image->entry_point;
>  
> -	printf("image entry point: 0x%lx\n", spl_image->entry_point);
> +	debug("image entry point: 0x%lx\n", spl_image->entry_point);
>  	image_entry(romapi);
>  }
>  #endif

+ Marek, as he is the author of the path which brang jump_to_image()

Personally i don't mind of usage either printk() or debug().
Marek, what do you prefer ?

Thanks
Patrice 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
