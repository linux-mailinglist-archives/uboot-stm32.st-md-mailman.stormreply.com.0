Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDVkA3rVnWk0SQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:44:42 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7738D189F8A
	for <lists+uboot-stm32@lfdr.de>; Tue, 24 Feb 2026 17:44:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DEF2C8F28A;
	Tue, 24 Feb 2026 16:44:41 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013029.outbound.protection.outlook.com
 [52.101.83.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C177C8F289
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 16:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzOmb7d3o+nE2A21CIjx0TnaYDbH78MFSaFsDxin3FPoVf3GIdmgzwBX+ovW/f/RQuuYf3GR3Qo1zE7s80YnMkdNSgOf69i69Dh7oQwBHokfOKi3dnZigDBLzDG7nSptVnLD4ZlKjxQdVBGohMqpWklbL8W4N7GeCCAXS5hyCSNWXYdXKVEcurlrcEKOjndt1kBJ7Bs3HsD3BjSFerj2QS3tkNRIZkddbJDICdy7HJSExxGxEh1I2eZodr1e6Y7Z0aWnVD86Y/U7q1yud9nOG9zuGDu9bdGkVJM1MMIzSQmE3+T3JJMUVjJHUVm3nbmo9tGDQVJawiZysnhXa6GCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAKIDLqJjAHkOSAmZO5dd5RjzTqcmIPDTWcz4fOZwOA=;
 b=BBljewwKtGsuiAizi1/uAbyAtsCbRIMynaZ3zEkS1ceTMVOidsrqqu13E0t9mKdec6a767S9U9pwWBgJu6HG6ar+1asyKzVuQ+2R6A5yD63aMKfYGvf7L+GN9kRK3UWDdV3KUzBjSqVW9hHyQkJ1UQhAnFaE2aNd/yOkNdNUjw4Tfi5pZodbprmzRJLFbMSYTZX/YAaEf5maaTXxITbqteYculpEAwgxQ5A6l6s3eyZDZJyGlEn680QXPICE/HQIXH6a4nhy+mZOqfOHprsQM8nHe0YIjbB1DRyEfFktNUNXyxkCWiy0re0cG6LqDBsYSgOubm/uvNRkHx718xiOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAKIDLqJjAHkOSAmZO5dd5RjzTqcmIPDTWcz4fOZwOA=;
 b=nH4rHWMECuK0rVxK4bTijzn7g35KdgqVMBSAWk0xbBHUh1zl8Z7jsXK1DH+HdaVCDPAMo3J2ThjKrZiLOQZyPTKRtIpcEX2gM8K8ZyOEMvhHAbn9EG3UcSlRxOGUgWv5VFWclqJC1dwZ9Rq41jXP54qYu660gg0cxH2xQuHcZQzBZgCJScpv5yVtEoX1KTtlvZyJR0rTlmg2R7EAn8vq9w7MhtqAyrE4dHLgYRpoZ5csh/fAVEp5p0AccguIUQM2dI4VKk462yXUgKaG7d+wI3uPDEdIroiS2hvfcMKZca2NWKZaPFS3o0DVVBVZUcdIjBUCqyGQCBy15K2OINBL6Q==
Received: from DU7P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::30)
 by AS1PR10MB5769.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 16:44:37 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::13) by DU7P195CA0025.outlook.office365.com
 (2603:10a6:10:54d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 16:44:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 16:44:37 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:46:53 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 17:44:36 +0100
Message-ID: <f60b9579-ca08-4e19-9570-95baa57bb223@foss.st.com>
Date: Tue, 24 Feb 2026 17:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20260204-upstream_factorize_and_update_read_idc-v2-0-7f0baa41d2f1@foss.st.com>
 <20260204-upstream_factorize_and_update_read_idc-v2-1-7f0baa41d2f1@foss.st.com>
 <06745e64-828e-4dee-817b-fed654448f0a@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <06745e64-828e-4dee-817b-fed654448f0a@foss.st.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E1:EE_|AS1PR10MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: e0a1a6a8-f7f7-4db0-e27b-08de73c3ff97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dCs2RGRYYnlaclIwR2F2bVJQUnZIeEFHQzcwV3gzcE10N3Y0TXNoUWJLU3d5?=
 =?utf-8?B?djYzSlIzWXFqY0hHMlV0QjNiSmgxYzBiRHRWUEpxZ0JvYnVSYWZUQXRuNlFu?=
 =?utf-8?B?V2F1ejBsYXZhd3RpaTk0Qk5MR092OVJGNHNyWXJmUVo4b2Q2THBiQmFjUW9q?=
 =?utf-8?B?OXY1YjV4MWh0d1p2S2gwdmVtRm8wYnRKdjVqTkZIMy9BenZrWEJCMUd0Vmh0?=
 =?utf-8?B?U0llUlJ2YURHSmZMamJZMzBTWThxN2kxS2JxbWsreHA0eFJtQURHVWpSWE81?=
 =?utf-8?B?UmFVSmMrR3ZTdm1NOVJlekZ4TDUvT20vQUtPWWJpN0xLRjdQTi9IL0ZCcmdJ?=
 =?utf-8?B?bnFZTnhVRVVXZGtHclhGbTNrb3UveWswdHB0MmtYRXdralZTaU9VMDlRS3V1?=
 =?utf-8?B?MWp2dWxoOU9HQ25jeXF3T0NYanlYM0xsMXJ5R1M1NlhtaVpHMW5MamppNGhX?=
 =?utf-8?B?RUpkNGdCd2VremxHY090VUppUmNWcnpDUHpCcENONUgvNDVnQTJ1aXRkcHRn?=
 =?utf-8?B?eTFjWFQ5TloyVzlGZUw0ZXh4TXpJamlxeGNCdUVPUzd3d0R1d2ZFdEw0VExE?=
 =?utf-8?B?UTVmelA4amlUaXNkdTV5T1gvYngvak9vY25qZUVoMFRlUTNyV0diOWtCY094?=
 =?utf-8?B?QzU0VEVCanVXdFFMS09uUk0zaEkxS0RUOWQvUkNRQzdQRE5VRVZRa0E2Yi93?=
 =?utf-8?B?dGRhNElKTW4wd0IvQlhWVTUxZEFyWStMQTVJSmlZYmRjOHpNL1NzTUZMV0V3?=
 =?utf-8?B?ZjZkNjRjMmVpNzZOWjlJOE10bDNlTWQ2dzhLWXFwZU9adFFncnRieDJEZ0dm?=
 =?utf-8?B?eWJYZWk1WnpOelo3cHUwcUlyS1ZNNC9aRUIyd2g1cUEvWFZ5RHJDQlFwOFlP?=
 =?utf-8?B?TitZb1BoaG90T0YwRDFlK1BYTWRZKzF0MG9IdnlTN0E3YzRPbEtUbHViUStD?=
 =?utf-8?B?a0N1VHJyaStGdE1vNURrOTFJV2x0elFiYnJRTk1RdU5WbmdJVEtnMWpNRm5K?=
 =?utf-8?B?ci9pUzFUMzhIdU5EVHpqZGFZcDlCUXltRG9iUXNqa3FrM2s5NlpzRW5DcGdw?=
 =?utf-8?B?MW1VRTdCNVhBYzNNRGxlZ2ErdFBGbFlWVWY1V0pDell0MXBzMWFFYmw2VTNo?=
 =?utf-8?B?enpISmMwSVRtSHVwaHc2Ny9TSnBDdG9QWHl3SGVVTnU3bytSNW9uQXZjZmZC?=
 =?utf-8?B?QjgvV3hENzRYUVhnTHU3MGVsQTdkc3ZSNUp3MDJhamZaejVkWmxjZmMxQ1ZZ?=
 =?utf-8?B?NERIbWd2ZHVyenRNQ1BXQ2haMzlVT3prVStjRElwZm9HazVJZ3ZkWGRrL25U?=
 =?utf-8?B?dURFMk9oSHR6L1h6bExkZ3l0MkthNHB0Z2xuZFBXZU5RMG9xcjlYY2lzZC9F?=
 =?utf-8?B?M2t4ZHRsaEhNakVpRFJlbGFyMEEvVjFUaElBa3dUZFUzUlRSZlV6c1ZKSExH?=
 =?utf-8?B?MmRGaDdvVzQ0MGJ0TktNaEpVQkJ0R25tZDY4eldVUnVmTG9PM1dwT1YySVNi?=
 =?utf-8?B?SnE0dVN1Y2k2N0FhNG56Y1BFbDlRUGF1eE9xWU80aWJSVVVKTDA1eTdQUnZ1?=
 =?utf-8?B?YnVxajNTYUFpazlRTFFMTHB5S0VGc2d6OXpKTlVnTVVRYXVNQ3lSKzlqbzFn?=
 =?utf-8?B?MUwxR0NJQjdrRFNpR21pd3FFSEZEQjJONHRzNFRBT2ZJaWt1b2o2a2JNalg5?=
 =?utf-8?B?RmNteUIyNjF5UHd2VVlTQjlQU1AxOWRCaHYyYUxFNkpLczZibzMyMWNKd1dr?=
 =?utf-8?B?dUhXeUJkZDhlQlBvRWJOcGEwTzlKUkljTDJ2d1lhbUlQNjN1S2kvVFcycVpR?=
 =?utf-8?B?eDNSQVhZVmVURDRRVHpaNmwwYmVxUGlsV3h5N2dXdzc2UEhHeVRLL3A0YjRq?=
 =?utf-8?B?eEt5MW5ta2g2RCtDbUY0RXpROGVya3Q1RHQxdkJhQ3pGby9iRk5XSmVMSEI5?=
 =?utf-8?B?aFVvakFSZG04aUZTY0l0S0hWRnJwQzhlSGNhQ0UzeEVCQ1RlOUJiWGdkaXFR?=
 =?utf-8?B?b082eU9VWDBuN285aVZFR1h1QTRvME0vczBGcGZoR3hHZTdZWWlvVldZU2F1?=
 =?utf-8?B?UmpicU1NeGdmQlJ4bjRYUGJydW9PZUE2OVRXUEx1K2cwL0x3UXh6WEpPQ2ZS?=
 =?utf-8?B?UDNWSnB5QzBtN0pJeVhPaXpmU1BST3ZLOHB3VWZKRUhSSXBPbFJMMWhCSEdO?=
 =?utf-8?B?d3Q0K0RKTmNJWGRFdnlkN203Q21EWXN3eFFXVkpTOHFxTGNSVWg1UmlpQVlN?=
 =?utf-8?B?aHluSHREQ0dEd1kySDdDZ1F5azBRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZXBh0Nd3DLuL5hXB0rMPdtgb69oF+gn5Zm2tzBOFKRTv3eLT1eVMjgZjKOorhiD+2bIxOw3EmRSRmaYDiBFO3o8QuGWeJHoyP+p5Ed7yMWmbC8Jg05mnXXQqvjam2DGEan+BnOco+obFb0NSM/LzEY93pjpQPIgUUF+bCccvv09zWv3v+ZCNs/9wtkOPhOZePi6jhVyGb7eUkF9Mrkvq0uDywdGo3vYkPEBfaCLpXzEbVXRcsJHN1aRv5M/B0BRaoIpArvVBSJ2yyA9tx7/teUkK4EpUycxfY9cpFGRL907Ez4KcoNKslntarpttdJ1hfLMncGEXvz/Gmj2Xu6w7F4hd85EwNSVjKSKM5CXvXTJKBFgIXJ+lQv274iAzVh2S6O48ZFc3mI5FfGmBE8Pwc+KcDuSxKVsPNbvHHMJQ0ot6ai/R2myhgo8Kr0kjNZjB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:44:37.6026 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0a1a6a8-f7f7-4db0-e27b-08de73c3ff97
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5769
Cc: Marek Vasut <marek.vasut@mailbox.org>, Tom Rini <trini@konsulko.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Asadeds <md.asadullah@eds-india.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] stm32mp2: Migrate duplicated code
	into stm32mp2x.c
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick.delaunay@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:marek.vasut@mailbox.org,m:trini@konsulko.com,m:gatien.chevallier@foss.st.com,m:md.asadullah@eds-india.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st.com:email,foss.st.com:mid];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.336];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7738D189F8A
X-Rspamd-Action: no action

CgpPbiAyLzI0LzI2IDEzOjU1LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+IEhpLAo+IAo+IE9u
IDIvNC8yNiAxMToxNiwgUGF0cmljZSBDaG90YXJkIHdyb3RlOgo+PiBTYW1lIGNvZGUgaXMgZHVw
bGljYXRlZCBpbnRvIHN0bTMybXAyNXguYywgc3RtMzJtcDIzeC5jIGFuZCBzdG0zMm1wMjF4LmMu
Cj4+Cj4+IE1pZ3JhdGUgcmVhZF9kZXZpY2VpZCgpLCBnZXRfY3B1X2RldigpLCBnZXRfY3B1X3Jl
digpLCBnZXRfY3B1X3R5cGUoKSBhbmQKPj4gZ2V0X2NwdV9wYWNrYWdlKCkgaW50byBuZXcgc3Rt
MzJtcDJ4LmMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0
bTMybXAyL01ha2VmaWxlwqDCoMKgwqAgfMKgIDEgKwo+PiDCoCBhcmNoL2FybS9tYWNoLXN0bTMy
bXAvc3RtMzJtcDIvc3RtMzJtcDIxeC5jIHwgNDQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4g
wqAgYXJjaC9hcm0vbWFjaC1zdG0zMm1wL3N0bTMybXAyL3N0bTMybXAyM3guYyB8IDQ0IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgIGFyY2gvYXJtL21hY2gtc3RtMzJtcC9zdG0zMm1wMi9z
dG0zMm1wMjV4LmMgfCA0NiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL3N0bTMybXAyL3N0bTMybXAyeC5jwqAgfCA1NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDEz
NCBkZWxldGlvbnMoLSkKPj4KPiAKPiAKPiBSZXZpZXdlZC1ieTogUGF0cmljayBEZWxhdW5heSA8
cGF0cmljay5kZWxhdW5heUBmb3NzLnN0LmNvbT4KPiAKPiBUaGFua3MKPiBQYXRyaWNrCj4gCj4g
CgpBcHBsaWVkIHRvIHUtYm9vdC1zdG0zMi9tYXN0ZXIKClRoYW5rcwpQYXRyaWNlCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290LXN0bTMyIG1haWxp
bmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3Vib290LXN0bTMy
Cg==
