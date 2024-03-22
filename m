Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0151886763
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Mar 2024 08:18:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 853DCC6DD68;
	Fri, 22 Mar 2024 07:18:08 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADF24C6C85A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Mar 2024 07:18:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0Lw89hSwV3RzhIoXSYHEY+iDUrWzRbOlIXLRIGSLIBgQODZUhX01UpxxC+M0MCd5pHdsNBKU7/rEjc3d+K73wb4UXxEjt/uglQ66XYw8c/qprWJlnOniOhE1PjmIuTjAsJ4uDbO3AgGT/E0YmzHX3xTIEmYZ6PwnFFU1qfE2vpvnIIPtMWELvf7zbJmUh/CZOrbHbXNKin45ELyHkIc1DhCkWhVVCBX/vP/f37xvPJ+JLDWVf7bDElTj0LGuCjxvI5rT86JH6r+I5NWPr1UZXdcaUDUn9r2rXIq3bsN5enyoAJC4n5aUig32XdcQoYW/0kAsLa+R68qxl1ubGFAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgAiAOC2+R6RWfZWIr+qNbDSBFKYHXRFcLG0SqgN+UA=;
 b=Xc7HYe0wn7Uefii15V9VZFVNXIVUNIp8wt3lOE6R9LD8I3fy3M9lTLq2+0o3P3xBBoPW4ekbeq9bVkJn7wsdN/9T/wEhcd/m0Y4xlcuK+L0wwaGTfpi1glzRB/FESKhSSxfTlBGMsrN07TJfwUZi6WLPydwaBMybIVZ7AvAzsj0A4k6MALg9ug9MC4msqhs0QSU1p+1Hc13whtYWeZRglNu6xPTMbHkH8iXWxJpUX94E/zt33eYDAQnYnr0HfhbQ2oRfeeVGqoNH+8wh3yDbeRVReB4AneUj2LzHIiHLdPN2WJ+aevXdQd5MVgnoxIHEvP9GpR20V1yoafsfIqT74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgAiAOC2+R6RWfZWIr+qNbDSBFKYHXRFcLG0SqgN+UA=;
 b=dgDzKVOsg1o539L/4JnSpwhXtYnh0SduPMPjjL6fCYfLWdlXjXP4sC04cbKoxsUZ8EK7VFWoZacmp5/ndo4ParbaWFsTuLc3OreFrZ2TfutdOSGV5WUaE+8s3gRc9iilW/BwYuKUBOOruIilJ6J65EEECoUABGyEUn8LsHGhxBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CH3PR12MB9430.namprd12.prod.outlook.com (2603:10b6:610:1cd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.34; Fri, 22 Mar
 2024 07:18:05 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::6622:ec76:9367:3907]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::6622:ec76:9367:3907%2]) with mapi id 15.20.7386.025; Fri, 22 Mar 2024
 07:18:05 +0000
Message-ID: <db1febc0-508a-4a1f-a373-c76d38a8f4d7@amd.com>
Date: Fri, 22 Mar 2024 08:17:40 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini
 <trini@konsulko.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Matthias Brugger <mbrugger@suse.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried
 <rfried.dev@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Weijie Gao <weijie.gao@mediatek.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Rick Chen <rick@andestech.com>, Leo <ycliang@andestech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Dai Okamura <okamura.dai@socionext.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
References: <20240321-b4-upstream-dt-headers-v2-0-1eac0df875fe@linaro.org>
 <20240321-b4-upstream-dt-headers-v2-24-1eac0df875fe@linaro.org>
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240321-b4-upstream-dt-headers-v2-24-1eac0df875fe@linaro.org>
X-ClientProxiedBy: VI1PR0202CA0005.eurprd02.prod.outlook.com
 (2603:10a6:803:14::18) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CH3PR12MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f2d72b-d871-48f9-3431-08dc4a403799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkxlB09KdmiJP0qJGyYSReHrosTN3wy6ObpMTqCf/kKmo1BCZFeIdmjGOi2sRTYCzQiECKY/RC8kXdMpitE4IhYlPYMhju33plm1AZceLdJr2cMIeoNbcPwxYSOCei7rdvTmTfTtPHCMiFFMcHA/M4gwkm+3G9eZ3NcfLuTNnXp3wqIKG/dqeVtCkYobks+X+NF2U35d402/Ibb7+HprFn7NOIY2Z2hqVpc1fWyXK6NfTPyORlCOd7/vnbhs/wVemxx4TM/yH7flGd7aklL8qtnIfL40fwTQ4x5otYgi/BuOYxoQrM9/gCG7HTaCROI/8NJCP4Ot7mVtl2qoxVnsQK/GZkXdZG99qXQU+SL5IUZnx8dCt0/BEURWtXRWxdYrx37tpcIKjfSx9+oxn3ZUmOMISjtJ8agAQUs0W/2MtDrLTc9PE4ep2sHx3uuGULDG92b0J8qDbX6XUrrBHvTjoBxQXmbHJ57UPCVecGNXMocHLSgjp+bDAlLiaBx0Z3gb10Mr46wTpb75VIZxnR2c4lK+Gr+Mq1310k/pccVmpXeS78X+iF2+nqx+HpcVblR7572ShFd8td0UCUrTssS4y5R5eSMWjH3gjYLirX3PbBeD0gCgbyApd/rK1V2Qg6ZAh1gZHIJUTupvXIqhAOvbvLL/n0vfDQ3n0Keq7DrSGOL2hrsBWoC9SLzzIl9eMlX8zC7UYkbGy0unLXhBsB9AEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8109.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(366007)(376005)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1RlWkR6a0FOUEVTckZJRVJRSjg1ZmVTY2xQeEd3K1hxc1Y1RVhFOEx6SlZE?=
 =?utf-8?B?dnBnbE1nL3JKUXFZZlk2eDdhSm1VbStyOFhDcmx0VklPbHhiV05ISFhkeU9w?=
 =?utf-8?B?YWZGbU9VcGZqb091cEpnUTBONFdoNU1vc2hYTE9vV0g4NVFvVGRjazRlTVJG?=
 =?utf-8?B?eW5nZlJEZGVPZDNZMDJFS3o3eXRnb1VrUS9VRW9rNjdvcWZkYXlrd0RoREVs?=
 =?utf-8?B?MzZLNURodWtZTEZlcWZUQmRjczF6VVYrMnF6VTRZdDg1aFhKcDk3dWR2bDB6?=
 =?utf-8?B?cXlZN3RYcDRUcEhiVFZLSmtsSjdXZUlrQ3JKLy8yRTVUK0xLZzBTY1NpWUd1?=
 =?utf-8?B?WHdWWFBOU0w3NXY4bmlsa090S1FPUUsrUUxXaG02TjZhNTJBRDN2K0Joenkz?=
 =?utf-8?B?NjhSVjRINzFySm1WSVYzeUwyYStjYkJuc3RYcEdrZ3Y2VjJPWWZML1lYMW5n?=
 =?utf-8?B?R3lacFFCc2wrZjBob1ZreUtGVXJTTmxsMVZJQ0tGQU55TzBoUURmZzhjVTEr?=
 =?utf-8?B?VXhmTjQ2NUtLdUwwbmZiNzdqdUNyOWZabFdOSzVLWlA0QTE3R1pVZkJjenRL?=
 =?utf-8?B?N3RnUG04UEg2dWQ4ODhZa2tiY0hwTlUzSjk1Q1JQWCtyQ1FXQzJ6bzBNdjdF?=
 =?utf-8?B?VnhJM3REUFBlNTBpTXoxWUN0c1VMUjBJQ25HYWh5S01TQ213clI3SGJMM3pR?=
 =?utf-8?B?RjBvSE9kMXZHTkJXdVgxTkpTTUZGaTdaOVR4VWF2VG1PRWw2Zkhib0tvRDc1?=
 =?utf-8?B?c2llUXNta0hCdXQ0Z1JUZlhDdmJudlo4dGJ3d2g3T0hUSWFqc3JpUlFOVTR0?=
 =?utf-8?B?cjc3RHhGUzdsVW1ndzgzazNxUllXQ0JIMmlsR2FmVE1pT3J4K0NIMENHdTZz?=
 =?utf-8?B?QkhyQUFVUU5QdGUwQjFSK29ZQkxwTEF3enhBUFdJWnh4Ym9UUUpTQjkyVUE1?=
 =?utf-8?B?cTAyNHJnYzVTbUZ5Z0pUNWVpbjdHQ1Q4dGQ2Mkx4MkdqajFHdmIrV1VpMkxS?=
 =?utf-8?B?QURyQkhMVGd4dFBIWVZUL21YR0FHVmpWUG0yL255SzE4UkZqTkJocGxWcFZP?=
 =?utf-8?B?UWMyVGF4ckFzNTF5VlFUZU93OHI2dFZFQVJBSnovSWdwMFNuUm9Pam1TcVc5?=
 =?utf-8?B?dEdTaFlQV1BvWWhYNFFxTS9VSW9rUUwvSDNhdVg4SjRZekhLbU1UblZ5TUJ5?=
 =?utf-8?B?MndwMHJId3FwN2k4bnZBQmpoYUFERXpOQlZFNU1NWXFrTkJCU1dmWm5QOGx2?=
 =?utf-8?B?VFd6SUphbENLZWxVQnl2bkQvcFNmbjlFUVp6YVluOUZDSjM5amFwOHplakNa?=
 =?utf-8?B?R3g2RWVHQkpJN2c2bUdOQkZGSFlFLzJCeUhlMytXemxzQnpMd1dlRXBkb3BP?=
 =?utf-8?B?OVVmQ0d6UkZVcUVJWGNiZ2U5STVNempDaHYvekg1Q1FQM2xlZWdaUTVHMlpH?=
 =?utf-8?B?WUlOL1F4OXI0VGM5TUZZR0gzaXR1WnlUOHZhNWVTeXVrOU5sbFRGbXFURmVG?=
 =?utf-8?B?a2RJRk9nMThKQ3NQWXhGT0YwbkdWVXNvcGlsRjltNXRwRW9PWVA2MWJ3V1Za?=
 =?utf-8?B?K3VvbURBRWUxd1E1bzIzNnY5U3Jkd1F4Snl5bThZUkZENHNFaHM5NXc5QzJ4?=
 =?utf-8?B?LzdzdkZRc2lia0V6STVzdWg4YnA3NWZ2dlhlUFFKRUdsRHFKdWZJWldYTCtG?=
 =?utf-8?B?amRORHVDMXY0ZDNwVGRocGZmSU9VMWM0R3B1cWtHbnErOVZxckVVeXNrMTdp?=
 =?utf-8?B?TGJYd21Kbjg2YjBLeld3YitYalhzM3pnaXdBbUhWWFNaZDllUEJqUUM2Z2Ir?=
 =?utf-8?B?TnpMcDdOdUdtYUtXWjZXL253V0pVV1A5UC8rUWVVYlovRWtYdFJIT1hWYVJz?=
 =?utf-8?B?SEIycWU2SEZXTFA3ZllldkxtQ3dOYzFjMXdGL2xkZVVRR3AyK09lOFFybTBK?=
 =?utf-8?B?Z0JoMWUyQWhQV2pmT2xObWg0cWZIS3lnVGFHSlRJNUlkTWd4U0x6YXB6dE5i?=
 =?utf-8?B?cEtlV2FmYWpTMWNLazhkOGRzWXQ1MXArU2tLUnZBVzVuNEhwOHRNRVRzMmdi?=
 =?utf-8?B?a0taSi9NZ0Y2WnlLTXZRN3ZrbS84ZHorRE5ENDNDaXh5a3M3SkxoUFI2ZGY0?=
 =?utf-8?Q?cgw5OLHW/LXCSCfmvCq9ORwt7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f2d72b-d871-48f9-3431-08dc4a403799
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 07:18:05.3589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qsj7+4ihYF0W93zsSuQjveb2zMmu7VgoLGJAySNNXbhIjbVyb/OqNsTu3aFbj2ob
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9430
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, u-boot-amlogic@groups.io
Subject: Re: [Uboot-stm32] [PATCH v2 24/24] dts: support building all dtb
 files for a specific vendor
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 3/21/24 22:04, Caleb Connolly wrote:
> This adjusts OF_UPSTREAM to behave more like the kernel by allowing for
> all the devicetree files for a given vendor to be compiled. This is
> useful for Qualcomm in particular as most boards are supported by a
> single U-Boot build just provided with a different DT.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>   dts/Kconfig          | 24 ++++++++++++++++++++++++
>   scripts/Makefile.dts | 13 +++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/dts/Kconfig b/dts/Kconfig
> index b9b6367154ef..6883a000a052 100644
> --- a/dts/Kconfig
> +++ b/dts/Kconfig
> @@ -100,8 +100,32 @@ config OF_UPSTREAM
>   	  However, newer boards whose devicetree source files haven't landed in
>   	  the dts/upstream subtree, they can override this option to have the
>   	  DT build from existing U-Boot tree location instead.
>   
> +config OF_UPSTREAM_BUILD_VENDOR
> +	bool "Build all devicetree files for a particular vendor"
> +	depends on OF_UPSTREAM
> +	help
> +	  Enable building all devicetree files for a particular vendor. This
> +	  is useful for generic U-Boot configurations where many boards can
> +	  be supported with a single binary.
> +
> +	  This is only available for platforms using upstream devicetree.
> +
> +config OF_UPSTREAM_VENDOR
> +	string "Vendor to build all upstream devicetree files for"
> +	depends on OF_UPSTREAM_BUILD_VENDOR
> +	default "qcom" if ARCH_SNAPDRAGON
> +	default "rockchip" if ARCH_ROCKCHIP
> +	default "amlogic" if ARCH_MESON
> +	default "allwinner" if ARCH_SUNXI
> +	default "mediatek" if ARCH_MEDIATEK
> +	default "marvell" if ARCH_MVEBU || ARCH_KIRKWOOD
> +	default "xilinx" if ARCH_VERSAL || ARCH_ZYNQ

This is not enough it should be

ARCH_ZYNQ || ARCH_ZYNQMP || ARCH_VERSAL || ARCH_VERSAL_NET

Thanks,
Michal
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
