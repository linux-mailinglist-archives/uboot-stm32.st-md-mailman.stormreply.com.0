Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNGIBxh3nWmAQAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:02:00 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6CD18511F
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 11:01:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8167DC8F286;
	Tue, 24 Feb 2026 10:01:54 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B83AC8F285
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 10:01:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+e2cP75Z23TEfzrp6s9jbaAVCRySkrYPOMEbQ5iSnWNK4FaSy+WB3nPM8RPVYWQsVFQJdxiiHXdQErLWTgIMeve43DO5n9rQkOBJgMk98rrtCaEMIW3pOq2Gr2GNOI3AwYgkge9Okzy64opxRO0brc5mZGdJmq/bCfVxOQ5Hk24rcPhVz5YJ/4dzvDaEwHs98BpRdpB7WJbNLmkmSh8EnAHKw52OnnPCAQ5vXpFR+HgLR1N6O40P9mkcrEGoG9TW8EyzGwSnm2k+ewKtZeBFtGTYZ66WbpO4xuW1e+mpot+KlwWyCQW3fsQBEvPFy6AEETM8GVL0G0MkWnEA8iKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeeDgYwbAxtJYxUk5aKEda+oel38yOeIcIoh4zXGskk=;
 b=w5Pjj+MY78PvrkAtj8m9szJ7Tkh05sHr8Wcyisx0FvzKUkEqa/8tal4qo0eE3fBdNlzvMD+8IICrjLDYOV+yfIC34VvYWHPXKVnjH7FQnwV1CjdnFGQ5CtCySzAr5OAVaoJjXncwjm0Vhq92R886kiQ3AvjIwGv17j+kOXq6/TCJarRpXTsa+t4DeWPPAVcUEwbarzr8S/Y4XQ1pKkLBQgGbBr27DUF6Udc85OSElWXpucNtx2uXuaZtXP8sjQKEjgsujh2wZ7mS0OmDFk1SOZNNaxbYpVSazzjk7QzoQwPEeCq5L7NV1J3I/SvLQis0mz1nzmBcKnZJcR6YNOGAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeeDgYwbAxtJYxUk5aKEda+oel38yOeIcIoh4zXGskk=;
 b=PVXQjTIMFFS8Tds+tM7S4Ek+iH5UhVIuN8PYuIi5cWQaDAj1zbhgtu5Z2RXZGQrB0qLuTB9Z6+6ARZUkX6pTvW4AdRBN2XFDgL4OLsFQWUi+bFg0BZSyxaqYxdUfH5RuHQRqzfUsBe3fKruKWhUNFQM2PU+6Mr9hv3EY0rRDh0RSXEnPJHfg5qdbbJj+LBPZ7vzeMtQM3uDN011GyhmVIq9kFlkbtuj1AJZJ6IMgkTSOcLDmTL7hFBjxp5R/O8hckAZrvpiYwtOKYoz/TxE2qmUQewgvy8hR7R7il65o76WGltbQUR62SgzzdyClATts9enT38UAjnIhkwCbco2F6Q==
Received: from AM8P251CA0008.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::13)
 by GV2PR10MB7485.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 10:01:47 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::5c) by AM8P251CA0008.outlook.office365.com
 (2603:10a6:20b:21b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 10:01:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 10:01:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:04:01 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 11:01:44 +0100
Message-ID: <50a9f6c3-4284-460c-a429-49b4a53c836e@foss.st.com>
Date: Tue, 24 Feb 2026 11:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260205-dsi-v1-1-eb5805068e97@gmail.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260205-dsi-v1-1-eb5805068e97@gmail.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B7:EE_|GV2PR10MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 84216788-7b42-418a-30b6-08de738bb805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3V0SncvaEN3SEpFTTBzU1YxcWZ1WjVPZzVsTFYyWEFrU1c5dHFzMjNtZXhT?=
 =?utf-8?B?MUNlWWlqMU5acEtoaTI2VEVDY0pCejhiVTd1Q0haZVpvSkhDT1k5K0dDWnVu?=
 =?utf-8?B?N0VyMDlHSUYzbG9NZW1IY2tDMXlId1ZKNUIva2FyTDFZcWNYR3JaTUxzRVAr?=
 =?utf-8?B?dzAweURsWkxoWHB6NzRVQkt4WlZURkZVZHNMby9LODB4RnIyRS9uSDFBSFp6?=
 =?utf-8?B?K1lEWTRUNzNXREF3bUYwc2xqemhzdjVxcEwxUE5QOTg3alpCT3lwb2NwQmhy?=
 =?utf-8?B?NjQ4Y1J3Mlg0Ti9Vak5sNWlBbmRsVU9sZGtLd0k4Y29TUDRERkJQaVFoTUhC?=
 =?utf-8?B?VUY2WjRDNW5rQXp1Rit3REpUaVpYaFArTWl1Q0VoQk8zYm1DRElDWDl6Q1h6?=
 =?utf-8?B?c2ZtcmkrV2pVMmtBb203ZDlwR1E1a2h1N1pXWm9FUDR4S0YyT29TTUJoNGVm?=
 =?utf-8?B?UFBqVFpTZDJkdkhrWCtlSnhjRE1FWFhzeUp3SEk0RnZTRjZibTBuV2dESFZG?=
 =?utf-8?B?Y2dqVCtwWndRSndwa2s3aDdnQlY3R0h1UkFwV0RCTHpCZDhoMmxubEZHM05G?=
 =?utf-8?B?SGtsbFY5aHJUSkZpY3lidk9sTWJKQ2pEdFM1RTd4TUpIcE1mS3ZLZDBSM0ZH?=
 =?utf-8?B?ZEZScHlOelUwWTZJcmxtaXovdTc2ZXlaNmJPMlN0emNQRzhwTi9KTFVqQm5J?=
 =?utf-8?B?RU4zNjRIRU4yOHY5T1RUN0lSRU4rRUpodS9VMXpwTm5PU1BsdlgzZlVHS1Y5?=
 =?utf-8?B?eFpOZmJTamVKTDVYdUtBQ1l4Z0RQMmsyRGNuWVdKL0JtblpLTm9TVytCM3NN?=
 =?utf-8?B?VTNyMjVLU1ZVTEhKMkVEUlA1c0xNR0syMWkzazgzTjdLdE5MdWNtZ0pGRkJO?=
 =?utf-8?B?M2VweUl6eVgvVERxeCtLT1FCQk1GM0FvVmZ6c2pEZlJtb2R6MFp4KzJJK1RC?=
 =?utf-8?B?ZTlPZHNwb1RoSjJZRkxyNnkrY2xsRC9oZjlNaE50Rlk5NVE3NCsySlhhTjc2?=
 =?utf-8?B?OGdXL3MweVNnQ0k0YlpzU2ZrNk9vOGI5TmFML2NkbGdwRG5jZ3hSY0dkbmNs?=
 =?utf-8?B?RlJPT1dlcHdhQUR4N1hQc1dnS3d2dnNNL0JqNEl4SkMwMUdxZTdsQiswT0Jt?=
 =?utf-8?B?RnpsZ3ZyZ0FJQTZmQnF1TkVJTU9MS2dHRjROQjVVbkNSMDJCeEpQaGFUV0Vt?=
 =?utf-8?B?emw1VmQ4aXd4WDZJbkZJSWIwWHN1OEkvVHoxbGFMTndVR1lLRUVKaUJUTmVk?=
 =?utf-8?B?ODZGamVsZkRVcGs2QW9iV3c3ejlYem5hN0w5UW9MZFd5SU9FbTNxOGNEWmtx?=
 =?utf-8?B?cmsvWGo3Wm9Kd2pTMCt6WXIxNjdzdWp2cWVjWmpPTmxTSDNIQXVNMmdtTlB4?=
 =?utf-8?B?Mi96eFBCWDVXUVhPMzR0R01Eajdjb3NwcGkyTEtWNFU2L0pCSm03dFJmNlV2?=
 =?utf-8?B?Rkd6d1d0MzhmdUNxRjZ4em12UjJKNFFJSkNERjdOVmtGNm1oc1NkdkRzWHh2?=
 =?utf-8?B?anYwdWhnd1BMVlV5TER6cXJZcFdYTy9GZTFiSnhKaGNYTk8zSmg1NzY0NEpk?=
 =?utf-8?B?bXpXNG5SRlZnR056UXVSMnl5bTBKamIxYWdVWEZiMDVteW1TclFDTEozQ3Jt?=
 =?utf-8?B?TjZRbG5qb09aTjJCemp0d0NWNVFTQWhjbWc3d2w2ZWdUUFRtUnNwTk9pRkFp?=
 =?utf-8?B?T0w1cGdmT0JyZy9MWGVDY1dOSWp0anVrSTJyUHRqdzFxdEpvR0NhQmhzYnRv?=
 =?utf-8?B?T2tDNVhWUlBHSzJEY3ErbmdPNVl5bEZ1b0dsSUpJSnAwcVVidVFkMVBpOU1a?=
 =?utf-8?B?bjVmZmpOa2JtYkFnUzZVZ0huSTNLUDI4M0UvNE1zY2ZTWlAzUVR5K09uZ1Nw?=
 =?utf-8?B?eDlwc1Q4YXo3MlovWkE2NjhlR0piK3c1YWNOcEFDYjh4dm1TTGVDRmRreEt4?=
 =?utf-8?B?MVNTdlo5RGhlcW5yb0xkcnJNWVhydFk0VWQ2cWxVRVBuUEQ3RHhHa1V6Uy9Q?=
 =?utf-8?B?NlcvQlJjUDlMSmlFV2RObE1vMm15MDBQVXlBQmVUbjVucHc4WDVEdGhSVkRI?=
 =?utf-8?B?UTZJNyt3ZW1TSVo2M2ozZkFWUklGQjNyTXJheWNoZzhjVnM0TGxPc2dqaVM1?=
 =?utf-8?B?ZitNZE1SeXVIeWpuWWlKdXFTYjRVSytaaWFRckVTNXYyTXRBdVZPSkVPdVlN?=
 =?utf-8?B?NnJ6b1JTUEIrNmtQSjh1bmVZQmxtTTUvMTg0Nm5zeWpmNk16dmozcUJjUFZs?=
 =?utf-8?B?dzA3U3JFNVVFaUVBOXhnZUJGeWxBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OVZvTCtHaPmm7ZVeDNoXMGJpu4u3tG2NRRT9NR+VxRuDdIUa9jkzL5wUuWiN4F5Ow2Rqgn2qg9/1B8JISUxgLjgDD1Yrg8nSM3N6W/RHj3ulwrPkEEjBqm9g5IStO7wx1eH2k9+TTXGAtNDovy6/kfLvwzfvOq1C9iXFdW8Jn9wVu5p1GyYr2ZzwHJsA/oCV8c/uHyvTkxr+bPZ2ke0nD32chMoafbiyMVAbyAUL1+lkVh+gnDMQ+wm1VJHnb5DuhAb0nOpG6ESIDpXsAvTQ9Q8B/5/SjqF4PX4zndLohee5tW6hBWRWtV5oIRxqQWV2AbqtNX4RRpFUtHW+J2b6DE6Zs2JbaqErnCIKC+L1mP2/leiDwmHF3l0wRWuHie1NeoAMlcjrgvxqIhIR2hv4o88b5eSi2E3dJGaePYMgLvLhnsnWq49Q2CAiwPKwlXL7
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 10:01:45.7163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84216788-7b42-418a-30b6-08de738bb805
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7485
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <ag.dev.uboot@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] video: stm32: dsi: add .of_to_plat
	callback
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,st-md-mailman.stormreply.com,lists.denx.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rgallaispou@gmail.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:ag.dev.uboot@gmail.com,m:agdevuboot@gmail.com,s:lists@lfdr.de];
	RSPAMD_URIBL_FAIL(0.00)[stormreply.com:server fail];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[konsulko.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.430];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RSPAMD_EMAILBL_FAIL(0.00)[patrick.delaunay.foss.st.com:query timed out];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C6CD18511F
X-Rspamd-Action: no action

Hi,

On 2/5/26 00:35, Raphael Gallais-Pou wrote:
> Drivers should extract device-tree data before probing via the
> .of_to_plat hook.
>
> Implement it for stm32_dsi driver.  By doing so, it also solve a
> variable shadowing in stm32_dsi_probe() where &clk was used as
> peripheral clock and ref clock.
>
> For readability some struct have been renamed such as:
>
>    * struct stm32_dsi_priv *dsi -> struct stm32_dsi_priv *priv
>    * struct clk clk -> struct clk pclk
>
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
> This patch has been tested on stm32mp157c-dk2 board.
> ---
>   drivers/video/stm32/stm32_dsi.c | 168 ++++++++++++++++++++++------------------
>   1 file changed, 91 insertions(+), 77 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
