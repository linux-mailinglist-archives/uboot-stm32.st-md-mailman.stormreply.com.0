Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOmjMpNsnWkkQAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:17:07 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E2918469F
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:17:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 400B0C8F285;
	Tue, 24 Feb 2026 09:17:07 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DA95C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:17:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqyDfha0i/rwBxjNdZmLOXYgls+cmKwodQ5gfTEB04lhdrxOT7WEv2tS2FJ3e330D9cPBqdvxIAo6ZulKPn9yY17t30EhhuS8q8KnBjSN9aRZnZ3RCx/Hxagqnr5aJiusigP7bhHCnEiG0YTpIQqzE25OFUo63ShgYJfVFvZQU/5gSN+GNyXb4eRMoDt+otF0Z5dveXSwy5An25nSuGgyNdrvhWfmKFZQNFJCr+m3MDWRQ79AgdLCXsYSvN1E0fg8GxvdmfhJaUag0X3lh7HUgKQm9hOvWZtiq2dHiRTvbB90VeaFziwCzjQ92oc+HJaQQs5MhikPbYT+obPHEpDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1LoIAOvVNzrIO00WF5dV+XV29pN8tcm4J1P+am94lI=;
 b=eNwVESduhNQ3udmk0VGxkTYOdblpc4bZOZ6fs3qsGhd/GbFTAgPwZ7NKaHP2J3H8FbrAq1H+MXgHbogaCwuztfuzZVp/tIcl7SMoCd0q9LKdspAR7lA4lvamykqNtHjpqIYKSROUT3f3tj2axYv9+mLusGe8K2njBL6iOx2a2z0bx/mF2qPQLuVildsvHmqBDuZrm8gCAkeboPzQeZkDUnoExIDCftGq7iNWk+9bCrlpfK8W5eBX/KDQahUK5yCnIbov7uZUB1bTKvMoaK6YJrSudSk2vCl8UQydPzXNLbyIn3d/X/K1WVcBDIZ6t5A9XbjIYibc+ApCjtnUtXi3gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1LoIAOvVNzrIO00WF5dV+XV29pN8tcm4J1P+am94lI=;
 b=fqqctDQK5JB2oS2QTFqJwTtAFFbASmIC/WtDo38N8GDgsbRDHwqS97V8Oh8b8XXUSk+8qF10LncxpnscVPB8NxF9KJzUv6ZCoOSaSB6LlbFMefeyqw2aLRwo2uGahpXBIQXD7qPznKPboYDYEmXRHb51hp2fMai6v9PNlMGGQrMeWd7MWztOJepOLwM7aj7/ev+u/ErjqlnUk5X6N+ZHR+j/UsZD3hGUcFsb5gtgwdMaXaWuKvJeDWeGO2qf9pZuPGM/w6DoL/rs1FXpMcsEaisM8wj1mTsW3V3nKQIWeaRKpjB88MudiijSDCGDutRX4Krzf9v3Es6SXr9DKbM3jA==
Received: from DU2PR04CA0297.eurprd04.prod.outlook.com (2603:10a6:10:28c::32)
 by AS8PR10MB6723.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:563::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:15:48 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:28c:cafe::dc) by DU2PR04CA0297.outlook.office365.com
 (2603:10a6:10:28c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:15:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:15:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:18:04 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:15:46 +0100
Message-ID: <ac3d66d4-d077-4ae2-9923-e0ed1149eca9@foss.st.com>
Date: Tue, 24 Feb 2026 10:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
 <20260204-upstream_update_stm32_cmdkey-c-v1-5-d95374395840@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260204-upstream_update_stm32_cmdkey-c-v1-5-d95374395840@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|AS8PR10MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f1c0b7-d68c-4c4f-b95d-08de73854c92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3NndXNwQW1PVnBpYkRBUTlCS2lJUjRyL1daODJLRkNweSt1aFdJdndwVkMv?=
 =?utf-8?B?R2pjeHpxYnJndkVXTlUydGNwaTk5bzAxQjV1b0JGUXl4a1orN1VVaWRodTFZ?=
 =?utf-8?B?WVlJOENndjk1dll6R215R0xBbTIwS3BKMzZ0RklQeGt3VXlpZWFyZHlsU3o0?=
 =?utf-8?B?S0FRa2NxaURrM283Y1lmbG9GL2dOaGRkN1k0VlFocnhvVndNUVFEVjNaQWdP?=
 =?utf-8?B?RDJZNGhKNC9tMkVsdXlVWmtsNE52dGdicHYxRmFrS3RyV3BEMStKcjBkeVQ0?=
 =?utf-8?B?anZBeVMrdC81QlFrd0NBb2JxTTBVRUoxOFJpV0VCTHF2QVh5OWpjNDQ5VWF3?=
 =?utf-8?B?TU1WS09BVWtZOGVRZEdEMExvajBnU0cyamVPOWl6ODYwdDluZEpGQU5HVXFF?=
 =?utf-8?B?SUJtNm9aN0N0Q2E2dGs0elpJUXR6WGNlVkRVVGI1VDdwRmdQZnd1SW14NU9p?=
 =?utf-8?B?Z0xrZVdRZGNidTlZTmdlTDd1ajZqZVFRZU1JbVAraVRKbWc0Z0xBNkpQbGRn?=
 =?utf-8?B?bzUrbkFSMXZzb29za2lhYzVrbUkyZHN6aWJkNmZnZFlkTkxiUGxpSWk2SVEz?=
 =?utf-8?B?M2J0Q3BGNlJjU3hDUVJ6Z3pjOVhJRmNuSTA3UXVCV29lTVVyU00vQ2RuNFBR?=
 =?utf-8?B?UGl6Mncya3VXZ0JyR0tCQk9MTVpYckFpMEJBSFBhYXJsbGRVeHRoK2xNUXow?=
 =?utf-8?B?ZkZCOTMwYlZtK3BsbUtwUTRWOG1wSTZJaTBjSGg5dEN0RXRmdGk1cnAydjBR?=
 =?utf-8?B?YzBkSVRLVU9kYnVYakZlWlpoTWtZMnlGdEh3S05udzdueU0zS0NaYlg2NmtK?=
 =?utf-8?B?OHQvWHZZblkxb1FVYWtaQjJTVCt4VUIzYndxNkVvaU9ONXNXT3BDTmxOdWQ3?=
 =?utf-8?B?dThBdVlUOUFsY3ArT244Vk1aeG1YcC94SURkSWRCMkxDZXZYUWZEM3RQWHpQ?=
 =?utf-8?B?TnNnUlJ2c1VzUGRuZWx3dUNOaGEzK0UzZHFXcVg3Y2lYQkY3VUhBd0wybmJr?=
 =?utf-8?B?SFI4aG5POFNhMnVWdk9seUt1R3FnSit6VHluUWdmTDJTNGpMblh4MFZORXc2?=
 =?utf-8?B?YjdJRnVZWmRYY2crODdBaTQrN0p0K3RwSzJkVTZSTGthMHJaNTM4NXpKV3Rm?=
 =?utf-8?B?QjhuSkhaNngybW11Y1A4cUpBWHlidnFwY3FNSG5iV05yRVo3YlVxOXV1NEs5?=
 =?utf-8?B?b1ZCemlxOFBBRkw0ck8rMXNWT3ZjZVl4QjhiMFdJS0lKVks5ZjNSMVhBZ0kr?=
 =?utf-8?B?U1hoYmhXUFhra1A5Z1FzN0VHQlg1eTNNSHdUdzBtNWoxY0ZTRVA2dUVaY2d2?=
 =?utf-8?B?b2ZMRk1HclJGS1ZvNy9KZ2J5TklDblNiTXFWZm5oYk9kOURFaUgyZ05rSmlN?=
 =?utf-8?B?aG4xMkdsbXFBMFFnRElEZU15MFF1eExIVnpSUUl1Wk9DclZwRXB4Q3E5Vitt?=
 =?utf-8?B?RXhNZXZFTmFsOHp5NGRNS0JkczJLUUJkNFhwbUlmQWN4Q3ptWWFFZVdhSDIz?=
 =?utf-8?B?dU1YMkNERkRLNmVGMW1oeHllMHRkYm1KNkw5eUNCQ3lWTDZRb2Fhd0lTcmxX?=
 =?utf-8?B?ejJkS2VYakdGc1lQeitka3NLM1BRTC9PR0lqTFdBQzF2U1JBRzVCUGpROW41?=
 =?utf-8?B?dlh0NnBkOXIrbmFtQ2N1Mi9zSTUvQlBsWWJrUDNDcVlCQzA4SFFZN04yYVBy?=
 =?utf-8?B?M3RUUjQwT01kMGlPWUVQditLNEZKOWc5OWFrdEZyYnlFa0cyd0dObU9UZVVt?=
 =?utf-8?B?TURzMHh3bTk0M2U1VlNaSERQNjZEYlU5RUVXMTB6dm54NkhuMEl3OHNLQWxk?=
 =?utf-8?B?bWw2cUZIc2JUbDB0N0E3ZDBVMkh2bmlldUJJbmJQV2puclRuRkFHNWExb3VC?=
 =?utf-8?B?VEVyU3pKYXNUbzVjVkwzUW5vMUo5SkN1WHRUWlhwRXZPSm9IakxySHcrOEJi?=
 =?utf-8?B?QmpJOTBpTyt1Tyt4NXFtQ041Q2N4TXRoZ2VsbVM3VHBCMi9lcUwzNUdJOEI1?=
 =?utf-8?B?OEd3NkRZNFlzcnpaQWpwMzZRK2gwMC84Wk9oY2JWSGUrRDRncjVlSVUxa25m?=
 =?utf-8?B?SEp0TE1PVWwvWVloUFFIbzJhOCtmUGV0QUVLUW15RlMycmF1bVNnTlZoMzBm?=
 =?utf-8?B?OWN4WXV5M3ZoaC9JSmZQdHc5NHowc2E0TDh6eGNqcDJ5MWRVN1JVaGUvSFdj?=
 =?utf-8?B?Q0hKQzRwUUJmNjdJTVRWZXRscUF2Mi9ZNEdFdnpVK0YxY1RBRGdpQURETVlu?=
 =?utf-8?B?WVpSUmw2bGtCRzFRSHo2THJ0UW1BPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9lVJX6LTt7OHuTEiQ7Ym4SBj6ZzlpBs93IDKha2Kh+Og0qUVjS4yzFO/GnSZ/Y+ewDR6GVgm49OMPAm2tXc7uggKjgqBkhgR+rtzu25cX3m4wCHM25z4h02OOGFxaqXNNGp9Ujtm7cMuCGjnJLQxYZnaROApWeYPwVEL/t/dtXZY5V6j+zc937sUZRelQD0p93tiN455oaFhuJORdT3+5lNwKIoZUexc/KsupFtcXzfVCdtvVhgi7+I5CfS+H2jB7W7rLHvSIuvPjrGxKGO9v4A+TRVD9uamr+oEFrYudWSIjrAS3JzSq7Zp0vTFaPu1kMJZBlN0scbDmlFCtbkpWaF2bTXJcfhJeIeaJYwT/ZmNvihCsFxSD7KL37IfQIu23UD1JAd1XH5OR0KpMWQ/p6M34mH328IOUeEoic5N4kGapHFFSG+3l/DB5ZTat7r/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:15:48.4588 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f1c0b7-d68c-4c4f-b95d-08de73854c92
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6723
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 5/6] stm32mp: cmd_stm32key: add support of
 ADAC public key hash
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:gwenael.treuveur@foss.st.com,m:nicolas.le.bayon@st.com,m:cheick.traore@foss.st.com,m:lionel.debieve@foss.st.com,m:yannick.fertre@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,foss.st.com:mid,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76E2918469F
X-Rspamd-Action: no action

Hi,

On 2/4/26 11:20, Patrice Chotard wrote:
> From: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
>
> Add support of ADAC-PKH for STM32MP21.
>
> Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/cmd_stm32key.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index d1432ba1e23..4610841f825 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -94,6 +94,13 @@ const struct stm32key stm32mp21_list[] = {
>   		.size = 8,
>   		.key_format = format2,
>   	},
> +	{
> +		.name = "ADAC-ROTPKH",
> +		.desc = "Authenticated Debug Access Control Root Of Trust Public Key Hash",
> +		.start = 238,
> +		.size = 8,
> +		.key_format = format2,
> +	},
>   	{
>   		.name = "FIP-EDMK",
>   		.desc = "Encryption/Decryption Master Key for FIP",
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
