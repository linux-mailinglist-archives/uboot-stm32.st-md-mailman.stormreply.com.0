Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16336B43345
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 09:03:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9697C3F93A;
	Thu,  4 Sep 2025 07:03:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A12EC3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 07:03:56 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58450GKn007335;
 Thu, 4 Sep 2025 09:03:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 NuNRXJzXaQGKA9v9ZKbY+8CDH/c/v7eqs0P6KQfgByo=; b=SJoCnSJl6KZL5SUE
 7dFzxBGDW61nsv78uA1X2H0TIhNsl/Hfi60JbkyYL7aD8VX0s95cESsbHNePfizZ
 ViSmFpyuiULh0+lNRAlB+QswZ+0owfUhXhsGntdIlnxthZL3vxo60jDQLNS3bUQE
 hkt/v8zdzYCqsHen2OD0pvkjIpDLF3QdSRdhmZ8jlidlt9vXcNrTuH2VX/VmiR5l
 OCqFskPQRoFAT6z/+rhvGnwGc4QS+ot7Fp8x3AE+b4rIL+80iwxmpmu0BGyWFpY+
 uU3qz+FaPpsmXuWyV35OKF7lAht3QGU4G0MTq5m2ylHyPppTrjDyeDFp+qPGwdYE
 EOU/Kw==
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013064.outbound.protection.outlook.com
 [52.101.83.64])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upqkn12k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 09:03:46 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpkTgf5H1lhb5HOgjBVzGpWzLBOjGNyD8VREO0T9dpY9zLsRTcZJBDTLHo2euyCGZg9FTmSrVjKyb9DscqRhpiDiinoHNx9xDBHBPBnR6ozw/8gYKqeDXi3d0b/VI86vQNr2X9JYrfr1rYGHRTs8jvtAjcwJv6lJGrxfgHqRca162oubm9kobhsOWIP++U6BZW+j/HCXOI2xBXJAXcZwgClnVScmBiDgMuUypPCLqA00Bcv4Y1M30cfV1JJ8fGWB3S0CgMeeRewnknF+BkIFlPCwRdESzNBYz1jk1pWZK8ePxjmhtQcWimzPC9T+wHq614vE9shXpmi//nZA1zqp3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuNRXJzXaQGKA9v9ZKbY+8CDH/c/v7eqs0P6KQfgByo=;
 b=nI23HaEwZqsD5hR7DE6u059hngts35Cl58BMxYrz/UaKyRcxTX+1+Izc1mVSbb1+WYprQ6V3EEaryLmEVpS3vh29tREj4TzopJP5EscplJdFxwe4rKnIn8isOxO2SHH42Kk2TZLl7q6tOjvjnqH+4U6+oCsRepwRlf7BzbrLxIQ79QBvVW7zdudATDGaau1RTJ1MtbHyBGQD59TbS0ZQSX/YpHrpG4tiFJN5uS3pQWGv7Z+IFEaniIKCi2UJxmUqCOCjx9txhGC4jv2aKT5eIwGplZMEprVcDszFvkzjk/z1FsDRkkJRbxjf9MH7dmtHLHat80KwJDIBAJoPURIGXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuNRXJzXaQGKA9v9ZKbY+8CDH/c/v7eqs0P6KQfgByo=;
 b=mkUybdqOJGv9B8t1eyxni5D4+NlpjbPvb0iUQVijgwyJWwxYnkesO/B/z3Nae42ZfUZ77Og4n5GeyE9jmCVYAD0oLrXMD11aU3gdRPCXCHT+SxsF4gPIfWlXPyf8Quj8hv5U1LC2C6cIWPeEWb0LhEmwg/EZIEnqUBzUDhd89Mw=
Received: from CWLP123CA0048.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:58::36)
 by AS8PR10MB7328.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:614::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 07:03:44 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:401:58:cafe::bf) by CWLP123CA0048.outlook.office365.com
 (2603:10a6:401:58::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 07:03:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 07:03:43 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 08:56:27 +0200
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 09:03:40 +0200
Message-ID: <8cb33c73-46a9-4464-ba3a-7013db3b4add@foss.st.com>
Date: Thu, 4 Sep 2025 09:03:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
 <20250903-master-v2-4-5cdf73bff42c@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250903-master-v2-4-5cdf73bff42c@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A792:EE_|AS8PR10MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 7236dcbb-9a96-4553-b90b-08ddeb812fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1Bycm9VY2FFazRsZUFub0hNMWxzQ1hkUzlJRnF4SjhiMFNFNVZnY2VvTmdq?=
 =?utf-8?B?dnJPOUE1NStsZWg5VlNPTFc4SjVYYVJhczZwSm5nWmNVbEY0OTVJMzlyU2p2?=
 =?utf-8?B?eGdoVjRzTi9EeWNrQVlIbzd5L21DcC9XY05seG00YVI4OXF6N0FwSEh1Q3hh?=
 =?utf-8?B?d0xObDNva0RHZ2dEblVMMHI1QXQ4V29kOEJIdkpvTldWa3JWa2dRdVo4cksy?=
 =?utf-8?B?TFR0UEZzdWpZMmFXdk42ZkszQTFtckNmNXhxbUtlSTdYSG1KNk1EYTlKRlJL?=
 =?utf-8?B?WEZ4ZExHa1FqYVY5b2FxMFdkNWs2RXZKY1dKVHBnVjFrVnc1NHQyTjZuUnk2?=
 =?utf-8?B?Yko5amg4ZEdzK3R3S1BlNzcvZzk4U3RXS2xsWThQazZYQlY3aWwvelVNb0k0?=
 =?utf-8?B?TmNRZFpxcTdsa2RRdm9TMU1CVFZwUktQTUVZRzdXb0w1ZmtaL0pReGo1bUNs?=
 =?utf-8?B?ZC95bDA1TXBxSTRpNkQ5eGM4VUpuTmUvUXJpSnNiV05PVWVJS2dQQW12UlR6?=
 =?utf-8?B?L1hkWEpRU3ZOaXhLSEVKSzRxQmJvSkVEa1loN0lUWVg5VXpjZnZpOXlmV0lP?=
 =?utf-8?B?NHh0QTFqWk1BR1hPV0tRY1g0NndDbHc1anA5RnAxNHkrcUR0SXNMR3dLNk5z?=
 =?utf-8?B?U1dyeCtTcGRwTEdzVVVqU3AydEllSUVXSjRKNUYxSWNMcWhYYnJSY1V1TVZT?=
 =?utf-8?B?Tm01cFpSdkZTSFFKcXJEcDU5Smp0Sm9hRmpsVkVTN1R5MmwrRHZ5cWlVcVk0?=
 =?utf-8?B?UDVXdVBWVTV5QjNnZ1ZDTVhUZ0VrbklLMXQ3U2duRDRndnZNdHpNNUZTaE1X?=
 =?utf-8?B?Y2FlTEF2UXdieUwzUUwxSDZYajJBTXBDK0M5OHVhdkYxOWtXN1JvZElOUEhu?=
 =?utf-8?B?eTc4UVpxWlhoRjFaTzlTcWROZUpkTXpVd1RNejMrbXd4Y0pYNU5lajVIbEI0?=
 =?utf-8?B?Z2ptZTd1OGpvRGR0Ry9UcFJHOHNDQlJKYnI4TUFxd1ViWG1LZXFlSXFmc21E?=
 =?utf-8?B?L1Vrd3dUbXdiSUZCS3lpQ05YcEpPaE1OYi83ZTJuR3NPTWhiR1VUc215OFQr?=
 =?utf-8?B?N1VIRllJVTlON3lxaWxXL2c5cjdieVNEaENKRHlXSWN5ZkpjRzdLSm1CbDJP?=
 =?utf-8?B?RmxzRjRadU1oMWR0cktWOTZSV0lySFhZOWZLRm9TbDZjQmpPd1E2QkFmc3p4?=
 =?utf-8?B?Z3dLMzZaN25vbTRSNFpEYmNYV0ZhTDJYTnJLamc2cDZPSGJTbEZTZzRZZU1s?=
 =?utf-8?B?aE5NWGZzd2lPeWQ2QmVuZ20rdzFGQnA4YWVOekl1RDhFdTNJc3lsTlBlUE9w?=
 =?utf-8?B?SHpYOWF2SVllcWhwWEJHZHlaanZrenJ1VDNNejRwUmxOWUFoYUt6SnhjRjRN?=
 =?utf-8?B?Qzc5VWk2UFRDSVJrM1BQYzgzRFlYVW5vTjdGbkI2bDVNc3lYVlpacFF6RHNX?=
 =?utf-8?B?NVBDUnhVZ3dtaDVKQ0NCbVcwYzdIL3kwdDhsd2g5R2hhS0tZaUxmM1ROWG1O?=
 =?utf-8?B?NzJLRmI0bGtyaitVQVdWa0xNS0dvcDhHZGVTMXQ1QVR2ZkZ2RzM0QTJheHBw?=
 =?utf-8?B?YnhKZTV6ZWlvNXcwRXFvVUtGbXI4RC9ocHFoQklxKzdBUWJvc1NITmp6K2hO?=
 =?utf-8?B?S1RWcStqQ2NTTkFSOWYxWjJjd1pJS2xLbUc4VW45OFRwT0F5cXQ4aGl5dUxH?=
 =?utf-8?B?NE45UEMxS0xkMERRbEdNTWdaRzFOcWFhbkpJRndZWUFwekdMVyt4K3VqK0pw?=
 =?utf-8?B?US9CZTNYWGtCaHBnWVNtd3JKTTdpRGpYQzFac3JSWUxxZmpZdU5TZXVhMi9i?=
 =?utf-8?B?RkpSejFvSkg0eVpESDE3NGk0NjdveWhqa29keXJTTk0zM2Y1bGg4bWRyUHRN?=
 =?utf-8?B?c3dFOStwSm5RMFN5LzlwbURWVkpPdVc4aHpaQ1BYRVZxMmRlWkpjMUh0NU5E?=
 =?utf-8?B?YlM4UFp1dENEY2VCWGwwRm9PMkN5aHNTZy9LeGxSRVNRRzBYVkpmb1ZKR1pp?=
 =?utf-8?B?L0NCbXkrVjdaMFZOQ2RtcHhhL0NORXVWbDhnMjFaR3FmWEtWa0ZiYnorVlRh?=
 =?utf-8?B?ZVZNS1JoWFQyQUtHMVM4V2lhMDFGUURRb202Zz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:03:43.9220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7236dcbb-9a96-4553-b90b-08ddeb812fb3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7328
X-Authority-Analysis: v=2.4 cv=XYCJzJ55 c=1 sm=1 tr=0 ts=68b939d2 cx=c_pps
 a=RSP5wjQe9cmB1/5ZhXI0tA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=P2A4Zi-lJHsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=kxCilVioRAr92PqvDDsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: AuuxBS206KPEWJUGh15LS5Rr7g0w53It
X-Proofpoint-GUID: AuuxBS206KPEWJUGh15LS5Rr7g0w53It
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMiBTYWx0ZWRfXxmJFzSVPgfZG
 7nSlMRCiFk7ReuRw30o6z1oDR43lRVC7FqcR09QtJxH54lMxBImjeMN271BNFh88gr8YIqHiHYT
 PNw36EZexo3xvHD3l/9h7r+tCMquNAQFHAjSBTjzUtEaHzwYR0+hTD+CPpCxi7GkIYw79gHrNT9
 QvXQ5ex1gryroavTW3q/f5SCs6mi0dwBu7YEjCAh8GB4KKPw1qgPNhEArTk2o/V6CNY2VJi0Sgl
 iXglwjvvm0c7KrUZT0OnmiC6xP5KFzvmk5hX1Q5rybdCCdnM4O0cyUrmxGBeDSJRB1raKIYgyj1
 IQmVV5uV4DDPW5sPsoW2fyK+bjo+HLLtFfmSQlnmvC+Qz3sNsdGLXbA/yQSqWl0BEjb3P6RFuJN
 p2+4lXXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 impostorscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300002
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 4/7] video: stm32: ltdc: support new
 hardware version for STM32MP25 SoC
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKTGUgMDMvMDkvMjAyNSDDoCAxNDoyNSwg
UmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+IFNUTTMyTVAyIFNvQ3MgZmVhdHVyZSBh
IG5ldyB2ZXJzaW9uIG9mIHRoZSBMVERDIElQLiAgVGhpcyBuZXcgdmVyc2lvbgo+IGZlYXR1cmVz
IGEgYnVzIGNsb2NrLCBhcyB3ZWxsIGFzIGEgMTUwTUh6IHBhZCBmcmVxdWVuY3kuICBBZGQgaXRz
Cj4gY29tcGF0aWJsZSB0byB0aGUgbGlzdCBvZiBkZXZpY2UgdG8gcHJvYmUgYW5kIGhhbmRsZSBx
dWlya3MuICBUaGUgbmV3Cj4gaGFyZHdhcmUgdmVyc2lvbiBmZWF0dXJlcyBhIGJ1cyBjbG9jay4K
Pgo+IFJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxh
aXMtcG91QGZvc3Muc3QuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92aWRlby9zdG0zMi9zdG0zMl9s
dGRjLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zp
ZGVvL3N0bTMyL3N0bTMyX2x0ZGMuYyBiL2RyaXZlcnMvdmlkZW8vc3RtMzIvc3RtMzJfbHRkYy5j
Cj4gaW5kZXggMGEwNjJjODkzOWRiZTQ5YjExYWE1MGY1Y2E5NzAxYmRiZTVjNWIwYi4uZWZlOWEw
MDk5NmVjYTAzMDFkMmEyYjgyMDc0YmE5NjkwYTk2N2E3MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL3N0bTMyL3N0bTMyX2x0ZGMuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vc3RtMzIvc3Rt
MzJfbHRkYy5jCj4gQEAgLTI2Miw2ICsyNjIsNyBAQCBzdGF0aWMgY29uc3QgdTMyIGxheWVyX3Jl
Z3NfYTJbXSA9IHsKPiAgICNkZWZpbmUgSFdWRVJfMTAzMDAgMHgwMTAzMDAKPiAgICNkZWZpbmUg
SFdWRVJfMjAxMDEgMHgwMjAxMDEKPiAgICNkZWZpbmUgSFdWRVJfNDAxMDAgMHgwNDAxMDAKPiAr
I2RlZmluZSBIV1ZFUl80MDEwMSAweDA0MDEwMQo+ICAgCj4gICBlbnVtIHN0bTMyX2x0ZGNfcGl4
X2ZtdCB7Cj4gICAJUEZfQVJHQjg4ODggPSAwLAkvKiBBUkdCIFszMiBiaXRzXSAqLwo+IEBAIC01
MjksNyArNTMwLDcgQEAgc3RhdGljIGludCBzdG0zMl9sdGRjX3Byb2JlKHN0cnVjdCB1ZGV2aWNl
ICpkZXYpCj4gICAJc3RydWN0IHVkZXZpY2UgKmJyaWRnZSA9IE5VTEw7Cj4gICAJc3RydWN0IHVk
ZXZpY2UgKnBhbmVsID0gTlVMTDsKPiAgIAlzdHJ1Y3QgZGlzcGxheV90aW1pbmcgdGltaW5nczsK
PiAtCXN0cnVjdCBjbGsgcGNsazsKPiArCXN0cnVjdCBjbGsgcGNsaywgYmNsazsKPiAgIAlzdHJ1
Y3QgcmVzZXRfY3RsIHJzdDsKPiAgIAl1bG9uZyByYXRlOwo+ICAgCWludCByZXQ7Cj4gQEAgLTU0
MCw3ICs1NDEsMjEgQEAgc3RhdGljIGludCBzdG0zMl9sdGRjX3Byb2JlKHN0cnVjdCB1ZGV2aWNl
ICpkZXYpCj4gICAJCXJldHVybiAtRUlOVkFMOwo+ICAgCX0KPiAgIAo+IC0JcmV0ID0gY2xrX2dl
dF9ieV9pbmRleChkZXYsIDAsICZwY2xrKTsKPiArCXJldCA9IGNsa19nZXRfYnlfbmFtZShkZXYs
ICJidXMiLCAmYmNsayk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJaWYgKHJldCAhPSAtRU5PREFUQSkg
ewo+ICsJCQlkZXZfZXJyKGRldiwgImJ1cyBjbG9jayBnZXQgZXJyb3IgJWRcbiIsIHJldCk7Cj4g
KwkJCXJldHVybiByZXQ7Cj4gKwkJfQo+ICsJfSBlbHNlIHsKPiArCQlyZXQgPSBjbGtfZW5hYmxl
KCZiY2xrKTsKPiArCQlpZiAocmV0KSB7Cj4gKwkJCWRldl9lcnIoZGV2LCAiYnVzIGNsb2NrIGVu
YWJsZSBlcnJvciAlZFxuIiwgcmV0KTsKPiArCQkJcmV0dXJuIHJldDsKPiArCQl9Cj4gKwl9Cj4g
Kwo+ICsJcmV0ID0gY2xrX2dldF9ieV9uYW1lKGRldiwgImxjZCIsICZwY2xrKTsKPiAgIAlpZiAo
cmV0KSB7Cj4gICAJCWRldl9lcnIoZGV2LCAicGVyaXBoZXJhbCBjbG9jayBnZXQgZXJyb3IgJWRc
biIsIHJldCk7Cj4gICAJCXJldHVybiByZXQ7Cj4gQEAgLTU2Niw2ICs1ODEsNyBAQCBzdGF0aWMg
aW50IHN0bTMyX2x0ZGNfcHJvYmUoc3RydWN0IHVkZXZpY2UgKmRldikKPiAgIAkJcHJpdi0+cGl4
X2ZtdF9odyA9IHBpeF9mbXRfYTE7Cj4gICAJCWJyZWFrOwo+ICAgCWNhc2UgSFdWRVJfNDAxMDA6
Cj4gKwljYXNlIEhXVkVSXzQwMTAxOgo+ICAgCQlwcml2LT5sYXllcl9yZWdzID0gbGF5ZXJfcmVn
c19hMjsKPiAgIAkJcHJpdi0+cGl4X2ZtdF9odyA9IHBpeF9mbXRfYTI7Cj4gICAJCWJyZWFrOwo+
IEBAIC02ODgsNiArNzA0LDggQEAgc3RhdGljIGludCBzdG0zMl9sdGRjX2JpbmQoc3RydWN0IHVk
ZXZpY2UgKmRldikKPiAgIAo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCB1ZGV2aWNlX2lkIHN0bTMy
X2x0ZGNfaWRzW10gPSB7Cj4gICAJeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1sdGRjIiB9LAo+
ICsJeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMjUxLWx0ZGMiIH0sCj4gKwl7IC5jb21wYXRp
YmxlID0gInN0LHN0bTMybXAyNTUtbHRkYyIgfSwKPiAgIAl7IH0KPiAgIH07Cj4gICAKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBt
YWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1z
dG0zMgo=
