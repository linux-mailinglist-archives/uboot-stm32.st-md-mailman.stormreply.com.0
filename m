Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDscMm4QBGpODAIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2026 07:47:26 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A28052DB98
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2026 07:47:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E9F3C8F289;
	Wed, 13 May 2026 05:47:25 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013034.outbound.protection.outlook.com
 [40.107.162.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2BFEC01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 05:47:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVH3E/FXbOopUzi8AxQDbzxqZ7D6YUIOctlHOqcBhzt3sKIDekteL94Jy3zqoj3KK+B9K+TXFE0JtzzCMvgl8y5CVZIkOrlA5xwcjqsHHTqLRyRy1poNRZmlTfZ9WUntB0mL1LBd1G8C2BueRYhCJFn1+FRpKYGNrL3S3hwcKiBjHtrMr8lJnxYkQam27nnvSf6CSTxEpOpolDAXISNqFOSr4EjtPhF3AVTjoHYV4Rdz5FzdiF33655etPF+XpNJoucJa15REtUdLb6FFP/9dYUQLiCj166YZv8l67V1VEkZNPV5xY0dDJhaLeqiFnkcXzUkHLTWJrt1GEPlUPU0hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Atmsbrj/eJtD0qwsfbBe/1I5Uv71fG/Q/0Lrp6Rnzcs=;
 b=Rva7wBxg4B+1wyGQcQfD2TGTdhGcq5MD5BdAPt6IZAa23p3UPAQz7iWWMQKgywCrxISkJkV5tXdo75R892zPRidnJaGWtvvlyD3qAh8SMneBCOSTakprYttCf21NzDSWa6pVe+d7xLt1b2I0XPCA2k7ryp0xYeytN2WIao9muZYmukMKpjYA/uh+9KzJNgHasFMblBz1HF6Hg2Tbior8+pQ41PiVSIFb+71b7jLP3rT7UZ4F1kbLmkY7WVOYjKHpI8lwIDKzBOmv2b99mUmvamegLHZbQNs/0kW3JVgLc6Q0TvpbjKFXZZMaOmPuFC5h34TUAZNhor6y4f8mPTYuJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=deadband.dev smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Atmsbrj/eJtD0qwsfbBe/1I5Uv71fG/Q/0Lrp6Rnzcs=;
 b=cyBAPMjFwlq3ciCRZTKBSN5bx/wDBR6yL2mQsDOV5D6KKB+8v1lqZdtQfaZQKgAI13pNv3Ym0DegkvT6kDxRhkvvh++bJtQjgRBQF5GTQbWFsjAP7ruXxo+1o8wE8JPU85yOal/Nu8je7orRdz0GVMqUn8wXy2IXxoG8c2kKCoop5pYnj+kcXVwZe6X8PyXTL2wHgWVwl2832R5Rsup2FUOjivVMgpi68VoOBZdhR+JVgiDCUGgYqGseI0jzRJx/SrWlT6+endXxS3AjuGcFfOk2j1xGBcgMGkcXrg45kKkyXkaEptlLAiRQDs+Omb5tVmj2suM9rL37tREvqJetpg==
Received: from DUZPR01CA0245.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::25) by GV1PR10MB6561.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:81::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 05:47:19 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::64) by DUZPR01CA0245.outlook.office365.com
 (2603:10a6:10:4b5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Wed,
 13 May 2026 05:47:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Wed, 13 May 2026 05:47:19 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 13 May
 2026 07:50:45 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 13 May
 2026 07:47:18 +0200
Message-ID: <264b4b58-3b95-41ed-a6d7-96a75ad9ff0d@foss.st.com>
Date: Wed, 13 May 2026 07:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Austin Shirley <austin@deadband.dev>, <u-boot@lists.denx.de>
References: <20260506223758.3717574-1-austin@deadband.dev>
 <523bd0ae-10a7-4397-b9e5-a85e69dbe5b8@foss.st.com>
Content-Language: en-US
In-Reply-To: <523bd0ae-10a7-4397-b9e5-a85e69dbe5b8@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|GV1PR10MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: c070cb7f-12ed-4aa0-0be1-08deb0b318f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: nwvAmsrCtG4EKT1rg1NDFoiZLR2woWaAqW67oBz3VkRrexuVZrLvnCs9HwzHU6XkgMVHSVTxpXveLJni1oj+i/7bC3Pk9BpBuYI7GE1oGrW19PN1fBhzrc9l8r67jwzukCrkylYFnFCQWpoAf58XTpE3SZEJyMKVY7uycnNKBRRb2vCTW1GgrPHWlM4jM9UxYfWgcuEX9HCIYbBvzsrP841jKuycXC/2krR/Ijmzmgj+hdkpt0GPuUaH7Z1u8KTnKlaAZAZorlPGek6IRYfVbVXCH2e6H1LBtFLaAOCfm0sfGobLai611pJqqzYMftZoeP9Bg89UQ+lUSfg4Nrvv92FpwDVDXwlVD7D0cSVpwRBxJn2oo0mchf1KQj96cQYeHwd9yqO9T8OpdlPjrY8ezJ60GFktdVHUn9UpjgoYM2XX2/na3ouuPW9K1NH+eLvqLnaqbQ7jaS9OqyZA7mZ0XF71UMPodPsvA/NEkgYQMRE/RK+ZT7JqyYStFnheDHdODwySY0Bhg9L0Zz/NlIIEw+cP/My0fg/xeF3bTGVubVV/fjayTp7rDFUyxYYeNmSicFBLeZRhDe6Kvr4ymApEwuQxl1/VDhFESyxHKVFqRvnhpC4CX3IbbXS4HYSPayb348ZG8sKe5WytJBcX7Kw8Vv/uQXJyLilgw1rs6Uc1g59SA8/Kkom9ogyTmVgMeysV
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(11063799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +lKEmB9cOSVMHqmg9a7+MVmTHMLGHoUmepub1aY72xPeReF61NnK/7EKDXGsjl69Gd93N/x0Ze7uc7FiClD7lwjn8og8dW9v4aSKJT9gcowCHWdsjfE7fbENk5Ec1V3YTmSuBi4KPSuUBN85vxIXFfOk/+/cITSPtCuGsgirJucTc5gPipI064ZwNpwlkb1Kjw9vkJTaRGhzmBJxEkG8uI/zr1/bnWHVy1k7f/jFgaF3IHlI/e0HAjDpdeXfiiNfsUndUDvrbhx/JMMZ85RN1p9djQvcNhgXHZJgI+0DejoEkdbuOfNyhGJF7fwHCiKrKf1IpN9lqpo4iYxuNeHvi4xb5FL4Sim4YjNM2eE9E9HzkKrUk2TjDodS4KKMO5fnVbCcWP4RpOfie5ehVFdFAAkwignW/vdKnBZpYMmt94vQ8vxmf1Rh/xOMcKb+OJIx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:47:19.6280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c070cb7f-12ed-4aa0-0be1-08deb0b318f6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6561
Cc: patrick.delaunay@foss.st.com, trini@konsulko.com,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp13: add SPI-NAND UBI boot
 support
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
X-Rspamd-Queue-Id: 5A28052DB98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:austin@deadband.dev,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,foss.st.com:mid,st.com:email,st-md-mailman.stormreply.com:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.195];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/11/26 08:01, Patrice CHOTARD wrote:
> 
> 
> On 5/7/26 00:37, Austin Shirley wrote:
>> The STM32MP13 default environment only handles MMC and serial/USB boot.
>> When TF-A reports BOOT_FLASH_SPINAND the boot_device variable is set to
>> 'spi-nand' but bootcmd_stm32mp never redirects boot_targets to ubifs0,
>> so distro_bootcmd falls through to MMC/USB.
>>
>> This change mirrors the STM32MP15 logic:
>>  - Add a BOOT_TARGET_UBIFS entry to BOOT_TARGET_DEVICES so that
>>    bootcmd_ubifs0 is defined (ubi part UBI; ubifsmount ubi0:boot).
>>  - Add the 'spi-nand' / 'nand' clause to bootcmd_stm32mp so that
>>    boot_targets is set to 'ubifs0' when booting from NAND.
>>
>> Signed-off-by: Austin Shirley <austin@deadband.dev>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  include/configs/stm32mp13_common.h | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
>> index 3e3f49abae0..e707b146f90 100644
>> --- a/include/configs/stm32mp13_common.h
>> +++ b/include/configs/stm32mp13_common.h
>> @@ -33,6 +33,12 @@
>>  #define BOOT_TARGET_MMC1(func)
>>  #endif
>>  
>> +#ifdef CONFIG_CMD_UBIFS
>> +#define BOOT_TARGET_UBIFS(func)	func(UBIFS, ubifs, 0, UBI, boot)
>> +#else
>> +#define BOOT_TARGET_UBIFS(func)
>> +#endif
>> +
>>  #ifdef CONFIG_CMD_USB
>>  #define BOOT_TARGET_USB(func)	func(USB, usb, 0)
>>  #else
>> @@ -41,12 +47,14 @@
>>  
>>  #define BOOT_TARGET_DEVICES(func)	\
>>  	BOOT_TARGET_MMC1(func)		\
>> +	BOOT_TARGET_UBIFS(func)		\
>>  	BOOT_TARGET_MMC0(func)		\
>>  	BOOT_TARGET_USB(func)
>>  
>>  /*
>>   * default bootcmd for stm32mp13:
>>   * for serial/usb: execute the stm32prog command
>> + * for nand or spi-nand boot, distro boot with ubifs on UBI partition
>>   * for mmc boot (eMMC, SD card), distro boot on the same mmc device
>>   */
>>  #define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
>> @@ -56,7 +64,10 @@
>>  	"else " \
>>  		"run env_check;" \
>>  		"if test ${boot_device} = mmc;" \
>> -		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
>> +		"then env set boot_targets \"mmc${boot_instance}\"; fi; " \
>> +		"if test ${boot_device} = nand ||" \
>> +		  " test ${boot_device} = spi-nand ;" \
>> +		"then env set boot_targets ubifs0; fi;" \
>>  		"run distro_bootcmd;" \
>>  	"fi;\0"
>>  
> 
> Hi Austin
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice

Applied to u-boot-stm32/master

Thanks
Patrice


> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
