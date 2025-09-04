Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 507E1B43352
	for <lists+uboot-stm32@lfdr.de>; Thu,  4 Sep 2025 09:05:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14556C3F93A;
	Thu,  4 Sep 2025 07:05:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0D4CC3F939
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Sep 2025 07:05:56 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5845YsB9028512;
 Thu, 4 Sep 2025 09:05:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Kbg7Dv6VhEP37bHa25L1WnO/uX5MqltSgTJysrK8D5I=; b=neuwLbozZbCMGF5O
 i+V38+W0Q7FG3L8jKRwlZSqp8hBz2g7TbCiDW8IApoETS2177CAjw82Th49YH28+
 5AQBiF4re41/IRkJujmy3SCOLSQOZOfMoCZDpuqz5WE/qlVmM6L6cmjzsMJo1Mb2
 FeOXGS/XFAd0D2CqX2AOb07NVV4q3Wv5IKHjty5Fwed5xSIspHGyGTIBClwHnqTi
 xXRKU2rqxVZDZ1/m2DRgZ9+Hiw1uB/IPrFgkPg8OWYI0320BYBweDL1kXu8PSSsR
 WcPtG/VupZFmapYwI0qcRgiYLbN0jx+lcAaTkG8cLpn8mCWNT43IYVJMQfXUEpLz
 UgRcsw==
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7m1uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Sep 2025 09:05:51 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JezBqJYRtaYCh6KRtI7vmcWwGlrpXkrNpiidayU3tIW6/aIhH5/Hta670YIBzIlLa55tcDL6Iz0tS91Gbg4qozBQLI/ERc+nQb/9GLvdK2sXHf75kKHPujiFIePVxuYwIng0AGd21dTL44o4+iJyXSeDHJtBdA1G6j+PrlSIOd89Kl/x3Mq/lHkpXDMJlE9ty7WtWhGcawdEIusz1Jzd4SDbn7PDKKMmebyry2ZzwX0IUNW6C/NAWXFv7x+Du3brTLCVGz0N2161xKPmZhUh2c9yBYie9lmqFBn2I/5mtfZTodLEkbqVMZrrcgewuYQbktscVNF/FowbJJwnGCCquQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kbg7Dv6VhEP37bHa25L1WnO/uX5MqltSgTJysrK8D5I=;
 b=KtmjF8VmqmDnrQUqy0xr/S5zLb7668KnHQrFcgz5XOJzjf1j57nwJ/z4mlzELh5IZRjLAo8n0UVTHKW4trc3T5JMJfSBbVbTVr4Y7+CKkD6JUqIHbh5lo1/WrRdL6nk2F1Sz3JmzMbcv2XOu6yALiLyguZghOOZ/Z2tB7gsHMfyvj7P51HypCvxoTL1CSGwHaxmDg8mbJGE6XJjAq/2Xc32QsF7ZdGwDjjCvebOP6dCC5vBi8tljnaq66Kg7WwRSqz9h+VHKuDGdfzX/3bqoT+IUx/4hfrrAAF8vQXOo07jVitnrDKrR3RnKOfAVVQSar2WE996SUoL5fflPjA+3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kbg7Dv6VhEP37bHa25L1WnO/uX5MqltSgTJysrK8D5I=;
 b=gN4iUA6cgLqaHCd57nIYbZwAfqqeWS2yIhg/3NLEcRu6DSXHb6IOdO92inx/zMoNyyl4uuPlAOpTtyHP+1vwUmRV7vQy+3kZyelNd1b4PS8INJSuIANCBDujMuFDCLKtc7/JxW3DOAJiCQTGTYysNFl6gogQvbQl9T6JwCt4DkQ=
Received: from DUZPR01CA0265.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::15) by GV2PR10MB6211.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:7a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 07:05:47 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::e9) by DUZPR01CA0265.outlook.office365.com
 (2603:10a6:10:4b9::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.18 via Frontend Transport; Thu,
 4 Sep 2025 07:05:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 07:05:46 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 09:03:24 +0200
Received: from [10.48.87.178] (10.48.87.178) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 4 Sep
 2025 09:05:42 +0200
Message-ID: <4a5fa679-359d-4b16-bec5-319cf161a725@foss.st.com>
Date: Thu, 4 Sep 2025 09:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250903-master-v2-0-5cdf73bff42c@foss.st.com>
 <20250903-master-v2-6-5cdf73bff42c@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250903-master-v2-6-5cdf73bff42c@foss.st.com>
X-Originating-IP: [10.48.87.178]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C2:EE_|GV2PR10MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: fe17f843-98af-46a8-62a7-08ddeb8178d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXhmWTcyOXJyaUhiV3FvTEQ2U2pnbDdRWHZZN2F3QUZYemdDSVJCZVB5cFMr?=
 =?utf-8?B?VGdZY1UxNU1oQ2FGNE92ZEVHVnhJZmJsRjEyWkgwZmJScE9TOFFQamFxQWdL?=
 =?utf-8?B?UUJXL2hOSGR5blIzYVpnNUx1NmlOYVE5TlROTXVycHlLd2RBUW90QTBHdDI2?=
 =?utf-8?B?V3RhMWJXa1BmZjBHNzhQcWF2QzdLcDgvTHBvdVk0UGJBdHhqRWNpVzlzQXdF?=
 =?utf-8?B?TjFvZWovVUk2OWRsSmpKT2tSVzFKcXlPa0F6MUtZTkE2c25MbzR6OXBBbEJo?=
 =?utf-8?B?QzJ0ZEM3VnUvKzFRQmc3Wkl1ZVZydjlDT2VUdEF4RDU3T2dDTHRPeDVhOVo5?=
 =?utf-8?B?ZkZFUS90UzFJcDBsakFXSWRFeGhEVlJkVXR4SGZobHpqd2QwV25yNEJMWFRy?=
 =?utf-8?B?YTNIWEc1dUQrS0pybzJaaDRTYndrUnF4eVF3K001aWRuUHowaW1QVXZYNU5m?=
 =?utf-8?B?K0c1RlYvb09DTkVMUm9MR2JNa2xtclg5YlpPN0hHODZyaFJvUkpyV0tWTjl6?=
 =?utf-8?B?dS9sSmRkN0xOeW1OMzlwbzFzZVZoQTNhcXdxZDkvc2pJTUdhNFh0VkxNYTFD?=
 =?utf-8?B?UDgwNERjbWZPdWFKU1BGcDZoR1g2SDNXSGp0S0x6RXVnM3MydWZJQUkxK3hH?=
 =?utf-8?B?WDVZOUhaWm53K0lBSXVhMktZNlI3ZXF2akZNSjl6MkZDdzd1d1RiZzk3VytJ?=
 =?utf-8?B?VVhybUE2QldWejhvTk1GZVcreStRN1V2b3p0Vkljc0ZCaTR2VDA1czRZdzNV?=
 =?utf-8?B?RS9POFhlVTUwYUJvNjBONVJ6YkFKazlSSVlaVTNBV3JLMlltdnZudjFzc1dw?=
 =?utf-8?B?enQxOVVZR3FoY3MwMGxWWHJqUHpITy9ORDk0WGZkK2huWm5zUEpsNnFjTFA0?=
 =?utf-8?B?a3hPVFhJZWhCMll1N2xlVkJaMS9Tem5DSjdFN2x5cU0xZHZQUC9BR2tHVzBP?=
 =?utf-8?B?eHZtZzFTK3VWTStPVk92Vkg5Y2ZDK2lPQ2ppQ2dvcFJHMWFsMll6OWV6MElL?=
 =?utf-8?B?Z2oxZlFNNWx2RmVKaWN6anpKTTQrT3AyMkJrbkZ2YVgrYllaZXk2WStISzBK?=
 =?utf-8?B?bTZrNTZGS2RyaWNCRk9scE9keGpYYUlaN1dsR2dRVFNpYUxIZGJKNyt0cDBX?=
 =?utf-8?B?MUJlRURKVUdQVEMzcS9rdmtCZDc1Z2I5ZXZzNE5rTTB1WUNIZWc2MEJGRjdn?=
 =?utf-8?B?WjZhNzg4cFJLTE1nVThMc2ZGcEE1WGpFNEdyR1h5Yjl0SWtJb0RweXBNTUd1?=
 =?utf-8?B?RUJERk5OMTlBdzVGVzYwVDI0eVhFd2MvNEhVcy9XZWwxODZHVEkwRUtvZHp2?=
 =?utf-8?B?cGw4N2ZuS1d6NjY1ajNYaHY4Y2RIaXdqME9MS2h5ZlpMRDNXZi95eXp4K1Fv?=
 =?utf-8?B?WGpnb1ZvNW9ZSU1IS0ZVOWRjZmhNMlkzdDdYYlpaNmVpdGRqZE85enpRUUxS?=
 =?utf-8?B?U2tCZUVxSEJWNnBWMkVvMjZiWmh0YkJ4bjdneHhmMDl6K1A0MGxENlZsbUFU?=
 =?utf-8?B?NnJpb1dkc0FOa2g5akZIZGxpQ1BXNGdkTzJGNDRMV1hQZXhKN05rM1BlQ0RV?=
 =?utf-8?B?SXg3RW1jS3lsZGF5ckQvREg2MVFxNTJXd042clM3N1pTT0VKYVpZRXpIUDJY?=
 =?utf-8?B?dEp1US94SkpaakxXQjd3U3Bqblk2ZFNnUmZyZFl1TklmQTk4UStYaTRxZzNL?=
 =?utf-8?B?emovUEcvNGNSSE1UUTFrNHdzVXViSFhjU2wzUlhHZFJueDJtKzZPYTYySkkz?=
 =?utf-8?B?TEt4ajA5bCtnU1R6bm9tdVJLcjE4UThiWVFJalZZREtpVkJnUXZZSEdFc21H?=
 =?utf-8?B?aS9qc3ZSN2NiQkV2VWZNNVRtdHNDOFlpUEwwcDFwK1diQ2Nzc0o3cnRadjRX?=
 =?utf-8?B?WS80eVk1TnVCeTBIc3B5YXc4YUdLV05ITmcwd0RFNGoxZDd1eVpGamozQ1ZG?=
 =?utf-8?B?NyswRnlsZkRXcFI1b0pkMXdDWkZiUmZQSUFSYURKYi9CdEZLUDhZVEtiMDlK?=
 =?utf-8?B?M3JMd3gzaHlEdHN5dW5iWDB1dnloaSszR1dBVld5QVhEU1Jqd1AvckE0bjNG?=
 =?utf-8?B?cVZ6ZFFtbkVrWGxSZUxPdzZRN3UxUTFjWWZ5UT09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:05:46.5492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe17f843-98af-46a8-62a7-08ddeb8178d2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6211
X-Proofpoint-GUID: GioA-FPqo51N0VDq66up_erOhGYv9-US
X-Proofpoint-ORIG-GUID: GioA-FPqo51N0VDq66up_erOhGYv9-US
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI5MDIyMCBTYWx0ZWRfX7V7Ix0dYswcC
 gzSCaXyl+Hp5r3/cTKbNvI90rqkfV8Oyw6gEyw76KbGZfb6HGp0OQG7Qfebp1r3c4P8IrvVJ61H
 vTsBtcAlLOTB1nqQwauoCHEmgCpqrMa74nchchlI3JmcBEtAkGWghWVHuK8GSxynQLXfgbPlSxl
 wrOOyAIbDTtH3LBvDcx/RzDBVB3SBEOu6KGCASj88y1IvR82ckfKXv7fvmLNBX1/dM/Dnx1yHmv
 OW35DG+Ko2a1bUxOOrFT1BDXs/4qexFvmvTALZbtlwgMin3zOoG5fbdZd1+mGE1DHJ5rH4noCBv
 FHlfz4wpgjJA/unkWfQePLZpMhKzwxZOjtzUqHTEGTBGs6gvbcMBSlMydwNzeEnNN2KGDX+KGhs
 +bABu6jJ
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=68b93a4f cx=c_pps
 a=jPyTe4tpzhGg3oLrFBeDzA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=P2A4Zi-lJHsA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=i1RnyxxZvwQhDitc-iAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508290220
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 6/7] ARM: dts: stm32: use LTDC and LVDS
 nodes before relocation in stm32mp25-u-boot
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

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKUmV2aWV3ZWQtYnk6IFlhbm5pY2sg
RmVydHJlPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKTGUgMDMvMDkvMjAyNSDDoCAxNDoy
NSwgUmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+IFVzZSBMVERDIGFuZCBMVkRTIG5v
ZGVzIGluIGFsbCBib290IHBoYXNlcy4gIFRoaXMgaXMgc3BlY2lhbGx5IHVzZWZ1bAo+IGJlZm9y
ZSBVLUJvb3QgcmVsb2NhdGlvbi4KPgo+IFJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBh
dHJpY2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxh
aXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91QGZvc3Muc3QuY29tPgo+IC0tLQo+ICAgYXJjaC9h
cm0vZHRzL3N0bTMybXAyNS11LWJvb3QuZHRzaSB8IDggKysrKysrKysKPiAgIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9kdHMvc3RtMzJt
cDI1LXUtYm9vdC5kdHNpIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAyNS11LWJvb3QuZHRzaQo+IGlu
ZGV4IGQ5YWVlYjZkNTEwZGY5ZGVhOTcwMDE0OGNmOGE4YWQ1ZWZjZmQ0ZjkuLjNhYzM1YzRhNmJj
MjdjNzJlZWViNTMyNzQyZmQ0NDEyYjdhYTFiODUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vZHRz
L3N0bTMybXAyNS11LWJvb3QuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMjUtdS1i
b290LmR0c2kKPiBAQCAtOTMsNiArOTMsMTQgQEAKPiAgIAlib290cGgtYWxsOwo+ICAgfTsKPiAg
IAo+ICsmbHRkYyB7Cj4gKwlib290cGgtYWxsOwo+ICt9Owo+ICsKPiArJmx2ZHMgewo+ICsJYm9v
dHBoLWFsbDsKPiArfTsKPiArCj4gICAmcGluY3RybCB7Cj4gICAJYm9vdHBoLWFsbDsKPiAgIH07
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
