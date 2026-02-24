Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHK1JHXWnWk0SQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:48:53 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C618A0B7
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:48:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D84A3C8F28A;
	Tue, 24 Feb 2026 16:48:52 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F35C4C8F28B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 16:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJfo1iROCFw1srQFW2fBv8T49AiQSoiwy1BOL7dU3zlTOFPl3+VLL9lHq+mgsYAx+RQ1oAmtYXnJyO1JoVsYH11ZPyPLEbla5pYOq5Q+B8acHpe17UsEPWwxEuQBD9HRDHbe1VIkAVgcNhPPuY7tqYizq7larfuT0Sp/T6DiZBIy9MQhWfnpV8wAlDYHiQzBtPoKlqvUUz5lPu55ciXPmVZh/E0O7gb8OdnaGgSL3LSFzxZsrfszyWWCOcy9SNHiWDUBR/CKbXxPZk1EFJ18ULo4fP3w8JGeKUHurOgIJCh/AcgXl0vnzLwaN0t6XsVEXcIGNFWRvzooUkhbMbYg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbyWcdAuiXc0DK1uj87BbwfXO+5Q5Q5KjRh8ZqkMmNQ=;
 b=PyoBfmNXZipXx1GOfZjDchy0r5bITMtXz+tkRaouHdN/IEQ7y+zmC5XmNlymPfLM2VLYhi9//BuwzNBH5N50nA7YggiRuJSaxRdoYAZ6xNBjDD8ItoDclhLgWGERQ/43RDT4PUi4aNN6idJBZXW6gedIm1ZRmMxfifgVJ8EyLpTeNVSDBx17ty6hc4ELvjbMNOc1oztAY7jbEzWuondDhFYCf05wtSHZeXu/NigE4qff9TNsuQASlfqOJnuZvCxq0GwQUE22o0Xrgc1MWPIx3AncH//ZqkvRzxLeAXIDU/pJWXi2jPvtwCqy+EIrwig5B/LTi413jn9zdbxF/gBTNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbyWcdAuiXc0DK1uj87BbwfXO+5Q5Q5KjRh8ZqkMmNQ=;
 b=djuVIQYL02YHN95Dt4kGqu3qHzCIBhKn0Pg+777NkzGFGkpUFFT06gp4b3rOXzEkguZrvbJxcYWRoqCEtMDnN8Sfa6a2vHcZz8lWS0i+mH0n6g0WJ+sewYR/uFCjiesKDdnhNE3+t6Txu/dYaH0fl3+iJahJttTAwALYYpmb5fzX4v1gFFYNRc2qyibBr0ND18PzqTg2bi73uM8US8700XirD4rXm+Ztae3RHFLjLJLD4cdIkpG2Utx6V5/PEwz8GrUKvFu2CC5eV94rPAzsstCFLyxA6G9uGuEnjXjyLSwbaynwgYuPRg3w4CvOpOfDl7ZFHryK8nIP1J+opeeKsg==
Received: from DU7P194CA0016.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::19)
 by DB9PR10MB5859.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:396::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Tue, 24 Feb
 2026 16:48:47 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::c) by DU7P194CA0016.outlook.office365.com
 (2603:10a6:10:553::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 24 Feb 2026 16:48:47 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:50:50 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:48:42 +0100
Message-ID: <7dd87652-d386-456e-b5ff-f7d501a2a5e7@foss.st.com>
Date: Tue, 24 Feb 2026 17:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_update_stm32_cmdkey-c-v1-0-d95374395840@foss.st.com>
 <20260204-upstream_update_stm32_cmdkey-c-v1-4-d95374395840@foss.st.com>
 <8d0f7c3a-4670-48f5-a320-142d7d0d307c@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <8d0f7c3a-4670-48f5-a320-142d7d0d307c@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|DB9PR10MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 38228521-4f9e-4222-4e2b-08de73c49472
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eis5V2o1NEZZUFllU3RWaHZNTGNTRW0wNnNvaE1TYVFtNE40RXNwZmk3RjlT?=
 =?utf-8?B?RHVYWmhvdDZzK2dCYzRSbGhiaWUyL2R6VFR6bk5RMVd0bjhES0wrUzEyd1d3?=
 =?utf-8?B?N0NYb015ZWZBQ3pGMHY5amQxS3RRYnQ1eVRJamFsWmZra280RWwzUWFTOVVt?=
 =?utf-8?B?ekdhZVJwYWo1bDFVZWlwcGt2ZEszWEo0VGZOM2crZDZqcWJvN2FCamQ3TnR1?=
 =?utf-8?B?aXdyUDR2S0pzRm54d0JnNGNjL1lFNllSS1M2ell6ak9xSGJ1Yk1lVExkUUt2?=
 =?utf-8?B?RmQ4S3hmcFA3alBtQ3FPOGN2UDlOM3VMSnROS1dOdXNCNFFOalBWQnlEd1ow?=
 =?utf-8?B?ZzdPbkJXUUhNYldKYXBuRG9VaXhza1l6TXlablN0T0NqRExBcVBjdlcvSDBT?=
 =?utf-8?B?d2lHWW9kTDRDSUpCdTVNaDZUVEFQV1pLMUJTaFFnWGgzdnRhaVJscDFEWFhu?=
 =?utf-8?B?eUJpVTJyUk51c2NmT0hjbkptMkN6SHZQU05LN3lQRW5OMHVZak1jTTA4MkQ2?=
 =?utf-8?B?VjRRZE9WL3d1MHJCUUtrclZqa1JtOXV0MkIxYzhQa1lGVllJRGNEK2dEVGxD?=
 =?utf-8?B?ZVdkTnV3d05JQS9DeE9Qdndydm9pelZoSTlXbUZDNTdxVHU2VmJHa20zZ3Zl?=
 =?utf-8?B?elpGc2tRM01hYjVjWERKOTRDbmhzU1Q5NzhMK2tkSUwxRU96aDRpWXFhV2hx?=
 =?utf-8?B?dVN4UnNDWGx2RWxBUU1SbzlZQm5zWTNJWnVYenJYK0xKdy9WMStEdXZ6eDJX?=
 =?utf-8?B?SkpycmkvRE5ZbXlCU255Y3daZEVFREVLVHBDRmtKMXlnMFNFeG1GSHNEaFhW?=
 =?utf-8?B?VjMzZzk2ODQ1T3NsQTIrK0Vpcmh2dEdLUHIvd0RlUlBWcFZnaVZ3S3ZrN0s3?=
 =?utf-8?B?S2JFVGpwbXZ3T1I0dHQzL0t2WGQvSWw0a01Nc2FvNjZwOFVKRkR2Z1R0QVU5?=
 =?utf-8?B?YUlpSE1ySmhRM1kvN0JpVlNHaVhzWXVBSnkrbGFiQUlORkVyK0lMMHJBQUJK?=
 =?utf-8?B?WWRwNjBMY2JHSjNmcXFjMDRJN09lTXlBYW1ETE5UbUpUWjhtZTRrVmVaRUp2?=
 =?utf-8?B?SVpPbThGU3RXS2wvQ3lMTlNVL3pnbUFjQWg4SU1OR3VBSkFFZ1FPSmZwbEZi?=
 =?utf-8?B?aGFkWFRMRnVhTHlEdXJ0MldRN09kdCtFVzRtZnpTNHNSMFljUnhqZ0dQazVZ?=
 =?utf-8?B?SEFtU3ZCYWdWdG5YSmUzV0czREpKSVRmQnVVcnlwdGd6czFIekZhY2htYlFR?=
 =?utf-8?B?a1hjZGlVb01HZC8rbytkVmJOTzFLZ2FtR2hwbzNYSlIwNnpucHM5UHFZWndt?=
 =?utf-8?B?Z3VuYlpYa3orZXBDZjg1TzhteEdhZWliTnRJS1NHTVljQ2F1SjZhOVUybVlU?=
 =?utf-8?B?UEdxekVVQ0dGTmhrYmIyb2VOVVpMUTA0RGtFbnJBMStBWVB6aEExejB2N0dU?=
 =?utf-8?B?SGFMVk9BZ2RXTmo5dTVsaXF0ZkR3L2xLS3d6Q2dZbWZyYy9RQlZFemduTXky?=
 =?utf-8?B?L2lFbEZUY0xGSUpaUkxJU1VCUkoxQlRPQysvVVlmQ0RnU29paWQwNHdlSitx?=
 =?utf-8?B?NDdWd1pwNXZvL0hWZG1ZNGNoWjZTQzlja2FMZXBxTGozNmZ0ak42SUtJQTU5?=
 =?utf-8?B?VEFRb3FuVXRrYXFQMlkwWk5qbm5vbE5WOE93WlpWcWdvbGdhOGk1TjZFSUsr?=
 =?utf-8?B?NG45V1hGS3o0Q011UkRSZFpxdWFKMnBKMHJYWFpITnNlY1J5Y2VSdWdyU3pp?=
 =?utf-8?B?Q2NmZ2FEazJ4OThZaVpLZitFZWVCZzhFd3YwVmhBRmgva25WZ0pCN1pra3gw?=
 =?utf-8?B?YTd1SktldlUycDRTQlJEbkNBZkZGNitSSlg1K09abXRNRnA2VEsxZFhVNmxJ?=
 =?utf-8?B?UklIbno5SWVSL01odlF1cWxBWE5vTXNIQmpYS2lIV2ZaTURsUzlmZytYKzFx?=
 =?utf-8?B?bmF2eHJjR2orZUFoTTNVSVRlYnpiU29aZjY4ODNIMnd6RTkwaEY0NTlPOVg4?=
 =?utf-8?B?b0RnUTZaZS9zZWQvSzVFeEFkSWt5T0JYdTlvbU1hbmxWNklNM1NFMzcycHVB?=
 =?utf-8?B?STIvcGVZa3RsZytkb2pUYmpMSzJ1aE16MHptYjYxRnhZUDVJTWp2TkZuaDFT?=
 =?utf-8?B?RnVpVFpJM3B1NEYwcmxXQnVtd0tNSmFKS1V3aDN0R2l6MUU1R3lZVkV6V3lU?=
 =?utf-8?B?Mmg3clZOanlzMWJ6OHAzY2RVZ2lPbzdMb0lkMTBoYUV2ZG5iVFI1OVJ4WExW?=
 =?utf-8?B?V05DSzg0ekUxMUgrNmdVa2FoQzVBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KMYoioThPulCqGGbFOP23g7qXKGSUr4EVdU35SRP0jRZksY58VLwnVg+rsesp4BW2EoynIhXWhTTmWTfZANes8vInS7wMnQeUEOYPzAdqwP28+a+GRKY41+++2AMtvKlFdECFo/kN4lAw5ZIoETokvjRqqqG+mGzOJRAc2K+GKZPbBHRCilDGdqnYMuMS4xwyBcFf25hYwHegohrcULfMDBC1WwyiaP5f7iN4IgY0WwS4CYQyNFZ+QbzRzGuccLrVqY8yvE7KQ5jcTMseZyrbdaItW9r/GKEJMDua4Dm2ZhddPqwbO9wQixaJvBgUCgMp6kQ3HUlZvKunyW8fbpBFeee+tQDxzST9/m29MMPBeNsaxS868yAphnNAng2BE4eVOnWTIU3IIcZ0dNTM4LT/1vXgVeNgtxS9nK9B1rfpcQvIh6rTc0hvGddtiDvfOED
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:48:47.3400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38228521-4f9e-4222-4e2b-08de73c49472
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5859
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
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:marek.vasut+renesas@mailbox.org,m:quentin.schulz@cherry.de,m:gwenael.treuveur@foss.st.com,m:nicolas.le.bayon@st.com,m:cheick.traore@foss.st.com,m:lionel.debieve@foss.st.com,m:yannick.fertre@foss.st.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
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
	NEURAL_SPAM(0.00)[0.799];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 508C618A0B7
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDEwOjE1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvNC8yNiAxMToyMCwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBGcm9tOiBHd2VuYWVsIFRy
ZXV2ZXVyIDxnd2VuYWVsLnRyZXV2ZXVyQGZvc3Muc3QuY29tPgo+Pgo+PiBBZGQgc3VwcG9ydCBv
ZiBSUFJPQy1GVy1QS0ggZm9yIFNUTTMyTVAyNSwgU1RNMzJNUDIzIGFuZCBTVE0zMk1QMjEuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IEd3ZW5hZWwgVHJldXZldXIgPGd3ZW5hZWwudHJldXZldXJAZm9z
cy5zdC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90
YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL2NtZF9z
dG0zMmtleS5jIHwgMTQgKysrKysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKykKPj4KPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5k
ZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4gCgpBcHBsaWVk
IHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxpbmcgbGlzdApV
Ym9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMyCg==
