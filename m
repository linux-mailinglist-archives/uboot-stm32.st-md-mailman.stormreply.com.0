Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPGqKuD+8mmIwQEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 09:04:00 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBABD49E579
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 09:03:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52983C8F262;
	Thu, 30 Apr 2026 07:03:59 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010032.outbound.protection.outlook.com [52.101.84.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC5CFC87EDB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2026 07:03:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVd74MbHhCAb+mB8ODqH9h6sha9c7OHxUqI4ThmoTU7CynmYo818EaTtt3IY65r25SkgT8eWgToJbsQ3Fnx85AkAsRII0IwCIfX9gsxr6BhLsqPrabNBW8RgDv9dLRCQEsTvEqdSkvpmLuTG7zB1Owmja1fvX6kw5dB40obYeXJwrabzE5fPI5CFzH/yflVP13hOIQZrk/J+er18lP1u84Q/Wl0GZMVTnmt7/O43/9UE316xkUj19sORytPQDZN4+lil9FCVEBO/rgvmhBvtOXtl/B2KYJ50koRvBiRXmmq44kxlO+MxV4VuaqjMLSjFQNidDYbaptImej4aT/1uIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gEO3eG4Tdof+nglwp79Ls5Zy+cUj+Ed8qCk1Bt9Fuw=;
 b=ACt+/VMc2ntSRjtrNvo0F5uhc43fIjh6kCeYYh+ft4+yTBqZQ9aXXKtv1RXDbjyJCAoJfCLNpWUXed7311G6qM0P2230u6a/6FPKDEI+JXowiYuaKOjWtCZqWvMxd0H47HZLHqoMS2PBpToC3I/wjscPAD7GQjGqL6oEacnQIa9rBNNBHEkCn/a/kyNofrUObT0YTWze3p3kFsWyW8NXkQx/ufwUpTfD1V052P+f0JUn/ipD3ulZu+BR31ZVsEl3waTPF0b09nsyPESxdiWgEE97rZPD8+wWoZaCHsH2uK548zSVy+KWJM7oZvmNoqM/6muJc4zu6FyuWwwxsHnVzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=canonical.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gEO3eG4Tdof+nglwp79Ls5Zy+cUj+Ed8qCk1Bt9Fuw=;
 b=b4+Py6WGesJVE01pH9o+gkzYCGjSheiojwpQuC435yS9DQ//vDtgpXPwcK80esbwLffq+JRFpO9tLpszm0s7og6i7UT3edebn0wsOwvGEFAk3TEfY+avtaZ9AVckgG6CBW50bX/+4EdKN/a42f0pVU3gGDohPg7AIbJaQ5oYvEG+c/i0JJK2FTYRM091LxwHFXY4lOI/FjmkxPA8yQE2F7vQUtzJQRO9ToH3VDa6PwoUfjRt5JUmHyLzjxlFsmKBAbbeWlpkaoBvZgqohNXbWbp+SWrCSXVHTEebDLxbzkuF0au54x0PjMk9MRoa/cwOUMYYsz62xLSXZNhFanpCTA==
Received: from DUZPR01CA0172.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::29) by AS2PR10MB6799.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5f3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Thu, 30 Apr
 2026 07:03:50 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::9c) by DUZPR01CA0172.outlook.office365.com
 (2603:10a6:10:4b3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 07:03:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Thu, 30 Apr 2026 07:03:48 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:06:59 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:03:46 +0200
Message-ID: <fff03760-f6c8-4d80-ba79-303610114269@foss.st.com>
Date: Thu, 30 Apr 2026 09:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Tom Rini
 <trini@konsulko.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>
References: <20260225070224.49099-1-heinrich.schuchardt@canonical.com>
 <d6801cfe-4dca-42bf-83b3-083e996b25f6@foss.st.com>
Content-Language: en-US
In-Reply-To: <d6801cfe-4dca-42bf-83b3-083e996b25f6@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|AS2PR10MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 7365ea90-75d6-4437-ac64-08dea686a117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: BjZ8etXcZt2Z7nK8g3JVyQ45AskLdzQ0y3W8sDLdqenHpIfrufoNxCPmviOssKgvvlgiI4o8Ad5VSwpsT+Lf9Czzb9LmcdvfBUoZQD2WhRwBGr+dOJIcVSr9AKmwZvQNQHXSDuy8uCg8u4RKrUYqESaECtxHbGmo3JaRnQ4HqUy0svYPwrh1/6F2iaHgJgG+fiJGinhUMT6f63ZZywIyulXLYL5tX0fyiYoEZkWBOkCqcNKELtxgTA1inkfyRbddbWn5FO7tRez5TZjDAU/X9QbFbu34J42LxiYUWD22fTnp1a1JaUuNMepgXTTCmLUjZds7SvpzPZSJjWajv3bWJE95m9qJNIiSi/ZWhGijm0vJINXLWUXIiX3bjP/LlVMzlUkKFgHFZLEY4IdwPRq/2gKy0zMuuAiKn5IbYMcOr26riD9mbvptXSuyDj7DJxQwhZbLPol3DaoddNSI+9j/dywOFtxyPGBCz6Q1NHwkM2OktsX8ktKhWuq5/pofzD+mLvumaXRYMXffstrSYSXkmshsb3W+0ZlIMXCQGj2F3KkccgCOxW5VWdFB+x7Dzaa84EJ4GCZJKjGvVwvE6mahcJaIPf9mUXXRS9eMn921uHx12EZBHQjV57tXoU0Kpbn5ZzxTpLriLRCjSYWlLGGw4NAhc3i7rVazUsEUt8TVnMr1fvCNZ0XGhApgMojKfCy+/YYjukSDL6JtdSMp3vIBEKUvsPiE5yeaIOISW1uPTyU=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JxCerSZyjvTK4wWGL7bUDee7DqsIaBSe8nNcXUDDhUj8647fsh3EVhj3DDeP28ZEfGpdwlU4p2LvJxzm+d5rMw8mw1alBjd89Nl/HXoL7IBzxWdC0o9yOnkvIDLFFDfKhhScJUGhZwprVKW+4p4802t7hyedLAHIlwuLL+wtPaqaUa24gu2aK39Yh24LdjtuT8zdKP9ECQotZPfZg9nHnFESJrmeZMbauMOwLNf1K8GPZdrjUU6hT8saAn95Y+o/HZlWysj9cNPg0qOcNYVBua0NP83GgCLisqWOywxSRYiafGaY5WsCz2Ehpg0FbQ05ETqxqEvMHAS1E2aOYXhXDqtO5vKCJ+5+D4LCvxOUfimrbkWHJvGcE1zicdhoUJR8ffXBsGoAxxIJzoVHaYrb+ORK2BUSHJW6eMg1GyFHTlgo8RrPsMsDZshUlK/GG4/y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:03:48.8771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7365ea90-75d6-4437-ac64-08dea686a117
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6799
Cc: Marek Vasut <marek.vasut@mailbox.org>,
 Cheick Traore <cheick.traore@foss.st.com>, u-boot@lists.denx.de,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 1/1] arm/mach-stm32: don't select
 non-existent STM32_RESET
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
X-Rspamd-Queue-Id: BBABD49E579
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:heinrich.schuchardt@canonical.com,m:trini@konsulko.com,m:patrick.delaunay@foss.st.com,m:marek.vasut@mailbox.org,m:cheick.traore@foss.st.com,m:u-boot@lists.denx.de,m:fabrice.gasnier@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:lionel.debieve@foss.st.com,m:michael@amarulasolutions.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,canonical.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,foss.st.com:mid,ozlabs.org:url];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.045];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 2/25/26 09:44, Patrice CHOTARD wrote:
> 
> 
> On 2/25/26 08:02, Heinrich Schuchardt wrote:
>> Symbol CONFIG_STM32_RESET does not exist.
>> Don't select it.
>>
>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>> ---
>>  arch/arm/mach-stm32/Kconfig   | 3 ---
>>  arch/arm/mach-stm32mp/Kconfig | 4 ----
>>  2 files changed, 7 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
>> index de9d8547e61..1c6de559142 100644
>> --- a/arch/arm/mach-stm32/Kconfig
>> +++ b/arch/arm/mach-stm32/Kconfig
>> @@ -10,7 +10,6 @@ config STM32F4
>>  	select PINCTRL_STM32
>>  	select RAM
>>  	select STM32_RCC
>> -	select STM32_RESET
>>  	select STM32_SDRAM
>>  	select STM32_SERIAL
>>  	select STM32_TIMER
>> @@ -27,7 +26,6 @@ config STM32F7
>>  	select PINCTRL_STM32
>>  	select RAM
>>  	select STM32_RCC
>> -	select STM32_RESET
>>  	select STM32_SDRAM
>>  	select STM32_SERIAL
>>  	select STM32_TIMER
>> @@ -47,7 +45,6 @@ config STM32H7
>>  	select RAM
>>  	select REGMAP
>>  	select STM32_RCC
>> -	select STM32_RESET
>>  	select STM32_SDRAM
>>  	select STM32_SERIAL
>>  	select STM32_TIMER
>> diff --git a/arch/arm/mach-stm32mp/Kconfig b/arch/arm/mach-stm32mp/Kconfig
>> index 2716844b259..8ade36e4fbb 100644
>> --- a/arch/arm/mach-stm32mp/Kconfig
>> +++ b/arch/arm/mach-stm32mp/Kconfig
>> @@ -50,7 +50,6 @@ config STM32MP13X
>>  	select OF_BOARD_SETUP
>>  	select PINCTRL_STM32
>>  	select STM32_RCC
>> -	select STM32_RESET
>>  	select STM32_SERIAL
>>  	select SUPPORT_SPL if !TFABOOT
>>  	select SYS_ARCH_TIMER
>> @@ -72,7 +71,6 @@ config STM32MP15X
>>  	select OF_BOARD_SETUP
>>  	select PINCTRL_STM32
>>  	select STM32_RCC
>> -	select STM32_RESET
>>  	select STM32_SERIAL
>>  	select SUPPORT_SPL
>>  	select SYS_ARCH_TIMER
>> @@ -91,7 +89,6 @@ config STM32MP23X
>>  	select OF_BOARD
>>  	select PINCTRL_STM32
>>  	select STM32_RCC
>> -	select STM32_RESET
>>  	select STM32_SERIAL
>>  	select STM32MP_TAMP_NVMEM
>>  	select SYS_ARCH_TIMER
>> @@ -117,7 +114,6 @@ config STM32MP25X
>>  	select OF_BOARD
>>  	select PINCTRL_STM32
>>  	select STM32_RCC
>> -	select STM32_RESET
>>  	select STM32_SERIAL
>>  	select SYS_ARCH_TIMER
>>  	select TFABOOT
> 
> Hi Heinrich
> 
> I noticed that i will need to send an additional patch similar to yours when my last pull request will be 
> merged by Tom as i was still using STM32_RESET when adding STM32MP21 support:
> 
> https://patchwork.ozlabs.org/project/uboot/patch/20260203-upstream_add_stm32mp21_support-v1-5-48ca3409cce1@foss.st.com/
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> Patrice
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
