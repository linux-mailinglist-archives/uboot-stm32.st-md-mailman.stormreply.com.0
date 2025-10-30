Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E774C1ED3E
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Oct 2025 08:44:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F430C62D85;
	Thu, 30 Oct 2025 07:44:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64C1DC62D84
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 07:44:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U7X5gU1281050; Thu, 30 Oct 2025 08:43:56 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013054.outbound.protection.outlook.com
 [52.101.83.54])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a3be3nuaj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 08:43:55 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tihANHElcbyrfRbYlX5TtmWRMIamglTRSnlV/ws7E00mgts2097KBeUL/yTR1O4KNGXiPcIIHFC/JY+vgccGO3ybSHegb/d6SFF9DzYRBBvlljOv86F3hVh+ZVtgyWIse34ZbqUYsioiDrIXIDphogogj2x+Vdmza6vaWrUvdpicn3iDmD+g7lfT+0mqQ1pAq6N6Gy81nlUQeaJ3R4dQZykPjIIYeHBxZArBD/s7c88f8CX6w+y9xvzJdxowZ1FwQAgzHe7eVQlvcp9mb/9xCpM8sQLgK311MWEeb/XvhMZyi2qarR9jnN15x6Q38hOxTr8mIMUvaoXo5S5eRm0V0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNLFxhAz0I+3cESUFIxXHcp8jlE8vq/x9tR9QqEpVzU=;
 b=amHd4K1sQ5agFu/VGZGq06lHij/gxh0cNxd+m8F9WvodCSXjZdoVJ/1fSlmyth3iZETVkyiFZd9nBe4R9ZYeLJ7SCBOB1wl1sRe1xEb6xBXA73z8fBjKRiL2cwxG+MjQWXs8J/sINDA4pMulx0vrl1r7gyTMn/2OeDaNUAsZZ0xyAR5MGDhSBMgrN7LYGV/Y3jv9tY9jKjPdVX1HwvzIV1wydN7i74Dtg2iM0FoI7qRidaE7a5lunNkDV93L0DKn6OtsxPuFyZ5T5aOFNTqcvM6KCBQRbT+7DcBEL07Dn2IwwbYd0ueQ3pnoceGNfE7OyS39HMZEFqHe6o9YdtBQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=konsulko.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNLFxhAz0I+3cESUFIxXHcp8jlE8vq/x9tR9QqEpVzU=;
 b=Gdf6t2nWRXH9sifrHzpW5lmeuSP9eVg1MFYHjxyLV64+WNnHEwO5NS2Xa4KRF0VIlu1USxraAKtdFqICNLA93TQc36hRBMKsaYake5wc5q25jnDiOOjpcByS7NGV9EZP0Pl66XHtEcTbpHcajWEzly/F/bGcR8NdlUnPGHPAUvjFBUxw/RzoEgsXaQCBLYdzteGIyuyHYTE3El5tgVxiJORpTwOhPUn81ey/7ZESLT7s6RpQzb+iN4TjuIJwToWPr3abLNobLplRf6Z/QTbZNtJDd6E/g0lT5YIJcioNOI1k/pn31QkD2nXJMqCDB0GnKavhgIm34txI0PuTjKbE/Q==
Received: from DU2PR04CA0220.eurprd04.prod.outlook.com (2603:10a6:10:2b1::15)
 by PA2PR10MB9133.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:421::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 07:43:52 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::77) by DU2PR04CA0220.outlook.office365.com
 (2603:10a6:10:2b1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 07:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 07:43:52 +0000
Received: from SHFDAG1NODE3.st.com (10.75.129.71) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:36:26 +0100
Received: from [10.252.23.232] (10.252.23.232) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:43:51 +0100
Message-ID: <7b886fcf-3f2a-48a3-b496-3793d381b6ef@foss.st.com>
Date: Thu, 30 Oct 2025 08:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Dillon Min <dillon.minfei@gmail.com>,
 "Patrick Delaunay" <patrick.delaunay@foss.st.com>, Anatolij Gustschin
 <ag.dev.uboot@gmail.com>, Simon Glass <sjg@chromium.org>, Sumit Garg
 <sumit.garg@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>
References: <20250904-master-v3-0-b42847884974@foss.st.com>
 <20250904-master-v3-6-b42847884974@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20250904-master-v3-6-b42847884974@foss.st.com>
X-Originating-IP: [10.252.23.232]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|PA2PR10MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aad291d-ab43-4f63-6b32-08de1788128b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDM2aTJKVXNGUUVyRFA1eUQ0YWdHa0hDU0tzbmIwRlZ0VS9MRGQwQW9JKzJa?=
 =?utf-8?B?RkpBVldHM21BLzQ2UkYxSnAzK1E0Qm5nWElVR0xQcHUrL2wyWmdjMDd6Y0dP?=
 =?utf-8?B?REl4WjhJT0x0WngzQ29uTEpCSHRvcGorZ2Ira0ZOK01icEdNeHJCcVVHMTla?=
 =?utf-8?B?TzRLNWZlRUNzZjcvNU92YVNnTVFkRzJPOU13VmhzL0pRSnZ6Zy9LdW0rTFVi?=
 =?utf-8?B?bVVIUUxtaUdwQVdBVFQ2TzlOMWw3SVNQbmRydk1PdDdsQk9RSDVDc3ArTk9H?=
 =?utf-8?B?N3d4RHQ3cVNlaGFqSmNWUzNlVzBNZzJ5aGZ3MnAxZk9GVWFWamhmMDkwQUVr?=
 =?utf-8?B?RVU0elJWc3ZheXVxSUN6QlRBSjBoYkc1Z281cXhPZHJoY2tPRis5QksrZVEy?=
 =?utf-8?B?TTJMZ2ZvZ3VwOTF1aDdzNURINkIzZVQ4Q1VhQTZJMENjakhSREhTMWN0YnVV?=
 =?utf-8?B?blRaa3M4dm5xRzFzMTkyUVVBY1V5YjJVTDRCb2M2TFJwT3NxR3BEZWQ0K2xJ?=
 =?utf-8?B?bVcram1mN2orK3YyWk5sbXRvTldOajEwSUlLVGdDcXZZcEF1YStWUHlVT0x6?=
 =?utf-8?B?Q0dmU0JzZHNVWWdtVGpHSXVrbmVwZEFRL3h5ZW8rc1BhUlNwM1NwVUhPTlFK?=
 =?utf-8?B?NUwwblhmcDlBU2VWQW5aWkRyMVZQYlJCS3lYRG51VDJlQ0Z4ekJXZGY0a2RV?=
 =?utf-8?B?aDk0U2swdTJ4dnQ3eVVpMHc5azVUakdkbTJ4QXVYbGNjN29oZG4vQ1JCRHZG?=
 =?utf-8?B?YTN3M0NWeVNPZlVLdnpUYk9YZXhrUjJ3eDJ0ZUYrM25TWGQ3OFc5NTliazFt?=
 =?utf-8?B?LzVIQk1HRHJVOTZOdWIxWU9kcnJHTVVTREY2NFR0Z1B1cFpIeWVXUmVuRFEy?=
 =?utf-8?B?bS9HeUhXOUk2MlRPcmdRRkpQSUxWOTJSWU9mbXlWV3NtemIxQjRuemVYTk12?=
 =?utf-8?B?SHdLOXdpVUZROS9URVd3R2hIOU0wY21TdStIdXo1MDRjYXJ3MFFJYjVVWStT?=
 =?utf-8?B?YUZnQmRWZTZjVlZZeWRSb2IyOGJJQThTZzFQeFU2Sy9RcjRSbFVWa3NBMlNk?=
 =?utf-8?B?aWY1d3JSQ3pYKytIN0VFMWxyaFFBOUFsd2NRYk85VGozV3BmUm10aDdtS2pz?=
 =?utf-8?B?YlJoQXBGU2p5Wlo5Z1JhVjdFRWUyRllOMGRwK3F0b3ZzaVl5dnhpc3FXczdJ?=
 =?utf-8?B?NkRpNktNTERpSjBFdit3cHd2TzhqcTN6M0ltWTUrUDdQeXV6dXpSdW9RQ0pn?=
 =?utf-8?B?d1F5NjVMTnUzK1Q2Ymo4SGFFK1N5dDY0Vkg3MkMyZmhFTlVKcW1OTWYvdVNu?=
 =?utf-8?B?bldXVUsyaWFHd3NCUWxuTHFkWjUwNExhUlgzU0s2WUFoVW90bnN2elN4NWpa?=
 =?utf-8?B?TWo0dWdXRnRPTVlFNVRzT2R4dXFnVTR3TGZhaTBaQkVFMmF2TGkwUjJKSWI0?=
 =?utf-8?B?RnZNL2kvbXZ1WlBuajdWS1R4eWZjVGl3MkxnZFY5L01TT3Zlb2dkQlR5dEpi?=
 =?utf-8?B?MWNDRnNQSEVjRGl4VU1hMVB1WXhZN1BKRzdXRFVqWG14OW1pWlNUczN0ZTdr?=
 =?utf-8?B?VkVhbi8veG55TFM1ajRKa25UOTVTNnBUeFg3L0RlKzVDVmJnYmVUcGVFUFVZ?=
 =?utf-8?B?ak9qVVlQWUhQN3pJRW1iYTAzMTNZTHh3V1lsTW4reVJvd1NSWWhIdEFIMnAy?=
 =?utf-8?B?Qk5ZVjlmVlFCbXFxdjdtQ3MycjZkN0dTRXk5T2xudmIyYW9CWWdtM1JFb3Rv?=
 =?utf-8?B?R2pqY29BTWcxTE14WkRNVS9JY3hROXU1NGFBcStaT1FMWElWalVOd0oxR1p1?=
 =?utf-8?B?WEsrWlFsSnV4L1JQbHB2NGVWMGpRNlBtcGNhTTFXemtXOGN2M09mNEdPL255?=
 =?utf-8?B?SXhwb0V4NTE1ZmRWblo1L041K1hwdTl5R3Y4Y1Q2RlBpb2RHWi9Ca0x2ZHda?=
 =?utf-8?B?bGdYVjJYTUk2a2o4VVVQZkd5cUVreHhIeFZiZnlwcXdseDdEekZWQ2pheFV2?=
 =?utf-8?B?dnA5YmExNDFVR0YwY3Rady81S0JEbENraXgzOFdSbWtRUmlmWTVMSUZrYWpC?=
 =?utf-8?B?RlRpbjhNT3JMZUJxK0hjS01jNEF4alZoR2ZKR0ZDaWpJc0VDblo4UllQa2tn?=
 =?utf-8?Q?efgBQ14x7TW4sOJPcpKDJKnaV?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 07:43:52.5855 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aad291d-ab43-4f63-6b32-08de1788128b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9133
X-Authority-Analysis: v=2.4 cv=JMU2csKb c=1 sm=1 tr=0 ts=6903173b cx=c_pps
 a=1ekRL+OxKw2/ljWpMeJ4Gg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=ttam_Flv6DUA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=i1RnyxxZvwQhDitc-iAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: mXRlkaGWR3Ms2w4eHw6lHwfMMCIZaHzI
X-Proofpoint-GUID: mXRlkaGWR3Ms2w4eHw6lHwfMMCIZaHzI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2MSBTYWx0ZWRfX+9VUU2f60M48
 dsGtk1yg0nUg8XqYgMnrdBjSppeREsIyjYkc2Fxib55Pq9FoXbSSL3CMskGSRJl0i/uGykVFQGh
 Ues8GMMyDU8PuaC4Ozb1utmZem/MPNiTpuWRyOPHihFkK2xssXVTsMCHoNna1jbOHQUiteqb7/l
 8sGFOJBhrJZhZpnYQ2vK4eprMcFUUeenE7Hw4+8KVWKd26Vkn3eMQV0gXnJ1h9E7hB7JyHaEVwu
 DEHHMp5rW+18FU3VtQes23wAnrdtIP7Y/zx1EnPM5ynhHoYEAZUMlORBXkqWX7cwqtt+tH9FAoR
 gf13ZVoySVuwjejUkuGLBnM8fHkbKPdLdMtLQxGpI929DunwMbtt2qy8WyZlmf+Hu6CqeM16xEc
 sx4SLbpdQp384zf01UfizDsvPrTxEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300061
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 6/7] ARM: dts: stm32: use LTDC and LVDS
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

SGkgUmFwaGFlbCwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlPHlhbm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgoKTGUgMDQvMDkvMjAyNSDDoCAxNDo1Mywg
UmFwaGFlbCBHYWxsYWlzLVBvdSBhIMOpY3JpdMKgOgo+IFVzZSBMVERDIGFuZCBMVkRTIG5vZGVz
IGluIGFsbCBib290IHBoYXNlcy4gIFRoaXMgaXMgc3BlY2lhbGx5IHVzZWZ1bAo+IGJlZm9yZSBV
LUJvb3QgcmVsb2NhdGlvbi4KPgo+IFJldmlld2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJp
Y2UuY2hvdGFyZEBmb3NzLnN0LmNvbT4KPiBSZXZpZXdlZC1ieTogWWFubmljayBGZXJ0cmUgPHlh
bm5pY2suZmVydHJlQGZvc3Muc3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFp
cy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4gLS0tCj4gICBhcmNoL2Fy
bS9kdHMvc3RtMzJtcDI1LXUtYm9vdC5kdHNpIHwgOCArKysrKysrKwo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2R0cy9zdG0zMm1w
MjUtdS1ib290LmR0c2kgYi9hcmNoL2FybS9kdHMvc3RtMzJtcDI1LXUtYm9vdC5kdHNpCj4gaW5k
ZXggZDlhZWViNmQ1MTBkZjlkZWE5NzAwMTQ4Y2Y4YThhZDVlZmNmZDRmOS4uM2FjMzVjNGE2YmMy
N2M3MmVlZWI1MzI3NDJmZDQ0MTJiN2FhMWI4NSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9kdHMv
c3RtMzJtcDI1LXUtYm9vdC5kdHNpCj4gKysrIGIvYXJjaC9hcm0vZHRzL3N0bTMybXAyNS11LWJv
b3QuZHRzaQo+IEBAIC05Myw2ICs5MywxNCBAQAo+ICAgCWJvb3RwaC1hbGw7Cj4gICB9Owo+ICAg
Cj4gKyZsdGRjIHsKPiArCWJvb3RwaC1hbGw7Cj4gK307Cj4gKwo+ICsmbHZkcyB7Cj4gKwlib290
cGgtYWxsOwo+ICt9Owo+ICsKPiAgICZwaW5jdHJsIHsKPiAgIAlib290cGgtYWxsOwo+ICAgfTsK
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVYm9vdC1z
dG0zMiBtYWlsaW5nIGxpc3QKVWJvb3Qtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby91
Ym9vdC1zdG0zMgo=
