Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEClLzVsnWnhPwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:15:33 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E37E184670
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:15:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E6B6C8F285;
	Tue, 24 Feb 2026 09:15:33 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36BF3C08D19
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWZK1584WJz0MpQdOyn3oEQ57La/o3utvhO1vw0ah0jeSxJgmKTEW3Oa9utVCWjYSPXHz0scd53FRYxo5DmlnUPyIPbh98ASNjAnaJfJHBVhVDEoVEebA5HMN9H6Gy753D5OPBvlq6f+B/nt67TpV5vQGLgbnRTUQu0Sh6v8JzQXbxWoSkxHKUjgitjegYn+Pb/wYaVJfQ9T06qVMouQdXNhRO3/7I9VSXx7X8ODMYIw4GoshkBY4rsCEAmYnfbgsmylYBVLLDdwByvFY9oeFThYOeTfvZfhGLDq1Znl0RbbgTto0VHcqWz7MKUR/6iH0nPMO0TsdxhyYStb5cBRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZVdGiWHlKIkPu3/D+nOgMWAzoHgcoMGb82uCzK6j+4=;
 b=OgffQ+DrBnO0wMgu71mthvcCfnz9MLm4l5i0BcfwCraiS0b1OfkLbgS0SsUN0zHQm71L9YS1Bvb7cY+PvhpfGwuFPuMqk0C1cXGtfIFd8qnXMJpOwzgOd+A1nLxY9RPfI/XH9czNIcRCqniwbXoORAGEddCaXbHZORNo96jADlTpGAgg/r/yz27P5EeQHbt+LVxb64IlAelD2sm2vBIdCRvq3TA+FPAkohDoP33nmUnp8leVAaU9und5CDhHzRtDlM4mxN9MmfOJ2TF4hpJzCf1EK09pDpzWH8zz53Nv7yHKVPWnIrmvcgsp8y6Il1eh5106hcpFxyLWZ2d9JW91uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZVdGiWHlKIkPu3/D+nOgMWAzoHgcoMGb82uCzK6j+4=;
 b=kZ6+X8YJVcGUX/YHzLWIGd2ZvF2gKW67WLpGNZnsxBn2uTGibTPr1VNKRrRTXw2eR/FwzN5Ior4iVEOqjryLjxTfR6plMFiUGkMWvBYF7373+GpUzdPy793wKrmswVrA0YBBtIDokFFj/ERQ79l6qqkN9rA0PjKN1XBA++kzULVBpnZskkLFPfwgA9MrLaeHkdAQ9FUQx1+HYLo32fC2iGrAqOnyPpRNAQMeqpWx4HXwshh9WMSZPLFxXR8MvtIVbDImlU3BUpyPWqPO956WsMalOveZcI+NjujgjD1JCuCaz4LIiAdRAYcRI10Q47p9JaMQit7DvplqW6O9UHoSug==
Received: from DU2PR04CA0277.eurprd04.prod.outlook.com (2603:10a6:10:28c::12)
 by VI0PR10MB9219.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:15:29 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::80) by DU2PR04CA0277.outlook.office365.com
 (2603:10a6:10:28c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:15:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:15:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:17:44 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:15:27 +0100
Message-ID: <8d0f7c3a-4670-48f5-a320-142d7d0d307c@foss.st.com>
Date: Tue, 24 Feb 2026 10:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
 <20260204-upstream_update_stm32_cmdkey-c-v1-4-d95374395840@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260204-upstream_update_stm32_cmdkey-c-v1-4-d95374395840@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|VI0PR10MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8d1272-6231-4868-7051-08de738540fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUhrdkpGdWErRHppMVRHRjZlZUwvY1ZZYytTc1A0VVlxSThqcEZXRk5HNzk0?=
 =?utf-8?B?Zk5LbFFVcThvS3h2RU00KzdOeFVMUHZtSGdxVjh5enIwUHc0eVMzeExEMDN6?=
 =?utf-8?B?eit5dDV1UDhtcWQrelJ4V1NPYVRlSkpTaXlmQlFCTisrbys3S2FSZUpWNmRl?=
 =?utf-8?B?SWxaVWxJYjdDeGJVbGRDSkxYWEhjeXpWQ1A4bTFrOHNvaWZ2Rlp3c29HMUpU?=
 =?utf-8?B?YXlJNFdUTXNXRFo5RTNEcmswTVJwTjFCZEVaMFlydjQ4YnREdzU4cGF4RnBi?=
 =?utf-8?B?SXlHc051dVZHY1k2MmpqOWxqYndaVjZJeCtYNzduQmZ4eElaMWJ1RU5OcUEy?=
 =?utf-8?B?OUQrcmhVcDFZNDg2NzVGMzc3MElNcFRFYXB0cUZGTkFLVzNrbVhVSkdiT0s2?=
 =?utf-8?B?ZVBwRmUrVXhoUGpXaFBLR2p5M29QN2trZm8rTkFURkxGcGYxRy9neGlGeWg3?=
 =?utf-8?B?dDExZWQxdlJUcmFsNzMrZnA3cjRzQ05BMXVtYnl2NXVlUUtrbHhhYzl2ekVI?=
 =?utf-8?B?enBjY0w3MmlpdFRpRy9wTnVUWkQ1bi9CR1dIMWoydVZCM2J3Z0ZtbHQxU2tK?=
 =?utf-8?B?Z1NRRmtUYjdQd2gyK2VMZWZjOVZKUE5LYXVXbFJVbGRJSDhqQkxJMS9vdmFk?=
 =?utf-8?B?V3B4Wm1QM0U3NEVFV2tOSW9pL3VJY3lGWTM5UXdxa0N0RHVrSmpWeU90anFh?=
 =?utf-8?B?RTRMWEpkK2VBY2ZVNFJweGpSOWJFbWkrc0EzYkJ0bXhFMk9oczdsSlpMUkdZ?=
 =?utf-8?B?OUtETmVTdm84VXduRDN6SWJJK3Jaak9tWEs4M1huRlI0UHZHRUpnZk9XTHY4?=
 =?utf-8?B?REw4cHpEOG5ZcGdhNWs0M21QWWJXenhKdWVManFsbnJQdXVlN3pQTk9HMUwv?=
 =?utf-8?B?TmtpQVBuYVpGcktOSXBEd3VXbExsMHRHUG5KOE1nWGgvMGpQcCs3TDY4cDN2?=
 =?utf-8?B?SEp1aUMzN3MrTmludnFWZVkxeWQ2MEEra0R2N2lBRy9qNy90clgvTG5PdzVx?=
 =?utf-8?B?ejVFSVYyOTVraGVaRmZLWUdjRFM0SGJjc2hyNkszZms5TG1DREZSQTMrSUJ5?=
 =?utf-8?B?cXJtejgvQUxHbzJ3K3Q5R3VOL1ljRW5Ub0pzdm1LT1FUNDNTSmVjT2NIdktD?=
 =?utf-8?B?a1FYSmljNXhwQnFsK09yMmNFdHdwb2RKL1ZlWUJZT015NDdZRUJUczlMZElC?=
 =?utf-8?B?WFhVNTJnMlpZL0FPOWpySmhUWFJBRDU2bkVLVDJ6dVp5R29ZUkoxc3E5emlR?=
 =?utf-8?B?OHl2eG5MVDVheWpoREtBQ3hkWXE0OXc2M0tXajhrcFdzUnFtTjJpMW5rYzJi?=
 =?utf-8?B?azdCdU4zMUh3TEc5Wmp3Z1N2bElpRGpKZEMvU0hPbzgvVUdGK01DVGhabXda?=
 =?utf-8?B?MG1SY0FMOTZUVG5pTFFYVFFkV2xXTUYxTFhWVC9yN2pocXRJM0RsMFdkWi8x?=
 =?utf-8?B?VkxJWVZvTmMxYXlVcnNWemFOWlZNV0VHS2xZK3FWYWJmSnl4Mis0WEtRMlBk?=
 =?utf-8?B?S1lOK0RMaDZpUmtCZi9MRVI4cmdTUEtCOVlTR1UvVGZLa1BEdmNvUDR1czlM?=
 =?utf-8?B?TlBqNlFqT0FDd1BIVmErMndaTmNFbEJVMUtFangxZnBvbEhhcTRobUhwajFC?=
 =?utf-8?B?VGo4RHRIVGtYSW5nNUFPbzIyQnBlbmJ5am12MnhBNjFjZEplZXJTdFNEdkRR?=
 =?utf-8?B?SHVQODROWmFsaEVYNHVGMWl0L3dpWVdTTmg4TExBL2tsbk1acDl5emF1SEpF?=
 =?utf-8?B?ZEo3YVhPZEQrNzFUVlpjUFpxMEg4QkFXOHdGT2FQWDdIWGRJK3lGOHRGdjFD?=
 =?utf-8?B?WDY1aDJZcUhqTmxvT2pnTmZGUUNlY3dOUU55MlJJczhNTzIybGpMdzIzVzZh?=
 =?utf-8?B?NWF6K0hLRmM2eU5zSTlmak83SjZ5YWg0dHhOZlBPT1ZWZEJYVlJtMjZON2xM?=
 =?utf-8?B?NGFUS2lkeGVPNmQ5M2EvMlRnSWkxOGNGMGJsTDZTVHdrSDhmUFlrOVprbkVG?=
 =?utf-8?B?YTZBcU5Oc0NEdzBnMmhFcGFRQXBDRUowMnVFNlFOTXVtdmpNTlRwOFRYNC9s?=
 =?utf-8?B?VzVpNjBzbzVlR1dMamFaZzFQSUVxTE9ITHBxVHdIUWxOZzJvMWM4b3FBY2oz?=
 =?utf-8?B?U2FaQXFPTEg1eWZKbWs4SFBIbTRWOUNwSXJGVis1dWdrY2FlOTdkc0hFK3dR?=
 =?utf-8?B?TXdieW5IRnQvWnJNZC9wZUVZeVYvN3NKcnJtN09kRDNTUW9Lb3YxcFNNS0RT?=
 =?utf-8?B?akpNSDhHWkxBQlorQmVTL2RQWWdBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: q4tgLZoKyCmFUClSftwGEcRcM85t+THOaCN8q0iAOWUoVzZLFepPi0/1Tsf5YFnOQfGU0YaRh0IeaUj0KNHiPlV2FmQxlFzFepZDkGWHezZ7nxQc7dSyrHlL32td07hxcEpKkP2YU1s06Us3hL0j+njGI/teJ+RmxlWpdbllekLEELO1lwV89Wa3BkhMOeHpjhnAv5Dn4DI+gbozeOoJOyNHziRB/ERkDacz0VRUqEsrWIRkv9ko4+9XnUdVmBjRJy1Sre3T4QK7P6eTOV0BFB6I55bt29pe13xGxbh+sBnxAyABKH1/FMHLQ43Eu81K4jWwgKbX4SGhPIQKm56g497ldfB3H5Fj5gjb+bZEPm6zndXUnq3UD2Iwv+gaNekr32ucVko2U2zrL4alD6epxhrIBSg0DNCr4AUedFEc/EqmRVAkRUTKGd8qarv0X4fy
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:15:29.0046 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8d1272-6231-4868-7051-08de738540fa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9219
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>,
 Nicolas Le Bayon <nicolas.le.bayon@st.com>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 4/6] stm32mp: cmd_stm32key: add support of
 remoteproc firmware public key
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid,st.com:email];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E37E184670
X-Rspamd-Action: no action

Hi,

On 2/4/26 11:20, Patrice Chotard wrote:
> From: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
>
> Add support of RPROC-FW-PKH for STM32MP25, STM32MP23 and STM32MP21.
>
> Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   arch/arm/mach-stm32mp/cmd_stm32key.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
