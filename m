Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aChuH8UREGryTAYAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 May 2026 10:20:21 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2458A5B06E7
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 May 2026 10:20:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A99B5C8F297;
	Fri, 22 May 2026 08:10:22 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011068.outbound.protection.outlook.com [52.101.65.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E49DC8F296
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2026 08:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnFGPAEBvVB2yeoj8oiiDJ8L4160IhhKFW1bzdHaCr+2MveQp5BvdtzXW5UBxczq8NKiBVFlxK5Cth0+cQsCCCbt5izeniJvDoBy0VOD2V88DC+6+SQIE8VpQaftPvINZmKnNN9N1CS9HDC+wCfoYUUjwZo4ebFazy5OKY7wI1W7nCnt8KC0cjzR8LHuR0iL4bD0Oi/4XxWUi0AnH74bk4CTYPUTfPUEmoJ+Nau67kfX2SbmEv4QdTlrnzLqYxXDbAJktjVzQe7VOjQ1hp1MkR8zZgX5sWHs6HO2zbNT2MIRVB6WK6zMYdPoWzKgAsmbnzbU6mzOMn4Tu/bDLmSsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nevNUZzh1jkIiALdWyUfNwkCh5BM6hobPcbaYOuSPco=;
 b=NHcojM77yb3TUSnlIWCoL85nFp3/KSy8hG8ZAHL4lqizuLFlQjWPYz9Gf8rHLMvk2c/CrS1GNQm9TTpxlwsGqCrJjLrJO3toitUCy31rPUpmIqCJWxETZLvqQFK5ICVpRuB/4ofnmFov/fMj3Rs48Gz/723m+TFrMyD0TjWaOI5LkSsHOsiVM8V2Qcc0eYwJhLL/PaQx0tnSNFH+xNc/K8JbegWzcnE5HUApd+fHLt/8MFQNCA5FzwwtFnqJvRcK303n64hiDY4iihGCr1eeKkrbBO2asHcPtNrkI67Y+H+exozodEyikL1137rARAPLdK8Or3wRqdT90k1Vo36DDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nevNUZzh1jkIiALdWyUfNwkCh5BM6hobPcbaYOuSPco=;
 b=mGF9sdjEPvjtG5TakJhKib23TRfzJ3ID/9s5uuPoC0iKev+1/fPGf73dEy3JCLPs8xDvPrdAqY2oMS95DcjRwA3phRRZuLECbbarfjn6DoIoCo9wu+l1kjl5fiDruOoBwY9NmqAZbl9G2HbJQNKjN20m6FS+MR08WZjCCBLLCHN90LYNkulD2MQ3u3HA+t80kvBvFSE0Wcn/iJ9PiIh+t2Axxd8OH1e+M1Rn/vYkHzD2hu0qZiHkAux6K6IF+RBRIxkKbf4Q3Fx3gKAMR2JXhkKKQL4OzRhdu1BoVqnvm/Ivx4O75Vx7CiJjgjyFj9T+OY7Y/dKS0LaT2wG4D9ATWw==
Received: from AS9PR06CA0267.eurprd06.prod.outlook.com (2603:10a6:20b:45f::33)
 by PAVPR10MB7186.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:314::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Fri, 22 May
 2026 08:10:13 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:20b:45f:cafe::a4) by AS9PR06CA0267.outlook.office365.com
 (2603:10a6:20b:45f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 08:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Fri, 22 May 2026 08:10:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 22 May
 2026 10:13:43 +0200
Received: from [10.48.87.227] (10.48.87.227) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 22 May
 2026 10:10:12 +0200
Message-ID: <47740fa7-a75c-497d-9982-4292ef5764a9@foss.st.com>
Date: Fri, 22 May 2026 10:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260518-master-v1-1-37fd4df56609@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260518-master-v1-1-37fd4df56609@foss.st.com>
X-Originating-IP: [10.48.87.227]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000042:EE_|PAVPR10MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abb8801-4d66-43ae-b676-08deb7d98d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|11063799006|5023799004|6133799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4gqtUGRXsKpBbaCRjokof5EScp7BiCZNe8qQUukyTq7FEyzB8uox/M3DjCrfv5hrH9NgxIKJvoVcmcd2qnF4zAp24V1O+ST4bdhB0GhDCNAwjs4wUORPoSL6HoNbO46/pmYYuoAEaWuJ8H7v8dcPlkjT2m+AeecPi2w0tBofV8Vk8mbtTIXAiMYBWK/54ZQCZ0/MzEK1nHDcm+kWN+gIetbkm7exxVhY0cwxmAmsm4HsOSN1QpKy+FvN/N7eilt0syNdbdu7ZiOrdfaR704Yq4Xk24thHHyA5AxlafjL71Nd2smHi5sjTUxUVo/jLlsHiO7P88gBy9VVzU0odFgp+Zh+7sMYqNloCCmigTZF9sJUmVII6MF9gn3Q4h52GzqQ3/8ACMBzJQ1PV9r2Em5KKP/zZNHkaNzZudQJt+K9hyhyAfyPKUE3ETHaAQ6udm9WSkXb/RdUilYRrCaA/Vkrucj8gToobrGwArCnKF10lECMsZQsPUpl/YHWWrtFGZ3dC1oVmWOsVNwCYIP6xY52QbiqUteRD4ktifnkljsMRolWpcQjT2Iiw2t9xnkVEhxLMEvMQIrojsaHGDCiElVkgeK+3arrPZRB66SyALOnYLs/UO6JG6F7jHim0Qqn55Eo5QnHbS3QoswtiZW/e/6XfbpopihN87Wgg8wLkFBeCAgf3XnCAgDz9J+IPcQxQXrN+kwcOjnZTVL98TntYEcHOb8SdGhHtVmhgsNpCmI7MyQ=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(5023799004)(6133799003)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PoKSoLiTVTah29tusQ72bJDAdv7Z2ZPGJ/PfmKwsKz3KP4biygfGx9Is4Jh5oy0wo0NuKdy/kOAwsF8miB4OfC52aRtDSIW9UOHSvNFJe3zQgmZ6OC5QNY2EjJfqSooaV20BGcZXsXuU6AjNBjkCOhvWSHBXNL+Lx1IJ4T6CUj8Ftz/f1MUIMbKlE0z8dClnwuSz6CLFiTwXOFydgJsnBVUbPjpiLKEzV2U7J6esb1Fewb73EYChMqDtCcUFkpTSYdFGVjhBKa8m7cQd7C+NNW9VKj42N71Cc6fghExI+D/+XMgEuZYSFVRVkJ2ubaPG94/nu1KWc5xJTP7U0WFO3eri7irWyQ34UmNFLMW9WqZsZTnFdz5YPDS+aj/KMYxyuRW/2S+E1AQoPpP0krL4egTgORdWpdR6OXRr0KofOlZtcyMOfZOEwN9nKTJ8u9xb
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 08:10:13.6290 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abb8801-4d66-43ae-b676-08deb7d98d27
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7186
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Peng Fan <peng.fan@nxp.com>,
 Anshul Dalal <anshuld@ti.com>, Michal Simek <michal.simek@amd.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: stm32mp15: Increase
	SYS_MALLOC_F_LEN
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
	GREYLIST(0.00)[pass,body];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:peng.fan@nxp.com,m:anshuld@ti.com,m:michal.simek@amd.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2458A5B06E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 5/18/26 15:28, Patrice Chotard wrote:
> Using stm32mp15_defconfig with stm32mp157c-dk2-scmi.dtsi device tree
> with optee-4.10.0, we got:
>
> U-Boot 2026.07-rc2-00052-g215496fec59b (May 18 2026 - 15:05:34 +0200)
>
> CPU: STM32MP157CAC Rev.B
> Model: STMicroelectronics STM32MP157C-DK2 SCMI Discovery Board
> Board: stm32mp1 in trusted mode (st,stm32mp157c-dk2-scmi)
> alloc space exhausted ptr 80060 limit 80000
> optee optee: PTA_BSEC invoke failed TEE err: 0, err:fffffff4
> alloc space exhausted ptr 80040 limit 80000
> alloc space exhausted ptr 80020 limit 80000
> DRAM:  alloc space exhausted ptr 80040 limit 80000
> RAM init failed: -12
> initcall_run_f(): initcall dram_init() failed
>
> CONFIG_SYS_MALLOC_F_LEN need to be increased to fix this issue
>
> Reported-by: Yann Gautier <yann.gautier@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   configs/stm32mp15_defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index b9e44254087..cc4dfd9af70 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -1,7 +1,7 @@
>   CONFIG_ARM=y
>   CONFIG_ARCH_STM32MP=y
>   CONFIG_TFABOOT=y
> -CONFIG_SYS_MALLOC_F_LEN=0x80000
> +CONFIG_SYS_MALLOC_F_LEN=0x90000
>   CONFIG_CUSTOM_SYS_INIT_SP_ADDR=0xc0100000
>   CONFIG_ENV_OFFSET=0x900000
>   CONFIG_ENV_SECT_SIZE=0x40000
>
> ---
> base-commit: 215496fec59b3fa09256b4fb62f92af46e2ec7f9
> change-id: 20260518-master-059c3c757a19
>
> Best regards,


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
