Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dmAzOr0VQmqczwkAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Jun 2026 08:50:37 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 766876D68A1
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Jun 2026 08:50:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=ebJbIo80;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E2A0C57A51;
	Mon, 29 Jun 2026 06:50:37 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99109C14549
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jun 2026 06:50:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rl1qxJeP0oWODcY9ns5L7okjJWiubTkklQrGyamqQform8VIV4XbmPae70ksIed/UheSfWVlDCd3MTTX0oUDMtL02QcEY5BFk8CraslzIBDSoaKmrgjfMKgVpnhQ3BhsZkJpOBnRv8bt3neZFoRpi6+08uoFldb3i2VKbzhIBQcuDBuYoE5qq09/ThNqT1fJ5NFYB1aL1FNH2OeUeu7tCvbwL0woCEtA37EWdRmZKfxoZUtPibVm61nkEoV+5I7rxbgXrWZ9fVfbsiNLYqnG2qxcRVdwxjgMYFv1iEL4EpJ0oJYJowUQLzN6jzgyF1XuUAZ9eya/tiaolLsduu7bxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAN8CabeWXgmgiQ80CKz02iTfHtc+zXikj5UWye9wGs=;
 b=hyWulz+ySRfWA9lD6hf5QaSi7s7PyYSkagi4bNT1hW87ek/uZ5ks5zsTtCIThLehJxGUFbZfmq6sv6AiSTJGHM6NHM1miHCjOX6gYj71GdT3kBbi3SVLXhGCqEDikSR6v4FaDdcfhOo/Vi81ZsxRjvHso2L0IHGDkmQXa1N9/z6JyTrVkoTCWZP2SyS9J7BIj6UENBK7y8kx3cyzZ7vSYG2s/G/XGpcakEoLkOVK+tzqFiDlM40m8VKXylJd88RbdIeFE9ox8T0tZ/OWMR0p6aSr1NfNbtkEBYOcMJrHFkk9YXGDkpJ93PGUxTxrQw1vxUoWeUFHxCmXrO3gXWGGCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=geanix.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAN8CabeWXgmgiQ80CKz02iTfHtc+zXikj5UWye9wGs=;
 b=ebJbIo80ZtzAm42BdZcM98SQgAeOX5O+VyZFbh2MZeNiFJ0HTqFvyD5OdT2Rj2xkLFtwl3ObcbxWvQGGhLMhpIHRwR1YnIdhQxx7RIUPlYzURwBa+GzQ17yJnDGdsHPgVP9rzft4b0iVuyQ54i/keeS9e3tdfjy/omY2a2P0F8aU6zfBjDyR7JSnmz0yRkT9+IKf2kW7dWQ/PUOiMskySn8h06qurphp/yfYO0WAv17idDZNjrYv1bJksCfOt25t4gOtRi9zkOiugXlGBW0ypp2X+fkPdDo2C8OQFJobCkT2QcvI0cS3GzXbN/Tdwt2s4wtC/lqSYpuZ0eTmW3Q8Fg==
Received: from AS8PR07CA0040.eurprd07.prod.outlook.com (2603:10a6:20b:459::11)
 by AM7PR10MB3349.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:50:33 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:459:cafe::8) by AS8PR07CA0040.outlook.office365.com
 (2603:10a6:20b:459::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Mon, 29
 Jun 2026 06:50:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 06:50:33 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 08:55:16 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 29 Jun
 2026 08:50:32 +0200
Message-ID: <04e0480a-2e4f-479a-801e-54699d854875@foss.st.com>
Date: Mon, 29 Jun 2026 08:50:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Sean Nyekjaer <sean@geanix.com>, Tom Rini <trini@konsulko.com>, "Patrick
 Delaunay" <patrick.delaunay@foss.st.com>
References: <20260618092855.3702905-1-sean@geanix.com>
 <a0c2d561-a2e3-4c66-a9a1-e810009f262b@foss.st.com>
Content-Language: en-US
In-Reply-To: <a0c2d561-a2e3-4c66-a9a1-e810009f262b@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|AM7PR10MB3349:EE_
X-MS-Office365-Filtering-Correlation-Id: e82c1b9a-8289-4ca3-484a-08ded5aab76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|22082099003|18002099003|4143699003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: GiWiNYoVLbCs/x1y7ivtycg2x/NagROSnwXJSNcYF0i8tJ++oLWId7LL1un+8L71Lqxir2OblTc9BYQh+Ixw57rUScDdihRFK3g4Zou4NVffbpGWQ6oVx29OYMP/Pg/9r8lpI4azlQrXZJihTlF4eXxmlZ2MibO99VNekfgbbxlCTxYqcaLUF6xd9eWRysRh6+NQCODcruIcG1uxqPFq2C8OFipXNeN7LrjuSbcqvUq8Gh8MKb+G3tgvR2DJyLXV/rOOeEaeaUFTQ4k5ca8LPfZ+1idSkOMEcQUsg3QtuoteVdFVsIOLSE5MdencpY7HHzYbosuIsy5UrzsJcXNir6xSdPdHTZ6r/44XAt1xqTGfaGVyqn0zabADgoJFfKMbXSvDx2JX040c1qOsnP97qy/oK3w83HfixC9ryMc7JLePdBb8821i6/6l6Yb/NKVQR61+R2YjzSfqmP2nQ7Pzitb4UHdnS1ePa4RMOeQb/lvrwVdk/v0mbgNGB6ZUC19/Diy/qX04hz0ouEA0lK1Hz97i6lwhHgnLtrrEtjzt95G6bxlqk02BO0LkcoYbEqkNlzsWvrNl6n33i/c4arlE6kM3X08opMvF/wlkNlWcA8mCvWabZIsz4P5VwAHotmpUhjsPWpgJaqQ75REkszkW5Tpwic5BR7KHrsrd8PVehxQrbiAJJWPH4R8LHYxHzCMsNq+kwXo8qFpg8wIoah3HPA==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P1+DqJr71DI0HFYFUp9sfTLyPsKFP/4sRuyapGVsG4/KTeKw2ReWU2a156QSLKP7U44BBgRZaxKq2gN12LqV/xBsiEOycAC2IkcJKWr32vHpNEKPh/0R4I/8gpMSNk0ZX5Q87PPuRVGgcS+XpRhYDYIeccOdSg8X99iWGXVInY5Gus9OlLKcYE+R3IUeI/R+K+vWUm8NbEW4KgHYJsRVrHmeo3X//xr1pJVNG/Kk5MkSulHUGZAc1vUQFriNrKLPzyn3n2qk8f50pagu6dCJRlZ6BgYRNxyGGjGa7ZCQxHjSVrcfSeAx495tekQ5CBPr9UvVvkxfO5uS59noRfpN9C+QMqekgTICpYhHidlU7eCp1jZbGbMfbM6cndEmhjydfUCixQT9aIpCbrXDNu6ZKhb538UbMRILM8lCcr4nIilMtd2o7lzeDzaEfZkuBDTK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:50:33.0914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e82c1b9a-8289-4ca3-484a-08ded5aab76d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3349
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,geanix.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
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
X-Rspamd-Queue-Id: 766876D68A1



On 6/25/26 08:14, Patrice CHOTARD wrote:
> 
> 
> On 6/18/26 11:28, Sean Nyekjaer wrote:
>> When CONFIG_SUPPORT_EMMC_BOOT is enabled, make spl_mmc_boot_mode()
>> return MMCSD_MODE_EMMCBOOT instead of MMCSD_MODE_RAW.
>>
>> This allows the SPL MMC loader to honor the standard configuration
>> options CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION and
>> CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR when locating U-Boot proper,
>> whether it is stored in a GPT partition or in an eMMC hardware boot
>> partition.
>>
>> As a result, both U-Boot SPL and U-Boot proper can be placed in the
>> eMMC hardware boot partitions.
>>
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
>>  arch/arm/mach-stm32mp/stm32mp1/spl.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/stm32mp1/spl.c b/arch/arm/mach-stm32mp/stm32mp1/spl.c
>> index d2e41b8e65f..d2af705a5d1 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp1/spl.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp1/spl.c
>> @@ -56,11 +56,6 @@ u32 spl_boot_device(void)
>>  	return BOOT_DEVICE_MMC1;
>>  }
>>  
>> -u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
>> -{
>> -	return MMCSD_MODE_RAW;
>> -}
>> -
>>  #ifdef CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION
>>  int spl_mmc_boot_partition(const u32 boot_device)
>>  {
> 
> Hi Sean
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice

Hi Sean

After a discussion with Patrick, it should be safer to keep spl_mmc_boot_mode()
implemented as following: 

u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
{
	return IS_SD(mmc) ? MMCSD_MODE_RAW : MMCSD_MODE_EMMCBOOT;
}

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
