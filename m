Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7yrhCPOXM2q+DwYAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2026 09:02:11 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 425BE69DF6A
	for <lists+uboot-stm32@lfdr.de>; Thu, 18 Jun 2026 09:02:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=IGWtxBJa;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F9A9C8F291;
	Thu, 18 Jun 2026 06:56:54 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013038.outbound.protection.outlook.com
 [40.107.162.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD245C712AA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 06:56:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2UPBS2InFYYfUZYUsZYjvh3C9kmMPsn5GTOnSI4gedBFMAI1vrpOt1DXKqKf4DrmFd9u7c9urlp6mmqgKg9lgFvIcVadZumuijtJQPqeCv0uuehn3iHgjlG8uXCqt8OzKGZO+0YACpq4wiygxO6GwL5tJnG/RFWgzKcOqlm9zNLfBp3tdOguX+vyUMPSvBD4LZlrdERjYcsqbcZm18M9qrU23/xzDFw79MIpa4BsYiQWFrRi+M6Kh0I27C3u9n19HvYl+0Iv9eWpd2BglkOHXEHoLnrNXHi/O2KEEJAP6p31aaPTe8Iy//Qm1Y6MYXqlcWD0xXCyVzN/b3c36ywaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBhMOCO31OIV/BKXLWjQq+2p2TooPSKo8hfLzEToftQ=;
 b=TmZsRHAQKr3ZgFuNkVd3cgsBhl/Ze4fvqZjvGrjjqkG8HEGwL+4C93MP9VdRS0nu/TKWyq3WNsm0ytXePWqI4LeHVQbXWdJKM43s9quCsuzxNmiMdAvAlA3j7+hbBFd4K+IAHyPbjfDFvhGSp+hJQqyvC86HLwD/7ia5Veiuja2pCoq9Uq2ZebS57XOE+XigseAMrYmTqyWmGdlKoRHSIgbi9YARzC/2rGcyX3RiRLpX7caOmqJBjoP6Wj/2cjZiL5Fe67L6mb7apIuZvY5UpelY7KgRqQ11HT6ATdgYhxslqPU7cVLIRkpn9un4fjJ79/2Ucne+LS1px/bqM3TsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBhMOCO31OIV/BKXLWjQq+2p2TooPSKo8hfLzEToftQ=;
 b=IGWtxBJaAj/1N/ie+aNJTRwPNw6CRd33wvB+p9ll+uRyG/U11IsPpdlO/yM9umn5dXxQLe0hokKSsQ29BHbgTI1dR3UMbRa4xCsXCDtYms8pOyTgYaT3qOm1HhLbkFEqdWSh7uNtdPklj9MrPzcxShnR3HRW3YX6lkfk029N1uJBZ2vuyHJvtb4ps9Ay0Ps66m7MJxljAMCRDVF6mVeYKPn8INkAoDkXodMn76bFYK61LsTadDYIPXinNH4JHE24PUiKCvaqXN42HM/pX3m0v1sz0TivqmazS0NIgrBm89pZtmC2tp+MqAIDa1PHNHISNdf1UQgk0avjFzA2UzVZiA==
Received: from AS9PR04CA0162.eurprd04.prod.outlook.com (2603:10a6:20b:530::22)
 by PR3PR10MB3850.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 06:56:50 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:530:cafe::f) by AS9PR04CA0162.outlook.office365.com
 (2603:10a6:20b:530::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Thu,
 18 Jun 2026 06:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 06:56:49 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 09:00:54 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 18 Jun
 2026 08:56:49 +0200
Message-ID: <99f25c82-e576-4e94-9b6a-f6f0f4d578b2@foss.st.com>
Date: Thu, 18 Jun 2026 08:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, <u-boot@lists.denx.de>
References: <20260617024511.153241-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260617024511.153241-1-marek.vasut+renesas@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|PR3PR10MB3850:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f844736-48e7-490d-3da7-08decd06c588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6UOYaFR4KrADcYNU1J4+Lzv4yYxFJuEYS9vapauUYI48O57J/U5zn6dOIcWXzbsGpwdOJ7D6E4mtTndgi+5cVAzwTq6HQFVcCpcpWUESyHSHSY2glWUsJRhuzByTXC7zRMtIusbpZks5j6M1oxtjYONrZqPXIw4DyWJVdQdIv6MegczwOy9FEJKeBux1JgeE3yipbGHJk7+AdZ1Bk0ceH8jZjTvRMqHgbA7sNm1j9++mwEE5elhpd7OOJs30l620Bo3fiUYA5goI2T5NmwqubJ3uWSnFAZI4X7VW0qyFixC6jp7iQlE3kUQSm3mMxB8Dz8rZ2PBxGkBRNzVe9RdckF/KXawTYUFw+Ns+ihNQcdHKpi7u0ZOjDLpKcR/VJZLfGEjHd4eDWJN8sfC7EAEsQXNwyKsxVkfPB13aCDdi0kyxTvOd423byl23jmilEgIGxPsRXs5IJzopQMWaQgFTQrU0DqW/sM/IZwXvnwCxryJptlk4LReuRXx/Z/2eJ8O3q8OC/lq39y+OSr3Fl1+WA9+FzK+rq4TY2JiRAIoAx4Ior5wBO0A4BtriG1JEsHfwbezlEP3VcUm07atgC7j/w8LjORiIZLwNcqzbNiI5RrCU2fx2m2+fc3iMTWT4D03MIEFTa4zSJL72Pnty+sHrUxKLsXPodB5+9Bi42AcNt2ayNGf0zysEUmiIr/UD09rr
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jPRJg2DskYj5kc2fQfddHXv10aLJ5TDZxv4lJXnuInEzbk5TqlCX/HMC1OypZxzXN4gru1xgUHHLqOf+yxpCXMBeCsLeYCe0JXvHpmpBXmHgH6ji0wG66eInzGOTY7rAS8u+bLnnUEhM8ryDRdlc5lYNAapXVEiBhtBtbbQlu6tC3mnpdx3SwVkzG+ACp+r8K8fTfxqoGOICOC2vT40zUP4wbqsE/RQT9mEEOkZ70ZOAmVr61zRwDX4OwQQqOmPaIHl46LBXWJ9t34CfFuzmDzk0/iHpcR1SzZPD52CU45zF2VB7wSGcIujZojDgZnFgKJGXOw4qtqso96YB92nWNW30iFRdJLqbnwKR3PWDIzXUiYT6UD92bp/mlxpQBQCAO1tSj6ZdS1mKvHT5DbIk99M2iiU+yZL3QAw3ZW1jP22mp2912fb4L3N8PHZcGYDt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 06:56:49.9906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f844736-48e7-490d-3da7-08decd06c588
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3850
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] MAINTAINERS: Replace STM32 and STPMIC
	with N:
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,arm.com:email,mailbox.org:email,denx.de:url,denx.de:email,foss.st.com:mid,foss.st.com:from_mime,konsulko.com:email,stormreply.com:url,stormreply.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 425BE69DF6A



On 6/17/26 04:44, Marek Vasut wrote:
> Use N: to match on all stm/stm32/stpmic1 files, drop the large list of
> entries which represent the same set of relevant files and miss a
> few in the process.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> Cc: u-boot@lists.denx.de
> ---
>  MAINTAINERS | 36 +-----------------------------------
>  1 file changed, 1 insertion(+), 35 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index edab1622bc4..c862b206a85 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -623,46 +623,12 @@ M:	Patrice Chotard <patrice.chotard@foss.st.com>
>  L:	uboot-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
>  T:	git https://source.denx.de/u-boot/custodians/u-boot-stm.git
>  S:	Maintained
> -F:	arch/arm/mach-stm32mp/
>  F:	doc/board/st/
> -F:	drivers/adc/stm32-adc*
> -F:	drivers/clk/stm32/
> -F:	drivers/gpio/stm32_gpio.c
> -F:	drivers/hwspinlock/stm32_hwspinlock.c
> -F:	drivers/i2c/stm32f7_i2c.c
> -F:	drivers/mailbox/stm32-ipcc.c
> -F:	drivers/memory/stm32-omm.c
> -F:	drivers/misc/stm32mp_fuse.c
> -F:	drivers/misc/stm32_rcc.c
> -F:	drivers/mmc/stm32_sdmmc2.c
> -F:	drivers/mtd/nand/raw/stm32_fmc2_nand.c
> -F:	drivers/phy/phy-stm32-usbphyc.c
> -F:	drivers/pinctrl/pinctrl_stm32.c
> -F:	drivers/power/pmic/stpmic1.c
> -F:	drivers/power/regulator/stm32-vrefbuf.c
> -F:	drivers/power/regulator/stpmic1.c
> -F:	drivers/ram/stm32mp1/
> -F:	drivers/remoteproc/stm32_copro.c
> -F:	drivers/reset/stm32/
>  F:	drivers/rng/optee_rng.c
> -F:	drivers/rng/stm32_rng.c
> -F:	drivers/rtc/stm32_rtc.c
> -F:	drivers/serial/serial_stm32.*
> -F:	drivers/spi/stm32_ospi.c
> -F:	drivers/spi/stm32_qspi.c
> -F:	drivers/spi/stm32_spi.c
> -F:	drivers/video/stm32/stm32_ltdc.c
> -F:	drivers/video/stm32/stm32_lvds.c
> -F:	drivers/watchdog/stm32mp_wdt.c
> -F:	include/dt-bindings/clock/stm32fx-clock.h
> -F:	include/dt-bindings/clock/stm32mp*
> -F:	include/dt-bindings/pinctrl/stm32-pinfunc.h
> -F:	include/dt-bindings/reset/stm32mp*
> -F:	include/stm32_rcc.h
>  F:	tools/logos/st.bmp
> -F:	tools/stm32image.c
>  N:	stm
>  N:	stm32
> +N:	stpmic
>  
>  ARM SUNXI
>  M:	Andre Przywara <andre.przywara@arm.com>


Hi Marek

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
