Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9181C0F8D2
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 Oct 2025 18:11:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DBC8C60492;
	Mon, 27 Oct 2025 17:11:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FF7FC6048D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 17:11:37 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RGhfai2362213; Mon, 27 Oct 2025 18:11:14 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013007.outbound.protection.outlook.com [52.101.72.7])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a275j1e60-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 18:11:14 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/zT53C+tq0P9yEDO9jCRdHph8BImfsL8osQFuwKv8gxdWdTxGXg0z58Dnvg3ifHuI8xEukwInpn1MjNNLo+iNB4VVso1801HoPZXVYHu4LRKi1OmwJaZoP1EnoGK8Jvomw/xagG7WNkW03KRtdsIwDV2a1GWEiEU3i5PS8Iu3f4QOdw0+daYE5tbLXm3XNjdKg4TN9Od28CmiP3Tx3vJhyuxico1FtMHrMOiaKsiUPzyQqYFIuY4Q1tXtkq24KaAnmkr/lZRTXEGZaRaZmWkz0jv3L9GM0dK1TjpYRYqJPLH/xQ2PTwCsLmwyh1MqzrOI04yD8eFj4afgKlQ7hdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YHXiWJiTgQdZTayHMw2mc8eIzQ8rgv3xRe53QeaHoI=;
 b=rlDW5SNizlX9BJxIPZtkB0rdbbqXzMufpb1L+cpycywA7V7/qv+lynjghKgDkRUq+cvbcYXDoTkEadFMahC7bxLyR1FknbFCpMqpn07AaTaGbRm6k3TBccMGznt0QODDw6ZMYLsk5rfChoMg3zhIXMugpQJoxn3aFBKBQTvoyvKpmqvRe8wPVc3X9umXpJ08tpuKbko+rQ2HM6uOn/WYO4bNHebZQm/CEdmSNj9jX6P/GO9KfmNTcpubtrdmMwOX7os3Gwjaz7G9W2pA+8GxISSeU3DbsBvBZHjCOGKfgeNNeQ2cVEhtXy4qmhl7gw2xPkAlQmViiyzsyyGKfQXPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=mailbox.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YHXiWJiTgQdZTayHMw2mc8eIzQ8rgv3xRe53QeaHoI=;
 b=Omvxt9atC0+zYU0BaWHqplNnXwL1uCHEDmdv8OvgSIz/qcd7Zyfb+YK7+zx0K7tzD2wywd3LDmmvVBcBFng2SvU5dNZaoi/NMpV9MLOty/KKdsyyxjzunFNqUq0hWMego0hE6Ns97G2gMaBbtT034v0+uxx0jE8ZxQBd8F6C0TllTNq2iFnew1SLsSrbPZYjL26qC77d+JTTmZqA/JMfE+b6cEVUMJTxhavXWQ+xhDAE5qSoFPLr/20romYjdFfiGEwbyuwzx0PrmMxKM4akbzPgjAaMy1wbEx+pB+zNuhk9BJFkqzgQKJxNGZuloNe0XTXsT9B5aAd7F+ATlJmjbg==
Received: from AS4P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::9)
 by PA1PR10MB8872.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:453::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 17:11:12 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::b7) by AS4P189CA0008.outlook.office365.com
 (2603:10a6:20b:5d7::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 17:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 17:11:12 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 18:03:44 +0100
Received: from [10.48.87.93] (10.48.87.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 18:11:11 +0100
Message-ID: <bc9ee0d3-59eb-4455-897e-7401c2ab4613@foss.st.com>
Date: Mon, 27 Oct 2025 18:11:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20251023214811.181389-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251023214811.181389-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000043:EE_|PA1PR10MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 51559bee-cd79-49b9-f034-08de157bd466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWxISjIzeUhScllpZU41UWxaUGlZcW8zbGxVYWp0clBMZGxCVFJpWEpwNEdr?=
 =?utf-8?B?UVRvNkRYOVJLLytnYlZWeEZ1M2puSGd3UjBlZFRxdWVINktMQ1RrSzgvTUph?=
 =?utf-8?B?SlZLdzhzRkdiTk1rRElTK1BnSGtGemtVRzQrYXA5bkJ2MFIya3hTVHNZM01S?=
 =?utf-8?B?dWpNQ1J5dVl6eGxteVdwWkZpVmdqbHFKY3Nza05kWDVTeFFQR250TXdzVU1T?=
 =?utf-8?B?T3dFa3pGdVNRTDFwcEtkNmlObnZaZndHamZWbk1UZXFPZnpiZ2JJZ01MSTda?=
 =?utf-8?B?SGFqTHdZcEdHQnZEbmJUTERHK0tDTm1LK3lxYkdvdHpjSC9PaDdZeE5BR2tX?=
 =?utf-8?B?MmJLUE02NHZlSGkyYmlmZnBxNERBdlhtUVdvR1NCQ2RNekZTUkNYdjlJRG9J?=
 =?utf-8?B?NDZLTEhjMjc2MWVXYkZTWUw2bS9SR01TOTM3YW9SV0taYWsrYWt5dkdjVHla?=
 =?utf-8?B?Rm84TXB3dm9oRmRkTWsxYnVZRlFEVHFCT2djT21scStEV1dqdEZJMmoxYm1X?=
 =?utf-8?B?SWJMY3g1TElNcnRYYmphK0tOVExlRWQwV251OVpGSU9aQ1NPREg0RDVjcDZE?=
 =?utf-8?B?RTNGeHhlbmgrenY0SDFscUlNeGpRV0xQdERpclkvOHozRVVMOFFCc0ZrQitm?=
 =?utf-8?B?cTkyT0NNRWdtK2U1VExobFd2V2FXRmhqdlorejViRm4xK2srcjFKcm5ORGt5?=
 =?utf-8?B?d1pEemp4bXhaakNCbmoyMDlkdDh0S3JyRUxadmM0MXpqZVAzWFlsNTM3RGhn?=
 =?utf-8?B?d25Cby9tU2NxVGR3SFdaak92KzF6S0ZEcGRVVUdsK2VUMVMvaFM3V0tiaDdS?=
 =?utf-8?B?TVZUV2tXNzVjUm80ZWhRaG9FeStsVEptOEV6UTJPTGx4UVFaOWlzbmFFclRO?=
 =?utf-8?B?ckNpTERHOUd4TGRzRk9wdVdpdGlLSFpzb1ZFbk9LK1pKZGhjZjBNb2g5ck93?=
 =?utf-8?B?R2dDVjNoME53TXMzdXNMbWpqTzllSFJLYURxNUN6N09welFGc0VubVRSQUxt?=
 =?utf-8?B?Q0ZJQ2UrMENsT0Q3WHEwaU5UckRUUnEzQWpwZHMvdTlibUJRYjJRaWlsOHM0?=
 =?utf-8?B?aHM4SzY4blpVOEdiMXVIL0lHcDE1NU9wOFBtaDVaWk9scTBJUDdkSk9Jd2R3?=
 =?utf-8?B?SVVTZUh0czNTanhpSTg2SlFKandLNzZnY3lNK1d6MzB3ZFZ5K1NZWUdrS2dl?=
 =?utf-8?B?bFVOTEl4NGMyZk9qMmJzSW1ET2tCbmUyVnNjU01jZUFMQ25ZN2c2blZOWUxw?=
 =?utf-8?B?a2FwMTRHczU0RmNpazZGTDBaVjVkeVBlTVRTcEtQT1c0Qmp2VW40WkNhajQ1?=
 =?utf-8?B?bVdZdHRUQW1kQU1HalVJTitCL01FYmE2RFZRWUJ0b3FnWmRYQlpyMXJYUnZp?=
 =?utf-8?B?WXlDaHVvZTRxbkIwUWNqQktjY2NqMTdnRnlQcjZCM1R2dms5N1JvdTlPVlo2?=
 =?utf-8?B?N2xnNnFIenV3Nlc0aHRNSGljZU9rVGgyV3lRY0J6QVowS2tHT0pINEtCSWRl?=
 =?utf-8?B?a3Q4WHhJbjZreUxiUzZBbnpMNzhURGVnWmIvamh5QlRHY0VEODEwZTgwRlZB?=
 =?utf-8?B?SGtzWjFYU1BrTEJVK0F6d3NtNHJ1OENrU0xxTXdzNlpDN3JERXJUZWllZk8x?=
 =?utf-8?B?dWVJbExPM0xkRGlET0ZrZFlVVjN4Qi9IbHdlS2h6bXl1VUMwUUhPNjRwSUJl?=
 =?utf-8?B?aC96bXREeTZGNWh3TjFCK1pOaEltTlBZL3psZm1wVGtnK0FEZ0JWbm1wbWtF?=
 =?utf-8?B?c0RPdHhMN0F2SjhlMEFCVjZURjRWNlpuY0pHWXpObnB2ckRpUDhsbDhCbzhL?=
 =?utf-8?B?cGU2dk12ZXpsQkhpc25ZSFphS2tZZ0FNM210NUlEcUN4dmZ1YzlBSzJ5cDBk?=
 =?utf-8?B?emNPelVVdWhBNFRNRCtUYkZ4ZmlKTEZpdit4KzhLV0RHQmxEeng3d3FBWnVD?=
 =?utf-8?B?clIwY1ZyYVBuQ1JhU04wOVdXc0IwaTA4RUVPalB1UWJ0ZVNlOUJSZjlwYy9r?=
 =?utf-8?B?MjlEU1VFSXkwVHFLb3lCU2gwYy85TDZBVi90YTNaUDJxdjhzR3ArT3BsRUpK?=
 =?utf-8?B?Vm8rbUQrWm1mZUhacE0wcytwVlJiMTJtYklJcmRnOWJXaHk5VjJ4eFRVRW5h?=
 =?utf-8?Q?mIwI=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:11:12.0697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51559bee-cd79-49b9-f034-08de157bd466
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8872
X-Proofpoint-ORIG-GUID: knM3orTGIAz8SfWMNY1jbV4uvOEr0ifG
X-Proofpoint-GUID: knM3orTGIAz8SfWMNY1jbV4uvOEr0ifG
X-Authority-Analysis: v=2.4 cv=GKYF0+NK c=1 sm=1 tr=0 ts=68ffa7b2 cx=c_pps
 a=Bmd43WCg4X2p3XZFHKK9+A==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=8b9GpE9nAAAA:8 a=k-42gJp3AAAA:8
 a=zk4-lHRcAAAA:8 a=phlkwaE_AAAA:8 a=BIUe7_ae1KqSYvMkQpEA:9 a=QEXdDO2ut3YA:10
 a=Rv2g8BkzVjQTVhhssdqe:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=uCSXFHLys93vLW5PjgO_:22
 a=7cv85riZL9-k45RWW8P6:22 a=uKTQOUHymn4LaG7oTSIC:22 a=cPQSjfK2_nFv0Q5t_7PE:22
 a=HhbK4dLum7pmb74im6QT:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE1OSBTYWx0ZWRfXw3dtVQtgRxgj
 DUO8cwnfHi3HkGDdzjQRCrL5yZrWx6AmjVHTxPjNsvem4UyYK2TFtvMNrStMJuUD9TpSWlbU7EO
 TQcZcIqIhDLTPTSoseF9bVlHLzbU/XXuu3BJ6oa2xZYFiIq1FGUoPzbdyqTRIQTZRifMez+ArgY
 OyHbH3WZ4kw8LJaM2XnoI4eNp/hIMWmhHdAIYATF9dYzz0/D5stFRzE8DEwXScXddntrXPooGad
 noQXNGWMe2TP25chUg6Ce0EwD5rJfcxTvHu5azXfJr55D2LPH2H0SiY1tT6y3FxbgRZyfctjznK
 gZtqxc4DeEOhpGvCQfxdP6bEIKN8OfvhrLoKombtY7fCxSMP7IhsBXfGJZdMog6RTPxqHTnHA5d
 VFhQe5/oLnk+TJ6kzU1sAb9WmuQnKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270159
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: dts: stm32: Introduce DH STM32MP13x
	target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>



On 10/23/25 23:47, Marek Vasut wrote:
> Split the DH STM32MP13x based boards from ST STM32MP13x target,
> this way the DH board specific code can be reused for STM32MP13x
> DHSOM.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@dh-electronics.com
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/Kconfig.13x        | 12 ++++++++++
>  board/dhelectronics/dh_stm32mp1/Kconfig  | 23 +++++++++++++++++++
>  board/dhelectronics/dh_stm32mp1/Makefile |  3 ++-
>  board/dhelectronics/dh_stm32mp1/board.c  | 28 ++++++++++++++++++++++++
>  configs/stm32mp13_dhcor_defconfig        |  2 +-
>  5 files changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/Kconfig.13x b/arch/arm/mach-stm32mp/Kconfig.13x
> index 6a45c4e4132..e9697e34f95 100644
> --- a/arch/arm/mach-stm32mp/Kconfig.13x
> +++ b/arch/arm/mach-stm32mp/Kconfig.13x
> @@ -17,6 +17,17 @@ config TARGET_ST_STM32MP13X
>  		managed by board/st/stm32mp1.
>  		The difference between board are managed with devicetree
>  
> +config TARGET_DH_STM32MP13X
> +	bool "DH electronics STM32MP13x boards"
> +	imply BOOTSTAGE
> +	imply CMD_BOOTSTAGE
> +	imply CMD_CLS if CMD_BMP
> +	imply DISABLE_CONSOLE
> +	imply PRE_CONSOLE_BUFFER
> +	imply SILENT_CONSOLE
> +	help
> +		Target the DH DHSBC development kit with STM32MP13x SoM.
> +
>  endchoice
>  
>  config TEXT_BASE
> @@ -50,6 +61,7 @@ config DEBUG_UART_CLOCK
>  	default 64000000
>  endif
>  
> +source "board/dhelectronics/dh_stm32mp1/Kconfig"
>  source "board/st/stm32mp1/Kconfig"
>  
>  endif
> diff --git a/board/dhelectronics/dh_stm32mp1/Kconfig b/board/dhelectronics/dh_stm32mp1/Kconfig
> index dc707c2753f..05cb97b61e6 100644
> --- a/board/dhelectronics/dh_stm32mp1/Kconfig
> +++ b/board/dhelectronics/dh_stm32mp1/Kconfig
> @@ -20,3 +20,26 @@ config ENV_OFFSET_REDUND
>  
>  source "board/st/common/Kconfig"
>  endif
> +
> +if TARGET_DH_STM32MP13X
> +
> +config SYS_BOARD
> +	default "dh_stm32mp1"
> +
> +config SYS_VENDOR
> +	default "dhelectronics"
> +
> +config SYS_CONFIG_NAME
> +	default "stm32mp13_st_common"
> +
> +config ENV_SECT_SIZE
> +	default 0x10000 if ENV_IS_IN_SPI_FLASH
> +
> +config ENV_OFFSET
> +	default 0x3E0000 if ENV_IS_IN_SPI_FLASH
> +
> +config ENV_OFFSET_REDUND
> +	default 0x3F0000 if ENV_IS_IN_SPI_FLASH
> +
> +source "board/st/common/Kconfig"
> +endif
> diff --git a/board/dhelectronics/dh_stm32mp1/Makefile b/board/dhelectronics/dh_stm32mp1/Makefile
> index 30db1dee807..ffd221ac224 100644
> --- a/board/dhelectronics/dh_stm32mp1/Makefile
> +++ b/board/dhelectronics/dh_stm32mp1/Makefile
> @@ -3,6 +3,7 @@
>  # Copyright (C) 2018, STMicroelectronics - All Rights Reserved
>  #
>  
> -obj-y += ../../st/common/stpmic1.o board.o
> +obj-$(CONFIG_PMIC_STPMIC1) += ../../st/common/stpmic1.o
> +obj-y += board.o
>  
>  obj-$(CONFIG_SET_DFU_ALT_INFO) += ../../st/common/stm32mp_dfu.o
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index d98b2c6e809..a9b1a0f2c34 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -692,6 +692,34 @@ void board_quiesce_devices(void)
>  #endif
>  }
>  
> +#ifdef CONFIG_TARGET_DH_STM32MP13X
> +enum env_location env_get_location(enum env_operation op, int prio)
> +{
> +	u32 bootmode = get_bootmode();
> +
> +	if (prio)
> +		return ENVL_UNKNOWN;
> +
> +	switch (bootmode & TAMP_BOOT_DEVICE_MASK) {
> +	case BOOT_FLASH_SD:
> +	case BOOT_FLASH_EMMC:
> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_MMC))
> +			return ENVL_MMC;
> +		else
> +			return ENVL_NOWHERE;
> +
> +	case BOOT_FLASH_NOR:
> +		if (CONFIG_IS_ENABLED(ENV_IS_IN_SPI_FLASH))
> +			return ENVL_SPI_FLASH;
> +		else
> +			return ENVL_NOWHERE;
> +
> +	default:
> +		return ENVL_NOWHERE;
> +	}
> +}
> +#endif
> +
>  static void dh_stm32_ks8851_fixup(void *blob)
>  {
>  	struct gpio_desc ks8851intrn;
> diff --git a/configs/stm32mp13_dhcor_defconfig b/configs/stm32mp13_dhcor_defconfig
> index c21416459e6..f751deb801f 100644
> --- a/configs/stm32mp13_dhcor_defconfig
> +++ b/configs/stm32mp13_dhcor_defconfig
> @@ -8,7 +8,7 @@ CONFIG_ENV_OFFSET=0x3E0000
>  CONFIG_DEFAULT_DEVICE_TREE="st/stm32mp135f-dhcor-dhsbc"
>  CONFIG_STM32MP13X=y
>  CONFIG_DDR_CACHEABLE_SIZE=0x8000000
> -CONFIG_TARGET_ST_STM32MP13X=y
> +CONFIG_TARGET_DH_STM32MP13X=y
>  CONFIG_ENV_OFFSET_REDUND=0x3F0000
>  CONFIG_STM32MP15_PWR=y
>  CONFIG_ARMV7_NONSEC=y

Hi 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
