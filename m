Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJp2GOxynWmAQAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:44:12 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03755184DB5
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 10:44:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BDC0C8F286;
	Tue, 24 Feb 2026 09:44:11 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF048C8F285
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:44:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxSo7VIONUj+njryLkBzR33kvqHARzILf03xq6DG+IVvhnR1GXidBJSppP3dLlh8N4UYT8PTV+Htpq9mfHZuSLgm++ZoA+O7BuHzz+V7Il2rbdCakVer7MZy1GGKJaJ3FuFwedW9U6VBnmeDwhKmX1KgzlsdPIPhRcEzII7LBHfGOtwsNc2ljFcp9LZiWEReYmK2PlzjQpQ6oFeTaq9SpDveDu7/F6yBpMxicdcDKmmhugfXWFJ4ncLQUfvdjT64So4nZV6t2tJ0hbgaxu/8nkrehMQ/sWszMnDF8La5fBKCokLDZGXHCgdqiDzutOXQETu0aG01z4GcyWdtrnwcOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Boh3OmLumcJXkqnx8hJ+b/Ze2J2JCG6s2Tv39I2pW4=;
 b=Swp+xLR+SvjQAytbP3oNaLG0cyyprsRSUBPpe5lVQjR6JfbU1QBpMSPSE3yWAUKGbhZPKA9hyIg9AcDQ67/9MhUhw00P/QFLl8KiVyVrc4SY1pQspe1deb0EAyjIDZ6MFQVJz1VYkwUU0zX81d3cp0QImEhwiKdNw27O9Es/4yH0St8SMpVBJZEUrDloDmTQi8VoMDHo4kpMSeLO0GEvQf1iMKMVgYz0UtJcQSlDHF7yoB3pAvaYHCpqwiNzVgXGBEWdgJD2+1iU0rC49YI9XTKx+UEMDgushfesj4KDRsdb5i/+gNlZtkqGsAdWZXblpC8uFh7KcWn3+X4GxLe3Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Boh3OmLumcJXkqnx8hJ+b/Ze2J2JCG6s2Tv39I2pW4=;
 b=miCpOTTrzOrueIpiMOD5yrfMli0y1eWOktJnBxGOEjlV3nyUB7GaZPhDuCiDX7m3c1M0aRdCh6k4OjtGU9wityHs/pZtIg5i0xa/boXqMztRmgHGmxx1iL5wiS+EFGjcJnjx7Bjle4jmWFh4CY08Nq//8XSrypKR8OFejtfW8ixONZYaK3SK3kX6//VvvZ/VQeNFZPxfZvEkeip6gPaVWZMwb4etlBCFgxygSFv4NjIBeJsWWveSdg4Ta6hefbk4qL4LDpsDgbbBiLRfvhAeYLJR8SAPXzTba+f+mDx4b9JmIkrOLv9HWA+8AGruy5fesjs3iTTVkGrAsA4pseEH4Q==
Received: from AS9PR06CA0675.eurprd06.prod.outlook.com (2603:10a6:20b:49c::20)
 by AS8PR10MB6415.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:56b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:44:05 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:49c:cafe::f9) by AS9PR06CA0675.outlook.office365.com
 (2603:10a6:20b:49c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:44:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:44:05 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:46:11 +0100
Received: from [10.48.87.244] (10.48.87.244) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:44:04 +0100
Message-ID: <763fbda1-5372-449f-822b-b53625be5162@foss.st.com>
Date: Tue, 24 Feb 2026 10:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>, "Antonio
 Borneo" <antonio.borneo@foss.st.com>
References: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
 <20260205-upstream_pinctrl_stm32_update-v1-3-3a3797af498d@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20260205-upstream_pinctrl_stm32_update-v1-3-3a3797af498d@foss.st.com>
X-Originating-IP: [10.48.87.244]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B1:EE_|AS8PR10MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: ead952af-2c05-49c4-ea5e-08de73893ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVpWcmZ4RERBTVJYS05VeG1KcFYvK2FXM2REdC9BZWJOMVZpY1ltL01lZ3JD?=
 =?utf-8?B?RVI0a2lXMnlheDQrbkEyaWZGaTlTM1lZcXVzbmF1MUIrcE5BVm1sUUNkcGFH?=
 =?utf-8?B?WGpESzdQeDN0NWs0QWl6d2ZjMzBUNWlPR3RCenYrVjQ5cFVXZ3ZkaDREV3pj?=
 =?utf-8?B?UWRKWUJleU5sSE5jZHFNd2tCSUxMem9UY21lclpzZXlpRzV0TG8zc0plRzIw?=
 =?utf-8?B?cmdvVzZGK0REb0t6YTVYYUYyZ1BMdkxRUHJhTGkwanlpUGJtV0hXd3BzRkpG?=
 =?utf-8?B?Mi9nQW9TaFJxVlR1UDBzZkJ6amY2WlNmUW9GdWVycGxaNjIxSW55WnluZTFw?=
 =?utf-8?B?c0dhaVlPaG12WDBocVI4V01iM2d5SlNYM1FDeXo2RzdRR09MNWNwTjdSbjF1?=
 =?utf-8?B?UXh5MnlHbDR5d0Z5NlkwSkRzUFFKb2dUNHBiZEp6YldoYjF6T2puTXpyWjlk?=
 =?utf-8?B?VkVpOGpqRlhSejE3NVJoT0dvZVdnY28yUDBPakdnVmR5THc4N1JjSDNhek5N?=
 =?utf-8?B?cjhkTWpKVXlBY0ZHUm9oejd2Ri9XTmRWOWw4emJFTkZ5Tnk5YmRVam9RK05y?=
 =?utf-8?B?QXVwdWZRNXRVYVJPOWVyMmordjcwdnQ4UUpjeUZZZnJ0bjFKeXVmVmkxcVlP?=
 =?utf-8?B?VTkvL2wwZFQxZkJDeFFzbnhaVHVkNEovRGlWSGRNS29Cdlh3U3VqN2dPK1Nm?=
 =?utf-8?B?MEZvZ0xRYXVIREh6U3A2V3FPaVdySDhYSG10NTg3THNLTGk0QkdnbkE2WnRh?=
 =?utf-8?B?Z3pTazVOa056T1lITmV4SDY2d2FwdWVndU5RUkRvZW5KQjBMV1lpTGwrZVJo?=
 =?utf-8?B?V2FUWEo4cGhMam1kN2VQd0o2TzN5NkVsekhUb3hEN09TZC9DQUhUMHJmUUVu?=
 =?utf-8?B?V1Y3NXNTNStteUFta0NhbU9KeFQ5MzFEL2xDbC85QmdjT2dCakx3RkF1SUtP?=
 =?utf-8?B?MlJFNVZPZE5SQ3B0R1haOTIzNThmQ213ejhLTEpJTXNlYk41RFEwNWV6RGNQ?=
 =?utf-8?B?b3R4by9oeXNQeUsrZGNCeVVsMzRidGIrU2xDS09hWEo3NlEvQW43RHh5cjhr?=
 =?utf-8?B?Zkc2VmR4SWVmWmFVaUdtRGN1T2RxaHVjTkJZQ3dLaDNVQTNlN1NIbzBBZFNn?=
 =?utf-8?B?QnJ1REh4Y2cvd2xRZDIvKzBQYVlXdWFZWUZCdDhacDhFKzE2cWxtTmdRSmNj?=
 =?utf-8?B?Y3FIMUd4ZlVIOEp4bHpKZ1hFakJ4dUUvd2hnNS9UUkdWZGU1R1VVQ0NXSmlB?=
 =?utf-8?B?Rmcycnd4RE9nMXQ1TnNyOUpkOWpYVm5TMUUxNENkRWtkTk9mb1U0enM4YjZz?=
 =?utf-8?B?Z25yV0o1K0ZyaXgzNnIxL0xGMXE5akZ3bjR0Vkt0R1JaYlo3eUdmcG5JY2xV?=
 =?utf-8?B?TkZKakhKd2U2TXBJV3ZQQzBDTjZmUlVJUXoxUUd5ZkNTSm5tcnJJOXFNaVh3?=
 =?utf-8?B?L2VGWmxiemRPdDJUVmtGVHp4WEhsWXdPWThyUEJYWUllNzZrRE9mcW5XUGxX?=
 =?utf-8?B?Ti94Q2lqUTAzTlBHL1BLK0NxYkVIdGJJVWRRNVhFV2VKWHU2YWRZeHloaFJM?=
 =?utf-8?B?bVREdU91WkQ1WStnbUY1SVVrT2l6YlJhY3ZHL2NydEZxMFpGVVJoemh2TndM?=
 =?utf-8?B?NXlEOExWcFVJS1hIeEdxVDdhWE9wNHlFNFRqRFZkejNpYW1jcmc0MVVOeHpj?=
 =?utf-8?B?L1MxL0syaExYdFlmQitmNGVYMnd4TitFNEhUWWxqNFlaRTR2UmdKeWR0V3Nu?=
 =?utf-8?B?ZFNsSk13bElzanRyYjRrMzVFbjB3TDVCVC9pMkVjcVhWdy9pVGE1TE9YWHFP?=
 =?utf-8?B?cDFhMzE2V05oWUNyQ3RZdXRzekpXNGpIOXQ0eFp4aHVvek8xWUZZQ1NaZnly?=
 =?utf-8?B?L0dZVkg4cStoNHVSRE9OOTZodW5lVTlEL0RmZGNzckNJVUtKRFZlVnZQa2Iy?=
 =?utf-8?B?QzIvRHo3ak9laE5iWEwyTVZzRkJ1dHNKamNHNHhUcTB1NEIvS0ZzTHFZT3Q5?=
 =?utf-8?B?RVpaNHFBc0xseFRKY1BqOUdmOWZmL3A3Vno0dVpPTjU2RFEyMnQ3eiszOHdG?=
 =?utf-8?B?aFM0YlRCQTBrSWtkRmlWWUY3N0k5eGlNR0w2bXBzTFc3SldqUXg0MDU0Tzlq?=
 =?utf-8?B?ZnlVenFIeEdzVmVjbVNWYWxjNDg1YVloNUdXSTByMTN0Z1dCVTZOTW4wOWZG?=
 =?utf-8?B?b0V0Ulc3MW1TVjF1MS9lcXZrVmtDTHllS3poa2xLMVowMFYzK3Q2SW56YkFU?=
 =?utf-8?B?WVNOSHVlYks1RXllQzc0VHRaTjNnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hCY/43kpGMrRAtY5ABWnKbLB6JPeU03/JCd/KS+ZLJoL6FvqpwDv5AfYfKZikUhJiysjFpyjuleq/cbjrm2OKw7vYIaqr6tPeCahP4eLVCv3dwEAAz0+UoMaZ3/LZgDooUnPAwsx8TcmRhzdSGMbDYAiXiFU0nywqarYY1JlfGHy/zPRdP0YPjP1UFZn6T40uHUWf168sC7J8CZroamadCdo5gi7gWuT9qCRpd2MpcanOizeS+eeLdCVHquHK6ZJkrPgv1Bop8wBvMHcMVHzrWgoNDpO2/6mkgNNzLcUpdH3AbE6+84akXDmi3ryDtYbEAt7nfl9shTBKMfL4ZGxv7X+hfOY2fRPJ9FKjdn8b8rVt96k9OrVzxd4CLo+fwo3g6Jiye0Igi2o/KKXPa6E0VlwMg9obsTzEPbJY2HFDWmgimu4EKVFjaS2EMefwhJD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:44:05.3369 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ead952af-2c05-49c4-ea5e-08de73893ff8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6415
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/3] pinctrl: pinctrl_stm32: support IO
 synchronization parameters
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
X-Spamd-Result: default: False [2.89 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:antonio.borneo@foss.st.com,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:fabien.dessenne@foss.st.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrick.delaunay@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03755184DB5
X-Rspamd-Action: no action

Hi,

On 2/5/26 09:07, Patrice Chotard wrote:
> From: Fabien Dessenne <fabien.dessenne@foss.st.com>
>
> Support the following IO synchronization parameters:
> - Delay (in ns)
> - Delay path (input / output)
> - Clock edge (single / double edge)
> - Clock inversion
> - Retiming
> These settings allow a fine tuning of the high speed interface signals.
>
> Enable this feature for the stm32mp257 SOC.
>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
> Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>   drivers/gpio/stm32_gpio_priv.h  | 58 +++++++++++++++++++++++++++---
>   drivers/pinctrl/pinctrl_stm32.c | 80 +++++++++++++++++++++++++++++++++--------
>   2 files changed, 119 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpio/stm32_gpio_priv.h b/drivers/gpio/stm32_gpio_priv.h
> index d89e9b8ed60..69868787af0 100644
> --- a/drivers/gpio/stm32_gpio_priv.h
> +++ b/drivers/gpio/stm32_gpio_priv.h
> @@ -51,7 +51,45 @@ enum stm32_gpio_af {
>   	STM32_GPIO_AF15
>   };
>   
> +enum stm32_gpio_delay_path {
> +	STM32_GPIO_DELAY_PATH_OUT = 0,
> +	STM32_GPIO_DELAY_PATH_IN
> +};
> +
> +enum stm32_gpio_clk_edge {
> +	STM32_GPIO_CLK_EDGE_SINGLE = 0,
> +	STM32_GPIO_CLK_EDGE_DOUBLE
> +};
> +
> +enum stm32_gpio_clk_type {
> +	STM32_GPIO_CLK_TYPE_NOT_INVERT = 0,
> +	STM32_GPIO_CLK_TYPE_INVERT
> +};
> +
> +enum stm32_gpio_retime {
> +	STM32_GPIO_RETIME_DISABLED = 0,
> +	STM32_GPIO_RETIME_ENABLED
> +};
> +
> +enum stm32_gpio_delay {
> +	STM32_GPIO_DELAY_NONE = 0,
> +	STM32_GPIO_DELAY_0_3,
> +	STM32_GPIO_DELAY_0_5,
> +	STM32_GPIO_DELAY_0_75,
> +	STM32_GPIO_DELAY_1_0,
> +	STM32_GPIO_DELAY_1_25,
> +	STM32_GPIO_DELAY_1_5,
> +	STM32_GPIO_DELAY_1_75,
> +	STM32_GPIO_DELAY_2_0,
> +	STM32_GPIO_DELAY_2_25,
> +	STM32_GPIO_DELAY_2_5,
> +	STM32_GPIO_DELAY_2_75,
> +	STM32_GPIO_DELAY_3_0,
> +	STM32_GPIO_DELAY_3_25
> +};
> +
>   #define STM32_GPIO_FLAG_SEC_CTRL	BIT(0)
> +#define STM32_GPIO_FLAG_IO_SYNC_CTRL	BIT(1)
>   
>   struct stm32_gpio_dsc {
>   	u8	port;
> @@ -59,11 +97,16 @@ struct stm32_gpio_dsc {
>   };
>   
>   struct stm32_gpio_ctl {
> -	enum stm32_gpio_mode	mode;
> -	enum stm32_gpio_otype	otype;
> -	enum stm32_gpio_speed	speed;
> -	enum stm32_gpio_pupd	pupd;
> -	enum stm32_gpio_af	af;
> +	enum stm32_gpio_mode		mode;
> +	enum stm32_gpio_otype		otype;
> +	enum stm32_gpio_speed		speed;
> +	enum stm32_gpio_pupd		pupd;
> +	enum stm32_gpio_af		af;
> +	enum stm32_gpio_delay_path	delay_path;
> +	enum stm32_gpio_clk_edge	clk_edge;
> +	enum stm32_gpio_clk_type	clk_type;
> +	enum stm32_gpio_retime		retime;
> +	enum stm32_gpio_delay		delay;
>   };
>   
>   struct stm32_gpio_regs {
> @@ -79,6 +122,11 @@ struct stm32_gpio_regs {
>   	u32 brr;	/* GPIO port bit reset */
>   	u32 rfu;	/* Reserved */
>   	u32 seccfgr;	/* GPIO secure configuration */
> +	u32 rfu2;	/* Reserved (privcfgr) */
> +	u32 rfu3;	/* Reserved (rcfglock) */
> +	u32 rfu4;	/* Reserved */
> +	u32 delayr[2];	/* GPIO port delay */
> +	u32 advcfgr[2];	/* GPIO port PIO control */
>   };
>   
>   struct stm32_gpio_priv {
> diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
> index 1758f9a909c..7d5a0471a65 100644
> --- a/drivers/pinctrl/pinctrl_stm32.c
> +++ b/drivers/pinctrl/pinctrl_stm32.c
> @@ -29,6 +29,12 @@
>   #define OTYPE_MSK			1
>   #define AFR_MASK			0xF
>   #define SECCFG_MSK			1
> +#define ADVCFGR_MASK			0xF
> +#define DELAYR_MASK			0xF
> +#define ADVCFGR_DLYPATH_POS		0
> +#define ADVCFGR_DE_POS			1
> +#define ADVCFGR_INVCLK_POS		2
> +#define ADVCFGR_RET_POS			3
>   
>   struct stm32_pinctrl_priv {
>   	struct hwspinlock hws;
> @@ -43,6 +49,7 @@ struct stm32_gpio_bank {
>   
>   struct stm32_pinctrl_data {
>   	bool secure_control;
> +	bool io_sync_control;
>   };
>   
>   #ifndef CONFIG_XPL_BUILD
> @@ -304,7 +311,7 @@ static int stm32_gpio_config(ofnode node,
>   	struct stm32_gpio_regs *regs = priv->regs;
>   	struct stm32_pinctrl_priv *ctrl_priv;
>   	int ret;
> -	u32 index;
> +	u32 index, io_sync, advcfg;
>   
>   	/* Check access protection */
>   	ret = stm32_pinctrl_get_access(desc->dev, desc->offset);
> @@ -318,6 +325,14 @@ static int stm32_gpio_config(ofnode node,
>   	    ctl->pupd > 2 || ctl->speed > 3)
>   		return -EINVAL;
>   
> +	io_sync = dev_get_driver_data(desc->dev) & STM32_GPIO_FLAG_IO_SYNC_CTRL;
> +	if (io_sync && (ctl->delay_path > STM32_GPIO_DELAY_PATH_IN ||
> +			ctl->clk_edge > STM32_GPIO_CLK_EDGE_DOUBLE ||
> +			ctl->clk_type > STM32_GPIO_CLK_TYPE_INVERT ||
> +			ctl->retime > STM32_GPIO_RETIME_ENABLED ||
> +			ctl->delay > STM32_GPIO_DELAY_3_25))
> +		return -EINVAL;
> +
>   	ctrl_priv = dev_get_priv(dev_get_parent(desc->dev));
>   	ret = hwspinlock_lock_timeout(&ctrl_priv->hws, 10);
>   	if (ret == -ETIME) {
> @@ -339,6 +354,20 @@ static int stm32_gpio_config(ofnode node,
>   	index = desc->offset;
>   	clrsetbits_le32(&regs->otyper, OTYPE_MSK << index, ctl->otype << index);
>   
> +	if (io_sync) {
> +		index = (desc->offset & 0x07) * 4;
> +		advcfg = (ctl->delay_path << ADVCFGR_DLYPATH_POS) |
> +			 (ctl->clk_edge << ADVCFGR_DE_POS) |
> +			 (ctl->clk_type << ADVCFGR_INVCLK_POS) |
> +			 (ctl->retime << ADVCFGR_RET_POS);
> +
> +		clrsetbits_le32(&regs->advcfgr[desc->offset >> 3],
> +				ADVCFGR_MASK << index, advcfg << index);
> +
> +		clrsetbits_le32(&regs->delayr[desc->offset >> 3],
> +				DELAYR_MASK << index, ctl->delay << index);
> +	}
> +
>   	uc_priv->name[desc->offset] = strdup(ofnode_get_name(node));
>   
>   	hwspinlock_unlock(&ctrl_priv->hws);
> @@ -391,10 +420,24 @@ static int prep_gpio_ctl(struct stm32_gpio_ctl *gpio_ctl, u32 gpio_fn,
>   	else
>   		gpio_ctl->pupd = STM32_GPIO_PUPD_NO;
>   
> +	gpio_ctl->delay_path = ofnode_read_u32_default(node, "st,io-delay-path", 0);
> +	gpio_ctl->clk_edge = ofnode_read_u32_default(node, "st,io-clk-edge", 0);
> +	gpio_ctl->clk_type = ofnode_read_u32_default(node, "st,io-clk-type", 0);
> +	gpio_ctl->retime = ofnode_read_u32_default(node, "st,io-retime", 0);
> +	gpio_ctl->delay = ofnode_read_u32_default(node, "st,io-delay", 0);
> +


The binding seens not aligned with latest proposal done for kernel

https://patchwork.ozlabs.org/project/devicetree-bindings/list/?series=479156


'skew-delay-{in,out}put-ps'


https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251023132700.1199871-12-antonio.borneo@foss.st.com/


I think, it is the old OpenSTLinux downstream binding


>   	log_debug("gpio fn= %d, slew-rate= %x, op type= %x, pull-upd is = %x\n",
>   		  gpio_fn, gpio_ctl->speed, gpio_ctl->otype,
>   		  gpio_ctl->pupd);
>   
> +	if (gpio_ctl->retime || gpio_ctl->clk_type || gpio_ctl->clk_edge || gpio_ctl->delay_path ||
> +	    gpio_ctl->delay)
> +		log_debug("	Retime:%d InvClk:%d DblEdge:%d DelayIn:%d\n",
> +			  gpio_ctl->retime, gpio_ctl->clk_type, gpio_ctl->clk_edge,
> +			  gpio_ctl->delay_path);
> +	if (gpio_ctl->delay)
> +		log_debug("	Delay: %d (%d ps)\n", gpio_ctl->delay, gpio_ctl->delay * 250);
> +
>   	return 0;
>   }
>   
> @@ -466,7 +509,9 @@ static int stm32_pinctrl_bind(struct udevice *dev)
>   		return -EINVAL;
>   	}
>   	if (drv_data->secure_control)
> -		gpio_data = STM32_GPIO_FLAG_SEC_CTRL;
> +		gpio_data |= STM32_GPIO_FLAG_SEC_CTRL;
> +	if (drv_data->io_sync_control)
> +		gpio_data |= STM32_GPIO_FLAG_IO_SYNC_CTRL;
>   
>   	dev_for_each_subnode(node, dev) {
>   		dev_dbg(dev, "bind %s\n", ofnode_get_name(node));
> @@ -546,25 +591,32 @@ static struct pinctrl_ops stm32_pinctrl_ops = {
>   #endif
>   };
>   
> -static const struct stm32_pinctrl_data stm32_pinctrl_no_sec = {
> +static const struct stm32_pinctrl_data stm32_pinctrl_base = {
>   	.secure_control = false,
> +	.io_sync_control = false,
> +};
> +
> +static const struct stm32_pinctrl_data stm32_pinctrl_sec = {
> +	.secure_control = true,
> +	.io_sync_control = false,
>   };
>   
> -static const struct stm32_pinctrl_data stm32_pinctrl_with_sec = {
> +static const struct stm32_pinctrl_data stm32_pinctrl_sec_iosync = {
>   	.secure_control = true,
> +	.io_sync_control = true,
>   };
>   
>   static const struct udevice_id stm32_pinctrl_ids[] = {
> -	{ .compatible = "st,stm32f429-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
> -	{ .compatible = "st,stm32f469-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
> -	{ .compatible = "st,stm32f746-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
> -	{ .compatible = "st,stm32f769-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
> -	{ .compatible = "st,stm32h743-pinctrl",    .data = (ulong)&stm32_pinctrl_no_sec },
> -	{ .compatible = "st,stm32mp157-pinctrl",   .data = (ulong)&stm32_pinctrl_no_sec },
> -	{ .compatible = "st,stm32mp157-z-pinctrl", .data = (ulong)&stm32_pinctrl_no_sec },
> -	{ .compatible = "st,stm32mp135-pinctrl",   .data = (ulong)&stm32_pinctrl_with_sec },
> -	{ .compatible = "st,stm32mp257-pinctrl",   .data = (ulong)&stm32_pinctrl_with_sec },
> -	{ .compatible = "st,stm32mp257-z-pinctrl", .data = (ulong)&stm32_pinctrl_with_sec },
> +	{ .compatible = "st,stm32f429-pinctrl",    .data = (ulong)&stm32_pinctrl_base },
> +	{ .compatible = "st,stm32f469-pinctrl",    .data = (ulong)&stm32_pinctrl_base },
> +	{ .compatible = "st,stm32f746-pinctrl",    .data = (ulong)&stm32_pinctrl_base },
> +	{ .compatible = "st,stm32f769-pinctrl",    .data = (ulong)&stm32_pinctrl_base },
> +	{ .compatible = "st,stm32h743-pinctrl",    .data = (ulong)&stm32_pinctrl_base },
> +	{ .compatible = "st,stm32mp157-pinctrl",   .data = (ulong)&stm32_pinctrl_base },
> +	{ .compatible = "st,stm32mp157-z-pinctrl", .data = (ulong)&stm32_pinctrl_base },
> +	{ .compatible = "st,stm32mp135-pinctrl",   .data = (ulong)&stm32_pinctrl_sec },
> +	{ .compatible = "st,stm32mp257-pinctrl",   .data = (ulong)&stm32_pinctrl_sec_iosync },
> +	{ .compatible = "st,stm32mp257-z-pinctrl", .data = (ulong)&stm32_pinctrl_sec_iosync },
>   	{ }
>   };
>   
>
Thanks

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
