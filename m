Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DITiNFbHPGqjrwgAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 08:14:46 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E26C2F12
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Jun 2026 08:14:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=LilQ+08r;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5DFCC5A4DF;
	Thu, 25 Jun 2026 06:14:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 665BFC57B41
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2026 06:14:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnizRgCZHgD7yAzangIOL5uLifHUD4r+5Gzzi38y9BbqHo6uqAfmfwpZDdNfmiFRAJETSab6uqJmbfmRLn8zfPxAhNM3/OiXusj9LN3UYd44Pw4qKae0mVQoDAv8PcvHQ2qHolJKqe7x90S86Gxc95Dja9ygxFMuC61gwntl/dpRXp/OKgnM3BKLkL2lndBjcjQJVVSyI9DeRKTGcFc+Gj4q1+UltS1vVlZ6MHHoWbo0TEAtmTmZZvNT+JKCR1kjNaGZpLvyvMPGPfhVklTGf0hpxQoABPbdhtDhCaqHIjcy2OX8wf0nEK+Xq7E37/1HDOES0tVAbo33pZNd/xgv8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqLmlcCE9PiTOILGTh0PzHdGwM/0vekU42A6sF+9yQo=;
 b=LR/OpEb76gFBR7UhaRn9RU3LLuTDODUk4RKO+4R8ehCijUlHLBQLM4a9v4ijatMirIRMXVpzurwbznkj5cO+DC2STlezUXOutC5+MeEX8uXUGK2V47OQsRDM2QtZb8XhJTColvzEL67RwNxo8edfs/4x9/zbQLbjMC0HRpWOH0iiEIOwh5dyXQja3AkX8IBb/FoLiv7xIkj5ab1Zdc87JHIuXW9i4ebfaGDvJguVqwyLgT8dNcPBpnRpCagsr6zHc0ussGGiPKtj3kfAdfdbTU1iH7uZt0/JMaNzS46YMKmQaN1O01aMo1emSxjO+XjEaskbjwNbD6011a1ej2pQLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=geanix.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqLmlcCE9PiTOILGTh0PzHdGwM/0vekU42A6sF+9yQo=;
 b=LilQ+08rYqn9cyCaCsC/4A/1t+PDtXDOIykMWQZz6O+LFYZrl4A2MKZ6MoWl18TkhMQlBaxDmwZ3sVO92/QnInX5RQ8lzrqBdHzyuLHVYixuRYjOF2MtL33TBPLF/NcoTz4dsCiqncQnvLz+Q4vI0hsyA3rKhJPtQNOyUacH+jfkvB35tt/FOriz0NgbKecAAIRdVDPxMY6ZOLJgxhzfDTtMJmec1XtvUcPmYLJ0Ro3FDXfpSNeao+sGBQb2VYUi0sbZ6pguSj0wXcWg2fcwzct+8HifjJPTovM8m9zCOItPAVfgI5CKbZTisVTHyA1qmp9YIy1RiLns61pgBdDZlw==
Received: from AM8P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::34)
 by DU0PR10MB7144.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 06:14:40 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::18) by AM8P251CA0029.outlook.office365.com
 (2603:10a6:20b:21b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Thu,
 25 Jun 2026 06:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 06:14:40 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 08:19:20 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 25 Jun
 2026 08:14:39 +0200
Message-ID: <a0c2d561-a2e3-4c66-a9a1-e810009f262b@foss.st.com>
Date: Thu, 25 Jun 2026 08:14:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Nyekjaer <sean@geanix.com>, Tom Rini <trini@konsulko.com>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>
References: <20260618092855.3702905-1-sean@geanix.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260618092855.3702905-1-sean@geanix.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|DU0PR10MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5b7f45-8a44-4448-2a6d-08ded2810aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: BL96fBHLd8uC5zkiPXx3C89XF4uo3pd2E2pldihoEP/ePWtnKxROxJyhqX+RawAKLotKM6dPf7COt5omO8LHU2FEAe1dcltZimqpOBSV4BoU9b/d1apVxoHiEOA+aCFLvriT5sZIxkdSKpR0by8zg3TRxLbaTA2/sWmB+LQJ3gBxH+IF6gA2zC3mwNkrnV7k/WZzrDoAGrRG2l5PDzFqUdgk/iCiR8fXSWYqYmhkCCsvi/c4aPoF5GZ6yfi66j7j5NUaT2srygfPO3tqKaPldB34l6NJY/puHaqx/Kw+KD7cAiLcoDzRHWhmS/41w2djyGHdbP3kNSYW8ffk2iJkPflUfzl/GFM/NTUMJ1waGo05tMzfM36IEEa6xVTot3iVksKJUNJtijVSJ5KDf5LUZMkFHrpP+J9+6lnEhy4UeWRhtMdWJCIqcrbEK0U2T8NRZFkloViA/OY1Irmr5H+oF27s6japaWyOtuPXzkQHE91rwEDTR1vhcF95kcPdpWASaZqzO7CwEhpPCfT0CW+SFkFTgq2Q2OtsaLUggQjFxr7pTNhMNu7I/COuyJH3qJ91Tjw57NlFexCiFEmXeRtQN2N5vDy9TlSaayzglQ5rxb4pH3oDTd4KkTj0DslLmrlOH+zuQgeEBxHet7i/psuUN82beU3iOBgc37nQJusoe7ZInEEZPCcnDGQzDA65gAyqNErh68OSWNywCcz5cRzIiA==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DCh65PCct8S37TYK5icQJ8ongfAJHQY6bBUr7ZvFZpmXtgRYpR7LnMsqd3Gbx6KFZqOjlU6v+tbw+M/tEls/2mbWOSbcyuRBCgETMA/dmDmcr0xfjjYo9rzAdO/CtJkjHRkxuqMMSwA/+uvb56bGuJzkkfUp0jU6M/XYrxATSAbOK0DdTWHahf0B9uWpGNgHCD1PsBFkp0bdDRJdnxyfaFZxFZwe7WnrPWMnLgu+SyiKY6dMfsZ7bYlNXI0Q6bQRqWdibvHmyxGibOfpisuLOdIyHGzIeTgs264TYOiuPLMoebzj2XHIgwJLl4MrALiYEU3pgVU8RHEEEPnZPcmYiD6vBaWhFxFgxl0AczS6ZQxAR1H2+PkJCu+akNSuMCWSGC3zLaYkGYdAz5YL0xZro7afYzkV5Lj5v7WwsDHG5iEwK/E6S06NnMjn8XojSBUD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 06:14:40.3509 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5b7f45-8a44-4448-2a6d-08ded2810aa4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7144
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: spl: support loading U-Boot
 proper from eMMC hardware partitions
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
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sean@geanix.com,m:trini@konsulko.com,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C5E26C2F12



On 6/18/26 11:28, Sean Nyekjaer wrote:
> When CONFIG_SUPPORT_EMMC_BOOT is enabled, make spl_mmc_boot_mode()
> return MMCSD_MODE_EMMCBOOT instead of MMCSD_MODE_RAW.
> 
> This allows the SPL MMC loader to honor the standard configuration
> options CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION and
> CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR when locating U-Boot proper,
> whether it is stored in a GPT partition or in an eMMC hardware boot
> partition.
> 
> As a result, both U-Boot SPL and U-Boot proper can be placed in the
> eMMC hardware boot partitions.
> 
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  arch/arm/mach-stm32mp/stm32mp1/spl.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/spl.c b/arch/arm/mach-stm32mp/stm32mp1/spl.c
> index d2e41b8e65f..d2af705a5d1 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/spl.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/spl.c
> @@ -56,11 +56,6 @@ u32 spl_boot_device(void)
>  	return BOOT_DEVICE_MMC1;
>  }
>  
> -u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
> -{
> -	return MMCSD_MODE_RAW;
> -}
> -
>  #ifdef CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION
>  int spl_mmc_boot_partition(const u32 boot_device)
>  {

Hi Sean

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
