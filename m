Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A66BFB51C92
	for <lists+uboot-stm32@lfdr.de>; Wed, 10 Sep 2025 17:55:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6498BC35E2B;
	Wed, 10 Sep 2025 15:55:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BFFDC36B3F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 15:55:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AFt7QR008156;
 Wed, 10 Sep 2025 17:55:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 QxzRvmpx5e4oia0UEoZVpMj4YZzwRJMENbR9Gba4v+U=; b=2S+sOyDkQysWQkX3
 Na7Pigxpc0OPApUMlkm3lphZ2aYuG1DjpiBRiU9CHSkGDcgDjKdZXemhqrM9I32F
 agaxeuiZskcdWvYg1+GJUpOkEEKi/dIDuXyexCOI8NF47EkDgoeOcY1pwa4vncST
 y5zyRbpI3zP/s6ayWMYj5KwSDPfTHhj5ffT1qbrjhB0vvekBnSyTryk+e7+XGAaW
 lnWCeYGmTmVuXQfF/vSfcIYPvPrjbrC9y3jA+8qFyc4PeULcO0oMatUiQSpDPQza
 kwdpGe65CcNgcreajKRah4j3VnsbTBAauloHkULhoboK/UVNii9/x8wTfFLT7TfO
 dNGiLw==
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4934xjj5r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Sep 2025 17:55:42 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQyJM8rntSPFdsmjW/ceVCBsGIMcz1nSPI7mDCtGTVQRKgqPsd8FlcdhNYIdFhl2XMo3EyzHf3T3fHHNmH5Kb/v6fkADkg55OHDvi1Bof81jhlrpjE/o8pQhkMfhfQ2Tut10RSw/Ft9zjFsUtTpUO/Gyf3Z6r7I6FyX9N1ireJxLU3ZuETrcgotet3xOz5s16RhuZlBz1s8dulbvhvP3/ewu69fD1kBOkir9Q4UiHYjzjwKyJJnEkefoOrwSxYZvbBhWdNh8nH8uFNJtNFW7h0d7sYfslTCiJCXHUbRTeIqlOG3VmTcJ9ddAlq7DzqwpHtKZlO47nFVu/GjaAj2O0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxzRvmpx5e4oia0UEoZVpMj4YZzwRJMENbR9Gba4v+U=;
 b=hkf94KvsrEpvGSoFlhLIBihuTxMZzVJ/ADmLnweLZJds+d7OM7PMGB14B/PHALn5FpDMq6DTkmrhKkBPSCPKXyOW/TBhu5uLYhXtItUSoWtOJaSZLcBbxO2yIxE9mLAsfZtylQHNcd5jeW/F2b2T/2U9+l8/UH9dAynDmPSSwxb2FH93llAtCSP51D5LPo3KkQQ0Ji4Rk3H7uSbolKDNqaod5MHeMmvKle5+AisyePBiOvQ73rosPDIiqKzvQdiNKaOxv0u+cXBT1yIZYDn+zqe3s1cbBnur7gkA2Az3vfl7B6EiBS+SGYJF1dd0wzvwypnMNDV3ffPuTh+OcJzSsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=lists.denx.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxzRvmpx5e4oia0UEoZVpMj4YZzwRJMENbR9Gba4v+U=;
 b=ZtuD8oCCNNC3gzPBGWcoyyYI58lGfsT9uA6JQSgwSONCnzCXV1rRUwezoKBW1O8OBCGwBdmqtM9Wta4sCDBWfhrF1X4hBQ/SgzsjbeWi2v1P/8jdbuV/XWAXSx3zfwBSIjzN3YSUxa149giCOdIKVesKWK52iUB4dMKmvHKqbZA=
Received: from DUZPR01CA0204.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::25) by AS2PR10MB6736.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:544::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:55:40 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::15) by DUZPR01CA0204.outlook.office365.com
 (2603:10a6:10:4b6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Wed,
 10 Sep 2025 15:55:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 15:55:40 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:53:18 +0200
Received: from [10.48.87.108] (10.48.87.108) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 17:55:38 +0200
Message-ID: <c5463f88-f9d6-4e0e-8269-4103be858bbe@foss.st.com>
Date: Wed, 10 Sep 2025 17:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20250808140358.53164-1-patrice.chotard@foss.st.com>
 <20250808140358.53164-3-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20250808140358.53164-3-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.87.108]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|AS2PR10MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2b43c8-4117-4dbd-0b25-08ddf0827db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWpHWHNpd3FUV25qZXIrZTNtdXZxVU1YUjg1ajErSlRWK1RPcUsxd0lLVWkr?=
 =?utf-8?B?SWZEY1FsTjk2VDV6RDNPdS95UFBGeFBLeUxTd3N5cm9VL3BvdUFvdTIrMUVJ?=
 =?utf-8?B?OHhibXpUa2hYS1VFaFZGTm5uYUJhYndLV0lzUWRGVjdER3NuNFBva3BXL3FP?=
 =?utf-8?B?L0NURUtyR2lkdy9LRmxhS3Y3Qml2b3lzMHRkaFpnc1BMLzVvaGFWWkpPM3hW?=
 =?utf-8?B?L2tBZUdNcXlSVGlybVF6NnRSMWZ1M0ZXQUhuTnJUWHBSOERvNlRIY3dvR2o5?=
 =?utf-8?B?ZnNJTGI3WElIZGdqTHpmMk1WazJKcFZjYm9kczQ4UFR3WUVxTjYyQkpFSjhm?=
 =?utf-8?B?Vll3OGRzUEF2U0JLM216eTFPckc4aXVRWGZYSjFVWThWTk9UL0ZFUFpyQ2VG?=
 =?utf-8?B?UG11YzM0TVpJTk1EUVJkbjNpRW50YnUrWjE3a04rSFBKcDEyemJadkpJZUJN?=
 =?utf-8?B?R2hOOGlSUGZycURxM3NmZW11VjRxR2YwN2ZhK01MYWZFY0pqMTZtcm1kVzhV?=
 =?utf-8?B?d1k4LzdRcVlPQXVhTHVzcityRTY5V1pyaDNlRW1pVmVsanpPZFp3MkhYRlI2?=
 =?utf-8?B?SVpTVHdaZHBuRk1OVTBaNFFDNVFHYTZDZWN2MitSSStnVmhRem5ReVpKRjRr?=
 =?utf-8?B?SDg5TDZiWmFoempjZ29oR0xJY2F0Yy9CTXJ4M1NuditJWnJhME9NemxOSmty?=
 =?utf-8?B?QzZqNVUxcHhzdklDUDdnSThRMmkrVFpPQ2NhenR0ZXd0RWhRLzR5cWZ0YWxV?=
 =?utf-8?B?TFpnV3Q4NUtxNDJKOFF4OVMyVHBGSlBtU1ZtZW9QeWRpZ2pUTUIyMDdCekcz?=
 =?utf-8?B?U3NINnZzRDQzc1l1WmFDRzNicGVQd2paZXB6Q3lnNk40YlBNMjdQWmp4UmRO?=
 =?utf-8?B?clhHdmRtN2czc015MFlORE4xZHM2RVNGN0ltaUpnM2pWMXZBNC80SGxKbTll?=
 =?utf-8?B?ZDJ6b1lHa08rNkdydnlhM3FYSmdLZXVySzA0c3k1Q28rdWgxQk5SZ3ZPNHV2?=
 =?utf-8?B?amlKSTU3WHJkQ0dMRE1RUnlpT0dhZnFFYTBTY1RQU29ORjJxbnlIamdkY004?=
 =?utf-8?B?ek44bEs2NEhSV0FacVJIOHNGMmJHYmgxOTJKZDg5SDN1OGlEOEs1b3NIZWN0?=
 =?utf-8?B?Nmx4WVVZSVVndk9MTzBBM25qVzIzTUZqdkloMVZueUFSZ1ZoTy92YU1NZjAw?=
 =?utf-8?B?R2hRVmJmNXpqYW9GVENNRTRlYTdIR0RubUEzMlVielJRdlVKZE9nZkNGaWd5?=
 =?utf-8?B?SFgvTEZBQW9nNGhoLzEvcWpDdGl1Y1J0U08vbzNOQllNK29FcktCOGNLcW1G?=
 =?utf-8?B?aFlFcGhaQTNnTi9nQ2FuYTBodEwzNWZWc3pKR1BjdlY1TjZRVkZRNFNQS2I4?=
 =?utf-8?B?SUFBbHlMcjBPc3cvSHJXdFBmOG5UeHNkenhGZ3pYaXFPd09uR3hRU3BmcWZr?=
 =?utf-8?B?bW1zVS9mS1NpT0pRamMzS2t4MUdRMmVtK1UwOWdoU1Y1YytIZDk2S0pqZHFm?=
 =?utf-8?B?aVRvM3h0U0ZkOFdlWEdVK2I0RXBoa0tLeWVxajExYk5tdzFpWjN1SWpsNVNn?=
 =?utf-8?B?d0k3MFFPNElhWFY0U3VFekVkMTJzV1VUZVpWRUZiRVVHNVJxbUgrczZ0azd6?=
 =?utf-8?B?ZDJWSW1iZXB1SmorZCt4dFFjS3Y3OHEwVXprR0VGRG5VUzNvUXhGOUcxNm5i?=
 =?utf-8?B?dWx1aHJ6M0ExcW1CUEdGMDhsblJiTFFTUXJJK0JkVVdxUnk1b1AyK05sWm9w?=
 =?utf-8?B?eUkyYmZUbi9WdVJKd1FrelNnZmhrODVEQkRjU0NZWVdkeGR5c2kybGZ3eVpz?=
 =?utf-8?B?NGhCaW8xclVKTUpBTUtNeUV5alRCR2QzS1hENG40c0gwM21kMi9ZdUx2WnIy?=
 =?utf-8?B?R2FPRXBzdEVVYm1iS01jTVM3c0FIMkU4MjZVYVNONlV3Sk8xMDFEczFPSVhn?=
 =?utf-8?B?UkM2NnVPYWtMRmxockpQNWVORngzbHdyeU0rcGJPelBTMHFPMW8xQitESzNT?=
 =?utf-8?B?bktuZFNtWlpPMTJxV1JQbkxRZ1RqdDdLbG9xWm4vUzhmM0syaWhzMmM5Ym5h?=
 =?utf-8?Q?KAQxpJ?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:55:40.0458 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2b43c8-4117-4dbd-0b25-08ddf0827db1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6736
X-Proofpoint-GUID: rb4lqhWCy1ETWzc4eo63fCZHNCmuOLbI
X-Authority-Analysis: v=2.4 cv=GuFC+l1C c=1 sm=1 tr=0 ts=68c19f7e cx=c_pps
 a=llX5wPWAi/rMcvepPPXqLw==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=q6CKDgr7omsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=QhRXLME1YQ-Z80f2VjcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDA2NiBTYWx0ZWRfX7aTrZutuOd1Z
 OGdelcTly1DSdINYXOoW0FFF0uY296DQLDq71G3MdjPEmQpkKVOhNfBA0nyNcCyOh9PAKrwVowP
 mOVbuSLB9LpaIVzPi/OhyEuFvgTC8j7q+I0WOgtHB4izEIvDJ7y9JfaotSNKxMiAfaTQmvjUNdn
 78DjuNJvz7JFerRAZuy9uv4l4PZS65tTeTSemaz6BIV+gKATGPkT+IMHqn1mf9fRKU/pN7BPWI6
 NtrqeGCcnqrYvWxwqhTZRiucLR9pzq2dOePRY1YyRDgYOMFyoO/7k5t9MCiYoS/ttm/SOaV9erP
 /30rFtkD1g5RMWcChV6Vdz7JGRjrji+XDpiYfvL0tTrbR13KBLKLMf6rLMqZ16SoTV9nzC9F/Xo
 Nkb/5Rev
X-Proofpoint-ORIG-GUID: rb4lqhWCy1ETWzc4eo63fCZHNCmuOLbI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100066
Cc: Tom Rini <trini@konsulko.com>, Valentin Caron <valentin.caron@foss.st.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Sean
 Anderson <seanga2@gmail.com>, Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] ARM: stm32mp: replace RIFSC check
	access APIs
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

On 8/8/25 16:03, Patrice Chotard wrote:
> From: Gatien Chevallier <gatien.chevallier@foss.st.com>
>
> Replace RIFSC check access APIs by grant/release access ones that handle
> the RIF semaphores.
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>


minor on comit message: unnecessary line between signed-off


> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   arch/arm/mach-stm32mp/include/mach/rif.h |  48 +++++++--
>   arch/arm/mach-stm32mp/stm32mp2/rifsc.c   | 127 +++++++++++++----------
>   drivers/clk/stm32/clk-stm32mp25.c        |   2 +-
>   3 files changed, 116 insertions(+), 61 deletions(-)


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>


Thanks
Patrick



_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
