Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGvEB3Ecg2l/hwMAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:16:17 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D0FE45B3
	for <lists+uboot-stm32@lfdr.de>; Wed, 04 Feb 2026 11:16:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAE5BC87ECC;
	Wed,  4 Feb 2026 10:16:16 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66EE7C87EC9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 10:16:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXB025CE75sOcctZa+up7nridY0U01S37mPYfqHF0ywJ0eguaF8oDe1cjlWrQizArgq9gsVFBr5OdhfrMaEN03qeZgERrgOVLjKnsA1u3CQd82wajN6lYLKc+lTIvi857IS3fcMt+cg4D4jIjREBhhOwbnOTMKprAclXgKAgLd5vFzTGnrwusYI5Vu3f9DKbsycGfy98SDYtzqlrnoFftNDYL6l3eW1qLTfXJirOKe6wC6c/42WGeT1R628bevIQL12DRNJRg5EFaHzFiPvNZ264RyfouuHf+c7L/MeIEYyKl/1vsUIUyzbwuoNxo7HJnkSnXFt4rkkdgYEAfsvkkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Oz96AZaoUaHNBnOezgeIAW8MOvzOiEqM/HSZ7SQKKE=;
 b=NS8brJCZtyAc5GoeX224RhZWdDEdHJVX2fRXROf+T8XALZel24lh4pW9zfuEn4J7OjiKl7Q4wchEzLC5oqkF6cnobrwzcVdtgq0tUFQxPqF7hiGn4seHewN82YpMvcntJLXCfvtc6EIP6/8c3RzyT7Wymxy/CKTwr6PoJ+UX0LrgrpzHE6FdTh8coFr1kho3rDMHA2aJTNwW7qwlQtaclfVtFKCV16aNLDpYvCY4XpTxnSmUu0Hk1uTrXNam6CocMjFDrvKYha/w/q/iErzSJoFFtnHfYDRnSje/q4QBv81/9o6GCizGCYTQ8Nz97tWrPEDYmnGuSLvmB7FE8n4mzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Oz96AZaoUaHNBnOezgeIAW8MOvzOiEqM/HSZ7SQKKE=;
 b=YaTNOHMR3wqYwTW2XMiAgOi0SAEgY38yoEDg2Qi2Qwc1forcEp7/AfSmIVL+5ZVWRpedis2eejRucbmlnCCBdCZ5I2Pk7dotHb9PneMQirltFlsSjbtkKEdhmN4nDZL+eozwY2zGvFNzYvPVnc1wOfAhoUqdkMRRt8EemTbBOqFMRr+ctXUk2l6OA3GdXnZRCU3cugM48oTopsHGzNseUojKIRuvMBZEb5bvBaCu9Nw4jBzBjprwRaZZbkPQdJFO+UT8UE2Ssf6JqJiuClQRtaikuSJBwNUBbSEGFFbuEn+fs9IQG1kHdlzDhD55VLn36kvOan9FYZhquJQc3tFUlQ==
Received: from DUZPR01CA0198.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::29) by AM7PR10MB3608.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:134::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 10:16:09 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::d2) by DUZPR01CA0198.outlook.office365.com
 (2603:10a6:10:4b6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 10:16:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 10:16:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:17:55 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 11:16:08 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 4 Feb 2026 11:16:06 +0100
MIME-Version: 1.0
Message-ID: <20260204-upstream_factorize_and_update_read_idc-v2-1-7f0baa41d2f1@foss.st.com>
References: <20260204-upstream_factorize_and_update_read_idc-v2-0-7f0baa41d2f1@foss.st.com>
In-Reply-To: <20260204-upstream_factorize_and_update_read_idc-v2-0-7f0baa41d2f1@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|AM7PR10MB3608:EE_
X-MS-Office365-Filtering-Correlation-Id: 20648739-97e5-4d7f-b1ca-08de63d66a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUlVWG9UNDNTcEtBaitqM0FTWm9XTkFHK0RiSkQ0ZTYvZCsyT0xTeUplUHR2?=
 =?utf-8?B?R2RQbUkxSVNxMFpzSllzc3N5MFZhVWxYNHNpbUxIU1JBUkpUQ2hZemlpYldI?=
 =?utf-8?B?YjZNblJDN29UdkJVRFMwSnl1dzFRUk5URVdDMXN0TlpYMzBnVDhTS3Y4eVRO?=
 =?utf-8?B?dFVMRFlzOHF3R0NRaUtIaTM0SFUwUy9rSGFQR2VmVktoWCtqU085WC9lbFFp?=
 =?utf-8?B?Q29LVzVKeU1HQzExQXRQR2dFdGw5M29aMFpxNkhLUmZOcmpIbnR2WUFocGZ2?=
 =?utf-8?B?Y0xiZ1crNEIraXc2Zy9pTFMrRmNOeWpQQ2w3b3d1NS9TejE1bmNCZ2VuTFEz?=
 =?utf-8?B?ZzFQOHFZSG5kNGJCdGh5cGRvaXMxTjBHMjVpZXlYRXF0eWlnUUVuNS8yZzlo?=
 =?utf-8?B?OTdqMHpDZ3ZTazgyVW1IbnhPTlI2TnVnQ0c1MVpnbjFHelJXdEg3R3NXcHVB?=
 =?utf-8?B?ZFZPS0xoWGZrdm9Ub3dkbVU2b0F4N3p1VzVhc0tUSlZNeUpkbkJGTDF4TDBr?=
 =?utf-8?B?YUZBYXhxU0E1MGN0YTc3Z0dKdW90L0VPNkFrWVlneW4yS2JIaW1rQklMUG0v?=
 =?utf-8?B?LzlMUEZvdHlNdEFtZ3JRbWFNWjNTRjhUUFNadFNQSWJocWUrRk9aVERhdVJI?=
 =?utf-8?B?d1RRd0JheDhqZThCK2R1OGRnelhHTFUxR0svbHJBQjJZUTRPczRlQlJKWnoy?=
 =?utf-8?B?elI4SUI5SjNGU3JNLzVGRGZxWjh2L080YlVCeUJ0RUFvWGFGSUhnVmRBTEl6?=
 =?utf-8?B?QWhpU0l2eEU3bGdtbjBERFBoczFFaHJVYW15Wlp2K3ViUEd1RmRBNys3NGI4?=
 =?utf-8?B?a1l6cWx6T2NWQ0ZPeUY5QWJIdjV5L0d5YjJRc0VSNUJQUFZUaWRjeWlIOTc1?=
 =?utf-8?B?S2pUZ3B0MVNtYmoxbkl5VlNQYmlDSnMvZ1NHYi82K1IrREJBQlFZVW85MkNI?=
 =?utf-8?B?a2J4ZUk1Uzk3czMrblNlRjZTa1E4aS8wUXB4SnFSQXdiMkMydGduUkl6UjR0?=
 =?utf-8?B?Y1g0QzVVOUttazB5cDlxb0Jkc1FGTW0xeHdBOHBKdG1YSStmY2hjTFdJdm43?=
 =?utf-8?B?YXJhSkovQklmbThTcDRtTkpkejd6SVYyNERqZGRHOUE2cHlaVE9weHhJdjhE?=
 =?utf-8?B?RXI1V2lUWEFyM0llSjNyM0k3NVlTVjFUaGVxR21ZNEpyRGpKcVJtTENlcHg1?=
 =?utf-8?B?Mk96clh2ZEVCK0ViNzZxcmZ3YUZuSUhOZUY4QXJoTit3ZnpNSjMwUHh2ODJI?=
 =?utf-8?B?cVIyNitlL3kvUkIzQVFNZTdlcFgrWXNDdlFqNDlwNTVHR0o1ZWhMZUVlT2NB?=
 =?utf-8?B?Z3E2Wm5EQUhGdWpCeDdVWCtKc0UzOUhwN2JBWHpPdUp6c0JGZWNrN0M4UDFL?=
 =?utf-8?B?VHlXMmZPSXpqSTdwWWFxUzlsQkc2SFVCWEprTXg0eFV6bCtobjR6QzN0YXJp?=
 =?utf-8?B?TzNlL2E0bks0VDRadVVzODhGNUI2eURUQmpFSWFEUGVZcXFEOHJHelIvbm5P?=
 =?utf-8?B?N3VTZ3NVbzViS3VsV3VpU1crZ3M2Zzg3d3RWSGNJem1FbjBpdjFoMENtdUlw?=
 =?utf-8?B?NWhyR1MvVnNpT1B4RDMvTFlMSWNYalR0Vkl4YkY0c1p3d1l2UVNkcjN5RlpN?=
 =?utf-8?B?NXVVUEgvYkIyZVZTZjAvQWxhSUFxcFhMc0FzU25vWWlCOGh4dFNiaFk0d2tN?=
 =?utf-8?B?Z3VTc24wbjVubnZ6d2xGcDloU2l0aHRaRjk0MzQ5ckhFVytPRG9tRjVRVHN3?=
 =?utf-8?B?OWFneEZibUp2VDJVNjZRd1JYUjlVNHdJRldTWGR1RXlOalJkcXYzY3VkT0ts?=
 =?utf-8?B?dVN4RWIraTRaMGhBc1hneGRzN1padzF0Sk9rNlpNaFZzMUdYR2Zmc1RZcnBY?=
 =?utf-8?B?K2RUTTlWbnJORFR5YUpETTFnUHlGVVRqVHBPSk1pQTVJUTBKRHo2eERFYlZ1?=
 =?utf-8?B?V0VPOHNybzd3Y1F5WDZqMFVva2xwZXkySi9MT1lYZDhSMUZJUE1DL2lzaDBR?=
 =?utf-8?B?MVZESzloL0t4bUQ4TU1odkJnN2kza0xMS0FWZGcwK2NyaWVrL1ZkR0kzTEs5?=
 =?utf-8?B?bEdsTUZ3QytQWVgzUy83RGxLaS9wTVNWNEhQSG9MMzhId0tJNWE0M3QvcWFM?=
 =?utf-8?B?Y2E2a2tLNFRQUTVOTFFYN3RlQ1BGMFI0MzBRd2VjeThIQlYrN012Mit6ZlZN?=
 =?utf-8?B?T25oaGJPOWxWNnZhNzZnNmY3YTB2RG1ZUWd6Y0dvNGt5WkFxUWtHRHhwTkVq?=
 =?utf-8?B?KzFzcXc2MHlQbkZYL3l6MnZmMml3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CINPsNiKiA1KSIeoISNBMLst3hVkz+0LPz+TwG0/LBmgWZTbEoyHkN917uduoheNzL6v94QfcYHM0JqygyiLmzEjUiSkl6j6CnFD3GISzqyK2v4q5zN+JKgjVbSJpwpSlN7xrGyMvrnePYtA79JyYjmI4U6DpysgVm1RN8CBYD+jznzffljDf4DgXBs8tK6nFUKcxvJU6p8lHpV0sgehjN/G0bCt5IccAm9DJJ2h9IFJgtyat4aVwsl1yf6Fhn0pnQDNDBDq38qflIg2NqymfIo3UdCP8ZJ9HAXMdFe5K/qFLTJNXFGqySPZuMgQWzcSj9xMnxy2v1EwdUJTfDm9sFR8id8NbKrQjf3GBmNdT8RTyVDoa0QXoy6OMM/D5pilVD5Pi9BNJFupEuzqVb3GP6e6fQd8pyTMAKnh+w35keK1+kI5kpyp9hPeHX0zMMXC
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 10:16:09.2063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20648739-97e5-4d7f-b1ca-08de63d66a72
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3608
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: [Uboot-stm32] [PATCH v2 1/3] stm32mp2: Migrate duplicated code into
	stm32mp2x.c
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 06D0FE45B3
X-Rspamd-Action: no action

Same code is duplicated into stm32mp25x.c, stm32mp23x.c and stm32mp21x.c.

Migrate read_deviceid(), get_cpu_dev(), get_cpu_rev(), get_cpu_type() and
get_cpu_package() into new stm32mp2x.c.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/mach-stm32mp/stm32mp2/Makefile     |  1 +
 arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c | 44 -----------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c | 44 -----------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c | 46 ------------------------
 arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c  | 56 +++++++++++++++++++++++++++++
 5 files changed, 57 insertions(+), 134 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp2/Makefile b/arch/arm/mach-stm32mp/stm32mp2/Makefile
index b25af2e8934..8f2e641dcab 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/Makefile
+++ b/arch/arm/mach-stm32mp/stm32mp2/Makefile
@@ -6,6 +6,7 @@
 obj-y += cpu.o
 obj-y += arm64-mmu.o
 obj-y += rifsc.o
+obj-y += stm32mp2x.o
 obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
 obj-$(CONFIG_STM32MP21X) += stm32mp21x.o
 obj-$(CONFIG_STM32MP23X) += stm32mp23x.o
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c
index 40d0f329496..7b5d79d3497 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp21x.c
@@ -11,19 +11,6 @@
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
 
-/* SYSCFG register */
-#define SYSCFG_DEVICEID_OFFSET		0x6400
-#define SYSCFG_DEVICEID_DEV_ID_MASK	GENMASK(11, 0)
-#define SYSCFG_DEVICEID_DEV_ID_SHIFT	0
-
-/* Revision ID = OTP102[5:0] 6 bits : 3 for Major / 3 for Minor*/
-#define REVID_SHIFT	0
-#define REVID_MASK	GENMASK(5, 0)
-
-/* Device Part Number (RPN) = OTP9 */
-#define RPN_SHIFT	0
-#define RPN_MASK	GENMASK(31, 0)
-
 /* Package = bit 0:2 of OTP122 => STM32MP21_PKG defines
  * - 000: Custom package
  * - 001: VFBGA361 => AL = 10x10, 361 balls pith 0.5mm
@@ -32,37 +19,6 @@
  * - 101: TFBGA289 => AM = 14x14, 289 balls pith 0.8mm
  * - others: Reserved
  */
-#define PKG_SHIFT	0
-#define PKG_MASK	GENMASK(2, 0)
-
-static u32 read_deviceid(void)
-{
-	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-
-	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
-}
-
-u32 get_cpu_dev(void)
-{
-	return (read_deviceid() & SYSCFG_DEVICEID_DEV_ID_MASK) >> SYSCFG_DEVICEID_DEV_ID_SHIFT;
-}
-
-u32 get_cpu_rev(void)
-{
-	return get_otp(BSEC_OTP_REVID, REVID_SHIFT, REVID_MASK);
-}
-
-/* Get Device Part Number (RPN) from OTP */
-u32 get_cpu_type(void)
-{
-	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
-}
-
-/* Get Package options from OTP */
-u32 get_cpu_package(void)
-{
-	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
-}
 
 int get_eth_nb(void)
 {
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c
index 022db60811a..e4e5812760c 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp23x.c
@@ -11,19 +11,6 @@
 #include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
 
-/* SYSCFG register */
-#define SYSCFG_DEVICEID_OFFSET		0x6400
-#define SYSCFG_DEVICEID_DEV_ID_MASK	GENMASK(11, 0)
-#define SYSCFG_DEVICEID_DEV_ID_SHIFT	0
-
-/* Revision ID = OTP102[5:0] 6 bits : 3 for Major / 3 for Minor*/
-#define REVID_SHIFT	0
-#define REVID_MASK	GENMASK(5, 0)
-
-/* Device Part Number (RPN) = OTP9 */
-#define RPN_SHIFT	0
-#define RPN_MASK	GENMASK(31, 0)
-
 /* Package = bit 0:2 of OTP122 => STM32MP23_PKG defines
  * - 000: Custom package
  * - 011: TFBGA361 => AL = 10x10, 361 balls pith 0.5mm
@@ -31,37 +18,6 @@
  * - 101: TFBGA436 => AI = 18x18, 436 balls pith 0.5mm
  * - others: Reserved
  */
-#define PKG_SHIFT	0
-#define PKG_MASK	GENMASK(2, 0)
-
-static u32 read_deviceid(void)
-{
-	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-
-	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
-}
-
-u32 get_cpu_dev(void)
-{
-	return (read_deviceid() & SYSCFG_DEVICEID_DEV_ID_MASK) >> SYSCFG_DEVICEID_DEV_ID_SHIFT;
-}
-
-u32 get_cpu_rev(void)
-{
-	return get_otp(BSEC_OTP_REVID, REVID_SHIFT, REVID_MASK);
-}
-
-/* Get Device Part Number (RPN) from OTP */
-u32 get_cpu_type(void)
-{
-	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
-}
-
-/* Get Package options from OTP */
-u32 get_cpu_package(void)
-{
-	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
-}
 
 int get_eth_nb(void)
 {
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
index bf1f3d3c5a7..e0d54f4ecc8 100644
--- a/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp25x.c
@@ -6,24 +6,9 @@
 #define LOG_CATEGORY LOGC_ARCH
 
 #include <log.h>
-#include <syscon.h>
 #include <asm/io.h>
-#include <asm/arch/stm32.h>
 #include <asm/arch/sys_proto.h>
 
-/* SYSCFG register */
-#define SYSCFG_DEVICEID_OFFSET		0x6400
-#define SYSCFG_DEVICEID_DEV_ID_MASK	GENMASK(11, 0)
-#define SYSCFG_DEVICEID_DEV_ID_SHIFT	0
-
-/* Revision ID = OTP102[5:0] 6 bits : 3 for Major / 3 for Minor*/
-#define REVID_SHIFT	0
-#define REVID_MASK	GENMASK(5, 0)
-
-/* Device Part Number (RPN) = OTP9 */
-#define RPN_SHIFT	0
-#define RPN_MASK	GENMASK(31, 0)
-
 /* Package = bit 0:2 of OTP122 => STM32MP25_PKG defines
  * - 000: Custom package
  * - 001: VFBGA361 => AL = 10x10, 361 balls pith 0.5mm
@@ -31,37 +16,6 @@
  * - 101: TFBGA436 => AI = 18x18, 436 balls pith 0.5mm
  * - others: Reserved
  */
-#define PKG_SHIFT	0
-#define PKG_MASK	GENMASK(2, 0)
-
-static u32 read_deviceid(void)
-{
-	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
-
-	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
-}
-
-u32 get_cpu_dev(void)
-{
-	return (read_deviceid() & SYSCFG_DEVICEID_DEV_ID_MASK) >> SYSCFG_DEVICEID_DEV_ID_SHIFT;
-}
-
-u32 get_cpu_rev(void)
-{
-	return get_otp(BSEC_OTP_REVID, REVID_SHIFT, REVID_MASK);
-}
-
-/* Get Device Part Number (RPN) from OTP */
-u32 get_cpu_type(void)
-{
-	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
-}
-
-/* Get Package options from OTP */
-u32 get_cpu_package(void)
-{
-	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
-}
 
 int get_eth_nb(void)
 {
diff --git a/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c b/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c
new file mode 100644
index 00000000000..551601a12a9
--- /dev/null
+++ b/arch/arm/mach-stm32mp/stm32mp2/stm32mp2x.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-3-Clause
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#define LOG_CATEGORY LOGC_ARCH
+
+#include <log.h>
+#include <syscon.h>
+#include <asm/io.h>
+#include <asm/arch/sys_proto.h>
+
+/* SYSCFG register */
+#define SYSCFG_DEVICEID_OFFSET		0x6400
+#define SYSCFG_DEVICEID_DEV_ID_MASK	GENMASK(11, 0)
+#define SYSCFG_DEVICEID_DEV_ID_SHIFT	0
+
+/* Revision ID = OTP102[5:0] 6 bits : 3 for Major / 3 for Minor*/
+#define REVID_SHIFT	0
+#define REVID_MASK	GENMASK(5, 0)
+
+/* Device Part Number (RPN) = OTP9 */
+#define RPN_SHIFT	0
+#define RPN_MASK	GENMASK(31, 0)
+
+#define PKG_SHIFT	0
+#define PKG_MASK	GENMASK(2, 0)
+
+static u32 read_deviceid(void)
+{
+	void *syscfg = syscon_get_first_range(STM32MP_SYSCON_SYSCFG);
+
+	return readl(syscfg + SYSCFG_DEVICEID_OFFSET);
+}
+
+u32 get_cpu_dev(void)
+{
+	return (read_deviceid() & SYSCFG_DEVICEID_DEV_ID_MASK) >> SYSCFG_DEVICEID_DEV_ID_SHIFT;
+}
+
+u32 get_cpu_rev(void)
+{
+	return get_otp(BSEC_OTP_REVID, REVID_SHIFT, REVID_MASK);
+}
+
+/* Get Device Part Number (RPN) from OTP */
+u32 get_cpu_type(void)
+{
+	return get_otp(BSEC_OTP_RPN, RPN_SHIFT, RPN_MASK);
+}
+
+/* Get Package options from OTP */
+u32 get_cpu_package(void)
+{
+	return get_otp(BSEC_OTP_PKG, PKG_SHIFT, PKG_MASK);
+}

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
