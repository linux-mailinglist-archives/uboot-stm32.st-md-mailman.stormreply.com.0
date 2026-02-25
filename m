Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBtdCt/KnmnEXQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 11:11:43 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C76E51958CF
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 11:11:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E012C8F281;
	Wed, 25 Feb 2026 10:11:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 052C8CFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 10:11:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bL14OpFUY2ILoOQXSyBDuNWFqZ8LoHnNBtQQmwvFALt4iUIWr38meChw109O2XdnqXFWq8A6w6ZnJ/cJ0rXOFE+vxiGuKOOEfTUkgUhNAWm50ZyZLvG4DWBt37BTkloaM2CttlW8fzP43EfxkCK4ae52dX6/TpkAZino7yhG2aqGCaCM7z0wUDcb/WX0vs94IOJAvfpCuuLQZz4DQ/NeIyO18VdW4pzaOLX7R28zN5yfeY68fySIaXSS49rVuAoSnUufJfyeEPntebU3JZR7TGGbxKSl3qpb223AVjZR1qlAXkOzdX5WeLt2KF1+PTnsS1pBXsm03y4gqMtrkFXGFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN668rOSladDtOWBvH1lSeRxdIpEuBxR05RdTyMi70U=;
 b=xbhvagkPpbH6LSwuuRr6jBzZg5q0kYi7Z60ealuXgoLjev+WiNq2lQepI/ix56My7JgJxzecC9jALBvyHpqKIBDIaGSiXRamqlCQLou/B8SijEaLuLC2SQ7JFyj6z+kXSCN79yPX4+8v5lZqXVVVwADiAvZRlmPPnhykvl3XNg+9a7vcdQpETN86ySr3QQQu6EPDNei+2Y+Ime3mFLthyiNcbpqwEiPKz38fX1k6hgLDg4G3C3k4Q4rv/OElL9xtT9K/l89dT+RyJSk1hMrPhbjVr2ma5Q+ttck6Y6WLSU0S+YXtv4e/xYRmXNF3QsCd6WG9OYbxGQKPx+or+oGS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN668rOSladDtOWBvH1lSeRxdIpEuBxR05RdTyMi70U=;
 b=mbKEmZYQF22nnOZPfqnJh/WGd38BfPFT0r7sWR/dPVnxPmcqD5ydEnPrdfQHFrs2RPW+Nr5BBzjqT2ow5Vfz33R6Ok2gtO1mkL4gfg7GDhgxSRu33e8BZQx3vFVl/95fbZ/EL4zppIYj+0HiHIkf24tjZutRt9KEQHOLPaJLTTCihjsIraJCgD+E3ADO/Yn6QKvuYucTFcT/qXMHfOXTLP/YiDbF2wq9TpyU2AHCRAJJBm2sRV7iXcSOKW6lhqCJzcNqFKQj6iJ+mw1A+cxEe8Qhbme2KAltuPIM1zh1kzWp0AdBT9mgv/sm9ETMtEDAcwE/7UE+LQ+k+u1sTzDnqg==
Received: from DU2P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::31)
 by VI1PR10MB3534.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 10:11:36 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::7a) by DU2P251CA0029.outlook.office365.com
 (2603:10a6:10:230::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 10:11:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 25 Feb 2026 10:11:36 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Feb
 2026 11:13:43 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Feb
 2026 11:11:35 +0100
Message-ID: <21e77ae6-73e0-4d06-95f7-31a9a043ece4@foss.st.com>
Date: Wed, 25 Feb 2026 11:11:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260221094252.3103034-1-dario.binacchi@amarulasolutions.com>
 <20260221094252.3103034-8-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260221094252.3103034-8-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|VI1PR10MB3534:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c1d271-58f0-4643-0446-08de7456425f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: 9y3A8d1cVkJZy/3QNg2i+7ZBAbF+0Bo418q4GZDAEjKd4A+K6qv3mUamSEWBJdYebcLbLgMRWIFl6XqXT0g8/VNY9zAp0j04o47QuKi/HJMT6YrBtAvJI7DZNWQiuzMYE7cJB4bi9U+VNej0EnT6mrJwcY8P4scY83Ko0mvC0KIEPzY2TvtDWaHA2P6miOj4haU80kHkL0uE5PQ+wo3Qqt3stCz99WWSa/HkKfT2EY2GXvxHmthP3gtpu+N9FlSZz1HyFiKrqGq3b7+tk3uUphSrDCqyC1SXRD74XbF7AqCYVGtDSr8e2nxRDtR/1IBycYsTcLHMvAcesurJda/5qaT9ezWqp1Jg6FyGK9NZ4M/8f/svGRaUhaSvRpD/tjiOjrw0X75SjstQbjc/T/BE5NqrWSCCB1OO63Q+hPj0Gwr4zBQ0YapY5n9b2/A0eXNwYwkSqTPopFZ77iZi8nrLDD4j268UOI9RO/9ImU3eqphlIwd4+TDBITzO5fgCV1QKMYdRkeKBqtO/ZkJsJyFuZSCw/x3EY7dWajPnC/fmdbe/Y/IHQ4adhSAU9JFeF2NQ24IfDGD4OicuT9nyK9GDhi9Agh5yPzq3KTgjpCHcpqrs6iXilxgYMyWYypYR4CCBAvCykg0iOdn3NJdb44iDPvd0EXkemRXJPWQS2osmBdgbqOioQfPBFMcpCb5r9BJcc+OBMcd9bpSUn9cK+lkJOZPCZGd0LZRP2jDsfArkBsGWxQfv/ovIPXOwOi+EO3AEPRoPzZYh5/MoCxLqO+LXToBzgB2k4PRHnW4Ltl08xwfJyusHIJJbyuwtrQQWCoSZQfQ8T4LdYihh6FA2GjZ7DQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: X7otHLj2npTo+yy2Fv2+1FZBeERisxtHaO4FgNqjXxFYi5oqxLYP+6ntpF6NZ2e9JXnthJ7wKhM1Tr+21C7hvHRojAfc7qdSR83j5RgRJJ+ZFHP70iduCkS2VSoItF1iP4o3srnqeczVWN1CEw4Fh4pBm1+1oclRV17HWvWXYHUsVSIB2h5VgAP5F/Y4M9QHKnhqWgVVHiS10stXIatx4rNoipatRON6PaVeftnhaZQc9MqtyL8jfz4zctPxX6RuxVjgj5F4ylRDXylbkG6JbMJKAwx9/bDj8fcJTpAFcJ+2toNZFGr2upWJdj6h/9E1fTrfO8uhi/jH22ESvgNiTFpqKxfqWAJM8T3rmZHcQftVbaO0tFzFst2K0Ii8xhT2CT+XZBCGxABMb82j23mHAY/0R9RVJ5x27b/+w0F1Rs3HP0IOrP5ZIz3sltysOdeF
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:11:36.1646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c1d271-58f0-4643-0446-08de7456425f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3534
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v2 7/8] spi: stm32: extend support to
	STM32MP25
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:linux-amarula@amarulasolutions.com,m:jagan@amarulasolutions.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_HAM(-0.00)[-0.842];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C76E51958CF
X-Rspamd-Action: no action



On 2/21/26 10:42, Dario Binacchi wrote:
> The SPI IP in this platform is fully compatible with the current driver
> implementation, requiring only a new compatible string.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/spi/stm32_spi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
> index 39ea69c68174..903cc3702807 100644
> --- a/drivers/spi/stm32_spi.c
> +++ b/drivers/spi/stm32_spi.c
> @@ -686,6 +686,7 @@ static const struct dm_spi_ops stm32_spi_ops = {
>  };
>  
>  static const struct udevice_id stm32_spi_ids[] = {
> +	{ .compatible = "st,stm32mp25-spi", },
>  	{ .compatible = "st,stm32h7-spi", },
>  	{ }
>  };

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
