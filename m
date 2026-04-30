Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHXpAEz+8mkfwgEAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 09:01:32 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E4D49E51F
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2026 09:01:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15662C8F262;
	Thu, 30 Apr 2026 07:01:26 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBDEFC87EDB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2026 07:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHTJOVu+HVegLcnI/OXaDccGXlhXXKuVDGiMbi1JtepZ73BtJ5KNjNBvBdS7uslgREk267zpR+Xi3vXMjxiTsrj7JUjD6E+H5K/xa+ttDk90MTap/pGz3HKoYcHLqDoZbTioVj/DX9RpTEAdzErgUiEIvOJONgXbIktF++XE2orq0kXcEqn1BOKnhGZwGHe8+S13QPs2ioZrA4A9bQZAhuig9UPn5cM5DbHMw2Tni8hJqQ7vroiNBBNGBhI5GT8aeYN6kSnbOg15aq9PcBr+jvlBPynFWf9+d9fVD/K9llP4jcMLThHA6t52MYuU/CKyFPYMjXAqenYGV63lYlGuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fXkwGl7SEkZr1J+Zspzm8uDdFbILhEmc323/I9j90g=;
 b=todX6/2KuI6Zj3lCA/ijYb6PKv8qps4b5X4mc7Lw+4O2NwhpSsXP6VaH+aRfAMjqsZ4RNoKATOBLNUemUfkQxWqdlxPmzJF2lyPahpvjreQ6Xv8RurQTkmBcD+3lOoYR6uG1BEENAlHebOZ+cAt4AcZSxBpOIrhnqEWMbFApPpKPzGMl0dLzWhZoI9DNjCVDXKvafdfW34r62YH7Z0SACM7ZSq9NdyR3BNN+E47qP2q3c+jfqxo9V3ND88LMakbBfXLYThDJFC01UYeBmdayoYF+rK8dUTyEiHZS+m1RgclBmjeh00vX84XUIT2fM0ZVgXZw+P0mfgKgaoq0UnySLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fXkwGl7SEkZr1J+Zspzm8uDdFbILhEmc323/I9j90g=;
 b=JYTMc4M/quolThk2/mtApmeGUo9KHZxHGQOxiXdCgc1RPk6Z2EM3FjCI1iBTZhuGdOBE+TLDmD1t7laWr0td04xgtdqYN5ZfwXVC+AzN64TGLIL1CE9Wp2hC5m41c8KD/ufracww6LEIsQWMNOBNuJ8VYcgtzFWaAAXlMzZv6O4bk04gNTHl2jHw7oWvKPrO2PmreCtm68YHSJ9++31ezwn4zsUCJduNwRrjlsa8DlwgmsJfEqmKGOGfljuwVq2+F3tmwap0GE7b/zbiHKAnBdD6I1zPmxoVfqagtoBExWjEdwfQ0melzKP+MjwOkvoPGP0dvCWtyR3W73kA3UOh0w==
Received: from DU7P250CA0018.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::31)
 by GV1PR10MB7978.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:8a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 07:01:19 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::25) by DU7P250CA0018.outlook.office365.com
 (2603:10a6:10:54f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 07:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 07:01:18 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:04:51 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 30 Apr
 2026 09:01:18 +0200
Message-ID: <95c62e0a-1f47-4256-8312-8e7efe534157@foss.st.com>
Date: Thu, 30 Apr 2026 09:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Tom Rini <trini@konsulko.com>, <u-boot@lists.denx.de>
References: <20260325190027.3428596-1-trini@konsulko.com>
 <f6c27c74-1188-4062-9082-d0f3639d3ce0@foss.st.com>
Content-Language: en-US
In-Reply-To: <f6c27c74-1188-4062-9082-d0f3639d3ce0@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|GV1PR10MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b09a31b-7966-4343-0fe6-08dea68647a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: GKy8IyJKb2Aed4wNK9vTJTPHKyC6PSS1cvJ/m0UCYLpSMwa10Vyifzuy/hDGlq1G6i04+jdiyGoh9hCT9FOuNyQXCjyEwTicY9XXJc+yxtzbJMqXaj003/juCtHv20lNm5Nkd4dAsaSXV/x32D6cs/qc8XnAuo+dgnwfbnntA44INhjEtIEt0xfu4k5jW0256gOPitQJHybA5KglrL8pJoMJkLZ5vCH47j3rLL7dXxivR2XxtYccB59GUIbPmA+UNzPTHFMxmQ78C5hyX0HOrIrXfUtFg8KLRPYYt4nKyE0fxqSw5UnzARFMUlsKvWp3ZWZmq7F6yHjv1g7hWbos8mRtEyCOl2pGO4XXQNH+Y+ywzFlHK+gdNkqD6tTJ5RVW+fP+J5+5WT5GNYiDFSoKUyQ7oBrfQr7jjHlMWxIMkbThus8FN446vnreNroiets0x7J1X1DQ/BVylMCSKP4AnvM6jGUwfTDUD3DL3ZVurvzPYXpKH+ZOYcPZfRnGay6Yl5ammOXzdTNczlisByIV3D/1odKw83FVfVIzK0HdKKxuaTy2ypScOgMQZa9wmjPF6n2kF38SgxNeMxKM6T285Xpl20aD6iVyQpzE77CRxbxrL9Sd9m1GofNVGJuQfUMvq8c5sGzTO9Z/dnq4WEjfSIdReVmbjzhEb9K8jzOmZNGha1tT9xr8JyrENEFCaBAJGCpF55c5wUi1IU6GNVtem3qryYU4NC6P0fJJ6/Q3KcDXe8kEGGJpO0vae6d+UbqfuauWOv59gxzCEokj4khMvw==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3M/ljWIdO6cb4ZFWmvk8Y9gb1Db5GV233sDcIoTv0ZyyyS+/9hqwuvkeNTmG/fC3FtjRnKGFO/FMQSo97iWsY7hGFUps859AlutR/j4hfC/PsrMMJjEt4CTTXbuO9alRDqeVwygODCt8JPwzRnsbTS+oRU3Czkc596t3A/0nMOFgDHCK0KM9p3l8uU4is+WAmL3KETvdRlnvk9QuXBQ4MSWvum9E0lwYRB3CH/RR+N59D5wzQydO0GzkD7wQ2QdXBwidowMFkt1zvfLj5Xe4OB4+9/O8HYSgkN2jjQKc3sPfw02coNbiPQxpP/TJW+ZA5qB15GreLW3Wtguqdz8IwXnhPNnQdPOLgjEme6cF47NgLVQYveGm0fDDsKITJ1h6kpavrDxI7xsz9H5zdfsdiabt7xSCjIkc0kbj69pkT7PxF/2q5QJh63eqtGpK6IEx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:01:18.9755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b09a31b-7966-4343-0fe6-08dea68647a3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB7978
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dillon Min <dillon.minfei@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Matteo
 Lisi <matteo.lisi@engicam.com>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: Drop unnecessary
 BOARD_EARLY_INIT_F usage
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
X-Rspamd-Queue-Id: 66E4D49E51F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,engicam.com:email,amarulasolutions.com:email];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:dillon.minfei@gmail.com,m:jagan@amarulasolutions.com,m:matteo.lisi@engicam.com,m:dillonminfei@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[foss.st.com,st-md-mailman.stormreply.com,gmail.com,amarulasolutions.com,engicam.com];
	NEURAL_SPAM(0.00)[0.991];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MAILSPIKE_FAIL(0.00)[52.209.6.89:query timed out];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]



On 3/26/26 10:42, Patrice CHOTARD wrote:
> 
> 
> On 3/25/26 20:00, Tom Rini wrote:
>> All of these platforms enable CONFIG_BOARD_EARLY_INIT_F and then have a
>> do-nothing board_early_init_f function. Change to not enabling the
>> option and so not needing an empty function.
>>
>> Signed-off-by: Tom Rini <trini@konsulko.com>
>> ---
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Matteo Lisi <matteo.lisi@engicam.com>
>> Cc: Dillon Min <dillon.minfei@gmail.com>
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>  arch/arm/mach-stm32mp/stm32mp1/spl.c         | 15 ++++++---------
>>  board/engicam/stm32mp1/spl.c                 |  6 ------
>>  board/st/stm32h750-art-pi/stm32h750-art-pi.c |  5 -----
>>  configs/stm32h750-art-pi_defconfig           |  1 -
>>  4 files changed, 6 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/arm/mach-stm32mp/stm32mp1/spl.c b/arch/arm/mach-stm32mp/stm32mp1/spl.c
>> index e63bdaaf42fd..d2e41b8e65ff 100644
>> --- a/arch/arm/mach-stm32mp/stm32mp1/spl.c
>> +++ b/arch/arm/mach-stm32mp/stm32mp1/spl.c
>> @@ -90,11 +90,6 @@ void spl_display_print(void)
>>  }
>>  #endif
>>  
>> -__weak int board_early_init_f(void)
>> -{
>> -	return 0;
>> -}
>> -
>>  uint32_t stm32mp_get_dram_size(void)
>>  {
>>  	struct ram_info ram;
>> @@ -204,10 +199,12 @@ void board_init_f(ulong dummy)
>>  	/* enable console uart printing */
>>  	preloader_console_init();
>>  
>> -	ret = board_early_init_f();
>> -	if (ret) {
>> -		log_debug("board_early_init_f() failed: %d\n", ret);
>> -		hang();
>> +	if (IS_ENABLED(CONFIG_BOARD_EARLY_INIT_F)) {
>> +		ret = board_early_init_f();
>> +		if (ret) {
>> +			log_debug("board_early_init_f() failed: %d\n", ret);
>> +			hang();
>> +		}
>>  	}
>>  
>>  	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
>> diff --git a/board/engicam/stm32mp1/spl.c b/board/engicam/stm32mp1/spl.c
>> index bb2bd446aa8c..19e5ab0180f9 100644
>> --- a/board/engicam/stm32mp1/spl.c
>> +++ b/board/engicam/stm32mp1/spl.c
>> @@ -15,9 +15,3 @@ void board_vddcore_init(u32 voltage_mv)
>>  	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER))
>>  		opp_voltage_mv = voltage_mv;
>>  }
>> -
>> -int board_early_init_f(void)
>> -{
>> -	return 0;
>> -}
>> -
>> diff --git a/board/st/stm32h750-art-pi/stm32h750-art-pi.c b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
>> index 244bb5eefb3a..8b1b23337790 100644
>> --- a/board/st/stm32h750-art-pi/stm32h750-art-pi.c
>> +++ b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
>> @@ -32,11 +32,6 @@ int dram_init_banksize(void)
>>  	return 0;
>>  }
>>  
>> -int board_early_init_f(void)
>> -{
>> -	return 0;
>> -}
>> -
>>  int board_late_init(void)
>>  {
>>  	return 0;
>> diff --git a/configs/stm32h750-art-pi_defconfig b/configs/stm32h750-art-pi_defconfig
>> index 971d5c00d88f..0d0dca2511b7 100644
>> --- a/configs/stm32h750-art-pi_defconfig
>> +++ b/configs/stm32h750-art-pi_defconfig
>> @@ -24,7 +24,6 @@ CONFIG_DEFAULT_FDT_FILE="stm32h750i-art-pi"
>>  CONFIG_SYS_CBSIZE=256
>>  CONFIG_SYS_PBSIZE=282
>>  # CONFIG_DISPLAY_CPUINFO is not set
>> -CONFIG_BOARD_EARLY_INIT_F=y
>>  # CONFIG_BOARD_INIT is not set
>>  CONFIG_BOARD_LATE_INIT=y
>>  CONFIG_SYS_PROMPT="U-Boot > "
> 
> Hi Tom
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
