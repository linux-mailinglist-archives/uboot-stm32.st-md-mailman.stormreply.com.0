Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO5iFSldDWpLwgUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 09:05:13 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D9588A16
	for <lists+uboot-stm32@lfdr.de>; Wed, 20 May 2026 09:05:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F175DC87ED1;
	Wed, 20 May 2026 07:05:12 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013036.outbound.protection.outlook.com
 [52.101.83.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14591C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 07:05:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZBkRRfEDIiuODamQwJGXEESxQqSxWfSZ6J2ukw6HEHsU+rr1SXL59V1o3vltEBhQbZxrovj2b4Z9Psh5bg6ftCHE3cT/WM/dl7Mnrql3lA07cJtujsfODIyHaCnnVnsqqUCzfdZtBEjT43TSKzsdRv7KOpEAGNLV7PgV/lOXjksX+N1tJgX7q+c09bcPFXbyu5VvpXZM6ruRtWL6XqUAhOTG/SPCFnHo1S+DDLc1nTMl1p7/trMA8kUXElgt9SlJLMLeGqPJd25YitaNZZ27MJxRnlVNM9SJ3VGKh+zh+KjMsCSgAkFsue1Fqbw4OAyi8To3Ito0TuP6/tRxzVhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pG+yzL8kV0gq2gbX0LoT2qER3/Q5DBeWpaEe6MiMo/4=;
 b=CSLu9s5b4JbTt8RWpZpH4CX8M7ic9vxciwqtcHQvbCS592jhaWRWuD3DoIppdrjc/S4/BRnJg05y74zyoSvzbibvE9sHtpb9i7wUSrzpylgUWAMUlLBiMC0xuwD/+TlLq8mNlcmmljG7OausZI9opxZAvOKSwQn/ETWNPw95M/tWqOxqnXgh3P/udH3GAVloQHhtUNx2s14WGMvU5N6VgGjJKom+LZoVmnEKpgRI6h3PXL/P1XqekKqjU5ibw0ihXBz0wcux4yr9A2IXpVG0iXrvUIY+EfsF1U/7toTf+0WJQSkuyfAloe36nnzZBER7Wlrcv9AI1y0xC/NBbIqmNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pG+yzL8kV0gq2gbX0LoT2qER3/Q5DBeWpaEe6MiMo/4=;
 b=Hom2Gh6gCdH/JprxcWqde+oJdLEsePJAYecyYMluHs5cLJQMAGLNVQjvQYkKQMHlrWrEcFKZVnwGigBffh9d5jHIHmDstW5KeyZCThh6e9VKm3ydt0a6w2gdm6tfsx8XxygxfEq4CCgyY+tDB9wXx+VqYX2g2nRI0nnH/KeWGkfs1Y1iPOckPU+/6uZfzahH3XGOnZKRaK55dRybMWmt+qMWmPq4diiDIgQZJXEfh9rFtv82D8vV2u+yD6Wg6/ubSla70TCKTIEmBXg41We57hMhel5/dOiSzWSBOoYj5qSgm5BEStOZswW8lpVDB2PGjBeGgBl07c9RsPRIKx4TLA==
Received: from CWLP265CA0354.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::30)
 by AS2PR10MB6975.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:578::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 07:05:07 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:401:5a:cafe::7f) by CWLP265CA0354.outlook.office365.com
 (2603:10a6:401:5a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 07:05:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 07:05:06 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 09:09:00 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 20 May
 2026 09:05:05 +0200
Message-ID: <c1852b75-dac3-4510-8c9b-9af5b397e9d9@foss.st.com>
Date: Wed, 20 May 2026 09:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260518065443.2531017-1-dario.binacchi@amarulasolutions.com>
 <20260518065443.2531017-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260518065443.2531017-2-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AA:EE_|AS2PR10MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: eea9bc1b-a9bf-45ff-dfdc-08deb63e1fc5
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|22082099003|56012099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: l3QJSfj/qXGrEO5mmQhMMt6lQycasFzVbnU7dv13xTKIeXp28tQEirZoqLLJA9LJEeTA27qDnzI04y6zI+arzr3WOb/Uv69gDkM634wDLHPKj+svgOCwDOPNHPVwUAGNGG+vhiuPG5D6ayymYy3lQeSmFj+CXY9fDvwrX8vL2CJSfiOLM4J2pz/Yp/MTuFI1xKqBAo+LMGjMiIsuvH2aII6kpPjoHoNB8QjpCYPjGBkGcYw0iBTTcQh9FjKZnFcJJwvkyxHKwqjP713ta1mWl9qf6idbLX6z6C+lNvt7qNuuBsQZkYL3FyYw7ZrJPuLoNjvT1DfdLkml+UFWjlxFddNE4Gq6qDGkb/o7kuseWRm/G05LHwAMcJcNsR29FX3nAAaSlhOlk6pEpgG2MywYdlyqRfKi1U0zXA80BH7IAjo06WFLEiraEGCINNx3TEcqiHKliiM7XvsBEcyN7YEvnI1HwEDbLBHAi5GSgwdYmAWBRaU24H4LTlkjCl/KUvAIDz8jSgCKvaOP8Wb3Ccgewcj7ds+ZWywWIiBqaiAh+PW8fq599/+OiMnuNvDeFT+y9dtndsrZUWIaPgVTF+PDbyI/L/3/FWiEi6FaKi0XJJTxtZuhj4nHboR7tAjZCEhfScc+PTDlHZOLf6xAXiiVsSeXlqyvhXbknHzD1lDtQ8fZJXzG9rBOP5s73ZoLfze+X6ihCaQ3u8fkKaX46EhoRXHuX/186AJZ9IkITZGN0pU=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZUAUSkXya5sEIbzdCf2BI6+XDE3lU3FRecFdSZiaqfHgb6e6W9orMbKiZcWZEOeLYAfrCWoc8trQcpDtpg0JNKk2H43ZYMgPiIOr6gs5pJXiT51EPClM4lPsolqlu/oq4lflc4289KrLR4aVpKjfGYQ6h2j8EBksZ3u9YgJrbzFtxblVnwh0mUdvlnHsZ0tnADY9o+gz/OW5mbg3pcYRnCK0i4iRYFGzhSWSypJW4at+jFnWn4mq88nfmZAxP7oVEHXAs08h3PVj5gENsgDxE54u6u4hduL+KDt+AThsdGRiuYuE9QT2PJfSpkWxRcAtRoZ49EOPJgeAd2XotQH+DRg83L/wuajG/hUFdZ0q1Oirose/r7S+sv9o3TuT0PMsTr+NXCZVzNM5Aq5rxOlAFciZNYGuT31mdxKsJS8RaXOJqU61j1Qh9w57PaiYjDha
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:05:06.9703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eea9bc1b-a9bf-45ff-dfdc-08deb63e1fc5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6975
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Tom Rini <trini@konsulko.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: st: factorize STM32MP FWU
	multi-bank support
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
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:u-boot@lists.denx.de,m:kory.maincent@bootlin.com,m:marek.vasut+renesas@mailbox.org,m:trini@konsulko.com,m:quentin.schulz@cherry.de,m:sjg@chromium.org,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 359D9588A16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/18/26 08:54, Dario Binacchi wrote:
> Factorize FWU multi-bank support code common to STM32MP1 and
> STM32MP2 platforms into a dedicated shared source file.
> 
> No functional change intended.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  board/st/common/Makefile      |  1 +
>  board/st/common/stm32mp_fwu.c | 55 +++++++++++++++++++++++++++++++++++
>  board/st/stm32mp1/stm32mp1.c  | 54 ----------------------------------
>  board/st/stm32mp2/stm32mp2.c  | 53 ---------------------------------
>  4 files changed, 56 insertions(+), 107 deletions(-)
>  create mode 100644 board/st/common/stm32mp_fwu.c
> 
> diff --git a/board/st/common/Makefile b/board/st/common/Makefile
> index 122b13c3aa8d..36dfaddfa0eb 100644
> --- a/board/st/common/Makefile
> +++ b/board/st/common/Makefile
> @@ -9,6 +9,7 @@ obj-$(CONFIG_PMIC_STPMIC1) += stpmic1.o
>  ifeq ($(CONFIG_ARCH_STM32MP),y)
>  obj-$(CONFIG_SET_DFU_ALT_INFO) += stm32mp_dfu.o
>  obj-$(CONFIG_$(PHASE_)DFU_VIRT) += stm32mp_dfu_virt.o
> +obj-$(CONFIG_FWU_MULTI_BANK_UPDATE) += stm32mp_fwu.o
>  endif
>  
>  obj-$(CONFIG_TYPEC_STUSB160X) += stusb160x.o
> diff --git a/board/st/common/stm32mp_fwu.c b/board/st/common/stm32mp_fwu.c
> new file mode 100644
> index 000000000000..ac7ca6bdca2a
> --- /dev/null
> +++ b/board/st/common/stm32mp_fwu.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
> + */
> +
> +#include <fwu.h>
> +#include <part_efi.h>
> +#include <asm/io.h>
> +/**
> + * fwu_plat_get_bootidx() - Get the value of the boot index
> + * @boot_idx: Boot index value
> + *
> + * Get the value of the bank(partition) from which the platform
> + * has booted. This value is passed to U-Boot from the earlier
> + * stage bootloader which loads and boots all the relevant
> + * firmware images
> + *
> + */
> +void fwu_plat_get_bootidx(uint *boot_idx)
> +{
> +	*boot_idx = (readl(TAMP_FWU_BOOT_INFO_REG) >>
> +		    TAMP_FWU_BOOT_IDX_OFFSET) & TAMP_FWU_BOOT_IDX_MASK;
> +}
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
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 8164a62e9a3a..9b933a2ba0b6 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -837,57 +837,3 @@ static void board_copro_image_process(ulong fw_image, size_t fw_size)
>  }
>  
>  U_BOOT_FIT_LOADABLE_HANDLER(IH_TYPE_COPRO, board_copro_image_process);
> -
> -#if defined(CONFIG_FWU_MULTI_BANK_UPDATE)
> -
> -#include <fwu.h>
> -
> -/**
> - * fwu_plat_get_bootidx() - Get the value of the boot index
> - * @boot_idx: Boot index value
> - *
> - * Get the value of the bank(partition) from which the platform
> - * has booted. This value is passed to U-Boot from the earlier
> - * stage bootloader which loads and boots all the relevant
> - * firmware images
> - *
> - */
> -void fwu_plat_get_bootidx(uint *boot_idx)
> -{
> -	*boot_idx = (readl(TAMP_FWU_BOOT_INFO_REG) >>
> -		    TAMP_FWU_BOOT_IDX_OFFSET) & TAMP_FWU_BOOT_IDX_MASK;
> -}
> -
> -int fwu_platform_hook(struct udevice *dev, struct fwu_data *data)
> -{
> -	uint boot_idx;
> -	efi_guid_t boot_uuid, root_uuid;
> -	const efi_guid_t boot_type_guid = PARTITION_XBOOTLDR;
> -	const efi_guid_t root_type_guid =
> -		PARTITION_LINUX_FILE_SYSTEM_DATA_GUID;
> -	char uuidbuf[UUID_STR_LEN + 1];
> -	int retb, retr;
> -
> -	fwu_plat_get_bootidx(&boot_idx);
> -
> -	retb = fwu_mdata_get_image_guid(&boot_uuid, &boot_type_guid, boot_idx);
> -	retr = fwu_mdata_get_image_guid(&root_uuid, &root_type_guid, boot_idx);
> -
> -	if (!retb && !retr) {
> -		uuid_bin_to_str(boot_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
> -		env_set("boot_partuuid", uuidbuf);
> -
> -		uuid_bin_to_str(root_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
> -		env_set("root_partuuid", uuidbuf);
> -	} else if (!retb && retr) {
> -		log_warning("%s: found boot GUID but missing root GUID (%d)\n",
> -			    __func__, retr);
> -	} else if (!retr && retb) {
> -		log_warning("%s: found root GUID but missing boot GUID (%d)\n",
> -			    __func__, retb);
> -	}
> -
> -	return 0;
> -}
> -#endif /* CONFIG_FWU_MULTI_BANK_UPDATE */
> -
> diff --git a/board/st/stm32mp2/stm32mp2.c b/board/st/stm32mp2/stm32mp2.c
> index 5cbbbc322a3a..7bc7d2a608fd 100644
> --- a/board/st/stm32mp2/stm32mp2.c
> +++ b/board/st/stm32mp2/stm32mp2.c
> @@ -188,56 +188,3 @@ void board_quiesce_devices(void)
>  {
>  	led_boot_off();
>  }
> -
> -#if defined(CONFIG_FWU_MULTI_BANK_UPDATE)
> -
> -#include <fwu.h>
> -
> -/**
> - * fwu_plat_get_bootidx() - Get the value of the boot index
> - * @boot_idx: Boot index value
> - *
> - * Get the value of the bank(partition) from which the platform
> - * has booted. This value is passed to U-Boot from the earlier
> - * stage bootloader which loads and boots all the relevant
> - * firmware images
> - *
> - */
> -void fwu_plat_get_bootidx(uint *boot_idx)
> -{
> -	*boot_idx = (readl(TAMP_FWU_BOOT_INFO_REG) >>
> -		    TAMP_FWU_BOOT_IDX_OFFSET) & TAMP_FWU_BOOT_IDX_MASK;
> -}
> -
> -int fwu_platform_hook(struct udevice *dev, struct fwu_data *data)
> -{
> -	uint boot_idx;
> -	efi_guid_t boot_uuid, root_uuid;
> -	const efi_guid_t boot_type_guid = PARTITION_XBOOTLDR;
> -	const efi_guid_t root_type_guid =
> -		PARTITION_LINUX_FILE_SYSTEM_DATA_GUID;
> -	char uuidbuf[UUID_STR_LEN + 1];
> -	int retb, retr;
> -
> -	fwu_plat_get_bootidx(&boot_idx);
> -
> -	retb = fwu_mdata_get_image_guid(&boot_uuid, &boot_type_guid, boot_idx);
> -	retr = fwu_mdata_get_image_guid(&root_uuid, &root_type_guid, boot_idx);
> -
> -	if (!retb && !retr) {
> -		uuid_bin_to_str(boot_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
> -		env_set("boot_partuuid", uuidbuf);
> -
> -		uuid_bin_to_str(root_uuid.b, uuidbuf, UUID_STR_FORMAT_GUID);
> -		env_set("root_partuuid", uuidbuf);
> -	} else if (!retb && retr) {
> -		log_warning("%s: found boot GUID but missing root GUID (%d)\n",
> -			    __func__, retr);
> -	} else if (!retr && retb) {
> -		log_warning("%s: found root GUID but missing boot GUID (%d)\n",
> -			    __func__, retb);
> -	}
> -
> -	return 0;
> -}
> -#endif /* CONFIG_FWU_MULTI_BANK_UPDATE */

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
