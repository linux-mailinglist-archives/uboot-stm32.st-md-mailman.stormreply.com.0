Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNUyDEwQBGoMDAIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2026 07:46:52 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C552DB81
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 May 2026 07:46:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B435C8F289;
	Wed, 13 May 2026 05:46:51 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DCA3C01FB6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 May 2026 05:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bss4xR+iKqEQrkxmvsfYPnBwf25rKEauEUA8Wk9tWL4p985/hw/9EQ8Qfwm6bLMKthEFWUIAsfSBdA/59qNkb4j/Z3RhPcycyDlYspJ09pTyE45S+/Fecl2Q6y13L7nalG2QJPn8B6D+rfKRPMALP4XcZQ9Wy44oI2GmK5+5wX4Ef9qmoU88HuEqxTVL94LeEPjFGH2A97Pl20oEnp52m6QD+K1q7GDus2Z/BPjAfhICnGd1+8zxdGL9zrRERkHL+qL0go8poDQmOx2/BWMU6Vti37YhG78YYb9D/+NQgfwytIS7h327fSBBsqGgKPcD4ObQzw9lWAvashyLLbG6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3VEaCU1uA+UrFYrZnh+ehxmbzsOL7IfnUyDJv7q5kE=;
 b=hxqYUzRhwfyLzRu5yRLztjtLXHoVTopFWPmfIh8qK4IIYuluPfoesb6paeiHK5h1P1fiWA+zDW4Y3ywYKmPmvdtwVUS/KMPqU3m1rkJgC9gcrCxKTv9zu1HCHVzDmP7oDQf5W3+azsuG/o+MF5zk/IDUMHuKoOn1j49TQGRSBb6d/Caq06+54Fo+ABpHst8/MY+SGOKZiSJBtqUpPU01VQnFXI1LBOUUYnyXF+rFxJsAZWbLaOWqk91lWj1LqbHtiF+8naJHFsWjCQHUHmhm/FgMISiPf15kRl+oclX7HT3eOconCvIok0ixf1533pIdoplwhV0Io8ZoauvZBCvF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=cherry.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3VEaCU1uA+UrFYrZnh+ehxmbzsOL7IfnUyDJv7q5kE=;
 b=RTmzPiXi1FEEhhdxmo2RF5Kw6A9T8PQKtl97hbYQpE2kDZCkV57YVbjZevjh5/GiDAiv+GUR1GI+7FR5G3PxHI04hcU3u9Y8lNWKzmG4osP3Q3Oyrr3G/lje3yoso0wsqrDLnnWV5ZD65wccm7Y80hZHty9aSVhpv+IWP8xBjecexhCpJN4pgbMhxvaR62Yjxgx903Gzr06Q5B+k9g1w1r9s/SfFzKLXGrCsWhlAgtrHxrPVF4J3oPKBGEUFPacDSDwrWx88Y6kc44gA7nq/tw4Yi9itY2AGGpG8VbUfvP1JhvIFeECtixqlDSJznvpgMINhuVsmhHMyxZ8PffMGKg==
Received: from DU2P250CA0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::6) by
 AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 05:46:48 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:231:cafe::3d) by DU2P250CA0001.outlook.office365.com
 (2603:10a6:10:231::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.17 via Frontend Transport; Wed, 13
 May 2026 05:46:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 05:46:47 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 13 May
 2026 07:50:36 +0200
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 13 May
 2026 07:46:46 +0200
Message-ID: <8bddc5b0-70e5-411e-879e-0c1ef2bf8c69@foss.st.com>
Date: Wed, 13 May 2026 07:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260430-remove_non-existent_stm32_reset-v1-1-8ec87c655379@foss.st.com>
 <f99cdfe2-4490-4e7a-bf76-edfdfdf2080b@cherry.de>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <f99cdfe2-4490-4e7a-bf76-edfdfdf2080b@cherry.de>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AS4PR10MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5711c5-7ee0-4e99-053a-08deb0b305df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: yEIWXmDLGZ0NRObHEv4eCcKIX8TRo6KE/KrAzOSjrV2yxdUwBa529zOe2Bb7XCufZu7nWJj+ENJTiCgqZxpINeBuxyxT02CbI7wt7CfhQTp16GeZItvvLWntLC4yTfnKTUcOnC1DHPxvB7Rzo21i8oRsbRzV2nPyJtgeslLHeSbmlYeURKhA8nKCKbFRpTs8wgBnkjTroW6kIzsOjlgE7cJrKtq7XEvcvDVmuiNw1f5+I2uvnJ5qs0a9h1PN4DU4jA7zKVFryl012/b5OY9hXKxbDjBN6sNQ8rMk/v5wT3UDxycaqtVa5QrspATyWZEouKJlG+Y3s8wvr1CZ/o5KG3H6yeLZ2jILvRG9avuhRLh/nQRxribxf/wADfKIT4Km17pu69E8jJauZwKa0T0UCC0Jmp/LCOHg7SXTLvQpUnaIGnJxFBhSUONWPJRuFOMc4hYuqk1XAHdZEibwzvEV00kPSIci6NK8Vonv/QEVXUeegw9p+bIbla1qcA4RsI6bLZuI8EPTGJ5WwMWZK5C8B6MtWgiyzf9cwRBXfptrEsEXBA6Ljcyi4TwDwl/WvyLKqUGLjrpG92XlWt7pBkc6iiviayUCLCRVUtKkPNWfy9xEZUx2Wwwg5gs/SBYiun41L3iA0kn7MPkOxf5fwgiZrQYnGkaDBOQm+Vt9N/lpcS4wYYIJ0q3gc3+NlC/WYyFVBnJgkoiYPTNQ/ZRoFA1KjEHqhMV230exKCV6BQVUIxU=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(11063799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b3Hql+tGht+iDyg4FSHTUWj/TlgVjafFX+a4VTk2drHpMl55qnTOB75hs1tbhwGoWaJE5qDkUsgOJl3tAObJiQ4ZVt8PeB2Qof40jT420eKX7hBqy8rs7kpdEcWxhJ/lBls5pqCXfgfxMATnFOsVE8NVamQp6TU4VNpmTPYUKQV+EFuyXvEWs0tQD7siYEZKRb1VYyYh3rAKg4NXagY4Lj8ti2gQsm8SUXz32hSg7PC6XGKMeuaQTXHa3Pzt78FCpd2/FA79nCpRCnHkrrSpDrPElDqKK2EpuAhb9jTToboZP4vu/J0UYXKTsadpaFZOZK7dH0BV9E6Pz3ggwzJ0LsrseVnxpbKceHLYPAcXfQM4Df71y51yZT4p4EtMt6RvdMfFnmykjNDFNI2ttquIT8bWoAdslwjanR4Qs6TFZ0mvBbmLIBVK8EsQvz3k+j5k
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 05:46:47.6161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5711c5-7ee0-4e99-053a-08deb0b305df
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6181
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [Uboot-stm32] [PATCH] arm/mach-stm32: Remove remaining
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
X-Rspamd-Queue-Id: CC5C552DB81
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,foss.st.com:mid];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:quentin.schulz@cherry.de,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:michael@amarulasolutions.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.441];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/7/26 12:42, Quentin Schulz wrote:
> Hi Patrice,
> 
> On 4/30/26 9:14 AM, Patrice Chotard wrote:
>> Symbol CONFIG_STM32_RESET does not exist.
>> Don't select it.
>>
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Fixes: fdd30ee308a2 ("ARM: stm32mp: Add STM32MP23 support")
> 
> Thanks!
> Quentin

Applied to u-boot-stm32/master

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
