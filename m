Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJctGLdqDGo8hQUAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 15:50:47 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B888D580030
	for <lists+uboot-stm32@lfdr.de>; Tue, 19 May 2026 15:50:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62D8AC8F294;
	Tue, 19 May 2026 13:50:46 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 833EEC349C4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 13:50:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0WfSuXJfTfSFmN7BAnFToKJ4p+NKnsjdZ0e+j74t/DgLkfzxyqAYsq1PoQrAxYsRz3n8HTEFakfvwLB15x2GG/0BxUpROGkKryAiApcqARlT1fm/nM6QqO7nx9CD9/GDzEcS+/kfcr2v6wz+J2pwJL45TLszDQDsE5gmyQ1kFJa9K9QMbvVrm+d6sWc8F6W/74M7BW9NcJLvrkDtiPRBudGW8yU84sLqkLA1GVZriy3wh/+IEXVvORY7XvAU/kwJc4MmUBDcbV0/Kh+9XGxsLvb+/mLFb2HmN3HPjqDOrkZ9T79WpGXp+qivqC8ZbPpQCMQscLo5iZwemEUCk3C9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ5ISB62w9RLG/vVBOSHSUqqfzNpTHz6ZSrMLwWUXQ8=;
 b=o29Gi89CRD8DEgRd9TrMVp2XoSfrwumdN9zvJp/ETKMoJMmy/u0PK0n/jugkGtmUvJimUanzX7O5ilx3HV8YfIJG1aTaMWsDlyrbOAwXO0cyp263X2+N7klAWjzTdnQq1OM0xDyp5Ama8mMTkhtMPTrmRQiwyc1gwr1t82TSfCj08oYsJKXbuVQnRpqpkW41u4LJoWyDFoG9A6VTM3z4cRHkxrSCRH1Uuayz/5AphXTrI6QMABV5Jjiaf1/b0mFdtzCIpg2kb+M9EzRjIy8owy9f+geAGFwW7KSBa/Sp+th5c0uMxB9Cq8hgxOZPbJRZpp9noYgY30ZqBZYgyf8zAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ5ISB62w9RLG/vVBOSHSUqqfzNpTHz6ZSrMLwWUXQ8=;
 b=WDQCUeABqBhsw47+68ZQ3cZYSQD5nqyHy5BPFQw8Mq1rzXtH8tn5Nf4d1/zNomShLSFqiO/qVTV0RMjag07otFw+Z3A1DO3PnhM3CHpUCqGx3E3dHoQDrC8wg2nLCxlxT3ot7jjqS1OpVpNj9oIZUZqofe3TWkmZPLZS37HFUADNT20GDtYR2SPX65enSaAGWnzLjGJx+r3FVAXiLoEnGcKslPOBg39UXetfEUyOiJemXSj9nqSkvKEKufVrAWoLLLwaKxY2sNOJW8IKMzoDe4JX+uR8U9stn4wgQO7lbbfCw8Ob3aYo2tvRgaATExyF2wOAemUouTAPXrEzH4vbjQ==
Received: from AS4P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::7)
 by GV1PR10MB9058.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 13:50:40 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::79) by AS4P190CA0036.outlook.office365.com
 (2603:10a6:20b:5d1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 13:50:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 13:50:40 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 15:54:33 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 15:50:39 +0200
Message-ID: <49df56e8-95b4-4ba4-8f42-2bfd7fdfd9bd@foss.st.com>
Date: Tue, 19 May 2026 15:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yann Gautier <yann.gautier@foss.st.com>, <u-boot@lists.denx.de>
References: <20260519080737.47928-1-yann.gautier@foss.st.com>
 <20260519080737.47928-4-yann.gautier@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260519080737.47928-4-yann.gautier@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|GV1PR10MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: c41835e4-e337-4e4f-0287-08deb5ad9d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|4143699003|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gMRdlbyn+GnY6wlKFtoKEs1M+Vr/kFo62ucHEPFFOtHXa/Gz7q94i/rLGKFo1t4VUaQpMjYMs4qPCpqErQ8pr4vE3ybponbLwcMxI7+/lUKasx+3aIhueUcHIHXfuZeCyKBQXxCHbdlALAYSTksLx6o+VVDnWoENyoj6ZQEO8gG/oSWCEuSwslWtP4W8I8iGOXX1+nsiU8iiVnUApxsySOe3a4LjG9/R6NTcM5WflH387/EVc/o8sfFXYwrkVQboP3VpsPFOnrjq0+J+vejduQab56lwfs6951Mz5ZXzNKc8zCQxK/tduRzMShMWiHLC3iroW9HQNJqqrbj8kI+jrxzsiIIi7UoINdu2DA14iQapTW+6fV/oW+mTnMRI5Qa+q+RZok/mYKEIwQtUXYwLstd3q7zTy08IUAfWizlsdJj3alPzCsi4lAlgnn92VvONFQ8C9v3ZQoo9C5Oy5bJv8x28OeFHBgc/PVzSLtA/uIqUP3xJze4JCfEUfYFI2QwBprZ5uvdvsXrgbAPHtSL8qO4FjmIjunmF7pAIEB1qvRynNEF9Gbh/bMVV74IpC7tF7m0YquPAhZeJK3ng730bQsguPTCsWwAThOUPZEAnK7By/aeFq60yBRjWf/HlFyrpA1wF+KSQKqjVgUpTIMGqxAGnr+v3d3/H3roIlr1EIqrt6vHLgfeupa7NHADkGHmdetU9qtbOyMySrSiLgr8sdT1DjkJzu31eLxc5syKrW5w=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(4143699003)(11063799006)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /V1QtLuEgHx9XxmUAmUQJhzmkHNd9WGNsP/GQnHLZPAwO8w3DrItkTzTET3qcc9rv47sLF1jtXUBjRV+qI7Wn3u01a+ApFuDjBN3ivlZ00S6Gsg2lmhQQ25DDZtWgv4XCe7umytd/jZd5isGnIH8JZcM5VPH4xLxoX8UgdQgVuat/ULtW8Y61RO2Qk73gYZlfieqZtydZVAw+oHspU9l3+sbyYHGiFkSlFqLaOZ8bJoNBHg7ZrQMxFVoONpA3n+uHH5NTOcckeZoHkY/vI61uNZvGYnbGbAMuio3SToBwlnDYoe087T1J5ssLA7ukP5WZLlfsuZMotjdS77PLO5KZ037AG6k082sSLO71mnMnl/60AJcNWhCF0rI9BRgSxstUxaog+M8XeP3kfr6MmghIitWgTAroWmmKf9rNg24ME1eu/HHiRvdX8/FGP161amc
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:50:40.5125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c41835e4-e337-4e4f-0287-08deb5ad9d48
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9058
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Peng Fan <peng.fan@nxp.com>,
 Christophe
 KERELLO <christophe.kerello@foss.st.com>, Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] ARM: dts: stm32: enable SMC watchdog
 for STM32MP15 SCMI config
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
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yann.gautier@foss.st.com,m:u-boot@lists.denx.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,m:peng.fan@nxp.com,m:christophe.kerello@foss.st.com,m:trini@konsulko.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B888D580030
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/19/26 10:07, Yann Gautier wrote:
> For this configuration, the watchdog (iwdg1) is secured and managed by
> OP-TEE. Add an watchdog node with arm,smc-wdt compatible, and disable
> iwdg2 node which is then no more used.
> 
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
> 
>  arch/arm/dts/stm32mp15-scmi-u-boot.dtsi | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi b/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
> index 79494ecad90a..600316205fcc 100644
> --- a/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
> +++ b/arch/arm/dts/stm32mp15-scmi-u-boot.dtsi
> @@ -21,6 +21,13 @@
>  		pinctrl1 = &pinctrl_z;
>  	};
>  
> +	arm_wdt: watchdog {
> +		compatible = "arm,smc-wdt";
> +		arm,smc-id = <0xbc000000>;
> +		timeout-sec = <32>;
> +		status = "okay";
> +	};
> +
>  	binman: binman {
>  		multiple-images;
>  	};
> @@ -103,7 +110,7 @@
>  };
>  
>  &iwdg2 {
> -	bootph-all;
> +	status = "disabled";
>  };
>  
>  /* pre-reloc probe = reserve video frame buffer in video_reserve() */


Hi Yann

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
