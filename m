Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBEOCSJdDWpLwgUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 09:05:06 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3029588A0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 09:05:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2F24C87ED1;
	Wed, 20 May 2026 07:05:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010057.outbound.protection.outlook.com [52.101.84.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A45EC36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 07:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxB9t+FzWEeoDEuTYH+8LZCVG1pySAV+wU+BYdr1FwhNZ8sTXRUU6ALcKbyYTR5DVw+K23PdbrRPf5GFiX8xk1naW9PBDIjpOzH1DSTpCeHOg/danRcv15M+M4ofXz8wL+uRAcM+p1ERyFuFWnwhoRVIc7IGsuNZaSmeAy688DGTCPUB0bVrHg+EHPL0em3wqG5v/wBPaqh3IXAlCRoaXtaJ9//RyIQJiBdpsmlSacXNxEKPdKaX50SEY9ssxH49YyqAeT/97K80OXH3h/vIkg8fqoqrbgBcKCuKPy2EQEdTKuePkk6HSfxHwUf1pGbpe081B3vw4ullS6NDzxU2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlsT4W6eerp231yMNocy4C3k4Nn2ic8BfxcRy0HEBR0=;
 b=sV9bTYEf0XUTiCDOKZ0Oj3RDXhoh9dKqxs+xqt9wVUQvvIlrEqIc7xatj9FaPZGkSxTZSKjd5KFrYU05gZ9JK1YLJDTUPqz5RVi+dWfVRRVX5GNCQo4CKSigs3nkvQKY4hEUA1a6VNndpcF1bJSkjJ14jraBPiwQSJmXer/+vx5x7PhaADARk5fL0FQfMfPMZ2uC2vsr5mpb5ITMH7kOSELxepSxN7+nNm+VzzoocPIoJbcnrs7eogoAy1aLnfu66QiEheIUWnNa4QOYW6H/zTpkw5MVfdnj9MK2qXR0782AU5nQR5bV1ZpWxgW4eDOW7FwZLKqAMD8HFHKsaRIL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlsT4W6eerp231yMNocy4C3k4Nn2ic8BfxcRy0HEBR0=;
 b=XF8ZDB4Xc4toxIItdKeVsGettf0ACS7JKHhAdrShdPGJ+0A33e6K15+sWPj9Tylz8B4grYzaOJD4ojHbQU/ARVLH5wwtJPuhLwuSEJayhwilQLj0Zfu6GM/ccRVRTwThyQyVDv/pProfwbmwZpGsP4mkDtYSNnyzKsgZ3BKykaTvgbxoD4zVaz56F6jsHaV55F8CSjF8R7tcQcY/XSpzfpui56sec7O8nG+uLAH5A+9XuOmloJKSRTtsPcUOmPQ4B0JGN7b5FVmskDwbbMoHpPWSMH9h1BDC9E82X7Gz984z2H6phcVNla2+rnDPOVGQ+JjLM7S/k1pqKkjsSZiV9Q==
Received: from DU2P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::27)
 by VI0PR10MB8834.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:04:58 +0000
Received: from DU2PEPF00028D12.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::64) by DU2P251CA0024.outlook.office365.com
 (2603:10a6:10:230::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 07:04:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D12.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 20 May 2026 07:04:58 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 09:08:27 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 09:04:57 +0200
Message-ID: <ae24c989-a1b0-442d-a3e9-49b73e06e76f@foss.st.com>
Date: Wed, 20 May 2026 09:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260518065443.2531017-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260518065443.2531017-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D12:EE_|VI0PR10MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: 14de63e8-9e4e-45de-33c3-08deb63e1aa4
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|56012099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: qtIu56AnIT0/0MaZ7eMApNYjdvDox2XsuEkxODoGzglL51D2ZCJlOn6ljoInv6u/rv8oVZhov+pc0f4fSwwNueOxwp1odynVCgL2NB+Mx2l1L6zeboEjVBlU9jc6pTgt2Z8w+h4N3jBMnnU6lcfBUFffJqqWIIuYFnGsEhjkxanPfUFos1IHsdbHkULJPlk8/a6grxtGZZKbgO+PCQUW6sy9AgU13k1+MWkQpZSrGiK4u6SQosXj7MBNcmVlp5jtQYWUCto9k1aFCamn4X1K1Q3+RCyuZOog75eZUBSkz/QkOJFwNlFeEx+8PDJg5x16qoiTQjBTT27likdimbDg9G1XG8Q3tt7RBdKpYAzyQW4YzMbIfuDT3TFfUTHYP2g/+nwS8ZDFEnWnxSi+JBM/FDE4hDFva7WkfyTozy2LoOY8Sql9d5u0Ls6jOhqcC0yZ2nmDl7vjj6EFt6xR0OvkFxylb6W9bevdw6MYLcwmyZR3Bhz4XFPNNewIaTm4ewtlWosQghiMrpIOQpnsd5dGQf9w/fRuku4ql2X/q9ANI3Uvx/OjiFxFVX9SWIhI23WyImbVcO+6eHVwMN4kZJXtZrYxzjE6Pc5VGJja3Jl9DVvF8e6Ne/i9d3m+2r4SFedlg6cVky+lNBeovfsgqZLHXA1dN/4jcj9gEldMv+VpBqve7DEiXzbJPGIJf8Q19tqPxOfL2XBYY48BFaHDonfcQ6i+ZhUUc6tJtAtUrpTSVBw=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(56012099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SK/HKV0sONa4LN4ISdDlEytocUyOx8mI9hCCfyM9v9wl23Q9gH4avIaj4IL4cJo00NsERy0jUEfbbe4qu2MlULaxUSkZxByWOWm2F1Kx5xhn+rl7b14j0MqWrv6LM0peLhZyOVQh9NBECyhSjP+TbmLwD8kj9PkU8LETcTlU3wWEKs66CIVYmbQ7REp0Qi2aHJDx1CaGgmxQznlYt32Nv+2hH+GP+JH+L2KXK3uM2Jvu4yca+b9ou5YFf2/qh3KW4aMx2gfY74JARzPM+aGS+8Xr0CAss5DtYbtSBkUsNSc5DJHHx8x23inS/y3RD4/jLvJ49AkzSCTybr3iUYhstN1HJUigJOtlD2BW2odaN0G6E2sVTpqpPaq9MTd/FPGe9oLijb6JtKZ3GpftVAZQVGjj52B90ChSHxU1plsGXO0m0nLQW/WIrs0L4uTa/cEw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:04:58.3267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14de63e8-9e4e-45de-33c3-08deb63e1aa4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D12.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8834
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] board: st: stm32mp15: support dynamic
	A/B bank bootup
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:kory.maincent@bootlin.com,m:marek.vasut+renesas@mailbox.org,m:uboot-stm32@st-md-mailman.stormreply.com,m:trini@konsulko.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amarulasolutions.com:email,st.com:email,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3029588A0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 08:54, Dario Binacchi wrote:
> Following commit 4300f9f4c5d7 ("board: st: stm32mp25: support dynamic
> A/B bank bootup"), this patch enables automatic detection of the active
> A/B bank on STM32MP15 platforms by retrieving partition GUIDs from FWU
> metadata.
> 
> This ensures the system correctly identifies the bootable partitions
> even in multi-bank scenarios, falling back to a standard bootable flag
> scan if the UUIDs are missing.
> 
> To enable A/B bank bootup on STM32MP15 boards, add the following Kconfig
> options to the  stm32mp15[_basic]_defconfig:
> 
>  CONFIG_FWU_MULTI_BANK_UPDATE=y
>  CONFIG_FWU_MDATA=y
>  CONFIG_FWU_NUM_BANKS=2
>  CONFIG_FWU_NUM_IMAGES_PER_BANK=3
>  CONFIG_CMD_FWU_METADATA=y
>  CONFIG_FWU_MDATA_V2=y
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c          | 33 +++++++++++++++++++++++++++
>  include/configs/stm32mp15_st_common.h | 15 ++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 88ede4e39106..8164a62e9a3a 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -857,4 +857,37 @@ void fwu_plat_get_bootidx(uint *boot_idx)
>  	*boot_idx = (readl(TAMP_FWU_BOOT_INFO_REG) >>
>  		    TAMP_FWU_BOOT_IDX_OFFSET) & TAMP_FWU_BOOT_IDX_MASK;
>  }
> +
> +int fwu_platform_hook(struct udevice *dev, struct fwu_data *data)
> +{
> +	uint boot_idx;
> +	efi_guid_t boot_uuid, root_uuid;
> +	const efi_guid_t boot_type_guid = PARTITION_XBOOTLDR;
> +	const efi_guid_t root_type_guid =
> +		PARTITION_LINUX_FILE_SYSTEM_DATA_GUID;
> +	char uuidbuf[UUID_STR_LEN + 1];
> +	int retb, retr;
> +
> +	fwu_plat_get_bootidx(&boot_idx);
> +
> +	retb = fwu_mdata_get_image_guid(&boot_uuid, &boot_type_guid, boot_idx);
> +	retr = fwu_mdata_get_image_guid(&root_uuid, &root_type_guid, boot_idx);
> +
> +	if (!retb && !retr) {
> +		uuid_bin_to_str(boot_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
> +		env_set("boot_partuuid", uuidbuf);
> +
> +		uuid_bin_to_str(root_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
> +		env_set("root_partuuid", uuidbuf);
> +	} else if (!retb && retr) {
> +		log_warning("%s: found boot GUID but missing root GUID (%d)\n",
> +			    __func__, retr);
> +	} else if (!retr && retb) {
> +		log_warning("%s: found root GUID but missing boot GUID (%d)\n",
> +			    __func__, retb);
> +	}
> +
> +	return 0;
> +}
>  #endif /* CONFIG_FWU_MULTI_BANK_UPDATE */
> +
> diff --git a/include/configs/stm32mp15_st_common.h b/include/configs/stm32mp15_st_common.h
> index 60838cb0e3f0..7727e583fc77 100644
> --- a/include/configs/stm32mp15_st_common.h
> +++ b/include/configs/stm32mp15_st_common.h
> @@ -8,7 +8,22 @@
>  #ifndef __CONFIG_STM32MP15_ST_COMMON_H__
>  #define __CONFIG_STM32MP15_ST_COMMON_H__
>  
> +#ifdef CONFIG_FWU_MULTI_BANK_UPDATE
> +#define SCAN_DEV_FOR_BOOT_PARTS \
> +	"setenv devplist; " \
> +	"env exists boot_partuuid && " \
> +		"part number ${devtype} ${devnum} ${boot_partuuid} devplist; " \
> +	"env exists devplist || " \
> +		"part list ${devtype} ${devnum} -bootable devplist; "
> +
> +#define ST_STM32MP15_FWU_ENV \
> +	"altbootcmd=${bootcmd}\0"
> +#else
> +#define ST_STM32MP15_FWU_ENV
> +#endif
> +
>  #define STM32MP_BOARD_EXTRA_ENV \
> +	ST_STM32MP15_FWU_ENV \
>  	"usb_pgood_delay=2000\0" \
>  	"console=ttySTM0\0" \
>  	"splashimage=" __stringify(CONFIG_SYS_LOAD_ADDR) "\0" \

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
