Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2543B51BF8
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Sep 2025 17:40:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49017C35E2B;
	Wed, 10 Sep 2025 15:40:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AF17C36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 15:40:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AFQcj1026675;
 Wed, 10 Sep 2025 17:39:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Se/7VkST4UcwIaLt12m/Bf2SaNK2MT++9qEClOMgcIM=; b=3/Usd8Dyr5n7+8Rf
 grPtpL0W+TREkA62iYzs1AVjDi8vsjyhiES0itr0GPYYn6zdDc2RZqO9LQBfCZKT
 RCfmUqv3ZOD7KLheYt1fbak6klfJbBGEevijWzOEDBXfg/Fc3Yx8+AJE6IUCla1K
 lpfzPgW7sOyYHz0+bXLGcSmlDJlySrcm8L0rmId0ra54w9cMK1KpaqUEi5UfkHQ+
 9U5tFmT2yAHc7HWb7DvzwbbVqT7mmUkUA0xoQQeqpvUYP5uS+3UNxBVdPjj7sphI
 mfJYgeLeGg9CKWNvLNCkyEvfZNdlGMTwC39rqpyaSccagHR2le94OB9qHYZI/N4M
 0NFxRQ==
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013002.outbound.protection.outlook.com
 [52.101.83.2])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4934xjj3nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Sep 2025 17:39:51 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4N7DXn6uRaGcsI3qufVmwlquh+BNv2iVRUr7g2lORcq/cKVyXwnM9KPTqP78u4d4FEBDLHS4918QrlCRP+lBC3BK+jGSo0rUHYixPs8/zMyHYP/KmIVw1OHhNmSNmTf/a0ij41zZurmGTtoZpt+Rj1u/pJK5BY7yHrngr5Ng3zXYH/50EtdnI68ROF6V5P8xTzDLCST7Oue9GjzGgZhGhJcZ+kkTlGL/0oLye7DcdlSVMj8JglS7RVU+Lgfya6haqsjmRfi9F1EwIzwbCtRhVQsn5nyrtujOTkUxpWFRIjuRDgq9YpfMU0w9Tfv7zD6sqBUJPMEncakn5YYBSZipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Se/7VkST4UcwIaLt12m/Bf2SaNK2MT++9qEClOMgcIM=;
 b=EoO9BTTPMiuRYuqdnqtoLN4G/sFkuRoJngUva1w+Dl/KtgPNgxAs2XgdD35pUVT6AF9c2gFe/3QCF7EPEGHLZUEBB39O5yWf8BsnU5+5sBmj0fpBtWDg1PmCUWiczHIsJ9zuWtSCoAZzS0LbfnfID05WY1+G7OQP8kf2HWoPn/LA0OQPAi0z84XqeiKQ5vNZd1/8VIcJotop/94cbRoRofNfkS9WNbXL9yOr5C6bAHm4he0ny5tCNToJ1JVjavcZJ0lcd9pcFN0pGR+idpgOu26qASSwJTlxA8zyiVYi1udvggA12HXyP5ekECP2pFm0OVJpIuZDC4GWR2QGGmTT3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Se/7VkST4UcwIaLt12m/Bf2SaNK2MT++9qEClOMgcIM=;
 b=mlXowrQDYDwZZlZy1CqshfJOKBmOLa158aOw2GtZHuIw/1BFBEjHNVhBxxHnq04vGD6Vgkqo3KMUz177Iu1zvpfRqpc1tNxQDwoxhGzPqYBpaSKUrdEU7jpcYSfsifEUkWQBTQ78zbVhpJB6t7f9C2FcMiR42oIHLhIa7wgxnoI=
Received: from AM0PR03CA0050.eurprd03.prod.outlook.com (2603:10a6:208::27) by
 PAVPR10MB7538.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:39:48 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:208:0:cafe::44) by AM0PR03CA0050.outlook.office365.com
 (2603:10a6:208::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 15:39:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 15:39:48 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:37:27 +0200
Received: from [10.48.87.108] (10.48.87.108) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:39:47 +0200
Message-ID: <733dd41f-f740-4f42-ae26-be2685de4c20@foss.st.com>
Date: Wed, 10 Sep 2025 17:39:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250808151154.472860-1-patrice.chotard@foss.st.com>
 <20250808151154.472860-5-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250808151154.472860-5-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AF:EE_|PAVPR10MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 0877d83c-f1ff-4ae6-7563-08ddf080468f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enJGWlYyZXRZbzRKUlgyK1RtTXZTby9IVjVMUDdkYmxUWlBrSDBrczhtQm1q?=
 =?utf-8?B?b2dITEtVZFRDZW1POE44akI4aU1nSHBmbmJJTEU3aURPYWlheVRWcFYrTkFa?=
 =?utf-8?B?MGhaSHFwWmhrRWdnZC84bSszU1UvUi80M2RNTWlHTGxPdWZad2VpUnZZYnl1?=
 =?utf-8?B?Q2tHMjMzN1I4cHR5UnZxTkQvSERNTENFUllpT3lBcXF4YlN3S25FaGs3UnBn?=
 =?utf-8?B?cEdSTkFvV1BISjY5Rm1KTXkyUGpFSklYbmxjenh5dFlGVGxOTi83Rm9aOTIz?=
 =?utf-8?B?bnB4Q090UlJwWjlpZzF0ZThFMHFNNjQ0djdDMkdpQXZacjhGTW5oQjNEVFFB?=
 =?utf-8?B?dEZBeUxJV2NlTm1MUEJPdXp2N2krNyt6WWdYajJMNTdhOG1sU21YaG5yLzJJ?=
 =?utf-8?B?ZGZsS3FLbzQwK1d0T1dmemViTll5bDh0d2J2dFVvSFFqWEJIajcrQlluTm9Y?=
 =?utf-8?B?N0JNV2VQQks4UzdUcno3bGgxVnNZSEFZcXFkQmdZZ1lIeXphdkxZR21yVVNM?=
 =?utf-8?B?dDZvaldmREI0S3lFd05DWVpjR3dSSVZ5V051aHY2SDFUS1o0LzNxYjUyOEtI?=
 =?utf-8?B?d1NWVUVCZEJzS1E4MFk4UHNXZ1g0NnFtRXJRbVdFOVRzaC9PWlU5dnJJOWRW?=
 =?utf-8?B?b3Jmd0hYWjkxeHlLTzQrSWZmbERqcXRBZER1ZTE5UW1vZDFHL0xBS0FERm96?=
 =?utf-8?B?M3QxaDhLWVBZalFpa01RaU5nTzcvelEwNno4QXlnRm8rdHY2b2ZUTG5vM0RU?=
 =?utf-8?B?UC92WTBXaG9ucFNnSXRiSnFZdmM1aFRUVWpYTFkySUlJZkhkSDVaUkdGSUdr?=
 =?utf-8?B?ZzJaNVpZLzM3UUwxTmVwalB1cnJydnFDeGo5bU9vUUpWSXFuSmZsb3I0U3Y5?=
 =?utf-8?B?MlhiN2RPNWpvWDhLMnFtdExsWDlRMVZSdm8zcHNkV0RlNStmUVJ2dFVNVFli?=
 =?utf-8?B?SXJYZElaLys1WkhpWGJOYzBsYlpLdnU0NUhObGZnWWprV0txY1Q1YjAzVjVB?=
 =?utf-8?B?aFBGeERRV0x0ZFh6cjdkaVdlbXhaRlE3R0ozL0xoeG1RQU5ValV2VktsOTJC?=
 =?utf-8?B?dURsTFd6Y2x6NGpWMktqZDhxSVI0dkNWVDROLzJteEhUM1NVY2hFeU9JRVRZ?=
 =?utf-8?B?YjE3QllXbjVzcEhzVFdmNWs1L3FaZjdWNVMrS0wxK1dQR0lDbVZ1c3ljb0Zz?=
 =?utf-8?B?SGJBZ3lrdmdqTkJpZHVlVGFKK09PaGlXV0Y0VzNMck1QVXdrU0Y4NWFpdmRp?=
 =?utf-8?B?WlNtZG0rejZuNTl6NGdtcFJEL0YxNHdBNyt6TGtiSW81YkJYZnpONU05bW9O?=
 =?utf-8?B?RFc4V0l1dU9JNENMZ2JydUZSS2VhcU5PSG1tcFpEL3lNbHAvcDMySUZTK1FC?=
 =?utf-8?B?OVhlV0hqS1RYZ2k3M2lrQ2R6bHdKYVBtWWZDQlBaZmFPVkNwdEdDU0ozNEgr?=
 =?utf-8?B?OVZPSzRYVzBOTTVzZ3BTN2g2L0lEc0xNWlFkVUVLVThDeE5vbCtvQk1rTUtT?=
 =?utf-8?B?NkJtVGExalhwbVQraHVPalhKREhKUmdaVzZtWmNYN3NQNWtmeDU4OEprTW01?=
 =?utf-8?B?UThISEo2N2JzYnUrNi9wNjJIdXlHTVp0bEpRVWFKYTlSeFE2Y2RqVGl3d1ph?=
 =?utf-8?B?OTJmakMrVGZsNWo3WWVZMDRuSlRSRVBKYjBFOFM3c0VvZ0tyL04zZFJISWxm?=
 =?utf-8?B?VnZzNnVURzUyajhqempFc2VYTHYwU0Y0d1NFSmVwNWVsWkN6ZzV4dlViSjB5?=
 =?utf-8?B?UXA5b3lGNFp4dGN2VWNlaldJZTZIUjNLanlrQ2c5MHRaU3dJVjdOaCtHTlNV?=
 =?utf-8?B?c1dPZEpNR3lvQ09LTWsyUEZ6cGMrYkd6d0s1bTVTcHZUbCtDRVcxa0Z3YndX?=
 =?utf-8?B?dWYrYVBCWXA0VlFEWmI5UkNMSmlkVDE2NDJaVlg2RG04dDEwWUJjTUhlWmdV?=
 =?utf-8?B?R2dSTHAxTGo1TGx4dU9ZbmJVRDRUQm8xUjE5MnhTdDhza3gwbVM0a2E5UFlR?=
 =?utf-8?B?S01ySC91Q2hlT1NJQVBnMGI4WHJWNjM2NGZvSWxsQkFOM2ZuWG5SNkdqeUxQ?=
 =?utf-8?Q?x62JRg?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:39:48.5832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0877d83c-f1ff-4ae6-7563-08ddf080468f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7538
X-Proofpoint-GUID: O7YdXkoIEfAEeee5IU6FuJK974KEuMea
X-Authority-Analysis: v=2.4 cv=GuFC+l1C c=1 sm=1 tr=0 ts=68c19bc7 cx=c_pps
 a=mqCKFYWqC4Jv+say6eUmRg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=w_GlC29AdT9k15G2B0YA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDA2NiBTYWx0ZWRfX3P9568Xnzkip
 Xhp3pgUTimxuXKEcZbLqvxj+LtNJQGlQLHWFa/TtWbhvmNwauJTxgn1TrniM+azvzvFbLQZrSjM
 tsWvbqPsqPub0pfsavvomCWumMOayW5JV8He299QvJyquqKW4F8AGnOz9CBCwHCLGHwGZekWZBP
 fwrFq5NE3kSNx1pIAm2sWK/gGd4jBYIaj5aE3vQbHMPrfDx6tj1ttCx8zJCL+xYhE7GqTSW4AqO
 otSrXaNEn6T/FqRs2mcN5QEKwxG//7cYFNqeuaLvFlIYXd06XkTyLAJWRfnfsuRjUuzpp81QmHV
 mki5Vgdgu6U40VQk2bI/mEjRhC091IH9Tu2ZXu66r88ayQ0j/j0QrTQgiG3KYotI9CZW/AHe5dv
 IDJ87dnH
X-Proofpoint-ORIG-GUID: O7YdXkoIEfAEeee5IU6FuJK974KEuMea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100066
Cc: Tom Rini <trini@konsulko.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Jerome Forissier <jerome.forissier@linaro.org>,
 Cheick Traore <cheick.traore@foss.st.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 4/5] configs: stm32mp25: Enable configs
 flags related to SPI flashes.
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

Hi,

On 8/8/25 17:11, Patrice Chotard wrote:
> Enable configs flags related to SPI flashes.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   configs/stm32mp25_defconfig | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
>

Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
