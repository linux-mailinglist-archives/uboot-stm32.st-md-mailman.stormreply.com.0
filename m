Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBMUOdRwAWoyZgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2026 08:01:56 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 393CA50858F
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 May 2026 08:01:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B893FC8F274;
	Mon, 11 May 2026 06:01:55 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010063.outbound.protection.outlook.com [52.101.84.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CA07C87EC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 06:01:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQsHVDUvn5DTovqd/UO/Bemb4rYJdQ2suMCkg8Brr0qPZHxDTwELryzxhKVyvJRCErPUCMV14OercGIhBS/uTFRMILFR4FFf63hLvskInQkx7tlV4ytKHpDBJ7fE3IjBoyEaGl3DVOP7Fniw/QDOh59tFa8Z8lpIM1inqx4CMMwt4BWH9Jqkmd+53ShNKrZQAavBTvh4n4rj3+ZhIJDXj+5P3fNLj4CUPKMiswe2mGyybBieGci8kfVsfE2N1duNptBFxZ7jKPdbbVd8T2ItNZPJ3bEcIecBQZ1EXWKUfJZRTHP8N0UgPboSvmUqf0+bPkLWYn0T7Zl9IwbbeHmoMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20dokVosM0106/5j8ppYK6GktkpxyQ0tWYGJ0YnWSI8=;
 b=etWizn68w9DTuPOhkg+uV+WYnN9FWr3PBSQTiu9d7gzBBmyois4ulrDlFMLAMXXAqy6lKbFPu/dQ63t77+kKS0iIRcvs2/8YE0zVGbPF970hdqoTHQXVUuMa8425ASv5JtQHybwMZak2ofSE8QxvVGArTIquuCXdeEF91wLd9UwfauhjxZFboAfgQYhOG1zhfG5i6zsQ10g9BpgWx9rCOlAiUU7FaNkX8y+50hsRvQ1mF+QvaF2Aj1DxNrgUbs5ZNYTBJjYs0BVihCbWmkEV/OZnILGmfOLqQrln0VsS+ODHA0ba7O/lnb8HIBNC7HViWq8T2yBzrUmRUgtmjFriLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=deadband.dev smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20dokVosM0106/5j8ppYK6GktkpxyQ0tWYGJ0YnWSI8=;
 b=lJmNJMQijGh7wYibGClpp8mpnXX3+tcU5uejXskPEeZGIYcpf+axpfV1Y3I5GMhYVzhSp7lVRMdofrLg7L6pcKDWNVKt/c7fFf6xjHrOA8oeMVtbM4kVKSE97mNa7q2U4A2lp154CbSZfFtfnWAMwaN8ffdyIgEOQcu+ubYLjK8sb1SjWrsISyrqkDUZDeDw8DWlSpRk8apIIgj+8MxzB67CFJt3tHxB3G8kiuqZYc21Tof3cTVymmGB5pgtrFlYumgbVnkXrgx+nKT7Y4V0cOdXYi0Ji/P7QJKVaL2+O4yNCiLPg7vVSfY8gleOTD1YSBqKwKb8hNdX8VZJbOoOUA==
Received: from DU2PR04CA0224.eurprd04.prod.outlook.com (2603:10a6:10:2b1::19)
 by AS8PR10MB7400.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:613::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 06:01:48 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::c1) by DU2PR04CA0224.outlook.office365.com
 (2603:10a6:10:2b1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 06:01:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Mon, 11 May 2026 06:01:47 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 11 May
 2026 08:05:13 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 11 May
 2026 08:01:47 +0200
Message-ID: <523bd0ae-10a7-4397-b9e5-a85e69dbe5b8@foss.st.com>
Date: Mon, 11 May 2026 08:01:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Austin Shirley <austin@deadband.dev>, <u-boot@lists.denx.de>
References: <20260506223758.3717574-1-austin@deadband.dev>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260506223758.3717574-1-austin@deadband.dev>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0F:EE_|AS8PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 884ceaa6-1676-48f4-042c-08deaf22c9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 9Pguow6lzAcWAJO5fItOXWThkCpUU19nqge7E7UgckKwTQKm35lPd3ujwac5IdTFA5d+LqtVMNI7Jzm1osU7UpuW9VCM5wrHOq5pu8HaGAnC6okZex4og9NK/+yOezIRLoCJupB/g8Dd23QINo5vmGnZRquj6QqYJCC0aIBx1f5q6TIG4hlt+64d11aBPC7XD2ASz8iW6c6Pk0qa5UqviKpCuST+EXTcKl2wJcOcszL09ClTfY57dctWrwoVdbVquEAt57v4w2A6cQSQVDHmUJ3peCCGUz/OtMmE8i+38Ki1T91e40SPY7pzheuDzF0mg1z6mpoiQvV4TVJ0EiM+6CAYlMBH5zwGhTcU6EnQ+LWpAH214csmwIzG5ICBLrU5AlE8/zLZYFPf4hH4LqPXZlCwuh9bglwxyb0bg4Zr7p+pHRhkqVHtaKrnQAjebVoXSMTxErIYbZcsfzW26WPpY0W/9lnO0ycW+k7q3TyX1VZDGlE+IeMqswwinEUHipEBFCP5X1wCEk3ttudJhU6ncUYvIWn8SWAS11oY2620AgTXrl0rp72aWZsNLIV2MHW6kC3MmoIfaSEXlY5xFZvtFWpwckP006Bg2tr1hbKrwWObSPY3JJ1ZQYtQRMom2wviN4B5U6kW54ORUO1qIejnTzFBUTAWiJd2iSu2a3ATiZrx6yK/rIzbafAf/Yl4Xdbb/01kl2ybBfvZ0GkNwU+f2rl1S6dJlKI5nJSTTkruINM=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qNmaE+Sf7xbxS99dLcq97TgNdBEjpjuPPdWXUwsMFzBfipY2q+N1V5kVaNm3xowxvaaGx9SktbLgjZZF+EpsjZp0sSkaIZjenTS3SWOY5AW39cI9lAjZQ8/JFTlBwu8+HTrT+BZ/5s7N5Wj+IPh/p02dzREz4PMJvDNajaPaO52/mcqkrIG1T5hQpchDlTsxYov9gi34E4rWx61NpDR4U20nfhGcM7IpML/nXbUNAbVMpS8jw0GTUBIsxbHGJTxjem1hzbGlQsWpFBNiNQF6i9ncYj4D9a/+hn8m7983AK5H5NzFPU0sYC+Yx4xm2Kf2V6yvNw/wQ/l53DfdKI2yfkdokyGVxY56W+DWKJ1SYJTsa04/GTJreVdsiPcQYwtO2icLJOZ/M93hpgDTiKALBUx/z5aNlNlvCoOEBZumKilUngC47OMeDPCPb6QJgg0u
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 06:01:47.9486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 884ceaa6-1676-48f4-042c-08deaf22c9ae
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7400
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
X-Rspamd-Queue-Id: 393CA50858F
X-Rspamd-Server: lfdr
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:austin@deadband.dev,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,deadband.dev:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/7/26 00:37, Austin Shirley wrote:
> The STM32MP13 default environment only handles MMC and serial/USB boot.
> When TF-A reports BOOT_FLASH_SPINAND the boot_device variable is set to
> 'spi-nand' but bootcmd_stm32mp never redirects boot_targets to ubifs0,
> so distro_bootcmd falls through to MMC/USB.
> 
> This change mirrors the STM32MP15 logic:
>  - Add a BOOT_TARGET_UBIFS entry to BOOT_TARGET_DEVICES so that
>    bootcmd_ubifs0 is defined (ubi part UBI; ubifsmount ubi0:boot).
>  - Add the 'spi-nand' / 'nand' clause to bootcmd_stm32mp so that
>    boot_targets is set to 'ubifs0' when booting from NAND.
> 
> Signed-off-by: Austin Shirley <austin@deadband.dev>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  include/configs/stm32mp13_common.h | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/include/configs/stm32mp13_common.h b/include/configs/stm32mp13_common.h
> index 3e3f49abae0..e707b146f90 100644
> --- a/include/configs/stm32mp13_common.h
> +++ b/include/configs/stm32mp13_common.h
> @@ -33,6 +33,12 @@
>  #define BOOT_TARGET_MMC1(func)
>  #endif
>  
> +#ifdef CONFIG_CMD_UBIFS
> +#define BOOT_TARGET_UBIFS(func)	func(UBIFS, ubifs, 0, UBI, boot)
> +#else
> +#define BOOT_TARGET_UBIFS(func)
> +#endif
> +
>  #ifdef CONFIG_CMD_USB
>  #define BOOT_TARGET_USB(func)	func(USB, usb, 0)
>  #else
> @@ -41,12 +47,14 @@
>  
>  #define BOOT_TARGET_DEVICES(func)	\
>  	BOOT_TARGET_MMC1(func)		\
> +	BOOT_TARGET_UBIFS(func)		\
>  	BOOT_TARGET_MMC0(func)		\
>  	BOOT_TARGET_USB(func)
>  
>  /*
>   * default bootcmd for stm32mp13:
>   * for serial/usb: execute the stm32prog command
> + * for nand or spi-nand boot, distro boot with ubifs on UBI partition
>   * for mmc boot (eMMC, SD card), distro boot on the same mmc device
>   */
>  #define STM32MP_BOOTCMD "bootcmd_stm32mp=" \
> @@ -56,7 +64,10 @@
>  	"else " \
>  		"run env_check;" \
>  		"if test ${boot_device} = mmc;" \
> -		"then env set boot_targets \"mmc${boot_instance}\"; fi;" \
> +		"then env set boot_targets \"mmc${boot_instance}\"; fi; " \
> +		"if test ${boot_device} = nand ||" \
> +		  " test ${boot_device} = spi-nand ;" \
> +		"then env set boot_targets ubifs0; fi;" \
>  		"run distro_bootcmd;" \
>  	"fi;\0"
>  

Hi Austin

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
