Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sACjEMzwuGlRmAEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Mar 2026 07:12:28 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF4B2A4396
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Mar 2026 07:12:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A6E7C87ED8;
	Tue, 17 Mar 2026 06:12:27 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011066.outbound.protection.outlook.com [52.101.57.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 332E9C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 06:12:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4tEtowCMOQph6jPefaiIDs5ObKnh4T7t0uM1AceXuCG80BedwM0aPPUtnZMc7NVrrCj77a3o4+BlGJh3zpNfvDusMfhU+PUzIniSVuXE9L/SGx7WOOm+/E0cmzcuKUCCqt6lWwTWX4b9v8NZg0GkMbtkkLVQ7EijWKHNHrlsEjRM//2ShKtbVrwJJqEX944nf2bteMrirPEFLFM0GXoI+dQVdAjFQ4Bs47OZ4O/JCPO1zrczDjyTC4C6iv4AH+OLXuFi2tENxEMk5WVP6idpibxgcnpojTbNAt8wg69qPQ9M39Q5YKcxNpwdGInf64VstmtsYwcEIjNDz8dT+Ld0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crOLjffB4qxKnwaZuMFn6k8ozgfXCvChzRYTIvHKtvU=;
 b=j7iRFrOEItMNGY4clJTBFgF6N5w3SZvmC87xZZHSjtQ/EZsINdsHI709PijL9AGdmzWkGZhv4lkIMqUDroLBy5pSJAyO8v2+sehbTI48eQi8gZ0ZCwJmvsm1DW+BUtCSzdBUQ6H5y2WM2fdO4A7zhdPdxB4RnR37toD1zYQdUE3schP3uJtnNIGzwFCcssYKZZH94592oApCzFZlrDhqhLffoXaCT5Z1C5mQycaR5FD76c2981xbAAfb7T4SKpKJCqeXv033bFS9Cud2IX0EzrcIzFT07ysGgHO+jeSn0CmKQarvtsAzwVnBxHcwxyXDMEipYDMuIkbdgrfVlJleoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=ti.com; dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crOLjffB4qxKnwaZuMFn6k8ozgfXCvChzRYTIvHKtvU=;
 b=CJqSCraUHCJM8bB7EJZDZZr2/yYYpxURP+gWv33p+n9BneF0sL6+9X5TgirorkNQnMculQuYBWkE4qrBQrZCvKMTxxvGE1T9BVMnF6e1cTSR711MX2mH6EAd7HiXI6QSGHFIO42w1K7t3kEOcPHy5skgBZANhGshk0NxWyMNJpo=
Received: from MN0PR02CA0008.namprd02.prod.outlook.com (2603:10b6:208:530::10)
 by PH8PR10MB6621.namprd10.prod.outlook.com (2603:10b6:510:223::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 06:12:23 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::8f) by MN0PR02CA0008.outlook.office365.com
 (2603:10b6:208:530::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 06:12:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 06:12:20 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 01:12:18 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 01:12:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 01:12:18 -0500
Received: from localhost (ada0543016.dhcp.ti.com [172.24.233.9])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62H6CHSd2160377;
 Tue, 17 Mar 2026 01:12:17 -0500
MIME-Version: 1.0
Date: Tue, 17 Mar 2026 11:42:16 +0530
Message-ID: <DH4U2T40NVJG.1HP8TFEIGDROK@ti.com>
From: Anshul Dalal <anshuld@ti.com>
To: Tom Rini <trini@konsulko.com>, <u-boot@lists.denx.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317012414.4162304-1-trini@konsulko.com>
In-Reply-To: <20260317012414.4162304-1-trini@konsulko.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|PH8PR10MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 08e5de6a-6e13-4af0-d213-08de83ec2601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: gXz4mlq2g5yPTW80Uf4T0hEAAw8IheS15Io3CTL5vmhvVbk/+pYaPmn4Yezag08GrK+Dxa17pEKjThROU0cHUKY6gZ2FMAlSmOc3GS4eEzyKRjBWyjKJsHhIJGpfAjw4LgszE8SWUAgUJKp7tkJHGuMw95gurS9Nao77BcD93WP+SsaXCjiamVU8LfCBiUkcabNTJ9x6ISb1bYtXU7ebXjT327a8WTZM9AyEyQLOWP2Y8DQrmB4zKU6wP4fb0Fz9OSVr6V1AkWOHb96Hl/aRP7HNeSYZN2oe3KanO5Junhgexwlwyr0XeULcFnu90umpRaaOvWGihPh14H4EaMsUJ0EZU/Wb/dNKkqLmS1e3oi+wqQSmNiN1JLeJfK5Nv1dKlfelpr0dmu4KUpabWlCOMbt51hqnXtdOKam3mOVF4IY7N4lUKnlaZVMaq5+MmgDzZw6+Z38ucIO3XkCTNZryB5sRv20ccsCLWaQNCp9S/1BqSnyuTHJkgAa/8WLDcQsOKUqT+Lf5dxISDLTiBCOjERSmtcDKNDRk3SQjE7kjH5/jskISil1tze1StcLu4pFh8ygX7kXdYHq4Spu2Gc1fU2odOjivJLKmEm8pr1oUm/Cnhc9FNcN63RkwytpqvLRp8setHAttpkLFO58Z6AzywwJAr+lvqeNu6gX8EeRMa9x5idz9FrLBxHEADqFADXvFq9y5pMIlkYooBaxvVMxAmDMVvk1MsHeIVGw0pUxD/kHJjRo2wxXkPBo7/lwM2fOJR3f5Ikpq7qJ2Azqee7jAnA==
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(7053199007)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vQeb86NUWl13sAlAYRT5tQSB6oRjY6/8jyvIyfaOt4pOoR4Uq4T1vX+miikiLysNYD6JolrpVsEgAdmgLFunuQfqE3PqDvS3LI4vLnnyp70S/0BEvtFeTRhGQ8btgEkaerR9ZKtyMARkmmBc0eDRF83WMhLq30eC15RQkoaxouQ3Z5OIe0o3zvboqZDEpXxpCzVqDY2U9b+Peaz8FEyPFFN9eoaYJJ4ZH/9A8oiwQKSowcYeffF9m6nTJwL3Pe2BOYCDr6XHkh4s7NUFcQYpch8zfa7wHGIvCaUucwNUIBbPqTD2SfJPi5WcYt6+yhz1muAlDc0ivnW6gG4NYaMIOEn0s96ajp/rDL0pxQQKLWWTSQG81/jN1bBVMSCvsw9l3JwxoQjJjZDENtr+mclk2x50gSOU/20tXoR4YsGgRJqXGOOHBJgnVagPlrjzH42k
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 06:12:20.5265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e5de6a-6e13-4af0-d213-08de83ec2601
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6621
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Simon Glass <sjg@chromium.org>,
 Peng Fan <peng.fan@nxp.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH] scmi: Rework SCMI_FIRMWARE implementation
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
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[ti.com:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:u-boot@lists.denx.de,m:marek.vasut+renesas@mailbox.org,m:iwamatsu@nigauri.org,m:sjg@chromium.org,m:peng.fan@nxp.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:michal.simek@amd.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[anshuld@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns];
	NEURAL_SPAM(0.00)[0.027];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[anshuld@ti.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: CEF4B2A4396
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 17, 2026 at 6:54 AM IST, Tom Rini wrote:
> As exposed by "make randconfig", how we have SCMI_FIRMWARE today is
> incomplete, and in one case, used incorrectly. First, SCMI_FIRMWARE has
> a build-time dependency on OF_CONTROL being enabled, so add that.
> Second, RESET_SCMI depends on SCMI_FIRMWARE being enabled, it should not
> select that symbol. In turn, a number of platforms need to now enable
> SCMI_FIRMWARE explicitly and not rely on RESET_SCMI to enable it for
> them.
>
> Signed-off-by: Tom Rini <trini@konsulko.com>

Acked-by: Anshul Dalal <anshuld@ti.com>

> ---
> Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  configs/amd_versal2_virt_defconfig  | 1 +
>  configs/r8a78000_ironhide_defconfig | 1 +
>  configs/sandbox_defconfig           | 1 +
>  configs/stm32mp13_defconfig         | 1 +
>  configs/stm32mp15-odyssey_defconfig | 1 +
>  configs/stm32mp15_defconfig         | 1 +
>  configs/stm32mp15_trusted_defconfig | 1 +
>  configs/stm32mp21_defconfig         | 1 +
>  configs/stm32mp23_defconfig         | 1 +
>  configs/stm32mp25_defconfig         | 1 +
>  drivers/firmware/scmi/Kconfig       | 1 +
>  drivers/reset/Kconfig               | 2 +-
>  12 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/configs/amd_versal2_virt_defconfig b/configs/amd_versal2_virt_defconfig
> index 94dce5c191c4..8cc210946539 100644
> --- a/configs/amd_versal2_virt_defconfig
> +++ b/configs/amd_versal2_virt_defconfig
> @@ -80,6 +80,7 @@ CONFIG_CLK_SCMI=y
>  CONFIG_CLK_VERSAL=y
>  CONFIG_DFU_RAM=y
>  CONFIG_ARM_FFA_TRANSPORT=y
> +CONFIG_SCMI_FIRMWARE=y
>  CONFIG_FPGA_XILINX=y
>  CONFIG_FPGA_VERSALPL=y
>  CONFIG_DM_I2C=y
> diff --git a/configs/r8a78000_ironhide_defconfig b/configs/r8a78000_ironhide_defconfig
> index 180704e75af8..64e2c278a7e0 100644
> --- a/configs/r8a78000_ironhide_defconfig
> +++ b/configs/r8a78000_ironhide_defconfig
> @@ -29,6 +29,7 @@ CONFIG_FIRMWARE=y
>  CONFIG_NR_DRAM_BANKS=16
>  CONFIG_POWER_DOMAIN=y
>  CONFIG_RCAR_MFIS_MBOX=y
> +CONFIG_SCMI_FIRMWARE=y
>  CONFIG_RESET_SCMI=y
>  CONFIG_SCMI_AGENT_MAILBOX=y
>  CONFIG_SCMI_FIRMWARE=y
> diff --git a/configs/sandbox_defconfig b/configs/sandbox_defconfig
> index 36bf37827e91..b681b91c3f99 100644
> --- a/configs/sandbox_defconfig
> +++ b/configs/sandbox_defconfig
> @@ -209,6 +209,7 @@ CONFIG_SANDBOX_DMA=y
>  CONFIG_FASTBOOT_FLASH=y
>  CONFIG_FASTBOOT_FLASH_MMC_DEV=0
>  CONFIG_ARM_FFA_TRANSPORT=y
> +CONFIG_SCMI_FIRMWARE=y
>  CONFIG_FPGA_ALTERA=y
>  CONFIG_FPGA_STRATIX_II=y
>  CONFIG_FPGA_STRATIX_V=y
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index 6bd139441122..620a6da2efe3 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -70,6 +70,7 @@ CONFIG_FASTBOOT_FLASH=y
>  CONFIG_FASTBOOT_FLASH_MMC_DEV=0
>  CONFIG_FASTBOOT_CMD_OEM_FORMAT=y
>  CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
> +CONFIG_SCMI_FIRMWARE=y
>  CONFIG_GPIO_HOG=y
>  CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
> diff --git a/configs/stm32mp15-odyssey_defconfig b/configs/stm32mp15-odyssey_defconfig
> index 868ba1915f71..5d1c01c99fb3 100644
> --- a/configs/stm32mp15-odyssey_defconfig
> +++ b/configs/stm32mp15-odyssey_defconfig
> @@ -86,6 +86,7 @@ CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
>  CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
>  CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
> +CONFIG_SCMI_FIRMWARE=y
>  CONFIG_GPIO_HOG=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index af2efc7bceb0..c26602b63b6f 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -88,6 +88,7 @@ CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
>  CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
>  CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
> +CONFIG_SCMI_FIRMWARE=y
>  CONFIG_GPIO_HOG=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index 226d83357843..d7501612a797 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -89,6 +89,7 @@ CONFIG_FASTBOOT_MMC_USER_SUPPORT=y
>  CONFIG_FASTBOOT_MMC_USER_NAME="mmc1"
>  CONFIG_FASTBOOT_CMD_OEM_PARTCONF=y
>  CONFIG_FASTBOOT_CMD_OEM_BOOTBUS=y
> +CONFIG_SCMI_FIRMWARE=y
>  CONFIG_GPIO_HOG=y
>  CONFIG_DM_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_STM32=y
> diff --git a/configs/stm32mp21_defconfig b/configs/stm32mp21_defconfig
> index 8ad31292579c..6a74a435f8d5 100644
> --- a/configs/stm32mp21_defconfig
> +++ b/configs/stm32mp21_defconfig
> @@ -51,6 +51,7 @@ CONFIG_NO_NET=y
>  CONFIG_SYS_64BIT_LBA=y
>  CONFIG_BUTTON=y
>  CONFIG_BUTTON_GPIO=y
> +CONFIG_SCMI_FIRMWARE=y
>  CONFIG_GPIO_HOG=y
>  CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
> diff --git a/configs/stm32mp23_defconfig b/configs/stm32mp23_defconfig
> index 49f47becba64..ed6fdd9662ef 100644
> --- a/configs/stm32mp23_defconfig
> +++ b/configs/stm32mp23_defconfig
> @@ -51,6 +51,7 @@ CONFIG_NO_NET=y
>  CONFIG_SYS_64BIT_LBA=y
>  CONFIG_BUTTON=y
>  CONFIG_BUTTON_GPIO=y
> +CONFIG_SCMI_FIRMWARE=y
>  CONFIG_GPIO_HOG=y
>  CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
> diff --git a/configs/stm32mp25_defconfig b/configs/stm32mp25_defconfig
> index 99b22a68fda6..42335aafeaf3 100644
> --- a/configs/stm32mp25_defconfig
> +++ b/configs/stm32mp25_defconfig
> @@ -58,6 +58,7 @@ CONFIG_NO_NET=y
>  CONFIG_SYS_64BIT_LBA=y
>  CONFIG_BUTTON=y
>  CONFIG_BUTTON_GPIO=y
> +CONFIG_SCMI_FIRMWARE=y
>  CONFIG_GPIO_HOG=y
>  CONFIG_DM_I2C=y
>  CONFIG_SYS_I2C_STM32F7=y
> diff --git a/drivers/firmware/scmi/Kconfig b/drivers/firmware/scmi/Kconfig
> index 33e089c460ba..cd912ebe4096 100644
> --- a/drivers/firmware/scmi/Kconfig
> +++ b/drivers/firmware/scmi/Kconfig
> @@ -3,6 +3,7 @@ config SCMI_FIRMWARE
>  	select FIRMWARE
>  	select OF_TRANSLATE
>  	depends on SANDBOX || DM_MAILBOX || ARM_SMCCC || OPTEE
> +	depends on OF_CONTROL
>  	help
>  	  System Control and Management Interface (SCMI) is a communication
>  	  protocol that defines standard interfaces for power, performance
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 2fd91d6299cc..66911199c8ba 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -208,7 +208,7 @@ config RESET_RASPBERRYPI
>  
>  config RESET_SCMI
>  	bool "Enable SCMI reset domain driver"
> -	select SCMI_FIRMWARE
> +	depends on SCMI_FIRMWARE
>  	help
>  	  Enable this option if you want to support reset controller
>  	  devices exposed by a SCMI agent based on SCMI reset domain

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
