Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CC8B43323
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 09:00:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F37CC3F93A;
	Thu,  4 Sep 2025 07:00:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40A7BC3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 07:00:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5846kVxn020171;
 Thu, 4 Sep 2025 09:00:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 /HQHcq75KSDwjLQ6Wrue1E+QtSSlND3P2363NI5NcdI=; b=NYRTBVNdJbitWRVr
 GYdzyBS1fGWGurWDU1NENrTizdniCBhPp+3eFkK80wQUnji+HZfVVDxsw/jcSfpm
 98YDXBDP2Fpv/O1viMRWB5CBJqsL/uJ/fiatIEtIiX2aL1DNgKAFd4ATh7zjsDA4
 orP2sfbDZQZREnyVWdHOYvK0r6T/qiGVXir4soXAm0qJlWvWwvVhoLZDTv6wHOpl
 XV8aN/msl2ag0l9BSAUYNd+Gsh27eCu6rCdFNyiy8TBnGxpW6x6YCMNBC3Bw7Lm6
 LE7g5gvWWeXgo6ugv3ldcDVSe0ta+DeQ5XrIsROiXgUxidJTgzMR9W5wg0Bbsbxg
 p0sMuQ==
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7m0nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 09:00:05 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N69MyPIL2HpeYn3G24k1HBi/tlQNZ8Wcx9QTYE7hMGtV9DJR8VH26EYUR41b9m1JSK4NvCGCqCMkkHkg1jc36TImWXFJBaYn+oC/skHpx3rWYXIr2sVo4aJ6yi85UAcwwgF8Kg5PgQoPnUPM5xjXl2o427Uj9POopen9E8M9k534NRjTWio0eitEEhbp34CnHfumcXodzCPA2iIIxvQiCOk5enD9USh3fz3out+WyhYv72mgcK345S/kyuzV42r2WKIueK7LTom8xOjWDFLdCz+X5VQGKoj0NkO8+VFM+0hnaKQza7j44E01R7ji6mc/dqa6I9Py8QdTzB9Fic7oSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HQHcq75KSDwjLQ6Wrue1E+QtSSlND3P2363NI5NcdI=;
 b=gQ3ERImStR/m7ZReg6Rp8mqC8tizU7a8nswnwu/zcJ6jrMiLwBMWK6JqowIaPOjl7g/Y3z/z5cfwn+lFObL9ZHpHCBz0Ro9PkZjKTQZoTANyoibfDWMBDO6e/n7UOSmAUE5VCiB1IEi/Ca44Q3cxS+YSJDELJsmvbFWAke9uqoIIZOlTAoo0XkAX1fvr7//cYyXdzc37pClidUOW5+No+cqwPlAiJIzxe4RD6UWnIX+/5cOUf2E+0hK4JOkWHlGp9ELJ1LrbtMJ5dMqaTrCi1LcX/A/hgG1KEjMWLDdOOX+4ocqY0MR3FUSeogbjq6efVBx68FoQ3tcSSyaT3YZLng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HQHcq75KSDwjLQ6Wrue1E+QtSSlND3P2363NI5NcdI=;
 b=UaXvcS5ckbZhWFz/j7xQzUpHkE8L9C6PPJn5vNbDFBmptT01pCtQavx7DZG2yqWi3nYN/MwHzHnUeugX42BDe2hYxlcmJ2IjxvFPa8V8dQX+FGwApyi2bdGk49WY9p9izzGC7LwQP3HroPhB4zPYOoVRBxEwY1u2epPpPKCiLqc=
Received: from DU6P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::28)
 by DB4PR10MB7541.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 4 Sep
 2025 07:00:03 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::56) by DU6P191CA0017.outlook.office365.com
 (2603:10a6:10:540::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 07:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 07:00:02 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 08:52:48 +0200
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 09:00:01 +0200
Message-ID: <bd1f00f3-5221-4825-b793-5bf3682e4108@foss.st.com>
Date: Thu, 4 Sep 2025 08:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
 <20250903-master-v2-1-5cdf73bff42c@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250903-master-v2-1-5cdf73bff42c@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|DB4PR10MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c26793-42e4-4add-b9c6-08ddeb80abe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnFjcW1kWWY1K214ZWVDWFNTenQ0UGo0ZjA5bmRPR0UrVjQ5ckNsSG9hSWMw?=
 =?utf-8?B?TlpxQVhqK28vMGZxYWxqQmVlOVgvM3JaMFMydTlxWDZBZmNoSExpYXdpTjF6?=
 =?utf-8?B?YVd6K0NHYW9rZ0Z3RjRVQUMzZTZRcE96MUlxd3o1QXNlYTFpOEhHRGYxV2hG?=
 =?utf-8?B?dVROQTNBV2x6TGlybUpmb01mTkhKMzlNaXlNZnAxY1FqSWdqT2wvazg1NGNJ?=
 =?utf-8?B?OCtRaFBVWWJMQ0c0TTRnYzNYdkVhVjVsWHNDMzRBRHlJeTUrU2p6THpxTi9N?=
 =?utf-8?B?K0hVRUJVcGxZNXhSNFFENUh5eTdLU1dpZlJyWkx1WmEzcjg3NkhUNE1xQnJQ?=
 =?utf-8?B?VEZnUlBwOHZDODA0Y2V3MGZVZHBLZW82bmdPZG0xaE5qZ0ZtNktab1o3OU9t?=
 =?utf-8?B?NHdkL2tBUjAxdWtPTUdxVnBXTzhNRnJDeEQvR1o1U1ZmSGp3czUxVFVTZEk4?=
 =?utf-8?B?citRejhLNTFoOFRzRURxNmRNVjFXKytWVGZxYTFLazBQZEVneDNuYWVsQzZH?=
 =?utf-8?B?V3JMcDIxU2ovRzB1emtjTWF0bHBwSFJzSkNscVRNTXZINFJrVG1TVzZtSUZq?=
 =?utf-8?B?YTI3eUVWeXFsbG4za28rUnFCb0llLytFTUZSS3FsNDAvVDB3R0hqUWFpTmNE?=
 =?utf-8?B?M3JtZHRuM3BqQW9NN25haDcvaDArWFN1ZzREZ0NEL1lHTlNrQ3I5N1FTM04v?=
 =?utf-8?B?RkJ4SUF1bVRmalVyRlp5cFlTb2ZqaTFqQTdjTjVNQXU4blZTOUwrTnJleE9n?=
 =?utf-8?B?aExQNzc1WWl3TWpKNnRHOWdoR2RZM1gwZ0VyMURtcVRkVGFCZVRrTWNLcmpJ?=
 =?utf-8?B?c1BYYmF5OThKNEtMOHVHUlJTNVhDV244MUZJOFRGNThuV1IxekduZUZsWFhy?=
 =?utf-8?B?V0JUMGduKzlrQ0hlSkY2VU9xS3hZbWhwemhYMVpoQ25hQnBPcUtUbHBaS21R?=
 =?utf-8?B?OGVMQ0g0bTRNK05tSXRoMHB1eHV4ZFJjQ0JmcG9WeHhuVmlCVEU5dzFxb291?=
 =?utf-8?B?eUxWbjRtcTNJRHBhNjZKSC9oKy9uY0NJL1pLb0NvbVpnRFpwV2tCdHBidkdo?=
 =?utf-8?B?elZmaEV1bUpySi8rRUNzREdPUzIwRElaeXB6eVVWeEtOMGRwZUhoL2tYNE1h?=
 =?utf-8?B?STcveVJZMjhBV0cyY2xreFdGT3ZYelF1R2U5ajlPUEJZeW1CTnIreTBiV2Jj?=
 =?utf-8?B?L3czOTY3b3lDVVR4dmV1cE8zSXZOaWJmQjZRVFJma0dIZ0JFeUNUZGhSL3lB?=
 =?utf-8?B?N3Jra0FDYUU2UHBzQ0crOFIvUS9uT1RjRmNKSUNyMVVuL2k5QnFQWm94NFNm?=
 =?utf-8?B?NzZ2RmFwRVBSOWxNTTVJR3RDcGdqNUh5V2RxcHRpSy8vTUp5M0Vid2xJcjFi?=
 =?utf-8?B?Q09CYlRHcFVmQytTYk5kZFlSaVZxSW84TXlKK0M0T0lyREI3MkNUZmpTVWRj?=
 =?utf-8?B?OWdEQzhzdzlvTlJ6MVNDdzFqMERIWmdMTWNaMXBMektwb2g5N3cvNWtRMTFh?=
 =?utf-8?B?YUlnUmN4cUZkVFJvMDFYNkxuTW1VM3diUEhyMFkvQzkzWk94dnkzZkJDUlVl?=
 =?utf-8?B?dnBmYmh4YkNHV3lNRUU2ZkVvZFZiM0FzcEdjRmpxdVFUTFQ3OW1XS1hDem8r?=
 =?utf-8?B?UE9STVNaU2dVWG1vRkppbEwyQkZ4dTJoZFZnTmpMN1JmMXpDOXJ0cy9yTm55?=
 =?utf-8?B?M0NwTm1NUGpKdGpQSDdlZG5naXIxQzZRd3lNNzRLSmRuODQ1TmV1NVM2UEpC?=
 =?utf-8?B?T1FCbTJXVmc0QnNhcjg4YkxFcjRnWW9vc1FkRElnbSttb2w2QjhCd0NCcWJl?=
 =?utf-8?B?RzhSME0rbmdxdnAzNksySk4xSTV4R1dOblZ1Sy9jRzQrRExZdkQzamV4a0E2?=
 =?utf-8?B?NTA0UHZ2T1Z6VDcvcXBVejd3RVVZNENtS3JhbDJuV2RGSlVuMkFqTzJPT3Iy?=
 =?utf-8?B?bTNRRHA5SXRmMUZuMEMveWI4cmswcTROb1hQQ3N6ZjhET2FqRWYydEZ5ZkNx?=
 =?utf-8?B?RDZoWW9wK00wY2kvcG5Tb2hyeXd3VzVwbnl3cXBkOUQxMEtMTzJyUDA3RGhZ?=
 =?utf-8?B?MXlLNFFwQnQ0NnBJSFl5cUNMNUYwR3k3RWhXUT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:00:02.7241 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c26793-42e4-4add-b9c6-08ddeb80abe1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7541
X-Proofpoint-GUID: zChTg-Sy_-Y9J0Ni1P9R3dt6u4R_TkZ0
X-Proofpoint-ORIG-GUID: zChTg-Sy_-Y9J0Ni1P9R3dt6u4R_TkZ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDIyMCBTYWx0ZWRfXx2HZMOWX8zRT
 4ysuiOln7PbYTwyk/PoEmszGfDGglgz3+DyBCWMWKu2SM3ylroiOmqF7oEFlcdrb0sHSN1IJaVc
 3G/k8f1CtLQRCC6uADJzYyx33TD3X9pYWlLXrA25CmRNNRUOARvKIAmLKqGj3tL84TuB0I/Obql
 Y6nBKyPv6W4SoSBJqHb4S52TffGknT4FXSCWYucGa75v1oRRezYD7iOQDAPbbIxxvQrWR39h1Ok
 1AAGplZ22fe9BfyuQoIdo+EZer21Bc/DLQmwQ8vlYlZZUc5gRUq3fC/0YKC3CySudTvAXH5OAaX
 HRJR9QQo91Y4n7pTIRIAJKLNgqo+iwuddTdem1Z9BsED7LOTXVmKTR59I6/ZurO6yZpebKAd/dR
 kcT2J3ao
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68b938f5 cx=c_pps
 a=AeQ0znSE+p+lBnVhk+Jsqw==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=P2A4Zi-lJHsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=5-UEqyCUgD__VgFuBE0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1011
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508290220
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 1/7] ofnode: support panel-timings in
 ofnode_decode_display_timing
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
UmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+IFRoZSAiRGlzcGxheSBUaW1pbmdzIiBp
biBwYW5lbC1jb21tb24ueWFtbCBjYW4gYmUgcHJvdmlkZWQgYnkgMiBwcm9wZXJ0aWVzCj4gLSBw
YW5lbC10aW1pbmc6IHdoZW4gZGlzcGxheSBwYW5lbHMgYXJlIHJlc3RyaWN0ZWQgdG8gYSBzaW5n
bGUgcmVzb2x1dGlvbgo+ICAgICAgICAgICAgICAgICAgdGhlICJwYW5lbC10aW1pbmciIG5vZGUg
ZXhwcmVzc2VzIHRoZSByZXF1aXJlZCB0aW1pbmdzLgo+IC0gZGlzcGxheS10aW1pbmdzOiBzZXZl
cmFsIHJlc29sdXRpb25zIHdpdGggZGlmZmVyZW50IHRpbWluZ3MgYXJlIHN1cHBvcnRlZAo+ICAg
ICAgICAgICAgICAgICAgICAgd2l0aCBzZXZlcmFsIHRpbWluZyBzdWJub2RlIG9mICJkaXNwbGF5
LXRpbWluZ3MiIG5vZGUKPgo+IFRoaXMgcGF0Y2ggdXBkYXRlIHRoZSBwYXJzaW5nIGZ1bmN0aW9u
IHRvIGhhbmRsZSB0aGlzIDIgcG9zc2liaWxpdHkKPiB3aGVuIGluZGV4ID0gMC4KPgo+IFJldmll
d2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZv
c3Muc3QuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9jb3JlL29mbm9kZS5jIHwgMTcgKysrKysrKysr
Ky0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY29yZS9vZm5vZGUuYyBiL2RyaXZlcnMvY29y
ZS9vZm5vZGUuYwo+IGluZGV4IGUwNDBlM2YyODA2ZmZlNzRjNThkY2Q4MmYzNjMwNzM1MWFjZDVh
OTkuLjVhNzIxYjQ2ZTVhMzIxNGU3YmQ0Mzc3Mzk3NzYzNjJjMmQyMmEzYzkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9jb3JlL29mbm9kZS5jCj4gKysrIGIvZHJpdmVycy9jb3JlL29mbm9kZS5jCj4g
QEAgLTEyMjEsMTMgKzEyMjEsMTYgQEAgaW50IG9mbm9kZV9kZWNvZGVfZGlzcGxheV90aW1pbmco
b2Zub2RlIHBhcmVudCwgaW50IGluZGV4LAo+ICAgCWludCByZXQgPSAwOwo+ICAgCj4gICAJdGlt
aW5ncyA9IG9mbm9kZV9maW5kX3N1Ym5vZGUocGFyZW50LCAiZGlzcGxheS10aW1pbmdzIik7Cj4g
LQlpZiAoIW9mbm9kZV92YWxpZCh0aW1pbmdzKSkKPiAtCQlyZXR1cm4gLUVJTlZBTDsKPiAtCj4g
LQlpID0gMDsKPiAtCW9mbm9kZV9mb3JfZWFjaF9zdWJub2RlKG5vZGUsIHRpbWluZ3MpIHsKPiAt
CQlpZiAoaSsrID09IGluZGV4KQo+IC0JCQlicmVhazsKPiArCWlmIChvZm5vZGVfdmFsaWQodGlt
aW5ncykpIHsKPiArCQlpID0gMDsKPiArCQlvZm5vZGVfZm9yX2VhY2hfc3Vibm9kZShub2RlLCB0
aW1pbmdzKSB7Cj4gKwkJCWlmIChpKysgPT0gaW5kZXgpCj4gKwkJCQlicmVhazsKPiArCQl9Cj4g
Kwl9IGVsc2Ugewo+ICsJCWlmIChpbmRleCAhPSAwKQo+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPiAr
CQlub2RlID0gb2Zub2RlX2ZpbmRfc3Vibm9kZShwYXJlbnQsICJwYW5lbC10aW1pbmciKTsKPiAg
IAl9Cj4gICAKPiAgIAlpZiAoIW9mbm9kZV92YWxpZChub2RlKSkKPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1zdG0zMiBtYWlsaW5nIGxpc3QK
VWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91Ym9vdC1zdG0zMgo=
