Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM3oDnPWnWk0SQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:48:51 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8EA18A0AF
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:48:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C54C4C8F28C;
	Tue, 24 Feb 2026 16:48:50 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011006.outbound.protection.outlook.com [52.101.70.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25403C8F289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 16:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmLMhr/ogVa4CAA+EpYBO+pr3HovTScerEYAw0zKPMlFTPCJD3aUyWiCo89CacFADq2+Kt3jZXtbN7N3U8Nf0zmbuKDGWzU89F2qt46C/FSPIgUj/MgHw/3gUdWs9c6Fh/TuS/kIg98SaLhSmbaavR8rr4tdOiE8ggPtTWi7KiEsYhWmns+UnuziDpzCdfYveTv4nqYcslCMDFMPH1KK7GBQ2zjYdYuRy5zlTVWz8EggiQ6j7wk2PgxLyrnR48lVddaIq/QjVn9iOmPzPHaYPpU/Afbndd2y9gzVQSBRQ41ajck/pjzyl19hyo7ahS65rZPXrhNSRv5kn7w7eFCZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvR2PBIez1okRduGI5OSqWyBSS0DME0RNkrPF7ktbUU=;
 b=Ih5d/Z1wznq7kWTYZJF6+mwfh3gA7FQmNoe9w3TGdcptTbuixRVQ35g3he1pz0Bx8pVWSURAGNuFFkpUGzxA7XZf6Sg1wKfL5ksJGBkGeoityAwYWq0lgykkiWfUIhECENJXvmdHdqmNsQwXS/kCYiE03uhbxLPGCDJZIa6tisH3twqMVaqScbz+yvky0WK5g/lNgleTy++9JUJ+Ut+gWv0NeJU7pjs8YLmBqfunPJHi19yfaqJkfsPkx/mYF87gShoMDACOym2uwbTgjET7rbeSt7ISufgxKPO1n9Q56Nm8t5t9gyNrAam8P8udS/DvCy3uArAm7eERkYyLcxAKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvR2PBIez1okRduGI5OSqWyBSS0DME0RNkrPF7ktbUU=;
 b=WJMA3owcivITywuCCV8ZpFgoiyM7g1NahNY/ZIc+0LkH1mfMfZHETj1u7XDbSbCKfO61Ft7MjQAUTOtMtsH80mdPsVrgHFfZfoCZqM49TwJ3iAgjvIhvm2cK02sX9HbgGN11u3RlBw9VedWdXRYuFmKqJXBdKI/j/vWNQ5hlSoER02BdbV4qQh6qJp2GBEQxSGRBKvTBX/jBhUzyMaddZ/H3EpP33J/LFssW02qVjJs/1UCdM51M7SGJYYEQOqhgaJKRZEfni9s18bSlWvHfLuqtN3uDVmApxHVuWFmGwLfVeq/QP6OKUVwQJFBM45GkHuik7rwk45zRF5Q+NQFf/w==
Received: from DU7PR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::14) by PAVPR10MB7089.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:319::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 16:48:44 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::f9) by DU7PR01CA0011.outlook.office365.com
 (2603:10a6:10:50f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:48:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 16:48:44 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:50:28 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:48:21 +0100
Message-ID: <c8fc3b00-4fc8-47a1-bbe3-924fe9d6036e@foss.st.com>
Date: Tue, 24 Feb 2026 17:48:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
 <20260204-upstream_update_stm32_cmdkey-c-v1-1-d95374395840@foss.st.com>
 <6f9cd5cc-550b-49b3-a38e-339050447f8d@foss.st.com>
 <73c32748-8a1e-4d04-9fba-f8cca5e89ae4@foss.st.com>
Content-Language: en-US
In-Reply-To: <73c32748-8a1e-4d04-9fba-f8cca5e89ae4@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|PAVPR10MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: a86b7055-0350-42eb-e05f-08de73c492af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGVkYjlNY3lIS3J6aW9Bem5tbkh4WmV1RVNpaS9BZ25VKzBiSisrdU8veEhB?=
 =?utf-8?B?Vi85d1NSdHpDOTcvT1kxdmtJWGZDYytKci9qR2N2YnBtWlJpdis0eGN0RVZ3?=
 =?utf-8?B?Q3ZyS1RyZEdxMDNTU1RKV2dLbFBDUjNUdU1aSGpJc3dpSUEwY3pVeEFEZVNR?=
 =?utf-8?B?MjNNaHQyaTVQNG1Td0p0R3I5RjFWWEFBTXlCYkdDVHBDQ2tMS3VDVkNINEgy?=
 =?utf-8?B?NHRYZFIrWUpCZ2J3NXArejM5VG1EdEU3NzJGUjdYRllERHp5aXVZMU1aajM2?=
 =?utf-8?B?a0c0eXNpMjJQaW1rYk0vU2tCREVBbTM5WVVVQkZBTGtnYkxTNlh2bWpjRXgv?=
 =?utf-8?B?MVg3bWhORkY2SUp6R0xGeE4vMlpqRXJvQXdXcGxmY1RPWHdFYmFnajczUHhD?=
 =?utf-8?B?VlRrcUdrSVJsMzRHRFB0S0xmd0JOT2NrV0FvclJXaFduSE5yeFNIM1I0Q2RF?=
 =?utf-8?B?Wk5rUHFFYjF2RUY5OThCQ2xZOGZJMFR5bFBqa0svMHQ5V1VVZ1AwN2tkRWlo?=
 =?utf-8?B?emJ6STdzRW9mdE1leHRUL2wzRmkreWF1c1phSWk0a29VaVFyUlB4TmVjVXph?=
 =?utf-8?B?RVRQcUpva2I2QVVzUWRDRkg2STNHY0c1NWN4Zzl3WnlxSnJ0Yjk1ZHAwc2Yv?=
 =?utf-8?B?MFpsbXBkWmZBMEVRVmhCZUJFOU0xb20rSFNieGtTWk91M2xScTFCQVRKcGZY?=
 =?utf-8?B?VThTb01naUdiYmZTcWdGZXVXcmVJSE1Ycm5ZSjdqR1RqVFRoT0lmZzhzL2xt?=
 =?utf-8?B?Z01yeDdkTkZORUhpS1NCcTRhWDNvSHcxeDQyVVdxNXpUM2poWWM2NHJmS09j?=
 =?utf-8?B?ZVkvVGVRajVoSnRrVU4vclJpRENaemtPTVhOU2xWOGFOT2RYdWZIRThTcHli?=
 =?utf-8?B?a1NHUjRMNjVqbVZHNTY3eE5YVmJaNVBzbDJLZjdPa3ZOb1NGV1V3eHN1TlJV?=
 =?utf-8?B?RHJocDRycE1NUW5RRjZ4SUhmUXJXNDJCQTZHbmQxaWJ3MjdQUUVOVjhhZ2N1?=
 =?utf-8?B?TUh5OGYwMVlhUnc0WnV5Nldick9VcktTZlBaZjhFM1lEQUFmYmUyUUcwRDFC?=
 =?utf-8?B?bUlhZk5NUlhEVHdYK1dDLzJTK3ExZGowYTRXbk8vUkp0NU1mbjRvb0xGUmxE?=
 =?utf-8?B?UTU4SFZCQXFQY0xBRHJCMnFmVVZMZDU0RGlrUktiZkpMdndlbGpOV2VSOUI1?=
 =?utf-8?B?RmxSd1V6ZXFYRytPR29hZXZRUEpKcm96RHBmZmVycStuK0oxaDBOZG1VN0ly?=
 =?utf-8?B?eUkxc2dtVHgzOXhnVkpyOUsyUGFybllSRFBjM2g3RXFhazZ2bjRFQjc3NjRq?=
 =?utf-8?B?dTk3TDd5dmcyR29iN2xNTUtKVGNFZm1HK1drUVFYOXJxSzNKZ2ZWSDJoQ3BF?=
 =?utf-8?B?emlMT3d6TVp0bHlYU0QySEtVQjZGV1BDZEY5TUxiZ3I0VkZoMmVERndJQWhM?=
 =?utf-8?B?S3hjMy9HVWtZQmZiUi9TV3FvejJ4V2F0ZXBUdXRKN3d4RjRLM0NxRGpkeGhj?=
 =?utf-8?B?S0xpWUdZdzhUT1lla1h1cXN4WXlybG9oekpPRlBoSkF6cHB5ZjRXMVdsQmJL?=
 =?utf-8?B?MmZOdVBaUDlseXRtWnM5YUZYMlhqd0pTSkVNR0YvSktYSzkxa3Vvd2txUmdk?=
 =?utf-8?B?cUsvdGNCdW5rc1ZnVHRXbkVtaWxiSkFKV3VzWDVOdzVHeWtvVHptZFFJUkJ2?=
 =?utf-8?B?eC9BM1ltSGRWUHk3dS9SWHorUFdia0dvc1lSOGdST3RUSVhFOTZOZStWZ0tm?=
 =?utf-8?B?Qmdza2wrNkFmYmdicDdwRzFEYmdEUXIveVFucGt5RUcvdVk4bHdCMXJWa2NC?=
 =?utf-8?B?VVpXZnkzTWc5b0t3dWFNY0hUZGVkZW5oNmhoZVJwdEc4TmNQSlFENENKVThk?=
 =?utf-8?B?ZHVQSkg5RTJvQUg3dFZXL3ZjTmZJaUNQNzBaR05VejJ0QUFPWWI1ZS9NRHlC?=
 =?utf-8?B?cDFvWjRFRng0cWd5NHh6eE5JZHVnK2pIR1hBT3E0NWpBRjVsSmF1VE1PVlBw?=
 =?utf-8?B?MTZkRVhvb01KOW9GeS9zM1A2MS9iYW4rMmlKRWRNUE42UElSTjN5dVBJYmc4?=
 =?utf-8?B?bi9MZWpBYjJJdTMxbWFjcXVsSEx2L28vcVpBcGpSZW9WY1l0RkpndUxsRVNC?=
 =?utf-8?B?OFVROEl6UU94WXMvNkpxM2pvd0t4WCt5U3E5RUFOZEprcVYzYllaV3AzN2lk?=
 =?utf-8?Q?dRjAPh4FE576YMsSu48Jiy4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9YfVSYNSVuvrCdmXqNUIMkf7d18GDe+zt8GwRwgwyKmj0OfBR2UVbHKQ93OJ52wBW4MGj6NTidF7zb0/LV5JpNsekwN9HgCQQ9RcFssnDo1tlWA2zvdBBTvD2meBH/x7vgge30CnXsWExa8pw68AsRU3j+Gse851e7DFxySU3WICz2IaWLTp33K0RZMaPSgDWc1dlQbXcIwbnEjHaA60PFRvpy5rWMjyWCIGoOPVURFC4D19w2SG+6Aq5MU0U3lX6DOC/pRxgd7l0HHESCiE95Pc6zFgxze2EKo0lcE97agUyLonh7iu2jsrGODXndyoS1L6rsb3qGCjZ5pBlDcTZTo7iOZua860pEDjI8ilAIyvtQwKWQsvmq7sY8v9Cqe9G8lKfe4Q3T0NPKHzEhcYglgomeyq2l16obyomM4VE3JXVEqctDFUQDEbNpp9vWGE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:48:44.3786 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a86b7055-0350-42eb-e05f-08de73c492af
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7089
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>, Lionel
 Debieve <lionel.debieve@foss.st.com>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/6] stm32mp: cmd_stm32key: add support of
 STM32MP21x SoC
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:cheick.traore@foss.st.com,m:yannick.fertre@foss.st.com,m:nicolas.le.bayon@st.com,m:lionel.debieve@foss.st.com,m:gwenael.treuveur@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.847];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1B8EA18A0AF
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDE0OjAwLCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4gCj4gCj4gT24gMi8y
NC8yNiAxMDowMywgUGF0cmljayBERUxBVU5BWSB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDIvNC8y
NiAxMToyMCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+Pj4gRnJvbTogVGhvbWFzIEJvdXJnb2lu
IDx0aG9tYXMuYm91cmdvaW5AZm9zcy5zdC5jb20+Cj4+Pgo+Pj4gVXBkYXRlIHN0bTMya2V5IHRv
IHN1cHBvcnQgc3RtMzJtcDIxIE9UUCBtYXBwaW5nLgo+Pj4gQ3JlYXRlIGEgbmV3IGxpc3Qgb2Yg
a2V5IHRvIHN1cHBvcnQgdGhlIGZvbGxvd2luZyBkaWZmZXJlbmNlcyA6Cj4+PiDCoMKgIC0gU1RN
MzJNUDIxeCBTb0Mgc3VwcG9ydCAxMjhiIGFuZCAyNWIgRlNCTCBlbmNyeXB0aW9uIGtleXMuCj4+
PiDCoMKgIC0gT0VNLUtFWTEgYW5kIE9FTS1LRVkyIHVzZWQgZm9yIGF1dGhlbnRpY2F0aW9uIGFy
ZSBpbiBkaWZmZXJlbnQgT1RQCj4+PiDCoMKgwqDCoCBmcm9tIE1QMjUgYW5kIE1QMjMuCj4+IG1p
bm9yICJmcm9tIFNUTTMyTVAyNSBhbmQgU1RNMzJNUDIzIgo+IAo+IE9rLCBpIHdpbGwgdXBkYXRl
IGl0IHdoZW4gbWVyZ2luZyB0aGlzIHBhdGNoCj4gCj4+Pgo+Pj4gc3RtMzJrZXkgaXMgY29tcGF0
aWJsZSB3aXRoIHBsYXRmb3JtIFNUTTMyTVAyIChhYXJjaDY0KQo+Pj4gSGVuY2UsIHVzZSB1bnNp
Z25lZCBsb25nIHRvIGhhbmRsZSBhcmd1bWVudCBhZGRyIG9mIGZ1bmN0aW9uCj4+PiByZWFkX2tl
eV92YWx1ZSgpIGluc3RlYWQgb2YgdTMyLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBC
b3VyZ29pbiA8dGhvbWFzLmJvdXJnb2luQGZvc3Muc3QuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTog
UGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+PiAtLS0KPj4+
IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3RtMzJrZXkuYyB8IDk3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDg4IGluc2Vy
dGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21h
Y2gtc3RtMzJtcC9jbWRfc3RtMzJrZXkuYyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9jbWRfc3Rt
MzJrZXkuYwo+Pj4gaW5kZXggZjFlMGEzZTgxN2MuLjFjZWI2NDBlNmIyIDEwMDY0NAo+Pj4gLS0t
IGEvYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9zdG0zMmtleS5jCj4+PiArKysgYi9hcmNoL2Fy
bS9tYWNoLXN0bTMybXAvY21kX3N0bTMya2V5LmMKPj4+IEBAIC00MCw3ICs0MCw3IEBAIHN0cnVj
dCBzdG0zMmtleSB7Cj4+PiDCoMKgwqDCoMKgIGNoYXIgKmRlc2M7Cj4+PiDCoMKgwqDCoMKgIHUx
NiBzdGFydDsKPj4+IMKgwqDCoMKgwqAgdTggc2l6ZTsKPj4+IC3CoMKgwqAgaW50ICgqcG9zdF9w
cm9jZXNzKShzdHJ1Y3QgdWRldmljZSAqZGV2KTsKPj4+ICvCoMKgwqAgaW50ICgqcG9zdF9wcm9j
ZXNzKShzdHJ1Y3QgdWRldmljZSAqZGV2LCBjb25zdCBzdHJ1Y3Qgc3RtMzJrZXkgKmtleSk7Cj4+
PiDCoCB9Owo+Pj4gwqAgwqAgY29uc3Qgc3RydWN0IHN0bTMya2V5IHN0bTMybXAxM19saXN0W10g
PSB7Cj4+PiBAQCAtNjcsNyArNjcsNTYgQEAgY29uc3Qgc3RydWN0IHN0bTMya2V5IHN0bTMybXAx
NV9saXN0W10gPSB7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgIH07Cj4+PiDCoCAtc3RhdGljIGlu
dCBwb3N0X3Byb2Nlc3Nfb2VtX2tleTIoc3RydWN0IHVkZXZpY2UgKmRldik7Cj4+PiArc3RhdGlj
IGludCBwb3N0X3Byb2Nlc3Nfb2VtX2tleTIoc3RydWN0IHVkZXZpY2UgKmRldiwgY29uc3Qgc3Ry
dWN0IHN0bTMya2V5ICprZXkpOwo+Pj4gK3N0YXRpYyBpbnQgcG9zdF9wcm9jZXNzX2VkbWtfMTI4
YihzdHJ1Y3QgdWRldmljZSAqZGV2LCBjb25zdCBzdHJ1Y3Qgc3RtMzJrZXkgKmtleSk7Cj4+PiAr
Cj4+PiArY29uc3Qgc3RydWN0IHN0bTMya2V5IHN0bTMybXAyMV9saXN0W10gPSB7Cj4+PiArwqDC
oMKgIFtTVE0zMktFWV9QS0hdID0gewo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lID0gIk9FTS1L
RVkxIiwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuZGVzYyA9ICJIYXNoIG9mIHRoZSA4IEVDQyBQdWJs
aWMgS2V5cyBIYXNoZXMgVGFibGUgKEVDRFNBIGlzIHRoZSBhdXRoZW50aWNhdGlvbiBhbGdvcml0
aG0pIGZvciBGU0JMQSBvciBNIiwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuc3RhcnQgPSAxNTIsCj4+
PiArwqDCoMKgwqDCoMKgwqAgLnNpemUgPSA4LAo+Pj4gK8KgwqDCoCB9LAo+Pj4gK8KgwqDCoCB7
Cj4+PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAiT0VNLUtFWTIiLAo+Pj4gK8KgwqDCoMKgwqDC
oMKgIC5kZXNjID0gIkhhc2ggb2YgdGhlIDggRUNDIFB1YmxpYyBLZXlzIEhhc2hlcyBUYWJsZSAo
RUNEU0EgaXMgdGhlIGF1dGhlbnRpY2F0aW9uIGFsZ29yaXRobSkgZm9yIEZTQkxNIiwKPj4+ICvC
oMKgwqDCoMKgwqDCoCAuc3RhcnQgPSAxNjAsCj4+PiArwqDCoMKgwqDCoMKgwqAgLnNpemUgPSA4
LAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5wb3N0X3Byb2Nlc3MgPSBwb3N0X3Byb2Nlc3Nfb2VtX2tl
eTIsCj4+PiArwqDCoMKgIH0sCj4+PiArwqDCoMKgIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCAubmFt
ZSA9ICJGSVAtRURNSyIsCj4+PiArwqDCoMKgwqDCoMKgwqAgLmRlc2MgPSAiRW5jcnlwdGlvbi9E
ZWNyeXB0aW9uIE1hc3RlciBLZXkgZm9yIEZJUCIsCj4+PiArwqDCoMKgwqDCoMKgwqAgLnN0YXJ0
ID0gMjYwLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5zaXplID0gOCwKPj4+ICvCoMKgwqAgfSwKPj4+
ICvCoMKgwqAgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5uYW1lID0gIkVETUsxLTEyOGIiLAo+Pj4g
K8KgwqDCoMKgwqDCoMKgIC5kZXNjID0gIkVuY3J5cHRpb24vRGVjcnlwdGlvbiBNYXN0ZXIgMTI4
YiBLZXkgZm9yIEZTQkxBIG9yIE0iLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5zdGFydCA9IDM1NiwK
Pj4+ICvCoMKgwqDCoMKgwqDCoCAuc2l6ZSA9IDQsCj4+PiArwqDCoMKgwqDCoMKgwqAgLnBvc3Rf
cHJvY2VzcyA9IHBvc3RfcHJvY2Vzc19lZG1rXzEyOGIsCj4+PiArwqDCoMKgIH0sCj4+PiArwqDC
oMKgIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCAubmFtZSA9ICJFRE1LMS0yNTZiIiwKPj4+ICvCoMKg
wqDCoMKgwqDCoCAuZGVzYyA9ICJFbmNyeXB0aW9uL0RlY3J5cHRpb24gTWFzdGVyIDI1NmIgS2V5
IGZvciBGU0JMQSBvciBNIiwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuc3RhcnQgPSAzNTYsCj4+PiAr
wqDCoMKgwqDCoMKgwqAgLnNpemUgPSA4LAo+Pj4gK8KgwqDCoCB9LAo+Pj4gK8KgwqDCoCB7Cj4+
PiArwqDCoMKgwqDCoMKgwqAgLm5hbWUgPSAiRURNSzItMTI4YiIsCj4+PiArwqDCoMKgwqDCoMKg
wqAgLmRlc2MgPSAiRW5jcnlwdGlvbi9EZWNyeXB0aW9uIE1hc3RlciAxMjhiIEtleSBmb3IgRlNC
TE0iLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5zdGFydCA9IDM0OCwKPj4+ICvCoMKgwqDCoMKgwqDC
oCAuc2l6ZSA9IDQsCj4+PiArwqDCoMKgwqDCoMKgwqAgLnBvc3RfcHJvY2VzcyA9IHBvc3RfcHJv
Y2Vzc19lZG1rXzEyOGIsCj4+PiArwqDCoMKgIH0sCj4+PiArwqDCoMKgIHsKPj4+ICvCoMKgwqDC
oMKgwqDCoCAubmFtZSA9ICJFRE1LMi0yNTZiIiwKPj4+ICvCoMKgwqDCoMKgwqDCoCAuZGVzYyA9
ICJFbmNyeXB0aW9uL0RlY3J5cHRpb24gTWFzdGVyIDI1NmIgS2V5IGZvciBGU0JMTSIsCj4+PiAr
wqDCoMKgwqDCoMKgwqAgLnN0YXJ0ID0gMzQ4LAo+Pj4gK8KgwqDCoMKgwqDCoMKgIC5zaXplID0g
OCwKPj4+ICvCoMKgwqAgfSwKPj4+ICt9Owo+Pj4gwqAgwqAgY29uc3Qgc3RydWN0IHN0bTMya2V5
IHN0bTMybXAyeF9saXN0W10gPSB7Cj4+PiDCoMKgwqDCoMKgIFtTVE0zMktFWV9QS0hdID0gewo+
Pj4gQEAgLTE3MSw4ICsyMjAsMTAgQEAgc3RhdGljIHU4IGdldF9rZXlfbmIodm9pZCkKPj4+IMKg
wqDCoMKgwqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1NUTTMyTVAxNVgpKQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBBUlJBWV9TSVpFKHN0bTMybXAxNV9saXN0KTsKPj4+IMKgIC3CoMKg
wqAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1NUTTMyTVAyMVgpIHx8IElTX0VOQUJMRUQoQ09ORklH
X1NUTTMyTVAyM1gpIHx8Cj4+PiAtwqDCoMKgwqDCoMKgwqAgSVNfRU5BQkxFRChDT05GSUdfU1RN
MzJNUDI1WCkpCj4+PiArwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19TVE0zMk1QMjFYKSkK
Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gQVJSQVlfU0laRShzdG0zMm1wMjFfbGlzdCk7Cj4+
PiArCj4+PiArwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19TVE0zMk1QMjNYKSB8fCBJU19F
TkFCTEVEKENPTkZJR19TVE0zMk1QMjVYKSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
QVJSQVlfU0laRShzdG0zMm1wMnhfbGlzdCk7Cj4+PiDCoCB9Cj4+PiDCoCBAQCAtMTg0LDggKzIz
NSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHN0bTMya2V5ICpnZXRfa2V5KHU4IGluZGV4KQo+
Pj4gwqDCoMKgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfU1RNMzJNUDE1WCkpCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuICZzdG0zMm1wMTVfbGlzdFtpbmRleF07Cj4+PiDCoCAtwqDC
oMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19TVE0zMk1QMjFYKSB8fCBJU19FTkFCTEVEKENPTkZJ
R19TVE0zMk1QMjNYKSB8fAo+Pj4gLcKgwqDCoMKgwqDCoMKgIElTX0VOQUJMRUQoQ09ORklHX1NU
TTMyTVAyNVgpKQo+Pj4gK8KgwqDCoCBpZiAoSVNfRU5BQkxFRChDT05GSUdfU1RNMzJNUDIxWCkp
Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuICZzdG0zMm1wMjFfbGlzdFtpbmRleF07Cj4+PiAr
Cj4+PiArwqDCoMKgIGlmIChJU19FTkFCTEVEKENPTkZJR19TVE0zMk1QMjNYKSB8fCBJU19FTkFC
TEVEKENPTkZJR19TVE0zMk1QMjVYKSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gJnN0
bTMybXAyeF9saXN0W2luZGV4XTsKPj4+IMKgIH0KPj4+IMKgIEBAIC0yMzcsNyArMjkwLDggQEAg
c3RhdGljIHZvaWQgcmVhZF9rZXlfdmFsdWUoY29uc3Qgc3RydWN0IHN0bTMya2V5ICprZXksIHVu
c2lnbmVkIGxvbmcgYWRkcikKPj4+IMKgwqDCoMKgwqAgfQo+Pj4gwqAgfQo+Pj4gwqAgLXN0YXRp
YyBpbnQgcmVhZF9rZXlfb3RwKHN0cnVjdCB1ZGV2aWNlICpkZXYsIGNvbnN0IHN0cnVjdCBzdG0z
MmtleSAqa2V5LCBib29sIHByaW50LCBib29sICpsb2NrZWQpCj4+PiArc3RhdGljIGludCByZWFk
X2tleV9vdHAoc3RydWN0IHVkZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0IHN0bTMya2V5ICprZXks
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIHByaW50LCBib29sICpsb2NrZWQpCj4+
Cj4+IG1pbm9yOiBuZWVkZWQgY2hhbmdlID8KPiAKPiBGcm9tIHdoYXQgaSByZW1lbWJlciwgaXQg
d2FzIGEgd2FybmluZyBhYm91dCB0aGUgbGVuZ3RoIG9mIHRoaXMgbGluZS4KPiAKPiBUaGFua3MK
PiAKPiAKPj4KPj4KPj4+IMKgIHsKPj4+IMKgwqDCoMKgwqAgaW50IGksIHdvcmQsIHJldDsKPj4+
IMKgwqDCoMKgwqAgaW50IG5iX2ludmFsaWQgPSAwLCBuYl96ZXJvID0gMCwgbmJfbG9jayA9IDAs
IG5iX2xvY2tfZXJyID0gMDsKPj4+IEBAIC0zNTEsNyArNDA1LDcgQEAgc3RhdGljIGludCB3cml0
ZV9jbG9zZV9zdGF0dXMoc3RydWN0IHVkZXZpY2UgKmRldikKPj4+IMKgwqDCoMKgwqAgcmV0dXJu
IDA7Cj4+PiDCoCB9Cj4+PiDCoCAtc3RhdGljIGludCBwb3N0X3Byb2Nlc3Nfb2VtX2tleTIoc3Ry
dWN0IHVkZXZpY2UgKmRldikKPj4+ICtzdGF0aWMgaW50IHBvc3RfcHJvY2Vzc19vZW1fa2V5Mihz
dHJ1Y3QgdWRldmljZSAqZGV2LCBjb25zdCBzdHJ1Y3Qgc3RtMzJrZXkgKmtleSkKPj4+IMKgIHsK
Pj4+IMKgwqDCoMKgwqAgaW50IHJldDsKPj4+IMKgwqDCoMKgwqAgdTMyIHZhbDsKPj4+IEBAIC0z
NzIsNiArNDI2LDMxIEBAIHN0YXRpYyBpbnQgcG9zdF9wcm9jZXNzX29lbV9rZXkyKHN0cnVjdCB1
ZGV2aWNlICpkZXYpCj4+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4gwqAgfQo+Pj4gwqAgK3N0
YXRpYyBpbnQgcG9zdF9wcm9jZXNzX2VkbWtfMTI4YihzdHJ1Y3QgdWRldmljZSAqZGV2LCBjb25z
dCBzdHJ1Y3Qgc3RtMzJrZXkgKmtleSkKPj4+ICt7Cj4+PiArwqDCoMKgIGludCByZXQsIHdvcmQs
IHN0YXJ0X290cDsKPj4+ICvCoMKgwqAgdTMyIHZhbDsKPj4+ICsKPj4+ICvCoMKgwqAgc3RhcnRf
b3RwID0ga2V5LT5zdGFydCArIGtleS0+c2l6ZTsKPj4+ICsKPj4+ICvCoMKgwqAgLyogT24gTVAy
MSwgd2hlbiB1c2luZyBhIDEyOGJpdCBrZXksIHByb2dyYW0gMHhmZmZmZmZmZiBhbmQgbG9jayB0
aGUgdW51c2VkIE9UUHMuICovCj4+PiArwqDCoMKgIGZvciAod29yZCA9IHN0YXJ0X290cDsgd29y
ZCA8IChzdGFydF9vdHAgKyA0KTsgd29yZCsrKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgdmFsID0g
R0VOTUFTSygzMSwgMCk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gbWlzY193cml0ZShkZXYs
IFNUTTMyX0JTRUNfT1RQKHdvcmQpLCAmdmFsLCA0KTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
cmV0ICE9IDQpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dfd2FybmluZygiRnVzZSAl
cyBPVFAgcGFkZGluZyAlaSBmYWlsZWQsIGNvbnRpbnVlXG4iLCBrZXktPm5hbWUsIHdvcmQpOwo+
Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHZhbCA9IEJTRUNfTE9DS19QRVJNOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJldCA9IG1pc2Nfd3JpdGUoZGV2LCBTVE0zMl9CU0VDX0xPQ0sod29yZCksICZ2
YWwsIDQpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQgIT0gNCkgewo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbG9nX2VycigiRmFpbGVkIHRvIGxvY2sgdW51c2VkIE9UUCA6ICVkXG4i
LCB3b3JkKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+PiArwqDC
oMKgwqDCoMKgwqAgfQo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgIHJldHVybiAwOwo+
Pj4gK30KPj4+ICsKPj4+IMKgIHN0YXRpYyBpbnQgZnVzZV9rZXlfdmFsdWUoc3RydWN0IHVkZXZp
Y2UgKmRldiwgY29uc3Qgc3RydWN0IHN0bTMya2V5ICprZXksIHVuc2lnbmVkIGxvbmcgYWRkciwK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIHByaW50KQo+Pj4gwqAgewo+
Pj4gQEAgLTU1MCw3ICs2MjksNyBAQCBzdGF0aWMgaW50IGRvX3N0bTMya2V5X2Z1c2Uoc3RydWN0
IGNtZF90YmwgKmNtZHRwLCBpbnQgZmxhZywgaW50IGFyZ2MsIGNoYXIgKmNvbgo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBDTURfUkVUX0ZBSUxVUkU7Cj4+PiDCoCDCoMKgwqDCoMKgIGlm
IChrZXktPnBvc3RfcHJvY2Vzcykgewo+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChrZXktPnBvc3Rf
cHJvY2VzcyhkZXYpKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGtleS0+cG9zdF9wcm9jZXNz
KGRldiwga2V5KSkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRmKCJFcnJv
cjogJXMgZm9yIHBvc3QgcHJvY2Vzc1xuIiwga2V5LT5uYW1lKTsKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBDTURfUkVUX0ZBSUxVUkU7Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+Pj4KPj4KPj4gZXZlbiB3aXRoIDIgbWlub3IgcmVtYXJrcwo+Pgo+PiBSZXZpZXdlZC1i
eTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPj4KPj4g
VGhhbmtzCj4+IFBhdHJpY2sKPj4KPj4KCldpdGggY29tbWl0IGZpeGVkCkFwcGxpZWQgdG8gdS1i
b290LXN0bTMyL21hc3RlcgoKVGhhbmtzClBhdHJpY2UKCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
PiBVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vdWJvb3Qtc3RtMzIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMy
IG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290
LXN0bTMyCg==
