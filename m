Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOYVHzJMuWnG/QEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Mar 2026 13:42:26 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8612AA0BA
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 Mar 2026 13:42:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8182C87ED8;
	Tue, 17 Mar 2026 12:42:25 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013036.outbound.protection.outlook.com
 [52.101.83.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9351AC87EC5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 12:42:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsKuN8eX1JVbAhFj+T/HvSUdDwI9UTQLHHaEAyJwABejOJGJezPXkAVpGanY354Kwp12uJVmB+xJvwdUGtpkLFJnhzp3tAxK4kvkSFEJiptsizsIxI++DsPThqdvO09fUgM+cFpZ1a+20xlOVmp41ectlrUOMM7jFY3Qn0JOuXIBf8Xcd2Xuxm0BXZIG0GUPF5ZkZsau8YaXKNcsTAv5zHOiWygTqIm8Tjpp8HjV4Rmqs4fTbDkj3WeL0WyxpWF0Lr+iRXnRNvVZtXTFGzeRGo6WYVeC24Mj/sXXIGprN6mVA6/VtA8nK7RtgTIEyK80/Cn1eIU4Eoz98HYx3MphRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVngTnGoDlyWEGzLeo6p04KBUiT29qssiyjWsiod5pQ=;
 b=otdV05r3gq/jwhK0eMKZXPX/A48WPUtDw4z4lvyQoVLn8kGYK++fZzreya1Qir5n/VrWKrypCsphfl2+Ri6e11ZU54U6cB2RYPW9hIW2TDmc9dBVfXzIWad/OuUferYMBZYcBVcjXsgEHT91sTUI2m5aoDl5kgRK9ettg7sBZTSl0hLn+6cO5MPdwChM6/gBG0KOkLjScbdP7PlZl5ouIgZOg5lJHEEpE3IXYUHovqqgQyl86Tgaqm5iwpbPKHFjlcbkvHAtByMrBK6jnEvdrrmpfjf1GkO8DQ6NylsqNK4otdwwYmB4fTm8LrRy3x4bYUEJng9575vUYNPuP8e+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVngTnGoDlyWEGzLeo6p04KBUiT29qssiyjWsiod5pQ=;
 b=ittctm1GX/IGMFDODKQuRAcwAMJ+w/3jNB18eGgaM0jrZc16L64h4njesjEY5EPLKslrGa/xT5vbTn0Y/cA6/5iK6NOkylItR0DlZiUuvLIlRh0wlWPPd+zBVyqcPXO/tHLH8+iY75nobw4dBcBXuG7lfbpHlx38jj/wVhTs7aEMY2i0ROmk4HFrna4hAo/XeH1gk9JpOPDiZwpEPJ/KThFZgL9nFq0ZYTJWaBgPahz1nApuQRttXjId+9sk4n9L3OKJmwj4BYI8wmID8bnpOToOXMYnXBQXvEApYv9UpIKmG7cdOd11I4O+ivmG4daCdSXEppoazkWsg5uMmEcaug==
Received: from DU6P191CA0038.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::22)
 by AS2PR10MB7345.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:607::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Tue, 17 Mar
 2026 12:42:22 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::8b) by DU6P191CA0038.outlook.office365.com
 (2603:10a6:10:53f::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 12:42:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 12:42:22 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 13:44:55 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 13:42:21 +0100
Message-ID: <8add8b77-dc8b-45ce-8d72-1fb21cd391c8@foss.st.com>
Date: Tue, 17 Mar 2026 13:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>, <u-boot@lists.denx.de>
References: <20260317012414.4162304-1-trini@konsulko.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260317012414.4162304-1-trini@konsulko.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|AS2PR10MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 276252d8-f50a-4bf8-8b5a-08de8422a2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: 4VYboZZmjhHpcY8z9zYGf2OEXrqddA2873hTcVod/jlORkppq7JbFnPIGX6HIuw6XYeZhTnpeIaqaQEdiwivpItxDgeXFsH9RGcwNiRTifYYYRyc/FllWm3zrpMnKp1/QkiPJni/dNr8mczh4PmHip4E73UnsYveLER+mOQ5OQLhQt2spfFesii42hM/qXCFRsLIgT+1HQq5qEX69GeuAwGGzTgFy9+Rh2ZbidXqv4kOzjXBvqovLPYK0v6+L8Yk9Qz822+6Wq2M8wT9DXyss22K56FZTVOe/gewPeMrGgEE4vkzL17JNebVrp3bJJNOtEPWzewOJ6/zDXwccvMGxE6Nz7zbngvws1aQf2mhQpuWmpN03nXM2D9H8rkechs9oCXcNyY6KfuNanWPwLSQ6L6aFDpIcfAMmdYwglse0ARK8N/SD4akwgl0FnwR/Yj7/NG7KBYLemes49ZqzZUhue/EEpFKVSoCwkNGioG1uy2XSJrbqf1sibFWGQicHBdHpbm35hJGkgFqkj16MgOtssajdw976hCyqSdrd1b94eicK1zjkKfJQNIPfFHZf3V34L+1JmhN4okjo2PsqO/5C8WNUCkZq9D5GUMod96JF5I23Lb1g73HFsbQT9DwbDHfnkFN0fJblh5UnuVtYB9M8gnHkYd+j4SZJLQd6CEE8pPHjZbXUYUUlToi2VlkhP6BHsc1ZvnQl4+e1VFZBwX53QNekEpi+7/MD6GEEh9KIPubv+2lmHJmVQsCnDcoRXCi/H8AMNlV3N16SXa2EFfh5A==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003)(22082099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: v7L1N1sgf9KraYq0lO3RoMVRrL03DbSSQFYhsYbhNNqmCZl6Q0SdEiks4clMw/qOtEpk+icK8n7eXaz4N+vdXW9bbuwCXvMZE4F5jxjj2eT2/gtC+hMFD2JRJqNEYo2t8HiHWFIYsFsEJpl1+BYiMvSfc3s9P0uXht+uBdm/PyGEfNZxlMkVjaxFzmIXC6MJVmyOYXY0iVbHqOEw8Y+Hhdpniudv2AZli47FrUA3FqXA8iTwfr8Ryo456OF4ZyZlWPGz58OxZn8x/PqzkCqWiV8K1uPpHL9mQkpeEPk6T8p4fWRyxTOx9fsHGmSc2CBiF6ZSYdm5kHb5hnDbqIRb6RFKtohkATo9+mxN4YmY3cDi/GRo9MypG72fgoVuCq/RFGtRPuhOHaEGYNGrJvv3pMUYfI1rNZBvdyfX/bB+t+4o8dm0xHSDS4SofgI4y7hw
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 12:42:22.4605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 276252d8-f50a-4bf8-8b5a-08de8422a2a6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7345
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Nobuhiro Iwamatsu <iwamatsu@nigauri.org>, Simon
 Glass <sjg@chromium.org>, Peng Fan <peng.fan@nxp.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Patrick
 Delaunay <patrick.delaunay@foss.st.com>, Michal Simek <michal.simek@amd.com>
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:u-boot@lists.denx.de,m:marek.vasut+renesas@mailbox.org,m:iwamatsu@nigauri.org,m:sjg@chromium.org,m:peng.fan@nxp.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:michal.simek@amd.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.855];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0B8612AA0BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/17/26 02:24, Tom Rini wrote:
> As exposed by "make randconfig", how we have SCMI_FIRMWARE today is
> incomplete, and in one case, used incorrectly. First, SCMI_FIRMWARE has
> a build-time dependency on OF_CONTROL being enabled, so add that.
> Second, RESET_SCMI depends on SCMI_FIRMWARE being enabled, it should not
> select that symbol. In turn, a number of platforms need to now enable
> SCMI_FIRMWARE explicitly and not rely on RESET_SCMI to enable it for
> them.
> 
> Signed-off-by: Tom Rini <trini@konsulko.com>
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

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
