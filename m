Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DMxNd2FFmqqnAcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2026 07:49:17 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C41E5DF8E1
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2026 07:49:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06F3AC8F287;
	Wed, 27 May 2026 05:49:17 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21016C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 05:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tiup7YgSyaoeR0S+GnIaTZhsZlqne933nJaUWV6JAYW8qaxlsbe8E4WKgpcrfLBvHnMFKEaehKJEsJi89I7HJMwQR4I9H07mKNZxLgC+QiMk487EIA5uvPZnDjd86S/o/WAjdG5/F31HBF5uiSVEsdP30XgN5BK5kPbAODYE5bUKA7PPGo1MHoIpzu6Bnxe357hDR8+6sitgQE77rBv34bLfgK6byic9eS7iw9QQVEEppTZJRMHxJw05JFSmmKMY85zggfnYBDAxzDOL1SHTZsuM7upyx3cKcTtuqt0/y9P7YFh9nCBEdyK/HbrWYsXowzQFUgeqgQ3t5YQKiaTtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvBSTCmwHy7ivQvxDkrNgR5bGe4fNVKPqyybiv5RMcc=;
 b=P8WK5z4bkTrpbkb4ansu7qrdJgTrgyCr1e6n2qILuQS12QN4+Qq7awuZF3XP3OVbKZxhO4JSG4hjGgJy8eWGRtzfOo5NvynF8QwWFIioWPAJbr3DEVh0cE5xhxIXfmFdw5bzmqEO8E7nD6JHZm2jB2FvLHLwMbgTjsjYc7Er5MM83kEqcHX2aP5By4WFoeOmFP6Wz0CT+rXVcpraB0q+h+/03bxK/RSueBxbaI86F885ED+kwQRs0jifSL8ouPXyEAYYEeF7B5/7NbMJmjTwdJDV7WGBsACWE+QOkdjfK2q/hdzGA1PDozEtqyGMhqXX8bUGO4ecisQZRgOW2qz1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvBSTCmwHy7ivQvxDkrNgR5bGe4fNVKPqyybiv5RMcc=;
 b=MIu0OgFZ1otOJIAPYC7wk6T4gQgKMoeP7M2rV8VLSusOgximBucWzYL4a+PqPdR+qnznL8ZLpt2LtuzyNY5ppiDG8xldsQBoUH0q84sng2DLeypcL0Lw1ztxONq58tu/c6ivAb2A8j7ya0ZRHS+UWQobaoaKMWzTp+k6TJLCcXuusgtrgA9Ay2v93nWW8ah8IYRY8Fs85t23rN1iv1A7vikdtJxrcyg6TZl73VMginmGu861pLW7eLFLBlEBC5I2avgwOR59HF/YH55n5UMfeu1VSTrCONh9DP8SjR0kfW9Kxln6XD3VF/JF29HHcLpTSwSehcKDJ0F+4B4mtaj5KQ==
Received: from CWLP265CA0537.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::6)
 by GV1PR10MB8417.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 05:49:12 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:400:18d:cafe::5d) by CWLP265CA0537.outlook.office365.com
 (2603:10a6:400:18d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 05:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 05:49:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 27 May
 2026 07:53:17 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 27 May
 2026 07:49:11 +0200
Message-ID: <2ec9ca08-583e-4432-a977-2165b43334a3@foss.st.com>
Date: Wed, 27 May 2026 07:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260518065443.2531017-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260518065443.2531017-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AA:EE_|GV1PR10MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 4178f299-624d-4bba-4b84-08debbb3adea
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: m1hUlye54Tfzx0QtSUbnPNuiaX3n7jxYzxJHpzQIvmbmE063ZS+MoDnXm+E1RvGbFtHUZFjy4lPqnsQ3ANf1UqiXclRG3GyuL16PTdj2diayIzpd23wwPfkEwGjErJR6S9GdOKitATP983U39vrnl5l8aQVZeAw9uBev7/HhjCylJu/+WT1N/pQhTY+FfaBWYK4ZDhjiC6B+Ut7UmCA33kczXjm5P8hWHgHgVXFtsQAcxq4CiX5ThsxQovuIYlW7xbI6hIhco/suIzjDGKwEr8t37ICzw4pey4KY2BqcLOr86c2MytIvOMHk8GidJBG4KQVp2JVyGw9NZ+yFRixVb6t3K2tBJ+y+3dg3PRWIZ/TtvEFSdI2EOetwd5X7t8SIgERN+BQBgjNCCxU1pK4SqTlPoChmfiX63ywY9pUknzeP430wWufb28YJPqcR8ImTJSrrDWTO6/fzn8OaZ1y1CgbckOq9Se1Y6/aXcAZ8x6IQqB7UF67zefGZiCO3GGcBhd7C0W8eYB398IKfgAgm++zbiY3Ln+TQe1AP9+t6YDudC+D7iKfpc7bmxdz9XfvCIHthvvNMgTSoEngfC+vNdWdDrUFyE2eEXw6SjkwDBeUmQbX36C2/t25Aydhd3qOZ4sr8sgxH++cuVpHIOcYY+WNlpmrfc49xkbpzbCRlGb+TlEERbOuUE82qX4lWwJ4bqKCPkerPaCXrgKsKUnbr4J/eAyit1zMSJqdfZ1OV87c=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fVWAHPEja6kb8ejYpO2fhVxIb3T+mvhhI4LrXvYiwvH6sCzEL2yOLKFZhEizTduR7dR+qRCRHd/Db2mGUTmPheIh+UIIKe9L9eDN3gl44BP/HRsHchUIbZ/RUHJC5Jky064MTvOn2F1v1WE6h+54t5xE0+Ik/MCzFhuzZrMStasC2THZ6NdZqOF+d7aofuIup6DFob3r1nKdpC9krjNhjB+it9WxAczgVtVxXK5Ici7DwAcdOCrvDowHPQER+MXjSHk7KyMaZ6uwr+4xaDHKezdCUa38LWWlWmTwkVQK2kFuKG9f335Pz6sggu6EiS5i3Q+LXaVATtzseM9HBRxlA+FJBTvkhBjgP3glORe6CkhlRl6RIHudrLzTGgj/8Huh3Idr+ZXHul04mJcCNtTt3wuVWrrgK5WMGxYd8b5afJ+3bIKpoFNlaBMBY4Jnq3Ot
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 05:49:12.3716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4178f299-624d-4bba-4b84-08debbb3adea
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8417
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,amarulasolutions.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C41E5DF8E1
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


Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
