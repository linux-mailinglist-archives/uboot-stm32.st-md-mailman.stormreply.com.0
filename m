Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NNoAImGFmqqnAcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2026 07:52:09 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D065DF94A
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2026 07:52:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C8AFC8F287;
	Wed, 27 May 2026 05:52:08 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BD20C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 05:52:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B61cXFNs5L8zoHMAqxOICg83EyMoEfL5QeJ8I1NGzUcYERpQduW64r4F0Z0gDQ1EdpASf70qpsimt52fPkvhP6XXxXbM18Ysg8hHxf7CJvW7v3HYhNP8Hvj1Pnqf1DZKhfrLKZFcOnxLex3ShUDDStIA1y9reCDfaP2GDx8QoyBHEBBf8hAl9MbYFz47Lgp/Ju2jwAP+Od2hF/Rc34SWxshsyv6kovgingR++Sj6jh8BYf0MpxDhimZzG0Yja2eO1zjhKhXKzv5ksxrsDbW++fw9iApFCS/QVxfKaNpiUzhcwIC43GNnEzBkRFvpkAqiZ6Wx5DlanNZNzwvSSerSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xTPhH4WFeyzc9VGjS3bQQRa5RgIfC9An7VYSTkyC80=;
 b=zTLNgeEU4+I3NGcCBpjnc4li1yd+SOHKaRDwTT01yC83HWGsOImjcbunpl3y2EH/e7RWg4Iz/c0/I5yZxyupY8DqtH8t76l1LNfzoFhZcsEFA9HKSc9mQITK0nXn4a5OydWxOgvrZ8xXyA30zIL3/FrkK4mIUx6lbR2iaw9k+/iijKtZvzYejxlIkNgZJP5ndorkK/aFqWEWbuTOEr2lUuXlT3zt89UursNvY7ReOKZ6qKzqiVojFsHhQcMdP1j0gpC3kjJmCS9ZxmpMiZ2OSzhqxKeDqtgGI9XRQtt0Dmq0tCkNeJ+otHB/WPZK6x7HCTIBbVpxslJZyE40lu11jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xTPhH4WFeyzc9VGjS3bQQRa5RgIfC9An7VYSTkyC80=;
 b=IMf5uOVK6V/+maIeU0R4bAzzkdwY7hslODS4Dbq7Ew31A2yeyVxy8blztRcId45gOglY6KXii3IMSKiISMZcPwJnVH8GBHtSDu02CqyPx62+jHpzo8VcRbEVWGkj5TEu17AW6/6Pci0ovR6Ej04wlq9Kxz2ftpg1JRiNTNIg7vB+muOpRnUR5JjTAK6+J3A1uhBfpcRKyMAS3nk3WdxkLMCLJo9tH3PiA0nVRq6pGDy127Il/8WHewjNZf6XzZVXcyiOseA+Gr5voxLZcpuMkpHS2dQkupvRq/+mUl4Pa6X4glij1+DOa0rAjDxT6XXabH2Vye5NGXNxb18eGI8Hsg==
Received: from CWLP123CA0177.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::14)
 by AS8PR10MB6436.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:569::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 05:52:02 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:400:19b:cafe::dc) by CWLP123CA0177.outlook.office365.com
 (2603:10a6:400:19b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 05:52:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 05:52:02 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 27 May
 2026 07:56:07 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 27 May
 2026 07:52:01 +0200
Message-ID: <2c568a5e-897b-4efa-b1f1-24620ce07cc1@foss.st.com>
Date: Wed, 27 May 2026 07:52:00 +0200
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
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78E:EE_|AS8PR10MB6436:EE_
X-MS-Office365-Filtering-Correlation-Id: f80f68c5-b687-4463-8397-08debbb41328
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: hnzx5jHuOR9ILmpMdA/52va43MgOpJnviX2GkTTHv0RRTUjH0mbJQMIkbIKSOtKSusqwUXAKiWYv8juyElU43EwxB2Z5x/QTYymUP8qRaTIHo+zD2o233rX8e1DyUDt0yWwUp0h1LaTlpaptYQzGzLeBkDunzQX1a86gHQruR+UqDxlGucpwHGmmHpbuY1TTmbowgQPQdfc3eFknM8UrQYsNPWnGtnVV3PFYTIbYGaTinj1OLw2VighqN5om1xiVdaM99YbznoCYXvgIeWBFZgHiFkOAa5CafqWkQfElzehxiB8cvSsMKZQQrtuE8VdXOq3+Sk4DHaxI5Mx0FhgUnAQspyW1JnQTy9BK6EVoBlD1v54RLygVE+LAAKcniIPRM41tgVf336/yhr9aO9pzBMwhgcPocLPIgFubnuNy0OPOUMPO0wcjl/hGfuf7E2ILWDZYskgFdd0zUmFEqN+YEtJ8haid2Qr/oiDVkj//LrrhgFrhaw92DUFz+48h8YCJeFqdH2dzpSfCpIfnmYpitCNwSohgUkLYs6Z6/KU5OZjfPkWH//yBJqd806eboCzhyjzKWuHw30y2m4DpylA2rR44niV9Kb3LYijxiMGO68u+sBSHh5ELkkVljp7AvHxj+4VxFwvKNJo9WZlskX5+EVQFhrWcn5fZR0Ck80aLaLdycgxQGbWLzHP7o8XO5V9nznYcdkC6GpJ4OTIXHpfw9KytGLyxWaamTeU8lzw6SXE=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WQzcL8PvGVR/5muXwvmqnkpxyp2DspvdnetCdBEJu2ij6PbHp0rNKDBc36BySU9GYWoWTe6hyNu6ipS9MY2mnTax+8JhKP4e0Wi36ApliVc/Oy1T6uxY/25M4HCO5L8wxzfZBCS6zGa5gd8fB1ReJsZFFrE/+kXYSgxlqSRK/a5bSPTAhKzJS6tBgD8I+roUMkVmrRnK9X1p6XcyHJel4CxD2oOJsIgeT5OH+6Qm3rR8R326yG/k+ba9ejVkcXw4/j4lMyyD1CohIbYp5jy52p3GQBVMqTB7HSd7oaGzhlNNEPWgCt/54wQEwZ60SsO5Zvq6MrSdf02Z8mXMvagakOvB8EmTUWevAZSjU6XUurKIGvT+EKHgdemsy5dt46T9MSbK2R96L4gS2Unxc1CciD8yIuZAM5cbOb9GL57mq5IeJyjwnsZclWy6zcgPbTR6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 05:52:02.2287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80f68c5-b687-4463-8397-08debbb41328
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6436
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,amarulasolutions.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 93D065DF94A
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
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
