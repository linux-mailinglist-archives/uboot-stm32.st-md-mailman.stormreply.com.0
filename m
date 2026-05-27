Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBXPB9aGFmqqnAcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2026 07:53:26 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A1A5DF9A3
	for <lists+uboot-stm32@lfdr.de>; Wed, 27 May 2026 07:53:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71091C8F287;
	Wed, 27 May 2026 05:53:25 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010019.outbound.protection.outlook.com [52.101.69.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15AD3C36B3D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 05:53:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djwcxujGvLlmlkqiAAVz9K5k8UjJbnOx0nG24JWY2kn9NH+WFy99VL++M9LC3qkssl29eKbYAEsjKNGZx+3wYuvoWCaOstoHDGHxizYsuOTGilGLeE0sj7KOcgN71e3Cf3vVApuQ8fxFpuK4uHBeShI69qIFbMoMdg6KtY4xWFVW9VKF18nLb/jK3+xJCDM7MeCu1IqTcTo5qlhfba/Yb9CsbN6835Szal/fgpL6FG3Fxf61hNtkcpFeP49+mrSybaecbQ45qdtCUdHjVme6o5qn1gGXKQ4P/m1wGTE9EJHzSTMeI4ZhcyI50/gBf7EdfOSVxlIXj7k4fJPMjFViFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9b8oBV1k8CLp+Dcgt98wqgoweaxjsl2UrmLrJBOarto=;
 b=Dkpx3RQsQu1D3Gw5rFI4rtPS/Af0AMyI2XSXD1IcTEQRjCEiDIuoaxUoURadt3KzGUD+rJaN0SpLBnsaXt/oVF8jr/oJNePf473X9fxBMilxcK2D/brZM5OjCBTmupRX0jGk+zGdhmbzmGy3yWhddkqJkVU00fRCuJQA3mUuILTEpqfH1L5LXhcHP6+zATTzD9uAiMEPOZyrp2AUyAI9w3UtYzYZc5+R0eCyf+1DAV5IezqGLmQ/kFLdebmld4RjA7nNCegoLm9frH7+kOuR0096X2KkOoDiKAdCGVHTTKJVEtoEkMoU5voNqVff3jxlzhFKIkOc8iT922uSF6ubCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9b8oBV1k8CLp+Dcgt98wqgoweaxjsl2UrmLrJBOarto=;
 b=JWjv9okwZPWIo/K9FrZqjaAtiuWiZHVNPgykOA58mmEWZYNl0iwoU2TsvB9MiXIrK/NBlCvCk6xixR+4x9T6NBKzcKn+ZTrzIe6v+NzZ0b+6Ba3vumWxAps1tFd5Bv0YYlTquJRH7fsdJTWf3Fn0uW9yJ6zaoUWkn7NZn7DSx1MUB/qpz0kQFg2IcPlYvxzD4wp0jUY4t4vE8Ai9g6Tar/MJyPG73WK9mpAV3rd9tOC1fiyt7Ggmd0uHaqe7FJ6POvc2lpB+yyZGEqlXpXK52NDPAvifm9Pr1eyXGL5cQGMPlUJyn6qO6iC+94+DVWVZ2ldLJ2MzJOjOj2C8WXGcwQ==
Received: from DU7PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::19) by AS1PR10MB5415.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:48e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 05:53:21 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::2b) by DU7PR01CA0017.outlook.office365.com
 (2603:10a6:10:50f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 05:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 27 May 2026 05:53:21 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 27 May
 2026 07:57:02 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 27 May
 2026 07:53:20 +0200
Message-ID: <82c471c5-2522-4ef6-9075-ebc0bd34d2fa@foss.st.com>
Date: Wed, 27 May 2026 07:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yann Gautier <yann.gautier@foss.st.com>, <u-boot@lists.denx.de>
References: <20260520160715.175032-1-yann.gautier@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260520160715.175032-1-yann.gautier@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|AS1PR10MB5415:EE_
X-MS-Office365-Filtering-Correlation-Id: f40ad4a7-ffa0-42b8-956b-08debbb4427c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: uiUMCwrH/17J5hd38CYZZgkpcuznmZKwanfjIZVr2PFblcN6S7Zj0eZVPZib1TAl6vnU0X5+Y29Hda+aX/n+ZGGx5hbzGLBsnlvSZmX3dn2s0NdwQrCrTezJjPEWX6xgL+ftMbu/nmj+hYfOAdCSjjN7YNHFDPrcJb4CNTwT1VUcktJnCmWWHViPo1Mvqc45b/vPAqgf6WjFjtod9sWJTsHQ8C6ZZCNqO2GfaXgFdjALNIzT5dHxr9VRNxUbZNWPZb8MmI10Ri3bCEQT606JHFljtr8b3dt3Ems+4WgB/YnmcLqmDzpwcAqWmgoCHYohS6yCKHWSG9S1Yg9WY1YdBwOoJsqnDehXI92X2MjvFygHZsGw+Tz0EtuqAphcLLyFOZXE0sm5cCDmf0xDI6o7x37uud/1m2dMndOFo0MRUugROrdzYI872ikuPmv2GLFr383PnHv10PdZpEi45YfIz7Ap29DlASqEzsVKXGYsyojDuHSYRgwmZsStkrARHuqSQNfUtw7bUHiuwAllKCP5AtIAQZEfNEVYqNiDjiQOe2j1+LwBFrrwCbB5PvSDVXtfZyD0OJhsCBogwOGiIYcYyYlH4qsRiyhx44LR9gDb0zYznJzvWMs0nwldInh8ZVsGA4MUsRoM1XgEEySwXZS6aEdQtvBxLese1B0joMlsBlnt1ai2JWnh0M28+4sid3/XXowV+KZY448mTjAnh7bEB4x6ZJqMsjiOse/p3bZq7so=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KDD3a7efmKwXiewyr60eEP6B3TjeaNL88QgYMrwyRGxteXcpB3bkBY8aMr65Zyqf8ckHBgo6QDd4O9LwNsceF6S8yewaTU6JT3iyumzharcKs6j7o/Ms0d26I004z+7F5/y//MXRzIbZxy6FPqJpks3IVkcn4OPomcOXKo6pZo3xhBr9OecMsfRowzvnURsi5QYYLRwI8bGoRvOy9G+4QDNU46YKFGUQhtL2QNXEOAOZC/GaMvjITPuC8Dpu3qSp+qGBk6CDgcb0Wcv0/E4/EkSk23e/bVHWlaZ50kSH6TEFbf/9cmjx9NtBUnuqS12rTJcW7chE/ScU8d7bd+CzjZ2ikwhip4woW+x8iqzpkxLjgv9il+EjQhls6Wn88m3xKlMY/byxA/jTK6a4cdd3f4+Rgvr4QuV0fHssNtspRmRrtzzGR4ULd5jqya3dcBXN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 05:53:21.6007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f40ad4a7-ffa0-42b8-956b-08debbb4427c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5415
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Peng Fan <peng.fan@nxp.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Anshul Dalal <anshuld@ti.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v3 0/3] Enable Arm SMC watchdog for
	STM32MP1
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
	FORGED_RECIPIENTS(0.00)[m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:christophe.kerello@foss.st.com,m:quentin.schulz@cherry.de,m:peng.fan@nxp.com,m:patrick.delaunay@foss.st.com,m:anshuld@ti.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,ozlabs.org:url];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2A1A5DF9A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 18:07, Yann Gautier wrote:
> This series adds the supports for Arm SMC watchdog for STM32MP1x
> platforms. This enables the required config flags for both STM32MP13
> and STM32MP15, and updates the U-Boot overlay DT file for STM32MP15
> in SCMI configuration.
> 
> This series also requires a patch from Patrice[1] increasing the
> CONFIG_SYS_MALLOC_F_LEN for STM32MP15.
> 
> [1]: https://patchwork.ozlabs.org/project/uboot/patch/20260518-master-v1-1-37fd4df56609@foss.st.com/
> 
> Changes in v3:
> - Update patch 1 commit message
> - Remove CONFIG_WDT_STM32MP for MP13 and update patch 2 commit message
> 
> Changes in v2:
> - Improve patch 2 commit message
> - Add Reviewed-by tags from Patrice for patches 1 & 3
> 
> Lionel Debieve (1):
>   configs: stm32mp15: enable WDT_ARM_SMC driver
> 
> Yann Gautier (2):
>   configs: stm32mp13: activate watchdog
>   ARM: dts: stm32: enable SMC watchdog for STM32MP15 SCMI config
> 
>  arch/arm/dts/stm32mp15-scmi-u-boot.dtsi | 9 ++++++++-
>  configs/stm32mp13_defconfig             | 2 ++
>  configs/stm32mp15_defconfig             | 1 +
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 


For the whole series

Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
