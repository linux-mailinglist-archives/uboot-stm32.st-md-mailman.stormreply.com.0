Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uP4hEwimnWmgQwQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:22:16 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8FD187907
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 14:22:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5BE3C8F288;
	Tue, 24 Feb 2026 13:22:15 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6052C8F287
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 13:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfB7jBgOMbKuceW/IyqmM9MmWFy+2/Nq7xvtf646rblH6aOwdSVIhJ9Pvr4t0Nt0T054AcJV1h/mW0dCCkll2+l2/cEcsrqM0ilTJthvCrML4KuL4mNMi02cBMOywQzOT045Z618bje1xvcuR/fwnxX1hMJOiQKsxrIRR6GAbnbKgvuj4+JHug9AngbKMQSRpngnpYh7Pc8nYh3Y9yzWX6T9F2kww3Fhet2w4Xo5wdOoD8tf4XySoUvuIoX3Gq/bzQZTwf33JA+sFBg0SJT2XBYOCiLZPioJv9DLH+tOevfieaNMBFcDihr1y8biZaN0p630UqWXmvdjfTjGeL1gVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUb0AaosElvrCwHy4hdHjuppXEXW7lkgb9css5H8fxA=;
 b=WeH9xGiY+eR3QPG+N5RUHp7T2gAFsMcEhaPyx01ttxa3TIOqtEVX5sdQPhw3jR6EKHiIGrpKXDDTb0S2e735fkg8PtTHSCkguwaK1xNr5CZ3nS23ak9uH68UFVWwCygoE4nZKKcUGW7GDXUYIlSEBOYEXp2RLUOs/uJ51eLIQ282mkcb2XmnU9LjEmBE2bcXWyc2/SLe9oBjH6i9rPi5g856Qf3Kf8RMeVM6stH8jHEj9livRdAEg38VqauwEEgkcMw1rmqtLYNYh5v3QXuI9cKUqJoYej7jNGwhuLWaJPw/bU5GIZjFCGK38WohW+Mfy01uqwfGwcbhbzO/p0mftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUb0AaosElvrCwHy4hdHjuppXEXW7lkgb9css5H8fxA=;
 b=HDKlH2Vz/+HVariBkfF3xdy+Zm37e7+V5qgBwvNbHXlCiW7urBf7beFWL5gA00X6EKkVi45GhQZxTt+OI2J8anb5t9574q20iICFJOLDyzzLygEFUNy2hz+3mj2le8hda1wPCpsyPUX7iWe7u8pQaQvidIHi6Q7PETFaqzy1wmaW1QbZpsYCeMgdIUODc/8ZJKJj1np7MVME/MrBaNHrLUEZKD92QBIPlDs64IkerQlOprX4Ye6RswTn8pr1eDo88WQrTREnCOyy1kZehdmI7jMTMk8pll+opKMdbWUrerp7O17B+uEUR0n6yb43bnpBYMOCbJtHQ5/ByygbH/rsuQ==
Received: from AS4P195CA0033.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::20)
 by AM0PR10MB3684.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:151::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 13:22:11 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::28) by AS4P195CA0033.outlook.office365.com
 (2603:10a6:20b:65a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 13:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 13:22:10 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:24:16 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 14:22:09 +0100
Message-ID: <c798850c-2736-4079-b8c6-8336552a4d25@foss.st.com>
Date: Tue, 24 Feb 2026 14:22:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260205-upstream_pinctrl_stm32_update-v1-0-3a3797af498d@foss.st.com>
 <20260205-upstream_pinctrl_stm32_update-v1-1-3a3797af498d@foss.st.com>
 <1d0c08d8-4c5a-483f-b4f2-c58849f1113c@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <1d0c08d8-4c5a-483f-b4f2-c58849f1113c@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|AM0PR10MB3684:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb22f7b-a643-4154-39ce-08de73a7b721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzFlbTZDc2hqbE52ZXRjMUNDMENDdG9Bbk1iMzZTUGRXOUhBZW1yR0VRMkh2?=
 =?utf-8?B?QklFSzN2Z3pIZlBITlAxYlhWZ0dtZW1WZ25kbmZDTldMekt2R1dmTS9ZelFr?=
 =?utf-8?B?NnNxd1pDYlY0dnpQNHN5N3NqUjg1ekMxZk42Mk93WlY0L2tHNWJHR1R2TU5Y?=
 =?utf-8?B?SDFUZmhCVXFweHVuQ0FkYWVmT053UnRiMzNDbEJjdE1LR2JFN3FzL3hScGRz?=
 =?utf-8?B?dm9ZUVoybDlTVWNDMWkwUUtZcEJlYVdIRTJaRnFKMGdOR3phdTltbjVGSWhh?=
 =?utf-8?B?c00relpBM0EwaFAzS2p6TDQzNnUyOHFIRzl4RE9TeXE3T1BjMXUyR000dzh3?=
 =?utf-8?B?cjFYQkFpeW5pVmt1cUZqbkxwSTVJR0REU3dMeEI4d29Ec2xjalZFTE1rbUZF?=
 =?utf-8?B?Y0pONlIwTm9xMXd5cXFYSjFLdllhUitZTy82TXB3QjdRMlhpUUZUbTNHMHJK?=
 =?utf-8?B?ckUxc1lpVlJnSzZyWk5EUW9zVlFjZmpRTnllMU9TR2dwS3lLeVhIS0MwTzBE?=
 =?utf-8?B?anh3VS94bUxENE5pdlRldWJYQ214emlEVGVudnRMbFM1K3ArR2RralBlYmQz?=
 =?utf-8?B?V0xYVVc2aGdZWThFZVRJQTZGWXAyR1E2Q2tzeS8wY2gxbkZnaGNKckppVjR1?=
 =?utf-8?B?WU5vQ3NjTU5xUWE5YnFsdFFJZHNZM3kzWUtocHdpZmplMzRnZnBsL2pvaC9C?=
 =?utf-8?B?VWxLWEJoOU0zQzl2ck5OSGNWOXhKSWZnY2MyaVpoZUl6UC9zMXhBMTNubFVZ?=
 =?utf-8?B?NExXbmFkWUltM2t0aGRrSEpSbk14Sjh2YzBWUlZzQUl1Uk9GL3VrV01SY3ZE?=
 =?utf-8?B?Tk1lQXppc1M1dFZPZHNMSHkyV1BiSzBHSTl3d01BMWc2TEZMQytsaUZIUXJK?=
 =?utf-8?B?blBPWjdEc0VQRnlBK2kwZTZtT3d0amI3ZUI1SW9SRzM1R2N0bUlmWEJrN0NN?=
 =?utf-8?B?dUExelZQQ1pMeDUyVDlnTDdadzB3WE41K2VDWTVNYVN5ellsWGk4VUgraXpY?=
 =?utf-8?B?b3NIQkRCbHZac1Fpb1daS2lMMVkwbkl1V3VpdWx5ck5yendJdWd6TU5BcGZY?=
 =?utf-8?B?VTA2NGFSbTA2YWZOcWNLWTdhZmxydFN1d1p6YURzUEUvMkRKNlY3bFp0WlRT?=
 =?utf-8?B?WE5GR240c1pIWE80SFNlRDhQT3kvUWlXY0h5OEZCSWR0N29TK0NsM3h3clY5?=
 =?utf-8?B?ZHRyOWZUdGNxVzFQdzdqOXZzWWUwVjVKdHJ6L1JZcmdGMWhnNTFCZnc3Tkt2?=
 =?utf-8?B?VTRHWWdvMXFTaGlzcXRWSDVFSFRoL010NVRMczAyRWRLT0hjYkxHS1ZPdDJa?=
 =?utf-8?B?ZHRlcGhhNE9pMy9Ub3p2eXFIWFZNQ3NGaGViayt2M2hYSlBoL1dxNzkxSTlS?=
 =?utf-8?B?d3krT2ZVL09YMU9LT2U0QTdVSzFQY0g0RStVUGlkMUNGUzRwdzFpOHhFSGln?=
 =?utf-8?B?TG9GUFBkQ3Ava1cvUzBZdlh0cHB3MkVyM2lBMVFuWVB1eVNUTXhOWWtJdUhI?=
 =?utf-8?B?eWVVMzQ1VlVSOTJPQTZVUHVvNnBYeVVQcVVmcWhMdnBnVkRWUytWZEZrcW5w?=
 =?utf-8?B?UUZmQmVyby9zSit0ZmZkKzdlY3oyZUYrWVVoVHliQUhDeDV4Rk5ReitHZXZT?=
 =?utf-8?B?WTIrU0MzWWpNajh4Sm1jZGhidVpqc0VHa1IyR2ZySGZKN0tKZkhRV1JoYThy?=
 =?utf-8?B?R0ZoWWVrejdQaFBWSUQyMVZTbm5aZ3Q4UkYyN3JkRmdOWGpoeUkzWHlqYTlF?=
 =?utf-8?B?bkd2TVJ2WTZhZG1vSFZSZmI3amtkVmEzS21qWXBtaTNnYlBmeDBBRFJWdFF4?=
 =?utf-8?B?YmdwM0ZTM0dLRVltM2hJMTI5WU9hSnQrazZHbmpIT3RBYlJkdHE1WUhVcHFU?=
 =?utf-8?B?UUgxQjlyZWVUTWFWKzVBaFJhMm0zSTFhYnFkTEJnRExNTEpES1o1ZDNBNWZ3?=
 =?utf-8?B?eGZoNjF3RDlzbWFTNjlMV3hEYnhDQmttTEhDNTZKQUxDdGJYZHdaNDdzOW0z?=
 =?utf-8?B?OFcxc2lQVHVXTHN2eFNzL0NXWXJLa0NueUNJNmh3S1pFNkxuOFpvZXB1VEp1?=
 =?utf-8?B?Y1pRZVpaZURSbVBHcVRiYnNjT1JFWkpNdkFVY1lWSTlFem9hV2FaTHdhWmE1?=
 =?utf-8?B?REJtQ1k4cS9GTjdpWTVjb2MyNExVWkZXdmpHZjFFbEhWSTlaWms4STdwRkps?=
 =?utf-8?B?Z09SclNCMHlGemUxL3VEc3RLbHVOSmRycWgveXZaNmpiTEthd1FiMmpIZ0lR?=
 =?utf-8?B?TkRIdGQ1eFBxSmQ1SVB3NEI4YUlRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DEEKtvoPu+K7OP6u18lQ3/BAbMc8RsvsHvrssvADSQso40W02uEO7bOD/B10LGyD0xC0cia5F0nQSz4mU7PEIOTB+DHX90+JybL9IZLu/Cvg2Qa6G3hfH/j6zEEmeKQ9/xIBBqHqSTEJmN1Cr6ZGdngqlFHMd7ePOCKy6OeGB5Um4xiMP+l+JJDi7jIrygXoqmo2QpNhApGrzEuRoFoYukSuh2mKI0GgeLvY0QqmOViFuvUlTOqRkHtntKkWRL40gxqLJs1odmdn+ZQu1VQjxHdBShIBi0gXVGPBhxikDRzN6oLpnGoqz+KFmU3N0SFKQiWpBKridlmZAz9H9iqIWXUP9v+t7nVG8okD2H5m5n7FU3NaZps+uWUZ6IxyZBZP/ptIB1DJSHWMGOEXbNiC716h11MQB8Ly8RCM3ylKDZljBwDdP2rxV3ZBe8sXNawQ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:22:10.1434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb22f7b-a643-4154-39ce-08de73a7b721
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3684
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/3] gpio: stm32-gpio: prevent the use of
 the secure protected pins
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
X-Spamd-Result: default: False [2.99 / 15.00];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:trini@konsulko.com,m:valentin.caron@foss.st.com,m:fabien.dessenne@foss.st.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,foss.st.com:mid,st.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.227];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B8FD187907
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDEwOjIxLCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvNS8yNiAwOTowNywgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBGcm9tOiBGYWJpZW4gRGVz
c2VubmUgPGZhYmllbi5kZXNzZW5uZUBmb3NzLnN0LmNvbT4KPj4KPj4gVGhlIGhhcmR3YXJlIGRl
bmllcyBhbnkgYWNjZXNzIGZyb20gdGhlIFUtQm9vdCBub24tc2VjdXJlIHdvcmxkIHRvIHRoZQo+
PiBzZWN1cmUtcHJvdGVjdGVkIHBpbnMuIEhlbmNlLCBwcmV2ZW50IGFueSBkcml2ZXIgdG8gcmVx
dWVzdCBzdWNoIGEgcGluLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4gRGVzc2VubmUgPGZh
Ymllbi5kZXNzZW5uZUBmb3NzLnN0LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUGF0cmljZSBDaG90
YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dw
aW8vc3RtMzJfZ3Bpby5jwqDCoMKgwqDCoCB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysK
Pj4gwqAgZHJpdmVycy9ncGlvL3N0bTMyX2dwaW9fcHJpdi5oIHzCoCA1ICsrKysrCj4+IMKgIDIg
ZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQo+Pgo+IAo+IAo+IFJldmlld2VkLWJ5OiBQ
YXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+IAo+IFRoYW5r
cwo+IFBhdHJpY2sKPiAKQXBwbGllZCB0byB1LWJvb3Qtc3RtMzIvbWFzdGVyCgpUaGFua3MKUGF0
cmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9v
dC1zdG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by91Ym9vdC1zdG0zMgo=
