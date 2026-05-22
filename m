Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAUeLOoOEGpQTAYAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 May 2026 10:08:10 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4235B0598
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 May 2026 10:08:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DC42C8F297;
	Fri, 22 May 2026 08:08:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FF92C8F296
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 08:08:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrwTvNgv9CFXkju44nZxukXTyfAo58zOoNsnRxEDfUwj20DJk650nGIbb+lrT4znpp7O325IICrK4OEqVDOkWlhB3NHJnmIWvHYYl+8BZMgMEwpkDctEnAFina6j6BP9uSIl6u/2rBGaZPruFymzLxI4gd2VvoBi5fR7/uD/JZBATgaV9RC+45ZJEujG7bNirTKxlIeBhPbLX5G1zogyMTsnKt+AV3bpfloKaLA1Eh1HPAs7hTEkL2vfyJGQikks2QA/66oZaxREKe9zSrLat7HDHaMdTdcfvqzT42qTBM2aiAbOb0iEio0gbiA1aFGU/uoiD1saEUO4gEKZJcKx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn9oTUAX87oukIJkF71PuGHBfIE3vwyLaPawjUtmwNo=;
 b=mOPlcIjsh1ugtgpHMl4q05vS4u5J8ZO5F/bzCE+BrGjEK+NTfDS1csngYwzYDx1n1yeRrF1LesewAYZfdsDQjB0W2kGDC4h2PciWSNA5PhakGHd6ePQczvfd1YWNLb83dpHfDJCPPFhfZ+T5cMyn3iACZdjpDNVbCtO51JfGBviSmSGgE06ER/du4LeIbrW7vTg+t21y8VcFm3unp4T2CA+ft7GS5DWrtl9/Kfbt34pzb7CS+RGX9pcnlEoJRVmBU30aJ5MHpN4cMPoYxSjiTN9PQPYoDJMtJ/jqlG8HdYmI4auZYs2UHllLvrht+Vhl2CcLUnngF+k65TzFwzU5oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn9oTUAX87oukIJkF71PuGHBfIE3vwyLaPawjUtmwNo=;
 b=UH36fhYc9cGPLdl1t2VKZCPPRlGONO3xNBHPwjpYSSq+ojx+lqtK72noGcn/yKKGg65eOppXfqgp7bND59bSW1zV8V0TN14PHmIvd04cICk2J704V80qX6UvcKfB28WnfOCghhZTUthePpuGIcgR+VNG+vVoZMMzkGWqXFtmJWLUX2TJoBYanAhpjAyjvwUTUUnH1k2v/qrIFELWj1nITf9uTNHUyFQGOhF/fJM1dNcIICV7zCmj3TBQ925AU8JJlKWVHdmxE1qnmJDNjOXV9xGeXgJfSGj4OUsjd3A9PwHJYOg4zio12qABV4oh4yvrkJxI8NJgasoxB15QzrQNUQ==
Received: from CWLP123CA0223.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19f::6)
 by PA2PR10MB8750.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:426::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 08:07:59 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:400:19f:cafe::53) by CWLP123CA0223.outlook.office365.com
 (2603:10a6:400:19f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 08:07:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Fri, 22 May 2026 08:07:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 22 May
 2026 10:11:28 +0200
Received: from [10.48.87.227] (10.48.87.227) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 22 May
 2026 10:07:58 +0200
Message-ID: <2590b373-0184-4d53-920c-74442680789a@foss.st.com>
Date: Fri, 22 May 2026 10:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260224-update_mp251-3_part_number-v1-1-d8bf2033b3ed@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260224-update_mp251-3_part_number-v1-1-d8bf2033b3ed@foss.st.com>
X-Originating-IP: [10.48.87.227]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|PA2PR10MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 020d5eb2-680c-4dc2-8ea0-08deb7d93d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SgpAYkfuoe2fOaKvRov8nmjo8FWyjOeED1J0pK1KE3OQgZceVJetDNUVTIiUpqEkeYQFUTpdZbXQ1+hVsutgtINkSIHFpbrsTk/nNPA663WmXRT+aQOqgYVeC4enuTK+8NXjoOuM1Li2PE1qBdam/kX9dlYFG9XDqoXtbVJ9i804xkwVe1h4W4JGt/a8W1C8Oc0/EiHkIG1GkP3xH4OXwCnNHbmeXZfaVJ8Ll0hnjq7BgRQciDVi51fCdcdqf56jlKWBApfQshCFv8nleWC4hlLaXBcnaDaO6xtTbIrP4ViyUb/sfWAdQZ2cSbrRcdiNDKRq5TtVYx03Ql3s95wahusp9nX+g2QaVKy7LVslEiTJTZ5nJpYLRIj2iPkK2n9J6tOBaLTYJYAAK14BbGRyQr5EohFsCH+uskW1D9IO284B8db9RfhJZmjqQa0errN59FeiRRBq5QRH1XJhEcpcNWpoRjH0nsIuilobTixeYafFtiKSsyiMkNoZ23gIsPbzbGQoErU59Cb6ja78eLpGYPKec+v/R+B+Ap6Mb/VdKaSjlfh+rrpJZHiO4LV/g9geXgj8mNQaQ5HNM2f8L6n5hs76o5L0y0Sb+WidNyZ/mwP5/aPJBM91vLkZPUi/TFbc3F3Mco9QkpoPKLz+hXTrt/sN2ZN7gX8O6kMT32lrc4vfSEEJhoi2ETMCBiaYJC5T09BNXiUDjLFGq/1dOLnDNZ3TR2G1JbHRZYB2uBML3LE=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(11063799006)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: g9SPGaL+c9FvLRF7s3Z2pdkGm0jY/Cy9vmZX/mFxP4Rbj2NX4TOCHkP9rqXAg6aQuRH+Z66WLvzxb2zJgtbg6PEx7r484/GXYyvgBO9DHWq4S6j7cI6/jzyAyKSTgxHzgzk3Pz7vmi1iGFkuVBITUZo6SqPVpVFEeJ8gPSUTAn5GqL2ZsS8XkvVQvRDNXm6kEi+mUv7eNryR5ZkW5JZKNSVdYHw/tqtNOXbXb12jtCxtFNxBfLebp8DV+ksoZEAdvwaAUUVxETJ9qmJ3XqeaK1hPBicIURkRctlsEjVykcXeuXuluLBENW5KBbjEXFAK/Q/uk0EqilTfa+2oz41qs1qBMTZDVS3Q+BUSkTXqSJ0JRlJGgEcOen4Vb/bWy2GMLVmQ69Q70LBqnPUcYedhv+dHC5GVMuox52xpw6WKT28PoEUrFBS6XGLPMrnwcUa+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 08:07:59.3125 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 020d5eb2-680c-4dc2-8ea0-08deb7d93d18
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8750
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp2: update part number for
	STM32MP251/3
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
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE4235B0598
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 2/24/26 18:31, Patrice Chotard wrote:
> update part number for STM32MP251/3 for last cut revision.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/include/mach/sys_proto.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index a875907ac3e..05ce869c428 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -61,20 +61,20 @@
>   /* ID for STM32MP25x = Device Part Number (RPN) (bit31:0) */
>   #define CPU_STM32MP257Cxx	0x00002000
>   #define CPU_STM32MP255Cxx	0x00082000
> -#define CPU_STM32MP253Cxx	0x000B2004
> -#define CPU_STM32MP251Cxx	0x000B3065
> +#define CPU_STM32MP253Cxx	0x000B300C
> +#define CPU_STM32MP251Cxx	0x000B306D
>   #define CPU_STM32MP257Axx	0x40002E00
>   #define CPU_STM32MP255Axx	0x40082E00
> -#define CPU_STM32MP253Axx	0x400B2E04
> -#define CPU_STM32MP251Axx	0x400B3E65
> +#define CPU_STM32MP253Axx	0x400B3E0C
> +#define CPU_STM32MP251Axx	0x400B3E6D
>   #define CPU_STM32MP257Fxx	0x80002000
>   #define CPU_STM32MP255Fxx	0x80082000
> -#define CPU_STM32MP253Fxx	0x800B2004
> -#define CPU_STM32MP251Fxx	0x800B3065
> +#define CPU_STM32MP253Fxx	0x800B300C
> +#define CPU_STM32MP251Fxx	0x800B306D
>   #define CPU_STM32MP257Dxx	0xC0002E00
>   #define CPU_STM32MP255Dxx	0xC0082E00
> -#define CPU_STM32MP253Dxx	0xC00B2E04
> -#define CPU_STM32MP251Dxx	0xC00B3E65
> +#define CPU_STM32MP253Dxx	0xC00B3E0C
> +#define CPU_STM32MP251Dxx	0xC00B3E6D
>   
>   /* return CPU_STMP32MP...Xxx constants */
>   u32 get_cpu_type(void);
>
> ---
> base-commit: c61d6f67f46f05149182b33c3c0ba5d9b6b46889
> change-id: 20260224-update_mp251-3_part_number-42196c4f7d49
>
> Best regards,

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
