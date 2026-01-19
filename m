Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 676F2D3A1C7
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 Jan 2026 09:38:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BF83C87ED3;
	Mon, 19 Jan 2026 08:38:45 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A5D7C1A979
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 08:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UPUGG32LBBqgv0KrParzVa0aDCD6RvQDLN1E37QNrDL/YxWbtDNm1DFX7DVLNzVn2VsiXL2aBScEKNxuA7nFQ577YP2oQ+Xbn/APfgmSaiSvQt2BjpMdlPvFB3DHXcn8bgHZ1K16Z5NFj4j5vEhlITety6Qd+htMPcjNwaExNDrC0l31tI2fDP/1H0h6QCw4arg+hKgIHhnd9wHrGD/kK38Fn//v+L4Wc5DJ/zl4noHr8l5AKiR650OfYmo5f19gckrcV0gkgYyn0sLeG7mKpAZPqR0pG5Du22yL+MAQlm5nze0wmg6qE2rfAye70wo5mTyJnt7U1Fpwpj0b3lVeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpV8v4wT5ZnB9P7YkA62R0dtFXC/GOXVxxTBoTEd5VM=;
 b=JF7sN3kJ6cEm9RnazXpaUpgzxp8scwN9XGsl73JKS0NHl8hZoqzpdrLnOQWsYZ4fNLTM5hu9ackGmscCGNUju0Xo/Fkf2ZasMLJkdf8dRcYhtnPyWkM62pBXmlY+5JTpzxVR+8IqkawaV0tkxtmPkdWbdii7uHvyfRdQPL6PaG9DLDi+41OeJMpeYvCFVawPTDVaE2YrwDSQ16kswRPFGUNJG151Sm8Y+0YJj5tns5Z8TNYqenZkujcdMgpFi7C4rzsk/i7SgtnAg8YMNRaCjeoUtuw+cnjzPWNa0k+cZaDwcjumyp8vM1IDLdUkZgql/J/V3Y5rN42B7+K29U1a4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpV8v4wT5ZnB9P7YkA62R0dtFXC/GOXVxxTBoTEd5VM=;
 b=U6N6xBXUqzzlcqru92q9PvaR4JJf6jWgcD37nTzNkpOyZgzTbT221Qf9wSxaSthGYg8yXjjPj03k/2tWJDkQ2Gr0Z+1k6FYUDWjeFNL5kQfscTywrEsIMJzQP3iv/ZIjphInJWHUVC+IyyZohPmpULi5lLTsr6A+RNHCUVdgLic5Jll2sjd74+HD6NYOHxWNd1rhQ5ZGAOhfoMjyvg6PpSmhdQOqlCNIGAKeaHj2RmtYCN93qiWVU4a+MMXSpda//+OA0g1hTOYG+40UxgTHjfCanrsINFqkZQFLScoi4y1oGxbhQDe7nlauUPT1I8wUZAB02T9NEuyXNeQnkoeaog==
Received: from AS4PR10CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::8)
 by GV2PR10MB7605.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 08:38:39 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::49) by AS4PR10CA0016.outlook.office365.com
 (2603:10a6:20b:5d8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 08:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Mon, 19 Jan 2026 08:38:39 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 09:40:07 +0100
Received: from [10.48.86.129] (10.48.86.129) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 19 Jan
 2026 09:38:38 +0100
Message-ID: <a7a69ca4-c8aa-46cc-8745-249360a4e1ed@foss.st.com>
Date: Mon, 19 Jan 2026 09:38:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260118104912.1672642-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260118104912.1672642-1-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.86.129]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C711:EE_|GV2PR10MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 94aeee22-24bf-4737-f762-08de573624fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djRGdWdxNzEyVXFWLzJLVjliOW9hUmNkU0d0bDVmWm5uK2ZoMHVtR09qVFM4?=
 =?utf-8?B?NHpzbXdrLzBTVzdLVjFIOHROanMxeVFBN1RqbWpzeWhUVVcvQjNtZm4xUUtI?=
 =?utf-8?B?TnU1Yit4ZENUQUNnVHExK3FqWUUzQStqbHM2ZW9hT0FLd09vUDZJYmhtQkJi?=
 =?utf-8?B?VnhteW5DOWhCQWprNzYxdXNvZG1uTXJ0WlVvYTlsdkdhaVB3TmZSYmVnZGky?=
 =?utf-8?B?bVlWZE1HemZ0S1lnNVkxRlJxa0lKeVQ4NERad01EclFIeTUvZGZ6a0kwc25y?=
 =?utf-8?B?RXVJV25TY3hNZlh4SVFwWEFreVcrVmZDR2FYcElkd1JrbGRnNDRrODh4V0NY?=
 =?utf-8?B?c083d2ZGUWZ0bHJmVHVBOCtJWm5rVHUxbW1xL0hNWjg4UU9yMGlabzE4aHMw?=
 =?utf-8?B?OGI5a0NYaVNLMS9sZ2VqOXVoRjM0RnRKZmpVcEpHZTdwRjZGWFJKNFVmZm1V?=
 =?utf-8?B?WEowcmZoMDNmcGlyM01zWFk1ZjJwcHY0WnhIUHZWSlJwVGw4RmVnR083eVhY?=
 =?utf-8?B?MjhRM1d0SUkrcWpQTXdLNWo4UXUweG9ZVGJEYzF5RE5aT0M1ZElGOXV5VEMz?=
 =?utf-8?B?YXEwU3FJWWg2dUJZcHNKSVNrdlZjdFkwQ2lSYnYwVzVkWjFOQ2ZNTkcyRlBz?=
 =?utf-8?B?UGtyaWljY3NPOHI3UnJTU0dHU2RETUpSdFl5Z3lOc1BFYlIzZncxOXlrTGlq?=
 =?utf-8?B?VmphQkRRVjBQc25kMk4wWmwxR3Y4UDRHdlpxZEVYbkNQLy9GQXB5c3MwYnBq?=
 =?utf-8?B?ZFU4Q2dnM3BoZkFWSUhiS0hOd3hqUzN4YTBqQUV1Tzg3NVRmcHorNnRzSjZL?=
 =?utf-8?B?MDdSZGRWVE1vM0l2SFpnd1FSdFZpSTFhSFNOWkVVUG9Manhrd2N2dWZ6VEg3?=
 =?utf-8?B?bERsaGdvVnV4YlNYNldHRnMwN0dISkZMWC91MHVORjgxT2J2MHhuekptdTFG?=
 =?utf-8?B?aS9iVVlST3BpdjBua3VjRmFSQVkrM0ZxQmNLdjVscG1LZjNpVVNNWUhWYWo1?=
 =?utf-8?B?c0p3OCtJcXExUG8yeTJzRk90cGJCc29rYXBackdXYWhyQ3lzeTVmc2RCeUFS?=
 =?utf-8?B?cWNWWmpWZ28vcmxib0duaiswZ1ZiQzdYYWFDUXo4L3JzSWM1MjBGREZmSU4x?=
 =?utf-8?B?QW9NN0lRQVpSYlZDWGZFTkdCN3NIdk1hNEQ3VksyVVA4SlJhUWVXeWN4RHBF?=
 =?utf-8?B?MDhPZXN0VkNOalhUb2FRUXBFaUc5RVk5dzlZVGRjdFl3Vk1ZYkE3amZlRk14?=
 =?utf-8?B?L0xFbHY3UmVHcklpTm5oL1RWYUd5aU41ZHZOSFFQQWt5MnNhbWlPQnNLZWx5?=
 =?utf-8?B?T0hFT2JCVGc2ajE0WEV6RDBXbjlvRkYxazBpc3NpOFBvVkU0TU1nR28yWnp1?=
 =?utf-8?B?UzcyVGhTcVlBcVJEcmYxUTFIZlZHTTFSV25ieFNZK0ZTc3E1YkorZnRFdmlo?=
 =?utf-8?B?QUQzbTdvSzRBVDg4ZWJvV3k4Y1F2TEtWZEkvMU1tQVRlWDAzcloxdVd1dDR6?=
 =?utf-8?B?VHk5UTlCb3FpenhELzJLcGZSY0s1dThFWis5SXpRVEFxZXRKcXhtWkVVWC9K?=
 =?utf-8?B?Z1A0ZzRSaEVuUm1jb1RuR0F2KzVOcHlKMGxBalJ6dkZTcldSbFNPVTFLZ05M?=
 =?utf-8?B?WnJldittMm1FbzFRalFsT2gxelMvbFdZR3N1bFBVbWVSTWRQckVoVU1YZW80?=
 =?utf-8?B?SGdGUlpYTUlRRnEzbTlEZzdBZWhrRGduSHdiSS9lWFdXZ1dJeW9KVEVESkNC?=
 =?utf-8?B?S3MzN0RFU0R5UjRlTmlnL3ZuY0RvTm9UWCs1eUFOM0lsYkliNXdpU0lOMS95?=
 =?utf-8?B?aHd0RHZQbDhCL3Z5cmJsaG8wSlBESEEyS3JGZUYzblQwb1FxcjJkMU9EY1o1?=
 =?utf-8?B?aDBZS2trcW1VQi9NR2p3RkFqeHFBMW9uRWpuVXFxemVEQzlDZFMzczZmMWRD?=
 =?utf-8?B?Z21KY0FkdXB3TTh5MUFVa3dpa2FZS09OMHhKWWJPWVVRbWZBYWJRamw3bjQz?=
 =?utf-8?B?UkhqSDdoM01GeWRLNDZLUUlVNEwzTnFLU2tyT2FWbTVoT0lTaFlOQ0xHY1dM?=
 =?utf-8?B?dGp5ZTljS3ZXWFA4b1ErOTY0eERYelBrQjBRYzgrd01MMUhGWUdKcXNzUTBI?=
 =?utf-8?B?TEJSSCt3WFNGYXkyR2Y4S3hjbHV4eEtJWUc5YVRaZGNOZlJ2RHRXRDJrRk9n?=
 =?utf-8?B?cDg2YjVLOGtsRGk2c1Q2Qk0rczNxOWpySlZPaGNQcjRvYmhyaE1TUHdHc0xp?=
 =?utf-8?B?a2cxNUZZUE90TXRrZEhSam9Mb1BnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: DfPrVjo+IdRG9Yo9E0l2afHrYR2IpVkX+15KdRyHSts7tqnuezWzoCV1iOB2RMlhtkxkcz09ixUHqWM6mt2EyB2WgMGLoWT83dTpdhihoNLe8eoCwKMCg1EuNBpA1p81FIaDUu6tD8S+Z/6m55HkwGiFM4JqyaPL2nJsPNxm8ndyZDNFWHUmjxLi1R1uilaxyb7Xks9fX15E42BarawYQtnqqnQuTLGMsOI8+D6Y0craby9OJky8WRe2exz46r65ezjODZAmCMN6AORQutbj7lKFcnbsdrhDpk78A4PZo9Fa+58XLvHX5pLBuBmURCbJ+rPoR/Hr8vCuIYUQM9I+8OsMrtKU1wro2Zxoej1NcjcbPCCOipwqAZ9ePxrPoR9K4+s6Dy1xWVv+rkrLZkKwjZvTNFb0xjpU0beT7QlJJ02fgllmL1TXtRb9QIhFbIuUEr8UVNIbYgzHHHaUrkCOKYu6imCcgKdVFjIzGVl4jcj8EA6J2pjv8wvUlSzwZLSDpIeSUkneJrrp1k3zSD9sMwjcMu9S6YGuYifG6CzdsKYIUMLFZcWUsfVhZUzZoyZrBSQCCG2R0yx8yON4Pw5xnlNt/safQToIi1xqYdU8YZ5My4C9OsYiykniPD6Ek5OZyI0ZLE4uVmDTp5Wl+X6JC1b/dwkZ+TFlBIOf6uKOzu8nMfPsBtl3I+OuqvGFaxqu
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 08:38:39.2529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94aeee22-24bf-4737-f762-08de573624fa
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7605
Cc: Tom Rini <trini@konsulko.com>, Marek Vasut <marek.vasut@mailbox.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-amarula@amarulasolutions.com
Subject: Re: [Uboot-stm32] [RESEND PATCH] board: stm32mp2: read boot index
 from backup register
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

CgpPbiAxLzE4LzI2IDExOjQ4LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiBGb2xsb3dpbmcgdGhl
IGNvbW1pdCA5NWI1YTdkZTMwZjYgKOKAnEZXVTogU1RNMzJNUDE6IEFkZCBzdXBwb3J0IHRvIHJl
YWQKPiBib290IGluZGV4IGZyb20gYmFja3VwIHJlZ2lzdGVy4oCdKSwgdGhpcyBwYXRjaCBlbmFi
bGVzIHJlYWRpbmcgdGhlIGJvb3QKPiBpbmRleCBmcm9tIGJhY2t1cCByZWdpc3RlcnMgb24gU1RN
MzJNUDIgcGxhdGZvcm1zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJp
by5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAKPiAtLS0KPiAKPiAgYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL2luY2x1ZGUvbWFjaC9zdG0zMi5oIHwgIDQgKysrKwo+ICBib2FyZC9zdC9z
dG0zMm1wMi9zdG0zMm1wMi5jICAgICAgICAgICAgICAgfCAyMSArKysrKysrKysrKysrKysrKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaCBiL2FyY2gvYXJtL21h
Y2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3RtMzIuaAo+IGluZGV4IDJiZjUwYzc1NWNiZC4uOTBm
MDZhMDUyZDNmIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21h
Y2gvc3RtMzIuaAo+ICsrKyBiL2FyY2gvYXJtL21hY2gtc3RtMzJtcC9pbmNsdWRlL21hY2gvc3Rt
MzIuaAo+IEBAIC0xODgsOCArMTg4LDEyIEBAIGVudW0gZm9yY2VkX2Jvb3RfbW9kZSB7Cj4gIC8q
IFRBTVAgcmVnaXN0ZXJzIHggPSAwIHRvIDEyNyA6IGhhcmRjb2RlZCBkZXNjcmlwdGlvbiwgd2Fp
dGluZyBOVk1FTSBub2RlIGluIERUICovCj4gICNkZWZpbmUgVEFNUF9CQUNLVVBfUkVHSVNURVIo
eCkJCShTVE0zMl9UQU1QX0JBU0UgKyAweDEwMCArIDQgKiAoeCkpCj4gIAo+ICsjZGVmaW5lIFRB
TVBfRldVX0JPT1RfSU5GT19SRUcJCVRBTVBfQkFDS1VQX1JFR0lTVEVSKDQ4KQo+ICAvKiBUQU1Q
IHJlZ2lzdGVycyB6b25lIDMgUklGIDEgKFJXKSBhdCA5NiovCj4gICNkZWZpbmUgVEFNUF9CT09U
X0NPTlRFWFQJCVRBTVBfQkFDS1VQX1JFR0lTVEVSKDk2KQo+ICsKPiArI2RlZmluZSBUQU1QX0ZX
VV9CT09UX0lEWF9NQVNLCQlHRU5NQVNLKDMsIDApCj4gKyNkZWZpbmUgVEFNUF9GV1VfQk9PVF9J
RFhfT0ZGU0VUCTAKPiAgI2VuZGlmIC8qIGRlZmluZWQoQ09ORklHX1NUTTMyTVAyM1gpIHx8IGRl
ZmluZWQoQ09ORklHX1NUTTMyTVAyNVgpICovCj4gIAo+ICAvKiBvZmZzZXQgdXNlZCBmb3IgQlNF
QyBkcml2ZXI6IG1pc2NfcmVhZCBhbmQgbWlzY193cml0ZSAqLwo+IGRpZmYgLS1naXQgYS9ib2Fy
ZC9zdC9zdG0zMm1wMi9zdG0zMm1wMi5jIGIvYm9hcmQvc3Qvc3RtMzJtcDIvc3RtMzJtcDIuYwo+
IGluZGV4IDdiYzdkMmE2MDhmZC4uNDNiYzU4MzM3OGU2IDEwMDY0NAo+IC0tLSBhL2JvYXJkL3N0
L3N0bTMybXAyL3N0bTMybXAyLmMKPiArKysgYi9ib2FyZC9zdC9zdG0zMm1wMi9zdG0zMm1wMi5j
Cj4gQEAgLTE4OCwzICsxODgsMjQgQEAgdm9pZCBib2FyZF9xdWllc2NlX2RldmljZXModm9pZCkK
PiAgewo+ICAJbGVkX2Jvb3Rfb2ZmKCk7Cj4gIH0KPiArCj4gKyNpZiBkZWZpbmVkKENPTkZJR19G
V1VfTVVMVElfQkFOS19VUERBVEUpCj4gKwo+ICsjaW5jbHVkZSA8Znd1Lmg+Cj4gKwo+ICsvKioK
PiArICogZnd1X3BsYXRfZ2V0X2Jvb3RpZHgoKSAtIEdldCB0aGUgdmFsdWUgb2YgdGhlIGJvb3Qg
aW5kZXgKPiArICogQGJvb3RfaWR4OiBCb290IGluZGV4IHZhbHVlCj4gKyAqCj4gKyAqIEdldCB0
aGUgdmFsdWUgb2YgdGhlIGJhbmsocGFydGl0aW9uKSBmcm9tIHdoaWNoIHRoZSBwbGF0Zm9ybQo+
ICsgKiBoYXMgYm9vdGVkLiBUaGlzIHZhbHVlIGlzIHBhc3NlZCB0byBVLUJvb3QgZnJvbSB0aGUg
ZWFybGllcgo+ICsgKiBzdGFnZSBib290bG9hZGVyIHdoaWNoIGxvYWRzIGFuZCBib290cyBhbGwg
dGhlIHJlbGV2YW50Cj4gKyAqIGZpcm13YXJlIGltYWdlcwo+ICsgKgo+ICsgKi8KPiArdm9pZCBm
d3VfcGxhdF9nZXRfYm9vdGlkeCh1aW50ICpib290X2lkeCkKPiArewo+ICsJKmJvb3RfaWR4ID0g
KHJlYWRsKFRBTVBfRldVX0JPT1RfSU5GT19SRUcpID4+Cj4gKwkJICAgIFRBTVBfRldVX0JPT1Rf
SURYX09GRlNFVCkgJiBUQU1QX0ZXVV9CT09UX0lEWF9NQVNLOwo+ICt9Cj4gKyNlbmRpZiAvKiBD
T05GSUdfRldVX01VTFRJX0JBTktfVVBEQVRFICovCgpIaSBEYXJpbwoKUmV2aWV3ZWQtYnk6IFBh
dHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgoKVGhhbmtzClBhdHJp
Y2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVib290
LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3Vib290LXN0bTMyCg==
