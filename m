Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UA6eA5X/xGkz5gQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Mar 2026 10:42:45 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA663327FF
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Mar 2026 10:42:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF46DC8F279;
	Thu, 26 Mar 2026 09:42:43 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013057.outbound.protection.outlook.com
 [52.101.83.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 187D8C8F273
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2026 09:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbzDK9LUMyHWJ+9zH2dNNxdTJL41z/uZenGofPo7RHXv1Sxb1CPjuPFrSAmzgd11vN3kJgH2Q1WKr+n59XLj1PgUi0fxPSG4XxFTmC/NmTkkot+OQPNurO3Wqh9hLM+rdxBZ1ozlzHddVJ307GTSTXX9lJoeEzqGY6090IkPryGHClQ5xep6S6EPK5CD5DkxP+mucspIEyyGP97T+7pavybFPfyoTQW6Q4842YPqpBJ1L726bUJbiyQADMzXdIm+kxemG83yc8GIiJmZP9LP+49ZbM1jmfudSMvKVQoub879FBTAlLEXRxYwaDPQc0kLn3NaA484JEpk8up/TIbV4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygpwNYxtPxr2cyaJDzp2OhaJUK1W4EdFBzMzC8FsPGs=;
 b=O7qAzF/IZRPGO+O4S+9adHl1GnQxEiMvzNi44Lg2G10jxLlg3fEeY/n4NrfQOsaZTwc4+mkh3k+Kh/reu9C+98UpSf2tlTINHBea4KDrOmfqMpGnW4kAy4RPw8/zuCN8bphOEobuA81hUSn2W4XUaiW9J/z+2X2gKE1jdrBLjOLMFfB/7NiYnEXKW4sqPUAJYykEW8IAHgEmBllzZqY++yNuf/R2+lqfuT5pT/pJY/SkRClQ5n6A/jN5PFQJMRW2am05WlsKlMvhdH2TWMrsXyUwOPTs/ITnMsvZpUhh0VKhVmUgyMV+MG4LncBMSsmcRH5nfYFmQkO5dZL7nqwWqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygpwNYxtPxr2cyaJDzp2OhaJUK1W4EdFBzMzC8FsPGs=;
 b=n5YLEukzQBz/MgEGuwq6TOEAKilcPf2QR+2bPA5oFlvx0gJHAA7ol6cYD4//I4hdqM0R4NzhVvEzuteVIdStIbQEJ1tQUr9Zy/qpyuXL6AJxQLd+KpG56DaRoszqTuhb8gbK2vFqpu4lTwUVAyqri4eiGpqMdDi1wVwLHmQF6AqWOgh+THSMOSNkXL1Epka+0vnuEOITQM+iJ6KsYGu50nbGHlOK2LsgWd3xPdZryJcxP3DCr8LGMLqOhoQzv6/nmIgYWf/OVNIW+COVhP0YqJZUwepRkiVAdGRZqsPr1SP8O+mG/SQ2pKGRVPv7fMTjLLmCd8TQ0QWa7d2jmQbx4g==
Received: from AS9PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::13) by AS8PR10MB5927.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:529::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 09:42:40 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:20b:540:cafe::ec) by AS9PR01CA0004.outlook.office365.com
 (2603:10a6:20b:540::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 09:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 09:42:40 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 10:45:09 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 10:42:30 +0100
Message-ID: <f6c27c74-1188-4062-9082-d0f3639d3ce0@foss.st.com>
Date: Thu, 26 Mar 2026 10:42:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>, <u-boot@lists.denx.de>
References: <20260325190027.3428596-1-trini@konsulko.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260325190027.3428596-1-trini@konsulko.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000046:EE_|AS8PR10MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 63be5d94-39c2-45cf-a584-08de8b1c05da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: UxVrUfhj6jxeiGwnDXLBN155cKNTmsyPeXaRnWfvZLVqnWEbgd5jIG2NIlB6Tzbi0XBhMdzdEzalGqxfoWrIIqemw0fn3Avrc3iEQk3KaBy0TWa2t/0rSlU2VFeKRqQahdrG6r0YHeLKRDC1L4X5aL0/45Mzr1IbsSkWH9RM1Gzg4Bk8I7sXC+fCgHV+/WaFErLTT1mGDxVKTwbaFNhXc8DyDITWlnanOtR7BDErTH2j5oEoVllC91Vo+N31gS9QKmOc/UN/WaX9nl1usDaw9sHpZoBNjQD/lhavOzQ3/wv82qimY9aioHHwrk/4oSbcGkz35GPtrkCWFQzH0tddqsE3CkFCHJZbiGfkKeDVNv/RwCCWFT8YTNLs6wykHQBaTAPc8XAxs2pLZR9qyLxOi1p9bb+fVZ97U4ijhBpdI7BlmH+dRg8rfOECFEB3JUv/wVXUo1JpJyGNTQlvEUtHqQa8xs88b4ZammxiRIbsWu3qVn/9oPIfBNkicLUKlL2VmU3SF7uTn5MKkQQJGpAgnSb6sbaQ8CmQTSe99EIay/OovVQtPZQclDdCsrfVZ4W2jbHfOHI1ghG2e/CgF8zIcmMwCCdPkrhm9RaiDGlwah8sZPsUVM1KZRNgVtH0ZrNTOp/7L6Iw9G4cXDXZFgA8cHHslSpoIlXI/zOdWba9ALyZ1REvVP9RcMnhFIjdu1QX4k+4oqTELkIM+MN1OVatXMx7+HExvvrqWSBQfc4DKuAFjFvLdCMYvCfeRnJYSk9WHDjy0HKNqgNzEfOwBILGbg==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BveLg3Y9mcP2xh0I1ogodF0Mw1kamYmAmFWNYUuw74taYxpL4NDOuQyHu8sRGGYi+nWYIZk0osDOYA6HYZf3K3/bnFzkCaYyQH8wNGcIr7UkmCagnUfQLqWenb0uuP39KJqgwxgvOEReEfJh5xMfV7RjIj6pNNkrYkqz6in61sjKYjMlj0bqNj3b4hD2BFbr3wCjIFYINPY74UM8YzhkezvZq8mJya2Gc7cFouKCD8R7e4Q2+NTrE2k+hsIreq49uX80TeTYMxAIWdz0qlfuZoTu451Pf0CVZ0yBv7xZHqTql6MVYlVqBHmLYMG9b08SjKaUbmFXNuXW+la/hZb3dRdTWhZ7KAzH1FCytsZeLS09ZtQn2OPFqcqRfk0nJ1D7Pm3bqgclTCJEn8YZUMQCC/RNWD7MmogWrSd2qqvsHN0HABAJ3BEPZgd/2ByFOc++
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 09:42:40.5853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63be5d94-39c2-45cf-a584-08de8b1c05da
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5927
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dillon
 Min <dillon.minfei@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: Drop unnecessary
	BOARD_EARLY_INIT_F usage
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:email,stormreply.com:email,stormreply.com:url,konsulko.com:email,st.com:email,st-md-mailman.stormreply.com:rdns];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:dillon.minfei@gmail.com,m:jagan@amarulasolutions.com,m:matteo.lisi@engicam.com,m:dillonminfei@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,st-md-mailman.stormreply.com,gmail.com,amarulasolutions.com,engicam.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.343];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8AA663327FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/25/26 20:00, Tom Rini wrote:
> All of these platforms enable CONFIG_BOARD_EARLY_INIT_F and then have a
> do-nothing board_early_init_f function. Change to not enabling the
> option and so not needing an empty function.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Matteo Lisi <matteo.lisi@engicam.com>
> Cc: Dillon Min <dillon.minfei@gmail.com>
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/stm32mp1/spl.c         | 15 ++++++---------
>  board/engicam/stm32mp1/spl.c                 |  6 ------
>  board/st/stm32h750-art-pi/stm32h750-art-pi.c |  5 -----
>  configs/stm32h750-art-pi_defconfig           |  1 -
>  4 files changed, 6 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/spl.c b/arch/arm/mach-stm32mp/stm32mp1/spl.c
> index e63bdaaf42fd..d2e41b8e65ff 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/spl.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/spl.c
> @@ -90,11 +90,6 @@ void spl_display_print(void)
>  }
>  #endif
>  
> -__weak int board_early_init_f(void)
> -{
> -	return 0;
> -}
> -
>  uint32_t stm32mp_get_dram_size(void)
>  {
>  	struct ram_info ram;
> @@ -204,10 +199,12 @@ void board_init_f(ulong dummy)
>  	/* enable console uart printing */
>  	preloader_console_init();
>  
> -	ret = board_early_init_f();
> -	if (ret) {
> -		log_debug("board_early_init_f() failed: %d\n", ret);
> -		hang();
> +	if (IS_ENABLED(CONFIG_BOARD_EARLY_INIT_F)) {
> +		ret = board_early_init_f();
> +		if (ret) {
> +			log_debug("board_early_init_f() failed: %d\n", ret);
> +			hang();
> +		}
>  	}
>  
>  	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
> diff --git a/board/engicam/stm32mp1/spl.c b/board/engicam/stm32mp1/spl.c
> index bb2bd446aa8c..19e5ab0180f9 100644
> --- a/board/engicam/stm32mp1/spl.c
> +++ b/board/engicam/stm32mp1/spl.c
> @@ -15,9 +15,3 @@ void board_vddcore_init(u32 voltage_mv)
>  	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER))
>  		opp_voltage_mv = voltage_mv;
>  }
> -
> -int board_early_init_f(void)
> -{
> -	return 0;
> -}
> -
> diff --git a/board/st/stm32h750-art-pi/stm32h750-art-pi.c b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> index 244bb5eefb3a..8b1b23337790 100644
> --- a/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> +++ b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
> @@ -32,11 +32,6 @@ int dram_init_banksize(void)
>  	return 0;
>  }
>  
> -int board_early_init_f(void)
> -{
> -	return 0;
> -}
> -
>  int board_late_init(void)
>  {
>  	return 0;
> diff --git a/configs/stm32h750-art-pi_defconfig b/configs/stm32h750-art-pi_defconfig
> index 971d5c00d88f..0d0dca2511b7 100644
> --- a/configs/stm32h750-art-pi_defconfig
> +++ b/configs/stm32h750-art-pi_defconfig
> @@ -24,7 +24,6 @@ CONFIG_DEFAULT_FDT_FILE="stm32h750i-art-pi"
>  CONFIG_SYS_CBSIZE=256
>  CONFIG_SYS_PBSIZE=282
>  # CONFIG_DISPLAY_CPUINFO is not set
> -CONFIG_BOARD_EARLY_INIT_F=y
>  # CONFIG_BOARD_INIT is not set
>  CONFIG_BOARD_LATE_INIT=y
>  CONFIG_SYS_PROMPT="U-Boot > "

Hi Tom

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
